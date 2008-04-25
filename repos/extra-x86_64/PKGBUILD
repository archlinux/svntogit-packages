# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Charles-Henri d'Adhemar <cdadhemar@gmail.com>

pkgname=gegl
pkgver=0.0.16
pkgrel=2
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="http://www.gegl.org/"
license=('LGPL3')
depends=('babl>=0.0.14' 'libpng' 'gtk2')
options=('!libtool')
source=(ftp://ftp.gimp.org/pub/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fd49cb219ece97f4677554db4a2c02d1')
sha1sums=('de262a29fc3c6c5fc1a436828044cf22756fb54b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
