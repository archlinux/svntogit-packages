# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgname=libetpan
pkgver=0.52
pkgrel=3
pkgdesc="a portable middleware for email access"
arch=(i686 x86_64)
url="http://www.etpan.org/"
license=("custom:etpan")
depends=('db>=4.6' 'libsasl' 'curl' 'expat')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('119eb4ac27fb75540ca74d8997f7fc7f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # Fix detection of DB version
  sed -e 's/db-4.4/db-4.6 db-4.5 db4.4/g' -i configure
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 COPYRIGHT ${startdir}/pkg/usr/share/licenses/$pkgname/license.txt
}
