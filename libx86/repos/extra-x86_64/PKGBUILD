# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=libx86
pkgver=0.99
pkgrel=1
pkgdesc="Provides an lrmi interface that works on x86, am64 and alpha"
arch=('i686' 'x86_64')
url="http://www.codon.org.uk/~mjg59/libx86/"
license=('custom')
depends=('glibc')
source=(http://www.codon.org.uk/~mjg59/libx86/downloads/libx86-$pkgver.tar.gz)
md5sums=('c426d4f29fdf3499158cf49d4f374315')

build() {
  cd $startdir/src/$pkgname-$pkgver
  if [ "$CARCH" = "x86_64" ]; then
		make BACKEND=x86emu || return 1
    else
	  make || return 1
  fi
  make DESTDIR=$startdir/pkg install
  install -D -m 644 COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}
