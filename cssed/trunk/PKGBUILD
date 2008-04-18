# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=cssed
pkgver=0.4.0
pkgrel=1
pkgdesc="A GTK2 based Cascading Style Sheets (CSS) editor"
url="http://cssed.sourceforge.net/"
depends=('gtk2' 'libxml2' 'desktop-file-utils')
install=$pkgname.install
source=("http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" \
        "$pkgname.desktop")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
 # install some freedesktop.org compatibility
  install -D -m644 $startdir/src/$pkgname.desktop \
    $startdir/pkg/usr/share/applications/$pkgname.desktop
}
md5sums=('ff7c818d1f819b7d76b4f714be64e08e' '90003378b6d74a7b85b22de67c6aa893')
