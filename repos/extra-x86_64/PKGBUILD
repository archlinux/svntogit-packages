# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=libao
pkgver=0.8.8
pkgrel=2
pkgdesc="Cross-platform audio output library and plugins"
url="http://www.xiph.org/ao"
arch=(i686 x86_64)
license=('GPL')
depends=('glibc' 'alsa-lib')
makedepends=('esd')
backup=('etc/libao.conf')
source=(http://downloads.xiph.org/releases/ao/${pkgname}-${pkgver}.tar.gz libao.conf)
md5sums=('b92cba3cbcf1ee9bc221118a85d23dcd')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-alsa09 --disable-arts
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Add conf file
  install -Dm0644 $startdir/src/libao.conf $startdir/pkg/etc/libao.conf
}
