# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz 'mrlemux' Lemusisk mrlemux at gmail dotcom
# Based on the pcre package by Sébastien "Seblu" Luttringer
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=pcre2
pkgver=10.35
pkgrel=1
pkgdesc='A library that implements Perl 5-style regular expressions. 2nd version'
arch=('x86_64')
url='https://www.pcre.org/'
license=('BSD')
depends=('gcc-libs' 'readline' 'zlib' 'bzip2' 'bash')
source=("https://ftp.pcre.org/pub/pcre/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('ecfb8d48e219daff02874783b7b436fe7d70d8471e44eb66e1e29abb7b0aa67547e6b5fba7058b074ac90eef265ece7d12728f80afdda45b6b8124435f4561fd'
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
