.title SEPIC
.include irf520n.spi
.tran 1u 200m
.model diode1 D(BV=100 VJ=0.5)
.save i(V1) v(out) v(PWM)
.param vi=24
.param vo=12
.param vfwd=0.5
.param duty={(vo + vfwd) / (vi + vo + vfwd)}
.param freq=60k

R1 +24V n1 10m
L1 n1 n2 1.54m
C2 n2 n3 1.015u
L2 n3 GND 1.54m
xmos n2 PWM GND irf520n
D1 n3 out diode1
Resr1 out nco1 1.3
C3 nco1 GND 12u
Resr2 out nco2 1.3
C4 nco2 GND 12u
Resr3 out nco3 1.3
C5 nco3 GND 12u
Rload out GND 28.8

Rp PWM1 PWM 220

V1 PWM1 GND PULSE(0 12 0 1n 1n {(duty*(1/freq))} {1/freq})
V2 +24V GND DC 24
.end
