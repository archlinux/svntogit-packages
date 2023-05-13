# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
_pkgver=4.2.0
_patchver=7
pkgrel=2
pkgver=${_pkgver}.p${_patchver}
#pkgver=$_pkgver
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)
depends=(glibc gmp)
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig}
        patches.diff) # wget https://www.mpfr.org/mpfr-${_pkgver}/allpatches -O patches.diff
sha512sums=('58e843125884ca58837ae5159cd4092af09e8f21931a2efd19c15de057c9d1dc0753ae95c592e2ce59a727fbc491af776db8b00a055320413cdcf2033b90505c'
            'SKIP'
            '12cb553946b372da762b919a523a0dbb5c7b9f7931fd018013fb8e2a51b43d6ef421dda9c5ff6d89d7f75376d67f33205e7bcc3c69ef1aeaad5b3539218ec349')
b2sums=('dd88ae3a6a910ad8faeb791b49c3b1085de5d0d4c49c637c124bf4d9bc79fb621d0d1d69e07d0642b9b678f6d355a5830d083dfd189e1e91d0e04c970c10bd64'
        'SKIP'
        'bbe00cff15d382663db623e1ef834e44192df1ad22c436d5b870fcf8bf438bd618d8ae332fe7ac4c0fd1d638e0764ab84a81954b91d54e0337ccad3568a3a83b')
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>

prepare() {
  cd $pkgname-${_pkgver}

  patch -p1 -i ../patches.diff
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
