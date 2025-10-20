.title Convertidor DC/DC SEPIC
.include irf520n.spi
.include AvagoHCPL3120_MOD.txt

.tran 1u 200m

.model diode1 D(BV=100 VJ=0.364)

.param freq=60k
.param vi=24
.param vo=24
.param po=5
.param vfwd=0.364
.param duty={(vo + vfwd) / (vi + vo + vfwd)}
.param rld={vo^2 / po}

R1 vin n1 10m
L1 n1 n2 1.8m
C2 n2 n3 1.015u

xmos n2 PWM GND irf520n

L2 GND n3 1.8m
D1 n3 out diode1

K12 L1 L2 1

C3 out GND 36u

Rload out GND {rld}

V1 vin GND DC {vi}

V2 pwmin GND PULSE(0 12 0 1n 1n {(duty*(1/freq))} {1/freq})
Rp pwmin PWM 220

.end
