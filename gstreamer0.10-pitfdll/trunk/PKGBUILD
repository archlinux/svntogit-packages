# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gstreamer0.10-pitfdll
pkgver=0.9.1.1
pkgrel=2
arch=('i686')
license=('GPL')
pkgdesc="Win32 DLL loader for Gstreamer"
url="http://ronald.bitfreak.net/pitfdll.php"
depends=('gstreamer0.10-base>=0.10.13')
groups=('gstreamer0.10-plugins')
source=(http://archlinux.org/~jgc/gstreamer/pitfdll-0.9.1.1-20070630.tar.bz2
	use-fixed-caps.patch)
options=('!libtool')
md5sums=('b9c182d95c1967d7bd0c26c836363c21' '7b6a4c068698059b3a67f25a640b0a98')

build() {
  cd ${startdir}/src/pitfdll-${pkgver}
  patch -Np0 -i ${startdir}/src/use-fixed-caps.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
