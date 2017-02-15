% Multiprocesadores  
  Ejercicio 1: Simulando y cocinando con el Intel 7290F
% Barea López, Daniel
% 8-febrero-2017


### Tiempo dedicado (aproximado): 1.5 horas

## Resumen

Se trata de calcular disipación total, tiempo de simulación y coste según la información publicada en [1].


## Cuestiones

1. ¿Cuántos micros caben en la superficie de la vitrocerámica?

    El diámetro de la vitrocerámica son 22 cm, por lo que tiene un área de $\pi \cdot 110^2 = 38013.27\,mm^2$.

    Las dimensiones del micro son 20.5 x 31.5 mm, ocupando un área de $645.8\,mm^2$.

    Sin tener en cuenta la geometría de la vitrocerámica, se podrían colocar un máximo de $38013.27 / 645.8 = \mathbf{58\,micros}$ en el área de la vitrocerámica.

2. ¿Cuánto disiparía el multiprocesador equivalente?

    La potencia máxima del 7290F son 260 W (Thermal Design Power). 58 micros consumirían como máximo $58 \cdot 260 = \mathbf{15.08\,kW}$.

3. Velocidad de pico del multiprocesador (FLOP/ciclo).

    Para cada core:

    ---------------------------------------------------------
     Sin multiply/add             Con multiply/add
    ---------------------------- ----------------------------
      $\mathbf{32\,FLOP/ciclo}$    $\mathbf{64\,FLOP/ciclo}$
    ---------------------------------------------------------

4. Tiempo simulaciones aerodinámicas del avión sin multiply/add, para los tres casos.

    $$R = 72\,cores \cdot 1.50\,GHz \cdot 32\,FLOP/ciclo = 3456\,GFLOPS$$

    | Ala, estacionario                                                      | Ala, turbulento                                                          | Avión, turbulento                                                       |
    |:----------------------------------------------------------------------:|:------------------------------------------------------------------------:|:-----------------------------------------------------------------------:|
    |  $\frac{10^{18}\,FLOP}{3456 \cdot 10^9\,FLOPS} = \mathbf{3.35\,días}$  |  $\frac{10^{20}\,FLOP}{3456 \cdot 10^9\,FLOPS} = \mathbf{334.89\,días}$  | $\frac{10^{23}\,FLOP}{3456 \cdot 10^9\,FLOPS} = \mathbf{917.53\,años}$  |


5. Coste simulaciones, a 0,12 €/kWh.

    $$precio\,por\,hora = 0.26\,kW \cdot 0.12\,€/kWh = 0.0312\,€/h$$

    | Ala, estacionario                                   | Ala, turbulento                                         | Avión, turbulento                                          |
    |:---------------------------------------------------:|:-------------------------------------------------------:|:----------------------------------------------------------:|
    |  $3.35\,días \cdot 0.0312\,€/h = \mathbf{2.51\,€}$  |  $334.89\,días \cdot 0.0312\,€/h = \mathbf{250.77\,€}$  |  $917.53\,años \cdot 0.0312\,€/h = \mathbf{250771.96\,€}$  |


## Referencias

[1] SODANI, Avinash, et al. “Knights landing: Second-Generation Intel Xeon Phi Product”. IEEE Micro, 2016, vol. 36, no 2, p. 34-46.
