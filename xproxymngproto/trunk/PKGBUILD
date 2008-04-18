# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xproxymngproto
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 proxy management extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/xproxymanagementprotocol-${pkgver}.tar.bz2)
md5sums=('d28007a50976204960fc1fc07b4ca093')

build() {
  cd ${startdir}/src/xproxymanagementprotocol-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
