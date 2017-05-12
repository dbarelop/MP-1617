       PROGRAM ejer2b
        integer i
        real a(400), b(400)

        DO i=1,400
          a(i) = rand()
        ENDDO

        DO i=2,200
          b(i) = a(i) - a(i-1)
        ENDDO
        
        print *,a
        print *,b
       END

        