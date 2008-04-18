# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Eddie Lozon <almostlucky@attbi.com>

pkgname=gtk-theme-switch2
pkgver=2.0.0rc2
pkgrel=2
pkgdesc="Gtk2 theme switcher"
depends=('gtk2')
source=(http://www.muhri.net/gtk-theme-switch-$pkgver.tar.gz \
        enable_deprecated.patch)
url="http://muhri.net/nav.php3?node=gts"
md5sums=('f51b254fb347a86feef12db4bd76be6f' '1d8d84a768a824502d0ee998a52f81b9')

build()
{
  cd $startdir/src/gtk-theme-switch-$pkgver
  patch -up0 -i ../enable_deprecated.patch
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp switch2 $startdir/pkg/usr/bin/switch2
}
