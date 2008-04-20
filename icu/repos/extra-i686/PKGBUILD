# $Id$
# Maintainer: tobias <tobias@archlinux.net>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=icu
pkgver=3.8.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs')
source=(http://download.icu-project.org/files/${pkgname}4c/${pkgver}/${pkgname}4c-${pkgver//./_}-src.tgz)
	#http://download.icu-project.org/files/${pkgname}4c/${pkgver}/${pkgname}4c-${pkgver/./_}-src.tgz)
md5sums=('a827dbc9d909febd4ec39b90386868ba')

build() {
  cd ${startdir}/src/icu/source
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Install license
  install -m644 -D $startdir/src/icu/license.html \
                   $startdir/pkg/usr/share/licenses/icu/license.html
 
}
