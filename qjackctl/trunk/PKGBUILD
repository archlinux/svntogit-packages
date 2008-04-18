# $Id$
# Maintainer: tobias <tobias@archlinux.net>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=qjackctl
pkgver=0.3.2
pkgrel=2
pkgdesc="a qt based frontend to the jack server (jack-audio-connection-kit)"
arch=(i686 x86_64)
license=('GPL2')
depends=('jack-audio-connection-kit' 'qt')
options=('!libtool')
install=${pkgname}.install
url="http://qjackctl.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('17830d94f1f064ca190ab42ddac20c4b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=${startdir}/pkg/usr install
}
