# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=eclipse-cdt
pkgver=4.0.1
pkgrel=1
pkgdesc="C/C++ Plugin for Eclipse"
arch=(i686 x86_64)
url="http://www.eclipse.org/cdt"
license=("EPL")
depends=('eclipse>=3.3')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://download.eclipse.org/tools/cdt/releases/europa/dist/cdt-master-$pkgver.zip)
md5sums=('caf2aee8d43eb544a862ce99a8f7fdac')

build() {
  installdir=$startdir/pkg/usr/share

  mkdir -p $installdir/eclipse || return 1
  cp -a $startdir/src/features $installdir/eclipse || return 1
  cp -a $startdir/src/plugins $installdir/eclipse || return 1
}
