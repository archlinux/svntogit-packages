# $Id$
# Maintainer: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#

pkgname=metalog
pkgver=0.8
pkgrel=1
pkgdesc="Metalog is a modern replacement for syslogd and klogd"
arch=(i686 x86_64)
depends=('pcre')
provides=('logger')
backup=(etc/metalog.conf etc/conf.d/metalog)
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
    metalog metalog.confd)
md5sums=('91552a26bfe976356e6108944e195aa6' 'cdd1d34eedbfbc2d9e659bf0a0f58f56'\
         '86bccd5a02996921e29eff8a0394d11f')
license=(GPL)
url="http://metalog.sourceforge.net"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install || return 1
  /bin/install -D -m755 $startdir/metalog $startdir/pkg/etc/rc.d/metalog
  /bin/install -D -m644 $startdir/metalog.confd $startdir/pkg/etc/conf.d/metalog
  /bin/install -D -m644 metalog.conf $startdir/pkg/etc/metalog.conf
}

# vim: ts=2: ft=sh
