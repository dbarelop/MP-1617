       PROGRAM ejer2c
        integer i
        real a(200)

        DO i=1,200
          a(i) = rand()
        ENDDO

        DO i=2,200
          a(i) = a(i) - a(i-1)
        ENDDO
        
        print *,a
       END
