# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Jani Talikka <jani.talikka@gmail.com>
pkgname=smartmontools
pkgver=5.37
pkgrel=1
pkgdesc="Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives."
url="http://smartmontools.sourceforge.net"
license=('GPL')
arch=('i686')
depends=('glibc')
backup=('etc/smartd.conf')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        smartd)

build()
{
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/etc/rc.d
  install -D -m 755 ../smartd ${startdir}/pkg/etc/rc.d/smartd
}
md5sums=('4ab3668b7d1362ce923f64a211e0e568' '850f98b6792b7642ff193a49a2f1139d')
