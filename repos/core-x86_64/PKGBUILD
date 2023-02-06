# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
_pkgver=4.2.0
#_patchver=1
pkgrel=3
#pkgver=${_pkgver}.p${_patchver}
pkgver=$_pkgver
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)
depends=(glibc gmp)
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig}
        tsprintf.patch::https://gitlab.inria.fr/mpfr/mpfr/-/commit/5172494c09718ffcb7ef1f19b3b211e3bce8781a.patch)
#        patches.diff) # wget https://www.mpfr.org/mpfr-4.1.1/allpatches -O patches.diff
sha512sums=('58e843125884ca58837ae5159cd4092af09e8f21931a2efd19c15de057c9d1dc0753ae95c592e2ce59a727fbc491af776db8b00a055320413cdcf2033b90505c'
            'SKIP'
            '6d68ee5d286997c9a0bb66bf8da71a8af39e375091b743f1858dea9054b0f4f725ea0bcc37d39ac87b8a95ae508204c61413f4b2cb741807558952ee1a5d81e9')
b2sums=('dd88ae3a6a910ad8faeb791b49c3b1085de5d0d4c49c637c124bf4d9bc79fb621d0d1d69e07d0642b9b678f6d355a5830d083dfd189e1e91d0e04c970c10bd64'
        'SKIP'
        '16222c0f409d757b6cad515d13a1673be26302f48bc206f8526cb46a2d357404b181811da6180326be136a265d63b8e47b81107b01f4c8abc4637fd9d5fca4ea')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>

prepare() {
  cd $pkgname-${_pkgver}

  patch -Np1 < ../tsprintf.patch
  # sed -i '/check_vsprintf ("+1,234,567/d' tests/tsprintf.c
  autoreconf -fiv
}

build() {
  cd $pkgname-${_pkgver}
  ./configure --prefix=/usr \
    --enable-thread-safe \
    --enable-shared
  make
}

check() {
  cd $pkgname-${_pkgver}
  make check
  make check-exported-symbols
}

package() {
  cd $pkgname-${_pkgver}
  make DESTDIR="$pkgdir" install
}
