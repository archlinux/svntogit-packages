# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=nip2-devel
pkgver=7.13.0
pkgrel=2
pkgdesc="Frontend to the vips image library [devel]"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('vips-devel>=7.13.0' 'gtk2' 'gsl' 'imagemagick>=6.4.0.2' 'shared-mime-info' 'desktop-file-utils')
makedepends=('perlxml' 'gnome-doc-utils>=0.11.2')
install=$pkgname.install
source=("http://www.vips.ecs.soton.ac.uk/vips-${pkgver%.*}/nip2-$pkgver.tar.gz")
md5sums=('658fdb180db25377028180d41325dfc4')

build() {
  cd $startdir/src/nip2-$pkgver
  ./configure --prefix=/usr --enable-debug=minimum
  make || return 1
  make DESTDIR=$startdir/pkg install 
}

