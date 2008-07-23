# $Id$
# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=abcm2ps-devel
orgname=abcm2ps
pkgver=5.5.2
pkgrel=1
pkgdesc="abcm2ps is a command line program which converts ABC to music sheet in PostScript format. It is an extension of abc2ps which may handle many voices per staff. (DEVELOPEMENT version)"
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('glibc')
provides=('abcm2ps')
conflicts=('abcm2ps')
source=("http://moinejf.free.fr/$orgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$orgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr docdir=$startdir/pkg/usr/doc install
}
