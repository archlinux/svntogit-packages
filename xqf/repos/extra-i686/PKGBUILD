# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xqf
pkgver=1.0.5
pkgrel=2
pkgdesc="XQF is a Quake/Quake World/Quake2/Quake3 server browser and launcher for X11"
arch=(i686 x86_64)
depends=('gtk2' 'qstat' 'geoip')
license=('GPL')
url="http://www.linuxgames.com/xqf/"
source=(http://heanet.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a88cecba6abb6349107ab135f1009946')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk2 --enable-geoip
  make || return 1
  make DESTDIR=$startdir/pkg install
}
