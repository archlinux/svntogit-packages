# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=apollon
pkgver=1.0.2.1
pkgrel=3
pkgdesc="Apollon is a KDE-based client for the giFT."
url="http://apollon.sourceforge.net/"
depends=('kdelibs>=3.4.2' 'gift')
source=(http://dl.sourceforge.net/sourceforge/apollon/$pkgname-$pkgver.tar.gz)
md5sums=('d9624419e8fe3e1b274639063ea31dd0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
  #Don't slay .la files, this is a KDE app!
}

