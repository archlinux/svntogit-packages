# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.34
pkgrel=2
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
source=("https://ftp.pcre.org/pub/pcre/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('77ad75f8b0b8bbfc2f57932596151bca25b06bd621e0f047e476f38cd127f43e2052460b95c281a7e874aad2b7fd86c8f3413f4a323abb74b9440a42d0ee9524'
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
    --enable-pcre2test-libreadline \
    --enable-jit-sealloc
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
