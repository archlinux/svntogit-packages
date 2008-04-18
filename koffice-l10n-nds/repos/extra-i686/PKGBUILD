# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org> 
pkgname=koffice-l10n-nds
pkgver=1.6.3
pkgrel=2
pkgdesc="Low Saxon KOffice translation."
license=('GPL')
arch=(i686 x86_64)
url="http://www.koffice.org"
depends=('koffice>=1.6.3')
source=(http://download.kde.org/stable/koffice-$pkgver/src/koffice-l10n/$pkgname-$pkgver.tar.bz2)
replaces=koffice-i18n-nds

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

md5sums=('50702ef6c8d586e89280a2b42d2c5225')
