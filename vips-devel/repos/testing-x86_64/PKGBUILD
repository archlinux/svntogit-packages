# $Id: PKGBUILD,v 1.6 2007/09/22 09:36:54 damir Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=vips-devel
provides=('vips')
conflicts=('vips')
pkgver=7.13.0
pkgrel=2
license=('LGPL')
pkgdesc="A free image processing system. [devel]"
arch=("i686" "x86_64")
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('liboil' 'fftw>=3.0.1-5' 'lcms' 'pango' 'imagemagick>=6.4.0.2' 'libpng' 'libtiff' 'libjpeg' 'zlib' 'glib2' 'libexif' 'openexr')
makedepends=('make' 'pkgconfig' 'perl' 'perlxml')
options=('!libtool')
source=("http://www.vips.ecs.soton.ac.uk/vips-${pkgver%.*}/vips-${pkgver}.tar.gz" "vips-gcc43.diff")
md5sums=('d99126c8a187a91c971fce4ef0b54f65' '7fae69288dd10b1710495ff91465bcfc')

build() {
  cd ${startdir}/src/vips-${pkgver}
  patch -p1 < ../vips-gcc43.diff
  ./configure --prefix=/usr --without-python
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
