      SUBROUTINE DGELSY1_F95( A, B, RANK, JPVT, RCOND, INFO )
!
!  -- LAPACK95 interface driver routine (version 3.0) --
!     UNI-C, Denmark; Univ. of Tennessee, USA; NAG Ltd., UK
!     September, 2000
!
!   .. USE STATEMENTS ..
      USE LA_PRECISION, ONLY: WP => DP
      USE LA_AUXMOD, ONLY: ERINFO
      USE F77_LAPACK, ONLY: GELSY_F77 => LA_GELSY
!   .. IMPLICIT STATEMENT ..
      IMPLICIT NONE
!   .. SCALAR ARGUMENTS ..
      INTEGER, INTENT(OUT), OPTIONAL :: RANK
      INTEGER, INTENT(OUT), OPTIONAL :: INFO
      REAL(WP), INTENT(IN), OPTIONAL :: RCOND
!   .. ARRAY ARGUMENTS ..
      INTEGER, INTENT(INOUT), OPTIONAL, TARGET :: JPVT(:)
      REAL(WP), INTENT(INOUT) :: A(:,:), B(:)
!   .. PARAMETERS ..
      CHARACTER(LEN=8), PARAMETER :: SRNAME = 'LA_GELSY'
!   .. LOCAL SCALARS ..
      INTEGER :: LINFO, ISTAT, ISTAT1, LWORK, N, M, MN, LRANK, SJPVT
      REAL(WP) :: LRCOND
!   .. LOCAL POINTERS ..
      INTEGER, POINTER :: LJPVT(:)
      REAL(WP), POINTER :: WORK(:)
      REAL(WP) :: WORKMIN(1)
!   .. INTRINSIC FUNCTIONS ..
      INTRINSIC SIZE, PRESENT, MAX, MIN, EPSILON
!   .. EXECUTABLE STATEMENTS ..
      LINFO = 0; ISTAT = 0; M = SIZE(A,1); N = SIZE(A,2)
      MN = MIN(M,N)
      IF( PRESENT(RCOND) )THEN; LRCOND = RCOND; ELSE
         LRCOND = 100*EPSILON(1.0_WP) ; ENDIF
      IF( PRESENT(JPVT) )THEN; SJPVT = SIZE(JPVT); ELSE; SJPVT = N; ENDIF
!   .. TEST THE ARGUMENTS
      IF( M < 0 .OR. N < 0 ) THEN; LINFO = -1
      ELSE IF( SIZE( B ) /= MAX(1,M,N)) THEN; LINFO = -2
      ELSE IF( SJPVT /= N ) THEN; LINFO = -4
      ELSE IF( LRCOND <= 0.0_WP ) THEN; LINFO = -5
      ELSE
        IF( PRESENT(JPVT) )THEN; LJPVT => JPVT
        ELSE; ALLOCATE( LJPVT(N), STAT = ISTAT ); LJPVT = 0; END IF


! .. DETERMINE THE WORKSPACE ..
! .. QUERING THE SIZE OF WORKSPACE ..
          LWORK = -1
          CALL GELSY_F77( M, N, 1, A, MAX(1,M), B, MAX(1,M,N), &
     &      LJPVT, LRCOND, LRANK, WORKMIN, LWORK, LINFO )
          LWORK = WORKMIN(1)
          IF( ISTAT == 0 ) THEN
            ALLOCATE( WORK(LWORK), STAT = ISTAT )
            IF( ISTAT /= 0 ) CALL ERINFO( -200, SRNAME, LINFO )
          END IF

          IF ( ISTAT == 0 ) THEN
            CALL GELSY_F77( M, N, 1, A, MAX(1,M), B, MAX(1,M,N), &
     &      LJPVT, LRCOND, LRANK, WORK, LWORK, LINFO )
          ELSE; LINFO = -100; END IF
            IF( PRESENT(RANK) ) RANK = LRANK
            IF( PRESENT(JPVT) ) JPVT = LJPVT
            DEALLOCATE(WORK, STAT = ISTAT1 )
          END IF
          CALL ERINFO( LINFO, SRNAME, INFO, ISTAT )
        END SUBROUTINE DGELSY1_F95
