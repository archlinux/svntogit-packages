# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: deepfreeze (sgrealis1@comcast.net)
pkgname=pan
pkgver=0.14.2.91
pkgrel=3
pkgdesc="A powerful Newsgroup Article reader based on GTK2"
arch=(i686 x86_64)
license=('GPL')
depends=('gtkspell' 'gnet' 'pcre' 'libxml2')
source=(http://pan.rebelbase.com/download/releases/$pkgver/SOURCE/$pkgname-$pkgver.tar.gz
http://cvs.fedora.redhat.com/viewcvs/*checkout*/devel/pan/pan-0.14.2.91-gcc4-2.patch)
url="http://pan.rebelbase.com/"
md5sums=('26bf7253a5e320793e5aba1c731448cd'
         '8ba6afcc31900a8353dc12ef62681f38')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../pan-0.14.2.91-gcc4-2.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
