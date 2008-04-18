# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
pkgname=sylpheed
pkgver=2.4.8
pkgrel=1
pkgdesc="A GTK+ based, lightweight, and fast email client"
arch=(i686 x86_64)
url="http://sylpheed.good-day.net/"
depends=('gpgme' 'gtkspell')
license=('GPL' 'LGPL')
makedepends=('pkgconfig')
source=(http://sylpheed.sraoss.jp/${pkgname}/v2.4/${pkgname}-${pkgver}.tar.bz2 \
        sylpheed-2.2-replace-aspell-with-enchant.diff)
url="http://sylpheed.good-day.net/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/sylpheed-2.2-replace-aspell-with-enchant.diff || return 1
  ./configure --prefix=/usr --enable-ssl --enable-gpgme --enable-ldap
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/{applications,pixmaps}
  install -m644 sylpheed.desktop $startdir/pkg/usr/share/applications/
  install -m644 sylpheed.png $startdir/pkg/usr/share/pixmaps/
} 
md5sums=('97fcbaa1e278849408ab1d628d4d1af7'
         '0f4074345f62ede519f0b65730e4b762')
