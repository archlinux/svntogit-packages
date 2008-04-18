# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=vips
pkgver=7.14.1
pkgrel=2
pkgdesc="VIPS is a free image processing system."
arch=("i686" "x86_64")
license=('LGPL')
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('fftw>=3.0.1-5' 'lcms' 'pango' 'imagemagick>=6.4.0.2' 'libpng' 'libtiff' 'libjpeg' 'zlib' 'glib2' 'libexif' 'openexr' 'liboil')
makedepends=('make' 'pkgconfig' 'perl' 'swig>=1.3.31' 'perlxml')
source=("http://www.vips.ecs.soton.ac.uk/supported/${pkgver%.*}/$pkgname-$pkgver.tar.gz")
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('4766b591d3970e07fb6135758d84b877')
