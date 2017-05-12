       PROGRAM ejer5
        integer i, j
        real a(200),b(200),q

        DO i=1,200
          a(i) = rand()
          b(i) = rand()
        ENDDO

        DO i=1,100
          a(i) = a(i) + b(i)
          q = q + a(i)
        ENDDO
        
        print *,a
        print *,b
	print *,q
       END
