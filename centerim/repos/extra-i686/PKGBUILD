# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: shild <sxp@bk.ru>

pkgname=centerim
pkgver=4.22.1
_realver=20071003
pkgrel=2
pkgdesc="Fork of CenterICQ - A text mode menu- and window-driven IM interface"
arch=('i686')
url="http://www.centerim.org"
license=('GPL')
depends=('libjpeg' 'gpgme')
replaces=('centericq')
source=("http://www.centerim.org/download/$pkgname-$_realver.tar.gz")
md5sums=('ca0b169aee9f730d63fff0fb4f7af03e')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --with-ssl --with-openssl --enable-locales-fix

  make || return 1
  make DESTDIR=$startdir/pkg install
}
