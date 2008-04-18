# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=ed
pkgver=0.9
pkgrel=1
pkgdesc="A POSIX-compliant line editor"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/ed/ed.html"
groups=('base-devel')
depends=('glibc')
options=('!emptydirs')
source=(ftp://ftp.gnu.org/gnu/ed/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fb0c1c63ec13d8516733dd1d85c76473')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/
  make || return 1
# installing executable
  install -D -m755 ed ${startdir}/pkg/bin/ed
  cd ${startdir}/pkg/bin
  ln ed red
# installing man page
  cd ${startdir}/src/${pkgname}-${pkgver}
  install -D -m644 doc/ed.1 ${startdir}/pkg/usr/share/man/man1/ed.1
  cd ${startdir}/pkg/usr/share/man/man1
  ln ed.1 red.1
}
