# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.31
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='http://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
source=("ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/$pkgname-$pkgver.tar.bz2")
sha512sums=('44d7db2513d9415dcdf6541366fea585e016f572f3e4379f6e959a38114b2337851092049ab4a1576ae8f19b9de413edbcfa62f434c77fc8470747ee5413e967')

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
