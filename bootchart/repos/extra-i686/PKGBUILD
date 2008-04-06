#Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=bootchart
pkgver=0.9
pkgrel=3
pkgdesc="Boot Process Performance Visualization"
url="http://www.bootchart.org/"
depends=('j2re' 'acct')
makedepends=('apache-ant')
install=bootchart.install
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 bootchart-render)
md5sums=('4be91177d19069e21beeb106f2f77dff' 'f02888cda23a5b1c9b931140f6fdbb71')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  ant
  sed -i "s#ROOT=/#ROOT=$startdir/pkg#" install.sh

  mkdir -p $startdir/pkg/sbin
  mkdir -p $startdir/pkg/etc
  ./install.sh

  chmod 644 $startdir/pkg/etc/bootchartd.conf

  mkdir -p $startdir/pkg/usr/share/bootchart
  cp bootchart.jar $startdir/pkg/usr/share/bootchart

  mkdir -p $startdir/pkg/usr/bin
  install -m755 $startdir/src/bootchart-render $startdir/pkg/usr/bin/bootchart-render
}
