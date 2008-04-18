# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>
pkgname=xpenguins_themes
pkgver=1.0
pkgrel=1
pkgdesc="XPenguins Themes"
depends=('xpenguins')
source=(http://xpenguins.seul.org/$pkgname-$pkgver.tar.gz)
url="http://xpenguins.seul.org"

xpenguin_dir="$startdir/pkg/usr/share/xpenguins"

build() {
  mkdir -p $xpenguin_dir
  cp -R $startdir/src/themes $xpenguin_dir
}
md5sums=('827445e56d6f6216c43303c12ec2bbc1')
