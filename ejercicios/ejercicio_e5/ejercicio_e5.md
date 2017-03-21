% Multiprocesadores  
  Ejercicio E5 - Análisis de dependencias
% Barea López, Daniel
% 22-marzo-2017


### Tiempo dedicado (aproximado): 1.0 hora

## Resumen

Se trata de realizar el análisis formal de dependencias para el siguiente bucle:

$i \in rango\,N$

```
R: ... = var(r)
S: var(s) = ...
```

## Solución

$$
\begin{cases}
S\,\delta\,R\,si\,\exists\,\lambda \mid r(i) = s(i + \lambda);\,\lambda \geq 1;\,i,\,i + \lambda \in rango \\
R\,\delta^{-}\,S\,si\,\exists\,\lambda \mid s(i) = r(i + \lambda);\,\lambda \geq 0;\,i,\,i + \lambda \in rango \\
R\,ind\,S\,en\,caso\,contrario
\end{cases} 
$$

### Ejemplo para $S\,\delta\,R$

Sean $r(i) = 2 \cdot i$ y $s(i) = 4 \cdot i$:

```
R: ... = A(2 * i)
S: A(4 * i) = ...
```

 i   `A(r(i))`, `A(s(i))`
--- ----------------------
 1   `A(2)`, `A(4)`
 2   `A(4)`, `A(8)`
 3   `A(6)`, `A(12)`
 4   `A(8)`, `A(16)`

Como se puede apreciar, $S1\,\delta\,R2$ ($\lambda = 1 \geq 1$), $S2\,\delta\,R4$ ($\lambda = 2 \geq 1$), ...

### Ejemplo para $R\,\delta^{-}\,S$

Sean $r(i) = 3 \cdot i$ y $s(i) = 2 \cdot i + 1$:

```
R: ... = A(3 * i)
S: A(2 * i + 1) = ...
```

 i   `A(r(i))`, `A(s(i))`
--- ----------------------
 1   `A(3)`, `A(3)`
 2   `A(6)`, `A(5)`
 3   `A(9)`, `A(7)`
 4   `A(12)`, `A(9)`

Como se puede apreciar, $R1\,\delta^{-}\,S1$ ($\lambda = 0 \geq 0$), $R3\,\delta^{-}\,S4$ ($\lambda = 1 \geq 0$), ...

### Ejemplo para $R\,ind\,S$

Sean $r(i) = 2 \cdot i$ y $s(i) = 2 \cdot i + 1$:

```
R: ... = A(2 * i)
S: A(2 * i + 1) = ...
```

 i   `A(r(i))`, `A(s(i))`
--- ----------------------
 1   `A(2)`, `A(3)`
 2   `A(4)`, `A(5)`
 3   `A(6)`, `A(7)`
 4   `A(8)`, `A(9)`

Como se puede apreciar, no existen dependencias de ningún tipo ($r(i) \neq s(i + \lambda), r(i + \lambda) \neq s(i)\,\,\forall\,i,\,i + \lambda \in rango$).

