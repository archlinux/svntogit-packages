# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=x11vnc
pkgver=0.9.4
pkgrel=1
pkgdesc="a VNC server for real X displays"
arch=("i686" "x86_64")
license=("GPL2")
#source=(http://dl.sourceforge.net/sourceforge/libvncserver/$pkgname-$pkgver.tar.gz)
url="http://www.karlrunge.com/x11vnc/"
source=("$url/$pkgname-$pkgver.tar.gz")
depends=('openssl' 'libjpeg' 'zlib' 'libx11' 'libxtst' 'libxinerama' 'libxdamage' 'libxrandr' 'avahi')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}

md5sums=('75c717fc7468e0cf9a632a2172dea13a')
