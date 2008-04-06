# $Id: PKGBUILD,v 1.5 2007/05/27 19:14:26 tom Exp $
# Maintainer: Tom K <tom@archlinux.org>

pkgname=truecrypt-utils
pkgver=4.3a
pkgrel=2
pkgdesc="Free open-source disk encryption software - userspace application"
depends=('device-mapper')
source=(http://www.truecrypt.org/downloads/truecrypt-$pkgver-source-code.tar.gz)
url="http://www.truecrypt.org/"
license=('custom')
arch=('i686')
options=('force')

build() {
  cd $startdir/src/truecrypt-$pkgver-source-code/Linux/Cli
  make || return 1
  
  # Install files
  install -Dm755 truecrypt $startdir/pkg/usr/bin/truecrypt
  install -Dm644 Man/truecrypt.1 $startdir/pkg/usr/man/man1/truecrypt.1
  install -Dm644 ../../License.txt $startdir/pkg/usr/share/licenses/truecrypt/License.txt
}
md5sums=('8f2536eae16e6044a22b2a82c7003357')
