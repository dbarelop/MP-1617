       PROGRAM ejer3a
        integer i
        real a(200),b(200),c(200)

        DO i=1,200
          a(i) = rand()
        ENDDO

        DO i=1,200
          t = a(i)
          b(i) = t + t**2
          c(i) = t + 2
        ENDDO
        
        print *,a
        print *,b
        print *,c
       END
