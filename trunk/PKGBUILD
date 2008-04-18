# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=help2man
pkgver=1.36.4
pkgrel=1
pkgdesc="Conversion tool to create man files"
url="http://www.gnu.org/software/help2man/"
license=""
depends=(glibc perl-locale-gettext)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d31a0a38c2ec71faa06723f6b8bd3076')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
