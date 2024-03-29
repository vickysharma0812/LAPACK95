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

MODULE F77_LA_LAPACK

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_LAPMR
  SUBROUTINE SLAPMR(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => SP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE

  SUBROUTINE DLAPMR(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => DP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE DLAPMR

  SUBROUTINE CLAPMR(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => SP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE CLAPMR

  SUBROUTINE ZLAPMR(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => DP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE ZLAPMR
END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_LAPMT
  SUBROUTINE SLAPMT(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => SP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE SLAPMT

  SUBROUTINE DLAPMT(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => DP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    REAL(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE DLAPMT

  SUBROUTINE CLAPMT(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => SP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE CLAPMT

  SUBROUTINE ZLAPMT(FORWRD, M, N, X, LDX, K)
    USE LA_PRECISION, ONLY: WP => DP
    LOGICAL, INTENT(IN) :: FORWRD
    INTEGER, INTENT(IN) :: M, N, LDX
    INTEGER, INTENT(INOUT) :: K(*)
    COMPLEX(WP), INTENT(INOUT) :: X(LDX, *)
  END SUBROUTINE ZLAPMT
END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

! subroutine dlacpy        (        character         UPLO,
! integer         M,
! integer         N,
! double precision, dimension( lda, * )         A,
! integer         LDA,
! double precision, dimension( ldb, * )         B,
! integer         LDB
! )

INTERFACE LA_LACPY

  SUBROUTINE SLACPY(UPLO, M, N, A, LDA, B, LDB)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: M, N, LDA, LDB
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: B(LDB, *)
  END SUBROUTINE SLACPY

  SUBROUTINE DLACPY(UPLO, M, N, A, LDA, B, LDB)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: M, N, LDA, LDB
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: B(LDB, *)
  END SUBROUTINE DLACPY

  SUBROUTINE CLACPY(UPLO, M, N, A, LDA, B, LDB)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: M, N, LDA, LDB
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    COMPLEX(WP), INTENT(OUT) :: B(LDB, *)
  END SUBROUTINE CLACPY

  SUBROUTINE ZLACPY(UPLO, M, N, A, LDA, B, LDB)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: UPLO
    INTEGER, INTENT(IN) :: M, N, LDA, LDB
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    COMPLEX(WP), INTENT(OUT) :: B(LDB, *)
  END SUBROUTINE ZLACPY

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_DISNA

  SUBROUTINE SDISNA(JOB, M, N, D, SEP, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    CHARACTER(LEN=1), INTENT(IN) :: JOB
    INTEGER, INTENT(IN) :: M, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: D(*)
    REAL(WP), INTENT(OUT) :: SEP(*)
  END SUBROUTINE SDISNA

  SUBROUTINE DDISNA(JOB, M, N, D, SEP, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    CHARACTER(LEN=1), INTENT(IN) :: JOB
    INTEGER, INTENT(IN) :: M, N
    INTEGER, INTENT(OUT) :: INFO
    REAL(WP), INTENT(IN) :: D(*)
    REAL(WP), INTENT(OUT) :: SEP(*)
  END SUBROUTINE DDISNA

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_LANGB

  FUNCTION SLANGB(NORM, N, KL, KU, AB, LDAB, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: SLANGB
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDAB, N, KL, KU
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION SLANGB

  FUNCTION DLANGB(NORM, N, KL, KU, AB, LDAB, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: DLANGB
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDAB, N, KL, KU
    REAL(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION DLANGB

  FUNCTION CLANGB(NORM, N, KL, KU, AB, LDAB, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: CLANGB
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDAB, N, KL, KU
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION CLANGB

  FUNCTION ZLANGB(NORM, N, KL, KU, AB, LDAB, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: ZLANGB
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDAB, N, KL, KU
    COMPLEX(WP), INTENT(IN) :: AB(LDAB, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION ZLANGB

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE

  FUNCTION SLAMCH(CMACH)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: SLAMCH
    CHARACTER(LEN=1), INTENT(IN) :: CMACH
  END FUNCTION SLAMCH

  FUNCTION DLAMCH(CMACH)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: DLAMCH
    CHARACTER(LEN=1), INTENT(IN) :: CMACH
  END FUNCTION DLAMCH

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_LANGE

  FUNCTION SLANGE(NORM, M, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: SLANGE
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDA, M, N
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION SLANGE

  FUNCTION DLANGE(NORM, M, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: DLANGE
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDA, M, N
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION DLANGE

  FUNCTION CLANGE(NORM, M, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: CLANGE
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDA, M, N
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION CLANGE

  FUNCTION ZLANGE(NORM, M, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: ZLANGE
    CHARACTER(LEN=1), INTENT(IN) :: NORM
    INTEGER, INTENT(IN) :: LDA, M, N
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION ZLANGE

  MODULE PROCEDURE SLANGE1
  MODULE PROCEDURE DLANGE1
  MODULE PROCEDURE CLANGE1
  MODULE PROCEDURE ZLANGE1

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_LANSY

  FUNCTION SLANSY(NORM, UPLO, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: SLANSY
    CHARACTER(LEN=1), INTENT(IN) :: NORM, UPLO
    INTEGER, INTENT(IN) :: LDA, N
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION SLANSY

  FUNCTION DLANSY(NORM, UPLO, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: DLANSY
    CHARACTER(LEN=1), INTENT(IN) :: NORM, UPLO
    INTEGER, INTENT(IN) :: LDA, N
    REAL(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION DLANSY

  FUNCTION CLANSY(NORM, UPLO, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => SP
    REAL(WP) :: CLANSY
    CHARACTER(LEN=1), INTENT(IN) :: NORM, UPLO
    INTEGER, INTENT(IN) :: LDA, N
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION CLANSY

  FUNCTION ZLANSY(NORM, UPLO, N, A, LDA, WORK)
    USE LA_PRECISION, ONLY: WP => DP
    REAL(WP) :: ZLANSY
    CHARACTER(LEN=1), INTENT(IN) :: NORM, UPLO
    INTEGER, INTENT(IN) :: LDA, N
    COMPLEX(WP), INTENT(IN) :: A(LDA, *)
    REAL(WP), INTENT(OUT) :: WORK(*)
  END FUNCTION ZLANSY

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

INTERFACE LA_ILAENV

  FUNCTION ILAENV(ISPEC, NAME, OPTS, N1, N2, N3, N4)
    INTEGER :: ILAENV
    CHARACTER(LEN=*), INTENT(IN) :: NAME, OPTS
    INTEGER, INTENT(IN) :: ISPEC, N1, N2, N3, N4
  END FUNCTION ILAENV

END INTERFACE

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

#ifdef NO_LAGGE_BUG
INTERFACE LA_LAGGE

  SUBROUTINE SLAGGE(M, N, KL, KU, D, A, LDA, ISEED, WORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    INTEGER, INTENT(IN) :: M, N, KL, KU, LDA
    INTEGER, INTENT(OUT) :: INFO
    INTEGER, INTENT(INOUT) :: ISEED(4)
    REAL(WP), INTENT(IN) :: D(*)
    REAL(WP), INTENT(OUT) :: A(LDA, *), WORK(*)
  END SUBROUTINE SLAGGE

  SUBROUTINE DLAGGE(M, N, KL, KU, D, A, LDA, ISEED, WORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    INTEGER, INTENT(IN) :: M, N, KL, KU, LDA
    INTEGER, INTENT(OUT) :: INFO
    INTEGER, INTENT(INOUT) :: ISEED(4)
    REAL(WP), INTENT(IN) :: D(*)
    REAL(WP), INTENT(OUT) :: A(LDA, *), WORK(*)
  END SUBROUTINE DLAGGE

  SUBROUTINE CLAGGE(M, N, KL, KU, D, A, LDA, ISEED, WORK, INFO)
    USE LA_PRECISION, ONLY: WP => SP
    INTEGER, INTENT(IN) :: M, N, KL, KU, LDA
    INTEGER, INTENT(OUT) :: INFO
    INTEGER, INTENT(INOUT) :: ISEED(4)
    REAL(WP), INTENT(IN) :: D(*)
    COMPLEX(WP), INTENT(OUT) :: A(LDA, *), WORK(*)
  END SUBROUTINE CLAGGE

  SUBROUTINE ZLAGGE(M, N, KL, KU, D, A, LDA, ISEED, WORK, INFO)
    USE LA_PRECISION, ONLY: WP => DP
    INTEGER, INTENT(IN) :: M, N, KL, KU, LDA
    INTEGER, INTENT(OUT) :: INFO
    INTEGER, INTENT(INOUT) :: ISEED(4)
    REAL(WP), INTENT(IN) :: D(*)
    COMPLEX(WP), INTENT(OUT) :: A(LDA, *), WORK(*)
  END SUBROUTINE ZLAGGE

END INTERFACE
#endif

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

CONTAINS

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

FUNCTION SLANGE1(NORM, M, N, A, LDA, WORK)
  USE LA_PRECISION, ONLY: WP => SP
  REAL(WP) :: SLANGE1
  CHARACTER(LEN=1), INTENT(IN) :: NORM
  INTEGER, INTENT(IN) :: LDA, M, N
  REAL(WP), INTENT(IN) :: A(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    FUNCTION SLANGE(NORM, M, N, A, LDA, WORK)
      USE LA_PRECISION, ONLY: WP => SP
      REAL(WP) :: SLANGE
      CHARACTER(LEN=1), INTENT(IN) :: NORM
      INTEGER, INTENT(IN) :: LDA, M, N
      REAL(WP), INTENT(IN) :: A(LDA, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END FUNCTION SLANGE
  END INTERFACE
  SLANGE1 = SLANGE(NORM, M, N, A, LDA, WORK)
END FUNCTION SLANGE1

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

FUNCTION DLANGE1(NORM, M, N, A, LDA, WORK)
  USE LA_PRECISION, ONLY: WP => DP
  REAL(WP) :: DLANGE1
  CHARACTER(LEN=1), INTENT(IN) :: NORM
  INTEGER, INTENT(IN) :: LDA, M, N
  REAL(WP), INTENT(IN) :: A(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    FUNCTION DLANGE(NORM, M, N, A, LDA, WORK)
      USE LA_PRECISION, ONLY: WP => DP
      REAL(WP) :: DLANGE
      CHARACTER(LEN=1), INTENT(IN) :: NORM
      INTEGER, INTENT(IN) :: LDA, M, N
      REAL(WP), INTENT(IN) :: A(LDA, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END FUNCTION DLANGE
  END INTERFACE
  DLANGE1 = DLANGE(NORM, M, N, A, LDA, WORK)
END FUNCTION DLANGE1

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

FUNCTION CLANGE1(NORM, M, N, A, LDA, WORK)
  USE LA_PRECISION, ONLY: WP => SP
  REAL(WP) :: CLANGE1
  CHARACTER(LEN=1), INTENT(IN) :: NORM
  INTEGER, INTENT(IN) :: LDA, M, N
  COMPLEX(WP), INTENT(IN) :: A(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    FUNCTION CLANGE(NORM, M, N, A, LDA, WORK)
      USE LA_PRECISION, ONLY: WP => SP
      REAL(WP) :: CLANGE
      CHARACTER(LEN=1), INTENT(IN) :: NORM
      INTEGER, INTENT(IN) :: LDA, M, N
      COMPLEX(WP), INTENT(IN) :: A(LDA, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END FUNCTION CLANGE
  END INTERFACE
  CLANGE1 = CLANGE(NORM, M, N, A, LDA, WORK)
END FUNCTION CLANGE1

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

FUNCTION ZLANGE1(NORM, M, N, A, LDA, WORK)
  USE LA_PRECISION, ONLY: WP => DP
  REAL(WP) :: ZLANGE1
  CHARACTER(LEN=1), INTENT(IN) :: NORM
  INTEGER, INTENT(IN) :: LDA, M, N
  COMPLEX(WP), INTENT(IN) :: A(*)
  REAL(WP), INTENT(OUT) :: WORK(*)
  INTERFACE
    FUNCTION ZLANGE(NORM, M, N, A, LDA, WORK)
      USE LA_PRECISION, ONLY: WP => DP
      REAL(WP) :: ZLANGE
      CHARACTER(LEN=1), INTENT(IN) :: NORM
      INTEGER, INTENT(IN) :: LDA, M, N
      COMPLEX(WP), INTENT(IN) :: A(LDA, *)
      REAL(WP), INTENT(OUT) :: WORK(*)
    END FUNCTION ZLANGE
  END INTERFACE
  ZLANGE1 = ZLANGE(NORM, M, N, A, LDA, WORK)
END FUNCTION ZLANGE1

!----------------------------------------------------------------------------
!
!----------------------------------------------------------------------------

END MODULE F77_LA_LAPACK
