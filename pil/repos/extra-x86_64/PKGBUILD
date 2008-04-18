# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=pil
pkgver=1.1.6
pkgrel=4
pkgdesc="Python imaging library"
arch=(i686 x86_64)
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:"pil"')
depends=('python' 'libjpeg' 'freetype2') 
makedepends=('tk>=8.5.0')
source=(http://effbot.org/downloads/Imaging-$pkgver.tar.gz)
md5sums=('3a9b5c20ca52f0a9900512d2c7347622')

build() {
  cd $startdir/src/Imaging-$pkgver
  python setup.py build_ext 
  python setup.py install --root=$startdir/pkg
  mkdir -p $startdir/pkg/usr/include/python2.5/
  cp libImaging/*.h $startdir/pkg/usr/include/python2.5/

  # Install license
  install -m644 -D $startdir/src/Imaging-$pkgver/README \
                   $startdir/pkg/usr/share/licenses/pil/README
}

