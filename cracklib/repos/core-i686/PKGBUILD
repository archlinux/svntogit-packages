# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
pkgname=cracklib
pkgver=2.8.10
pkgrel=5
pkgdesc="Password Checking Library"
arch=(i686 x86_64)
license=('GPL')
url="http://sourceforge.net/projects/cracklib"
groups=('base')
depends=('glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('555f7832b63ebc7fb70b0373500c2358')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/share/dict
  make DESTDIR=$startdir/pkg install
  cp dicts/cracklib-small $startdir/pkg/usr/share/dict
  sh ./util/cracklib-format dicts/cracklib-small \
    | sh ./util/cracklib-packer $startdir/pkg/usr/share/cracklib/pw_dict
}
