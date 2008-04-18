#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=ndiswrapper-utils
pkgver=1.52
pkgrel=1
pkgdesc="Binaries for ndiswrapper module"
arch=(i686 x86_64)
license=('GPL')
url="http://ndiswrapper.sourceforge.net"
depends=(wireless_tools glibc)
replaces=('ndiswrapper-bin')
conflicts=('ndiswrapper-bin')
source=(http://downloads.sourceforge.net/ndiswrapper/ndiswrapper-$pkgver.tar.gz)
md5sums=('3ab2aeef398d29df3a40d40fa499405e')

build()
{
  cd $startdir/src/ndiswrapper-$pkgver/utils
  make || return 1
  make DESTDIR=$startdir/pkg install
}
