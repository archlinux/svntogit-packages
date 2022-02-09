# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
_pkgver=4.1.0
_patchver=13
pkgrel=2
pkgver=${_pkgver}.p${_patchver}
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=('GPL3' 'LGPL3')
depends=('glibc' 'gmp')
makedepends=('autoconf-archive')
source=("https://ftp.gnu.org/gnu/mpfr/mpfr-${_pkgver}.tar.xz"{,.sig}
         patches.diff) # wget https://www.mpfr.org/mpfr-4.1.0/allpatches -O patches.diff
sha512sums=('1bd1c349741a6529dfa53af4f0da8d49254b164ece8a46928cdb13a99460285622d57fe6f68cef19c6727b3f9daa25ddb3d7d65c201c8f387e421c7f7bee6273'
            'SKIP'
            'f7504bbca6631c9e0eba74b7e410032aec9f4f45731c48b1622c8251797dcb05e76e547ccfa407a767b1c35f08a04b61e872a982e07121c82bc11fcb6e9c06c6')
b2sums=('41d1be0c4b557760f12a4525ad3a84b6e2cd6f0927c935fcfba577ac0490e582d1ae4b581dce58e21e705cf9d7c88373054d7fb7a94bb32c69b339f99a25dc68'
        'SKIP'
        '3b1a1775619d5f4ec710f896596bcc2391707ec97c50d65acba2305c7e910756b2a63d476abf7877d97db9f5ed49991d23fd7ed278f08b7d96346640fb06d5d1')
# NOTE: key holder contacted about unsafe key (2021-05-03)
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D') # Vincent Lefevre <vincent@vinc17.net>

prepare() {
  cd $pkgname-${_pkgver}

  patch -p1 < "$srcdir"/patches.diff
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
