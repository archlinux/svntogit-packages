# $Id$ 
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=qca-tls
pkgver=1.0 
pkgrel=5
pkgdesc="plugin to provide SSL/TLS capability to programs that utilize the Qt Cryptographic Architecture" 
arch=(i686 x86_64)
license=('LGPL2')
url="http://delta.affinix.com/qca/" 
depends=('qca-qt3' 'qt3' 'openssl') 
source=(http://delta.affinix.com/download/qca/$pkgname-$pkgver.tar.bz2 qca-openssl-0.9.8.patch) 

build() { 
  . /etc/profile.d/qt3.sh
  cd $startdir/src/$pkgname-$pkgver 
  patch -Np0 -i ../qca-openssl-0.9.8.patch || return 1
  ./configure
  make || return 1 
  make INSTALL_ROOT=$startdir/pkg install 
}
md5sums=('886b1f60fc31de3b1a0bd93281e27b73' '6b384d7a8a9789b70c2c0b8444179eea')
