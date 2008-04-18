# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=source-highlight
pkgver=2.9
pkgrel=1
pkgdesc="convert source code to highlighted html"
arch=("i686" "x86_64")
url="http://www.gnu.org/software/src-highlite/"
license=('GPL')
depends=('gcc-libs' 'bash' 'boost>=1.34.0' 'ctags')

#source=(http://rap.dsi.unifi.it/~bettini/source-highlight-$pkgver.tar.gz)
source=(ftp://ftp.gnu.org/gnu/src-highlite/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make prefix=$startdir/pkg/usr install
}


md5sums=('80a947681d32b0fe515a5cd01f9582a7')
