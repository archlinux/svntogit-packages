# Contributor: Vinay S Shastry <vinayshastry@gmail.com>
pkgname=yasm
pkgver=0.7.0
pkgrel=1
pkgdesc="Yasm is a complete rewrite of the NASM assembler designed from the ground up to allow for multiple assembler syntaxes to be supported (eg, NASM, TASM, GAS, etc.)"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.tortall.net/projects/yasm/"
depends=('glibc')
source=(http://www.tortall.net/projects/yasm/releases/$pkgname-$pkgver.tar.gz)
options=('!libtool')
md5sums=('f06436d31a6c5c1bc43c318f42c7b51e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -Dm644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

