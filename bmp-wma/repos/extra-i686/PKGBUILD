# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=bmp-wma
pkgver=0.1.1
pkgrel=2
pkgdesc="WMA plugin for Beep Media Player"
url="http://bmp-plugins.berlios.de/novelian/project.php?p=bmp-wma"
license="GPL"
depends=('bmp')
groups=('bmp-plugins' 'bmp-io-plugins')
source=(http://download.berlios.de/bmp-plugins/${pkgname}-${pkgver}.tar.gz
bmp-wma-gcc4.patch)
md5sums=('8dcf3fcdb10e8e2e386f70745812412b' '730eba8f41e989dd8b56c18bcc826cc4')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  patch -Np0 -i ../bmp-wma-gcc4.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rmdir $startdir/pkg/usr/bin
  # libtool-slay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
