% Multiprocesadores  
  Ejercicio 2: Codificar en ensamblador
% Barea López, Daniel
% 21-febrero-2017


### Tiempo dedicado (aproximado): 0.5 horas

## Resumen

Se trata de codificar en ensamblador para el simulador DLXV el siguiente programa:

```
integer i, max
parameter (max = múltiplo de 64)
real*8 C(max), A(max), B(max)
do i = 1, max
    C(i) = A(i) + B(i)
enddo
```

Suponiendo los registros enteros inicializados:

$$R_A = \&A(0),\,R_B = \&B(0),\,R_C = \&C(0),\,R_{CONT} = max,\,R_{64} = 64$$

## Solución

```
      movi2s  VLR, r64           ; VLR = r64
buc:  LV      V0, [rA]           ; V0[i] = mem[rA + 8*i]
      LV      V1, [rB]           ; V1[i] = mem[rB + 8*i]
      ADDV    V0, V0, V1         ; V0[i] = mem[rA + 8*i] + mem[rB + 8*i]
      SV      [rC], V0           ; mem[rC + i*8] = V0[i]
      add     rA, rA, r64        ; rA += 64
      add     rB, rB, r64        ; rB += 64
      add     rC, rC, r64        ; rC += 64
      sub     rCONT, rCONT, r64  ; rCONT -= 64
      jne buc
```
