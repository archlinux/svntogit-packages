# $Id$
# Contributor: Mircea Bardac <dev@mircea.bardac.net> 
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=qca-qt3 
pkgver=1.0 
pkgrel=1
pkgdesc="QT Cryptography Architecture"
arch=(i686 x86_64)
url="http://delta.affinix.com/qca/" 
license=('GPL')
depends=('qt3') 
source=(http://delta.affinix.com/download/qca/qca-$pkgver.tar.bz2) 
md5sums=('ee44022eb0e5b8b5df64c62630f6e6b6') 

build() { 
  . /etc/profile.d/qt3.sh
  cd $startdir/src/qca-$pkgver 
  ./configure --prefix=/usr 
  make || return 1 
  make INSTALL_ROOT=$startdir/pkg install 
}
