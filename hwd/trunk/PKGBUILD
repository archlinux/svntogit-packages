# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Markku (rasat at Arch Linux Forums)

pkgname=hwd
pkgver=5.3.3
pkgrel=1
pkgdesc="Hardware detect for Arch Linux (devfs and udev)."
url="http://user-contributions.org/projects/hwd/hwd.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'pciutils' 'usbutils' 'ddcxinfo-arch' 'wget')
install=hwd.install
source=(http://user-contributions.org/projects/hwd/src/$pkgname-$pkgver.bin.tar.gz)


build() {
  cd $startdir/src/$pkgname-$pkgver
  cp -R $startdir/src/$pkgname-$pkgver/{etc,usr} $startdir/pkg/ || return 1
}

md5sums=('0b1392f68962b3d38123d279eec07a0f')
