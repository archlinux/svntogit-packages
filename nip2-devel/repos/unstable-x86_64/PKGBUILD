# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=nip2-devel
pkgver=7.13.0
mainver=7.13
pkgrel=1
license=('GPL')
pkgdesc="Frontend to the vips image library [devel]"
arch=("i686" "x86_64")
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('vips-devel>=7.13.0' 'gtk2' 'gsl')
install=$pkgname.install
source=("http://www.vips.ecs.soton.ac.uk/vips-$mainver/nip2-$pkgver.tar.gz")

build() {
  cd $startdir/src/nip2-$pkgver
  ./configure --prefix=/usr --enable-debug=minimum
  make || return 1
  make DESTDIR=$startdir/pkg install 
}

