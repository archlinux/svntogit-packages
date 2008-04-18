# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=glsof
pkgver=0.9.16
pkgrel=4
pkgdesc="A gtk-GUI for lsof (aka GTK-lsof)"
url="http://glsof.sourceforge.net/"
depends=('libxml2' 'gtk2' 'lsof')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5ad5f2a6908be713753d9826c38e3e2c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
