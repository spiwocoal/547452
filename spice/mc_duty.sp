.title Convertidor DC/DC SEPIC
.include irf520n.spi

.param freq=60k
.param per={1/freq}
.csparam freq={freq}
.csparam mstart=60m
.csparam mendrip={60m+per}
.csparam mendrms={70m}
.param duty=.20
.param vi=24
.param po=5
.param vfwd=0.364
.param vo={(duty / (1 - duty))*vi - vfwd}
.param rld={vo^2 / po}

Rl1 n1 n11 0.17
L1 n11 n2 2.74m

Rl2 n3 n33 0.17
L2 n33 GND 2.74m

xmos n2 PWM GND irf520n
D1 n3 out diode1

C1 n1 GND 21.9u
C2 n2 n3 2.28u
C3 nco1 GND 19.7u
C4 nco2 GND 20u
C5 nco3 GND 19.7u

Resr1 out nco1 1
Resr2 out nco2 1
Resr3 out nco3 1

Rload out GND {rld}

V1 vin GND DC {vi}
R1 vin n1 10m

V2 pwmin GND PULSE(0 12 0 1n 1n {(duty*(1/freq))} {1/freq})
Rpwm pwmin PWM 6
*
.options noacct
.control
  set csnumprec=12
  save out
  let mc_runs = 10    $ number of runs
  let run = 0         $ number of actual run
  set curplot = new   $ create a new plot
  set curplottitle = "Transient outputs"
  set plot_out = $curplot
  set curplot = new   $ create a new plot
  set curplottitle = "Measurements"
  set plot_meas = $curplot
  set curplot = new   $ create a new plot
  set curplottitle = "Variables"
  set plot_vars = $curplot
  let duty_start=.20
  let duty_end=.70
  let duty_step=(duty_end - duty_start) / mc_runs
  let duty_c=duty_start
*
* run the simulation loop
  dowhile run <= mc_runs
    if run > 0
      setplot $plot_vars
      set duty_c ="$&duty_c"
      set duty_step ="$&duty_step"
      let duty_c = duty_c + duty_step
      alterparam duty = $&duty_c
      reset
    end
    listing param
    tran 1u 75m 0
    meas tran rip PP out from={const.mstart} to={const.mendrip}
    meas tran rms RMS out from={const.mstart} to={const.mendrms}

    echo Simulation status $sim_status
    let simstat = $sim_status
    if simstat = 1
      if run = mc_runs
        echo go to end
      else
        echo go to next run
      end
      destroy $curplot
      goto next
    end

    set run ="$&run"
    set mc_runs ="$&mc_runs"
    echo simulation run no. $run of $mc_runs
    set dt = $curplot
    setplot $plot_vars
    set duty_c ="$&duty_c"
    let duty_p = duty_c * 100
    set duty_p ="$&duty_p"
    setplot $plot_out
    if run = 0
      let time={$dt}.time
    end
    let vout{$duty_p}={$dt}.out
    setplot $plot_meas
    let rip{$duty_p}={$dt}.rip
    let rms{$duty_p}={$dt}.rms
    let run = run + 1
    label next
  end
if $?batchmode
  echo
  echo Plotting not available in batch mode
  echo Write out to {$rawfile}.plt
  echo
  set wr_singlescale
  set wr_vecnames
  wrdata {$rawfile}.meas {$plot_meas}.all
  gnuplot {$rawfile} {$plot_out}.allv
  + ylabel 'Voltaje de salida'
  + xlimit 0 50m
  rusage
  quit
else
  setplot $plot_out
  gnuplot temp {$plot_out}.allv
  + ylabel 'Voltaje salida' xlimit 0 50m
end
  rusage
.endc
********************************************************************************
.model diode1 D(BV=100 VJ=0.5)
.end
