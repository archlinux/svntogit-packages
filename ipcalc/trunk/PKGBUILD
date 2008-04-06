# Contributor: K. Piche <kpiche@rogers.com>
pkgname=ipcalc
pkgver=0.41
pkgrel=1
pkgdesc="Calculates IP broadcast, network, Cisco wildcard mask, and host ranges"
arch=(i686 x86_64)
url="http://jodies.de/ipcalc"
source=(http://jodies.de/ipcalc-archive/$pkgname-$pkgver.tar.gz)
depends=('perl')
md5sums=('fb791e9a5220fc8e624d915e18fc4697')

build() {
  mkdir -p $startdir/pkg/usr/bin
  install -m755 $startdir/src/$pkgname-$pkgver/ipcalc $startdir/pkg/usr/bin
}
