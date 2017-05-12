       PROGRAM ejer4a
        integer i, j
        real a(200),b(200)

        DO i=1,200
          a(i) = rand()
        ENDDO

        j = 0 
        DO i=1,100
          j = j + 2
          b(j) = a(i)
        ENDDO
        
        print *,a
        print *,b
       END
