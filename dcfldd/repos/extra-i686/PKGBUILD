# $Id$
# Contributor: Paul Mattal <pjmattal@elys.com>
# Maintainer: Paul Mattal <pjmattal@elys.com>
pkgname=dcfldd
pkgver=1.3.4.1
pkgrel=1
pkgdesc="DCFL (DoD Computer Forensics Lab) dd replacement with hashing"
arch=(i686 x86_64)
url="http://dcfldd.sourceforge.net/"
license=""
depends=(glibc)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dl.sf.net/sourceforge/$pkgname/$pkgname-1.3.4-1.tar.gz)
md5sums=('952026c872f11b53ce0ec6681a3eef0a')

build() {
  cd $startdir/src/$pkgname-1.3.4-1 || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
