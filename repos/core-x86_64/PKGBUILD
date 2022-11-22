# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
_pkgver=4.1.1
#_patchver=13
pkgrel=1
#pkgver=${_pkgver}.p${_patchver}
pkgver=$_pkgver
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(GPL3 LGPL3)
depends=(glibc gmp)
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz{,.sig})
#        patches.diff) # wget https://www.mpfr.org/mpfr-4.1.0/allpatches -O patches.diff
sha512sums=('be468749bd88870dec37be35e544983a8fb7bda638eb9414c37334b9d553099ea2aa067045f51ae2c8ab86d852ef833e18161d173e414af0928e9a438c9b91f1'
            'SKIP')
b2sums=('ce20baee2f060acb28b877ffe6fc40c5619cf6af231bd54ca6cfb3e42ef2d74a4ffbab96cf0b5dd6a162e558099a54701d42f34f5bf2256f256fe6f5ae2505d0'
        'SKIP')
# NOTE: key holder contacted about unsafe key (2021-05-03)
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D'
              'A534BE3F83E241D918280AEB5831D11A0D4DB02A') # Vincent Lefevre <vincent@vinc17.net>
options=(debug)

prepare() {
  cd $pkgname-${_pkgver}

#  patch -p1 < "$srcdir"/patches.diff
#  autoreconf -fiv
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
