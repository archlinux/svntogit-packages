# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.42
pkgrel=2
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('readline' 'zlib' 'bzip2' 'bash')
provides=(libpcre2-{8,16,32,posix}.so)
options=(staticlibs)
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('72fbde87fecec3aa4b47225dd919ea1d55e97f2cbcf02aba26e5a0d3b1ffb58c25a80a9ef069eb99f9cf4e41ba9604ad06a7ec159870e1e875d86820e12256d3'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')  # Philip Hazel <ph10@hermes.cam.ac.uk>

build() {
  cd $pkgname-$pkgver

  # use fat LTO objects for static libraries
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  ./configure \
    --prefix=/usr \
    --enable-pcre2-16 \
    --enable-pcre2-32 \
    --enable-jit \
    --enable-pcre2grep-libz \
    --enable-pcre2grep-libbz2 \
    --enable-pcre2test-libreadline
  make
}

check() {
  cd $pkgname-$pkgver
  make -j1 check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
