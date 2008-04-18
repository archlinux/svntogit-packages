# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Committer: Jason Chu <jason@archlinux.org>
pkgname=user-mode-linux
pkgver=2.6.20.4
pkgrel=1
pkgdesc="Run multiple virtual Linux systems as applications within a normal Linux system"
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2 config)
md5sums=('ad6df0431ce9eb91dd558538e71239de' 'fbda645fd5825736e388ce2015f963e3')
depends=('glibc' 'uml_utilities')
makedepends=('libpcap')
url="http://user-mode-linux.sourceforge.net/"

build() {
  cd $startdir/src/linux-$pkgver
  cp $startdir/src/config ./.config
  make oldconfig ARCH=um || return 1
  make linux ARCH=um || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp linux $startdir/pkg/usr/bin
}
