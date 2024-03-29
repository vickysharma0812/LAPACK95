! This program is a part of EASIFEM library
! Copyright (C) 2020-2021  Vikas Sharma, Ph.D
!
! This program is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with this program.  If not, see <https: //www.gnu.org/licenses/>
!

MODULE F77_PB_LAPACK

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBSTF

  SUBROUTINE SPBSTF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE SPBSTF

  SUBROUTINE DPBSTF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE DPBSTF

  SUBROUTINE CPBSTF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE CPBSTF

  SUBROUTINE ZPBSTF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE ZPBSTF

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBEQU

  SUBROUTINE SPBEQU(UPLO, N, KD, AB, LDAB, S, SCOND, AMAX, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: AMAX, SCOND, S(*)
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
  END SUBROUTINE SPBEQU

  SUBROUTINE DPBEQU(UPLO, N, KD, AB, LDAB, S, SCOND, AMAX, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: AMAX, SCOND, S(*)
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
  END SUBROUTINE DPBEQU

  SUBROUTINE CPBEQU(UPLO, N, KD, AB, LDAB, S, SCOND, AMAX, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: AMAX, SCOND, S(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
  END SUBROUTINE CPBEQU

  SUBROUTINE ZPBEQU(UPLO, N, KD, AB, LDAB, S, SCOND, AMAX, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: AMAX, SCOND, S(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
  END SUBROUTINE ZPBEQU

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBRFS

  SUBROUTINE SPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,    &
 &                   LDB, X, LDX, FERR, BERR, WORK, IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(OUT) :: BERR(*), FERR(*)
    REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(LDB, *)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE SPBRFS

  SUBROUTINE DPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,    &
 &                   LDB, X, LDX, FERR, BERR, WORK, IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(OUT) :: BERR(*), FERR(*)
    REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(LDB, *)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE DPBRFS

  SUBROUTINE CPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,    &
 &                   LDB, X, LDX, FERR, BERR, WORK, RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: BERR(*), FERR(*), RWORK(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),        &
&                               B(LDB, *)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
    COMPLEX(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE CPBRFS

  SUBROUTINE ZPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,    &
 &                   LDB, X, LDX, FERR, BERR, WORK, RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: BERR(*), FERR(*), RWORK(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),        &
&                               B(LDB, *)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
    COMPLEX(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE ZPBRFS

  MODULE PROCEDURE SPBRFS1
  MODULE PROCEDURE DPBRFS1
  MODULE PROCEDURE CPBRFS1
  MODULE PROCEDURE ZPBRFS1

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBCON

  SUBROUTINE SPBCON(UPLO, N, KD, AB, LDAB, ANORM, RCOND, WORK,     &
 &                   IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(IN) :: ANORM
    REAL(WP), INTENT(OUT) :: RCOND
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE SPBCON

  SUBROUTINE DPBCON(UPLO, N, KD, AB, LDAB, ANORM, RCOND, WORK,     &
 &                   IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(IN) :: ANORM
    REAL(WP), INTENT(OUT) :: RCOND
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE DPBCON

  SUBROUTINE CPBCON(UPLO, N, KD, AB, LDAB, ANORM, RCOND, WORK,     &
 &                   RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: ANORM
    REAL(WP), INTENT(OUT) :: RCOND, RWORK(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    COMPLEX(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE CPBCON

  SUBROUTINE ZPBCON(UPLO, N, KD, AB, LDAB, ANORM, RCOND, WORK,     &
 &                   RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: ANORM
    REAL(WP), INTENT(OUT) :: RCOND, RWORK(*)
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    COMPLEX(WP), INTENT(OUT) :: WORK(*)
  END SUBROUTINE ZPBCON

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBTRS

  SUBROUTINE SPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(INOUT) :: B(LDB, *)
  END SUBROUTINE SPBTRS

  SUBROUTINE DPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(INOUT) :: B(LDB, *)
  END SUBROUTINE DPBTRS

  SUBROUTINE CPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    COMPLEX(WP), INTENT(INOUT) :: B(LDB, *)
  END SUBROUTINE CPBTRS

  SUBROUTINE ZPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    COMPLEX(WP), INTENT(INOUT) :: B(LDB, *)
  END SUBROUTINE ZPBTRS

  MODULE PROCEDURE SPBTRS1
  MODULE PROCEDURE DPBTRS1
  MODULE PROCEDURE CPBTRS1
  MODULE PROCEDURE ZPBTRS1

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBTRF

  SUBROUTINE SPBTRF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE SPBTRF

  SUBROUTINE DPBTRF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE DPBTRF

  SUBROUTINE CPBTRF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE CPBTRF

  SUBROUTINE ZPBTRF(UPLO, N, KD, AB, LDAB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: KD, LDAB, N
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *)
  END SUBROUTINE ZPBTRF

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBSV

  SUBROUTINE SPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
  END SUBROUTINE SPBSV

  SUBROUTINE DPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
  END SUBROUTINE DPBSV

  SUBROUTINE CPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
  END SUBROUTINE CPBSV

  SUBROUTINE ZPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
    INTEGER, INTENT(OUT) :: INFO
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
  END SUBROUTINE ZPBSV

  MODULE PROCEDURE SPBSV1
  MODULE PROCEDURE DPBSV1
  MODULE PROCEDURE CPBSV1
  MODULE PROCEDURE ZPBSV1

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_PBSVX

  SUBROUTINE SPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,&
&                    EQUED, S, B, LDB, X, LDX, RCOND, FERR, BERR,  &
&                    WORK, IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
    CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
    INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(OUT) :: X(LDX, *), WORK(*), FERR(*), BERR(*),  &
&                            RCOND
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(LDB, *), &
&                              S(*)
  END SUBROUTINE SPBSVX

  SUBROUTINE DPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,&
&                    EQUED, S, B, LDB, X, LDX, RCOND, FERR, BERR,  &
&                    WORK, IWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
    CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
    INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
    INTEGER, INTENT(OUT) :: INFO, IWORK(*)
    REAL(WP), INTENT(OUT) :: X(LDX, *), WORK(*), FERR(*), BERR(*),  &
&                            RCOND
    REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(LDB, *), &
&                              S(*)
  END SUBROUTINE DPBSVX

  SUBROUTINE CPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,&
&                    EQUED, S, B, LDB, X, LDX, RCOND, FERR, BERR,  &
&                    WORK, RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
    CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
    INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: FERR(*), BERR(*), RCOND, RWORK(*)
    COMPLEX(WP), INTENT(OUT) :: X(LDX, *), WORK(*)
    REAL(WP), INTENT(INOUT) :: S(*)
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),        &
&                                 B(LDB, *)
  END SUBROUTINE CPBSVX

  SUBROUTINE ZPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,&
&                    EQUED, S, B, LDB, X, LDX, RCOND, FERR, BERR,  &
&                    WORK, RWORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
    CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
    INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(OUT) :: FERR(*), BERR(*), RCOND, RWORK(*)
    COMPLEX(WP), INTENT(OUT) :: X(LDX, *), WORK(*)
    REAL(WP), INTENT(INOUT) :: S(*)
    COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),        &
&                                 B(LDB, *)
  END SUBROUTINE ZPBSVX

  MODULE PROCEDURE SPBSVX1
  MODULE PROCEDURE DPBSVX1
  MODULE PROCEDURE CPBSVX1
  MODULE PROCEDURE ZPBSVX1

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

CONTAINS

SUBROUTINE SPBRFS1(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,   &
&                    LDB, X, LDX, FERR, BERR, WORK, IWORK, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
  INTEGER, INTENT(OUT) :: INFO, IWORK(*)
  REAL(WP), INTENT(OUT) :: BERR, FERR
  REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  REAL(WP), INTENT(INOUT) :: X(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    SUBROUTINE SPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, &
&                         B, LDB, X, LDX, FERR, BERR, WORK, IWORK, &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N,    &
&                                 NRHS
      INTEGER, INTENT(OUT) :: INFO, IWORK(*)
      REAL(WP), INTENT(OUT) :: BERR(*), FERR(*)
      REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),     &
&                                  B(LDB, *)
      REAL(WP), INTENT(INOUT) :: X(LDX, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END SUBROUTINE SPBRFS
  END INTERFACE
  REAL(WP) :: FERR1(1), BERR1(1)
  CALL SPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B, LDB,  &
&                X, LDX, FERR1, BERR1, WORK, IWORK, INFO)
  FERR = FERR1(1); BERR = BERR1(1)
END SUBROUTINE SPBRFS1

SUBROUTINE DPBRFS1(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,   &
&                    LDB, X, LDX, FERR, BERR, WORK, IWORK, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
  INTEGER, INTENT(OUT) :: INFO, IWORK(*)
  REAL(WP), INTENT(OUT) :: BERR, FERR
  REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  REAL(WP), INTENT(INOUT) :: X(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    SUBROUTINE DPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, &
&                         B, LDB, X, LDX, FERR, BERR, WORK, IWORK, &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N,    &
&                                 NRHS
      INTEGER, INTENT(OUT) :: INFO, IWORK(*)
      REAL(WP), INTENT(OUT) :: BERR(*), FERR(*)
      REAL(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),     &
&                                  B(LDB, *)
      REAL(WP), INTENT(INOUT) :: X(LDX, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END SUBROUTINE DPBRFS
  END INTERFACE
  REAL(WP) :: FERR1(1), BERR1(1)
  CALL DPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B, LDB,  &
&                X, LDX, FERR1, BERR1, WORK, IWORK, INFO)
  FERR = FERR1(1); BERR = BERR1(1)
END SUBROUTINE DPBRFS1

SUBROUTINE CPBRFS1(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,   &
&                    LDB, X, LDX, FERR, BERR, WORK, RWORK, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(OUT) :: BERR, FERR, RWORK(*)
  COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  COMPLEX(WP), INTENT(INOUT) :: X(*)
  COMPLEX(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    SUBROUTINE CPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, &
&                         B, LDB, X, LDX, FERR, BERR, WORK, RWORK, &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N,    &
&                                 NRHS
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(OUT) :: BERR(*), FERR(*), RWORK(*)
      COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),  &
&                                     B(LDB, *)
      COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
      COMPLEX(WP), INTENT(OUT) :: WORK(*)
    END SUBROUTINE CPBRFS
  END INTERFACE
  REAL(WP) :: FERR1(1), BERR1(1)
  CALL CPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B, LDB,  &
&                X, LDX, FERR1, BERR1, WORK, RWORK, INFO)
  FERR = FERR1(1); BERR = BERR1(1)
END SUBROUTINE CPBRFS1

SUBROUTINE ZPBRFS1(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B,   &
&                    LDB, X, LDX, FERR, BERR, WORK, RWORK, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(OUT) :: BERR, FERR, RWORK(*)
  COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  COMPLEX(WP), INTENT(INOUT) :: X(*)
  COMPLEX(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    SUBROUTINE ZPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, &
&                         B, LDB, X, LDX, FERR, BERR, WORK, RWORK, &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDAFB, LDB, LDX, N,    &
&                                 NRHS
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(OUT) :: BERR(*), FERR(*), RWORK(*)
      COMPLEX(WP), INTENT(IN) :: AB(LDAB, *), AFB(LDAFB, *),  &
&                                     B(LDB, *)
      COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
      COMPLEX(WP), INTENT(OUT) :: WORK(*)
    END SUBROUTINE ZPBRFS
  END INTERFACE
  REAL(WP) :: FERR1(1), BERR1(1)
  CALL ZPBRFS(UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB, B, LDB,  &
&                X, LDX, FERR1, BERR1, WORK, RWORK, INFO)
  FERR = FERR1(1); BERR = BERR1(1)
END SUBROUTINE ZPBRFS1

SUBROUTINE SPBTRS1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(IN) :: AB(LDAB, *)
  REAL(WP), INTENT(INOUT) :: B(*)
  INTERFACE
    SUBROUTINE SPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,     &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(IN) :: AB(LDAB, *)
      REAL(WP), INTENT(INOUT) :: B(LDB, *)
    END SUBROUTINE SPBTRS
  END INTERFACE
  CALL SPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE SPBTRS1

SUBROUTINE DPBTRS1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(IN) :: AB(LDAB, *)
  REAL(WP), INTENT(INOUT) :: B(*)
  INTERFACE
    SUBROUTINE DPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,     &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(IN) :: AB(LDAB, *)
      REAL(WP), INTENT(INOUT) :: B(LDB, *)
    END SUBROUTINE DPBTRS
  END INTERFACE
  CALL DPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE DPBTRS1

SUBROUTINE CPBTRS1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
  COMPLEX(WP), INTENT(INOUT) :: B(*)
  INTERFACE
    SUBROUTINE CPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,     &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
      INTEGER, INTENT(OUT) :: INFO
      COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
      COMPLEX(WP), INTENT(INOUT) :: B(LDB, *)
    END SUBROUTINE CPBTRS
  END INTERFACE
  CALL CPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE CPBTRS1

SUBROUTINE ZPBTRS1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
  INTEGER, INTENT(OUT) :: INFO
  COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
  COMPLEX(WP), INTENT(INOUT) :: B(*)
  INTERFACE
    SUBROUTINE ZPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,     &
&                         INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: KD, LDAB, LDB, N, NRHS
      INTEGER, INTENT(OUT) :: INFO
      COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
      COMPLEX(WP), INTENT(INOUT) :: B(LDB, *)
    END SUBROUTINE ZPBTRS
  END INTERFACE
  CALL ZPBTRS(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE ZPBTRS1

SUBROUTINE SPBSV1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(*)
  INTERFACE
    SUBROUTINE SPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,       &
&                       INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
    END SUBROUTINE SPBSV
  END INTERFACE
  CALL SPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE SPBSV1

SUBROUTINE DPBSV1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(*)
  INTERFACE
    SUBROUTINE DPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,       &
&                       INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
    END SUBROUTINE DPBSV
  END INTERFACE
  CALL DPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE DPBSV1

SUBROUTINE CPBSV1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
  INTEGER, INTENT(OUT) :: INFO
  COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(*)
  INTERFACE
    SUBROUTINE CPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,       &
&                       INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
      INTEGER, INTENT(OUT) :: INFO
      COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
    END SUBROUTINE CPBSV
  END INTERFACE
  CALL CPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE CPBSV1

SUBROUTINE ZPBSV1(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: UPLO
  INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
  INTEGER, INTENT(OUT) :: INFO
  COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(*)
  INTERFACE
    SUBROUTINE ZPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB,       &
&                       INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: UPLO
      INTEGER, INTENT(IN) :: NRHS, N, LDB, KD, LDAB
      INTEGER, INTENT(OUT) :: INFO
      COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), B(LDB, *)
    END SUBROUTINE ZPBSV
  END INTERFACE
  CALL ZPBSV(UPLO, N, KD, NRHS, AB, LDAB, B, LDB, INFO)
END SUBROUTINE ZPBSV1

SUBROUTINE SPBSVX1(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,      &
&                     LDAFB, EQUED, S, B, LDB, X, LDX, RCOND, FERR,&
&                     BERR, WORK, IWORK, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
  CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
  INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
  INTEGER, INTENT(OUT) :: INFO, IWORK(*)
  REAL(WP), INTENT(OUT) :: X(*), WORK(*), FERR, BERR, RCOND
  REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(*),     &
&                              S(*)
  INTERFACE
    SUBROUTINE SPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,   &
&                        LDAFB, EQUED, S, B, LDB, X, LDX, RCOND,   &
&                        FERR, BERR, WORK, IWORK, INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
      CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
      INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
      INTEGER, INTENT(OUT) :: INFO, IWORK(*)
      REAL(WP), INTENT(OUT) :: X(LDX, *), WORK(*), FERR(*),       &
&                                BERR(*), RCOND
      REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),       &
&                                  B(LDB, *), S(*)
    END SUBROUTINE SPBSVX
  END INTERFACE
  REAL(WP) :: LFERR(1), LBERR(1)
  CALL SPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,    &
&                EQUED, S, B, LDB, X, LDX, RCOND, LFERR, LBERR,    &
&                WORK, IWORK, INFO)
  FERR = LFERR(1); BERR = LBERR(1)
END SUBROUTINE SPBSVX1

SUBROUTINE DPBSVX1(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,      &
&                     LDAFB, EQUED, S, B, LDB, X, LDX, RCOND, FERR,&
&                     BERR, WORK, IWORK, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
  CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
  INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
  INTEGER, INTENT(OUT) :: INFO, IWORK(*)
  REAL(WP), INTENT(OUT) :: X(*), WORK(*), FERR, BERR, RCOND
  REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(*),     &
&                              S(*)
  INTERFACE
    SUBROUTINE DPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,   &
&                        LDAFB, EQUED, S, B, LDB, X, LDX, RCOND,   &
&                        FERR, BERR, WORK, IWORK, INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
      CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
      INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
      INTEGER, INTENT(OUT) :: INFO, IWORK(*)
      REAL(WP), INTENT(OUT) :: X(LDX, *), WORK(*), FERR(*),       &
&                                BERR(*), RCOND
      REAL(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),       &
&                                  B(LDB, *), S(*)
    END SUBROUTINE DPBSVX
  END INTERFACE
  REAL(WP) :: LFERR(1), LBERR(1)
  CALL DPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,    &
&                EQUED, S, B, LDB, X, LDX, RCOND, LFERR, LBERR,    &
&                WORK, IWORK, INFO)
  FERR = LFERR(1); BERR = LBERR(1)
END SUBROUTINE DPBSVX1

SUBROUTINE CPBSVX1(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,      &
&                     LDAFB, EQUED, S, B, LDB, X, LDX, RCOND, FERR,&
&                     BERR, WORK, RWORK, INFO)
  USE LA_PRECISION, ONLY: WP => SP
  CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
  CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
  INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(OUT) :: FERR, BERR, RCOND, RWORK(*)
  COMPLEX(WP), INTENT(OUT) :: X(*), WORK(*)
  REAL(WP), INTENT(INOUT) :: S(*)
  COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  INTERFACE
    SUBROUTINE CPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,   &
&                        LDAFB, EQUED, S, B, LDB, X, LDX, RCOND,   &
&                        FERR, BERR, WORK, RWORK, INFO)
      USE LA_PRECISION, ONLY: WP => SP
      CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
      CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
      INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(OUT) :: FERR(*), BERR(*), RCOND, RWORK(*)
      COMPLEX(WP), INTENT(OUT) :: X(LDX, *), WORK(*)
      REAL(WP), INTENT(INOUT) :: S(*)
      COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),    &
&                                     B(LDB, *)
    END SUBROUTINE CPBSVX
  END INTERFACE
  REAL(WP) :: LFERR(1), LBERR(1)
  CALL CPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,    &
&                EQUED, S, B, LDB, X, LDX, RCOND, LFERR, LBERR,    &
&                WORK, RWORK, INFO)
  FERR = LFERR(1); BERR = LBERR(1)
END SUBROUTINE CPBSVX1

SUBROUTINE ZPBSVX1(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,      &
&                     LDAFB, EQUED, S, B, LDB, X, LDX, RCOND, FERR,&
&                     BERR, WORK, RWORK, INFO)
  USE LA_PRECISION, ONLY: WP => DP
  CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
  CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
  INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
  INTEGER, INTENT(OUT) :: INFO
  REAL(WP), INTENT(OUT) :: FERR, BERR, RCOND, RWORK(*)
  COMPLEX(WP), INTENT(OUT) :: X(*), WORK(*)
  REAL(WP), INTENT(INOUT) :: S(*)
  COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *), B(*)
  INTERFACE
    SUBROUTINE ZPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB,   &
&                        LDAFB, EQUED, S, B, LDB, X, LDX, RCOND,   &
&                        FERR, BERR, WORK, RWORK, INFO)
      USE LA_PRECISION, ONLY: WP => DP
      CHARACTER(LEN=1), INTENT(IN) :: FACT, UPLO
      CHARACTER(LEN=1), INTENT(INOUT) :: EQUED
      INTEGER, INTENT(IN) :: LDAB, LDAFB, LDB, LDX, NRHS, N, KD
      INTEGER, INTENT(OUT) :: INFO
      REAL(WP), INTENT(OUT) :: FERR(*), BERR(*), RCOND, RWORK(*)
      COMPLEX(WP), INTENT(OUT) :: X(LDX, *), WORK(*)
      REAL(WP), INTENT(INOUT) :: S(*)
      COMPLEX(WP), INTENT(INOUT) :: AB(LDAB, *), AFB(LDAFB, *),    &
&                                     B(LDB, *)
    END SUBROUTINE ZPBSVX
  END INTERFACE
  REAL(WP) :: LFERR(1), LBERR(1)
  CALL ZPBSVX(FACT, UPLO, N, KD, NRHS, AB, LDAB, AFB, LDAFB,    &
&                EQUED, S, B, LDB, X, LDX, RCOND, LFERR, LBERR,    &
&                WORK, RWORK, INFO)
  FERR = LFERR(1); BERR = LBERR(1)
END SUBROUTINE ZPBSVX1

END MODULE F77_PB_LAPACK
