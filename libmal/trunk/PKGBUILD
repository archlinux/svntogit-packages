# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libmal
pkgver=0.42
pkgrel=1
depends=('pilot-link>=0.12.1')
options=('nolibtool')
pkgdesc="a convenience library of the object files contained in Tom Whittaker's malsync distribution"
arch=(i686 x86_64)
url="http://jasonday.home.att.net"
source=(http://jasonday.home.att.net/code/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('91ec7c193afafcabb8ec31ddde919ff1')

build()        {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
