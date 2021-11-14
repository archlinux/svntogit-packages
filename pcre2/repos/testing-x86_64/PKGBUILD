# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.39
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
source=("https://github.com/PhilipHazel/pcre2/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('b3d898198f4b5ffc3453d2ba56fe2a7298c01c52e5f67d45f1e046fc0dee62e16a4024fcb65839ac9c367beedb531647affd6f8599fbeb102f19423c150d80d4'
            'SKIP')
validpgpkeys=('45F68D54BBE23FB3039B46E59766E084FB0F43D8')  # Philip Hazel

build() {
  cd $pkgname-$pkgver
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

# vim:set ts=2 sw=2 et:
