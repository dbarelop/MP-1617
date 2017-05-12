       PROGRAM ejer2a
        integer i
        real a(500), b(500), c(500)

        DO i=1,500
          a(i) = rand()
          b(i) = rand()
          c(i) = 0
        ENDDO

        DO i=1,200
          a(2*i) = b(i)
          c(2*i) = a(2*i)
          c(2*i + 1) = a(2*i + 1)
        ENDDO
        
        print *,a
        print *,b
        print *,c	
       END
