# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=wmix
pkgver=3.1
pkgrel=2
pkgdesc="Dockapp mixer for OSS or ALSA"
source=(http://www.ne.jp/asahi/linux/timecop/software/$pkgname-$pkgver.tar.gz)
url="http://www.ne.jp/asahi/linux/timecop/"
depends=('libxpm')
md5sums=('62f6e86f7558f193e081dc29444a6699')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  #  Fix version.
  sed -e '/^#define VERSION/ s/3\.0/3.1/' -e 's/wmix 3\.0/wmix 3.1/' -i wmix.c
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}
