# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=lsdvd
pkgver=0.16
pkgrel=3
pkgdesc="lsdvd is a C application for reading the contents of a DVD and printing the contents to your terminal"
arch=(i686 x86_64)
url="http://untrepid.com/acidrip/lsdvd.html"
depends=('libdvdread')
license=('GPL2')
#Special thanks to Mathieu Clabaut <mathieu.clabaut@gmail.com> for patches
source=(http://downloads.sourceforge.net/lsdvd/$pkgname-$pkgver.tar.gz \
        stdint_usage.patch)
md5sums=('340e1abe5c5e5abf7ff8031e78f49ee7' '6cbcbfde873f894bd3c784f65141b2fc')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  patch -up1 < ../stdint_usage.patch
  ./configure
  make || return 1
  make prefix=$startdir/pkg/usr install
}
