!Filename: barrier.f90
!
!This shows use of the BARRIER directive.
!

PROGRAM ABARRIER 
        IMPLICIT NONE
        INTEGER:: L
        INTEGER:: nthreads, OMP_GET_NUM_THREADS
        INTEGER:: tnumber, OMP_GET_THREAD_NUM

!$OMP PARALLEL SHARED(L) PRIVATE(nthreads,tnumber)
        nthreads = OMP_GET_NUM_THREADS()
        tnumber  = OMP_GET_THREAD_NUM()

!$OMP MASTER

        PRINT *, ' Enter a value for L'
        READ(5,*)  L

!$OMP END MASTER

!$OMP BARRIER

!$OMP CRITICAL

        PRINT *, ' My thread number         =',tnumber
        PRINT *, ' Number of threads        =',nthreads
        PRINT *, ' Value of L               =',L
        PRINT *, ''

!$OMP END CRITICAL

!$OMP END PARALLEL


END PROGRAM ABARRIER 

