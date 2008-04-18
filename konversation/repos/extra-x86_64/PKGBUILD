# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>
# Contributor: Sergio Jovani Guzman <moret@paretux.org>

pkgname=konversation
pkgver=1.0.1
pkgrel=1
pkgdesc="A user friendly IRC client for KDE"
arch=(i686 x86_64)
url="http://konversation.kde.org"
license="GPL"
depends=('kdelibs')
source=(http://download2.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('60c2c5f94d4a916055db09728304b19f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
