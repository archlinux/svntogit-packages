# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org> 
pkgname=koffice-l10n-nl
pkgver=1.6.3
pkgrel=2
pkgdesc="Dutch KOffice translation."
license=('GPL')
arch=(i686 x86_64)
url="http://www.koffice.org"
depends=('koffice>=1.6.3')
source=(http://download.kde.org/stable/koffice-$pkgver/src/koffice-l10n/$pkgname-$pkgver.tar.bz2)
replaces=koffice-i18n-nl

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

md5sums=('a63c40510c0bb322dc1f6bb057759772')
