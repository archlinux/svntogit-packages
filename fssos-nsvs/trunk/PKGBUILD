# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=fssos-nsvs
pkgver=0.5
pkgrel=3
pkgdesc="NSVS for FSSOS"
backup=(etc/nsvsd.conf)
url="http://fssos.sourceforge.net/"
license="GNU GPL"
depends=('bash' 'mysql>=5.0.15' 'mysql<=5.0.9999')
install=($pkgname.install)
source=(http://dl.sourceforge.net/sourceforge/fssos/nsvs-$pkgver.tar.gz nsvsd \
	fssos-nsvs.install)
md5sums=('3f17c2f6339f1a322b712b467023d825' '4a7189354be6dd44f3a8d655a6d38775' \
	'f71c19df8cabcfb23f6285ee75988668')

build() {
  cd $startdir/src/nsvs-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  cp -p $startdir/src/nsvsd $startdir/pkg/etc/rc.d/
  # libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
