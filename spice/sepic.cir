.title Convertidor DC/DC SEPIC
.include irf520n.spi
.include AvagoHCPL3120_MOD.txt

.tran 1u 200m

.model diode1 D(BV=100 VJ=0.5)

.param freq=60k
.param vi=24
.param vo=48
.param po=5
.param vfwd=0.364
.param duty={(vo + vfwd) / (vi + vo + vfwd)}
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

.end
