SUBROUTINE CGELSD1_F95( A, B, RANK, S, RCOND, INFO )
!
!  -- LAPACK95 interface driver routine (version 3.0) --
!     UNI-C, Denmark; Univ. of Tennessee, USA; NAG Ltd., UK
!     September, 2000
!
!   .. USE STATEMENTS ..
      USE LA_PRECISION, ONLY: WP => SP
      USE LA_AUXMOD, ONLY: ERINFO
      USE F77_LAPACK, ONLY: GELSD_F77 => LA_GELSD,  ILAENV_F77 => ILAENV
!   .. IMPLICIT STATEMENT ..
      IMPLICIT NONE
!   .. SCALAR ARGUMENTS ..
      INTEGER, INTENT(OUT), OPTIONAL :: RANK
      INTEGER, INTENT(OUT), OPTIONAL :: INFO
      REAL(WP), INTENT(IN), OPTIONAL :: RCOND
!   .. ARRAY ARGUMENTS ..
      COMPLEX(WP), INTENT(INOUT) :: A(:,:), B(:)
      REAL(WP), INTENT(OUT), OPTIONAL, TARGET :: S(:)
!   .. PARAMETERS ..
      CHARACTER(LEN=8), PARAMETER :: SRNAME = 'LA_GELSD'
!   .. LOCAL SCALARS ..
      INTEGER :: LINFO, ISTAT, LWORK, N, M, MN, LRANK, SS, &
     &  LIWORK, SMLSIZ, NLVL, LRWORK
      REAL(WP) :: LRCOND
!   .. LOCAL POINTERS ..
      COMPLEX(WP), POINTER :: WORK(:)
      REAL(WP), POINTER :: LS(:)
      INTEGER, POINTER :: IWORK(:)
      REAL(WP), POINTER :: RWORK(:)
      COMPLEX(WP) :: WORKMIN(1)
      INTEGER :: IWORKMIN(1)
      DOUBLE PRECISION  TWO
      PARAMETER       ( TWO = 2.0D0 )
!   .. INTRINSIC FUNCTIONS ..
      INTRINSIC SIZE, PRESENT, MAX, MIN, EPSILON
!   .. EXECUTABLE STATEMENTS ..
    LINFO = 0; ISTAT = 0; M = SIZE(A,1); N = SIZE(A,2)
    MN = MIN(M,N)
       SMLSIZ = ILAENV_F77( 9, 'ZGELSD', ' ', 0, 0, 0, 0 )
       NLVL = MAX(INT(LOG(DBLE(MAX(1,MN))/DBLE(SMLSIZ+1))/LOG(TWO)),0)
! NEXT LINE SHOULD BE  LIWORK = 3 * MN * NLVL + 11 * MN, WHEN THE LAPACK CODE IS FIXED
       LIWORK = 2*(3 * MN * NLVL + 11 * MN)
       LRWORK = 8  * MN + 2*MN*SMLSIZ + 8*MN*NLVL + MN

       LRWORK = 25000
       ALLOCATE(RWORK(LRWORK), STAT = ISTAT)
       IF (ISTAT /= 0) THEN ; LINFO=-100; GOTO 100; ENDIF

       IF( PRESENT(RCOND) )THEN; LRCOND = RCOND
       ELSE; LRCOND = 100*EPSILON(1.0_WP); ENDIF
       IF( PRESENT(S) )THEN; SS = SIZE(S); ELSE; SS =MN; ENDIF
!   .. TEST THE ARGUMENTS
       IF( M < 0 .OR. N < 0 ) THEN; LINFO = -1
       ELSE IF( SIZE( B, 1 ) /= MAX(1,M,N)) THEN; LINFO = -2
       ELSE IF( SS /= MN ) THEN; LINFO = -4
       ELSE IF( LRCOND <= 0.0_WP ) THEN; LINFO = -5
       ELSE
          IF( PRESENT(S) )THEN; LS => S
          ELSE
            ALLOCATE( LS(MN), STAT = ISTAT );
            IF (ISTAT /= 0) THEN ;
             LINFO=-200; GOTO 200; ENDIF
          END IF
          LWORK=-1

          CALL GELSD_F77( M, N, 1, A, MAX(1,M), B, MAX(1,M,N), &
     &         LS, LRCOND, LRANK, WORKMIN, LWORK, RWORK, IWORKMIN, LINFO )
          LWORK = WORKMIN(1)
! THE NEXT LINE SHOULD BE REMOVED, WHEN THE LAPACK CODE IS FIXED.
          LWORK = 10 * LWORK
          ALLOCATE( WORK(LWORK), IWORK(LIWORK), STAT = ISTAT )
          IF (ISTAT /= 0) THEN;
       LINFO=-300; GOTO 300
          ENDIF

          CALL GELSD_F77( M, N, 1, A, MAX(1,M), B, SIZE(B,1), &
     &      LS, LRCOND, LRANK, WORK, LWORK, RWORK, IWORK, LINFO )

          IF( PRESENT(RANK) ) RANK = LRANK
          DEALLOCATE(WORK, IWORK, STAT = ISTAT)
300       IF (.NOT. PRESENT(S)) DEALLOCATE(LS, STAT = ISTAT)
        END IF
200     DEALLOCATE(RWORK, STAT = ISTAT)
100     CALL ERINFO( LINFO, SRNAME, INFO, ISTAT )
END SUBROUTINE CGELSD1_F95
