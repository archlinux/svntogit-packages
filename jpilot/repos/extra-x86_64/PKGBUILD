# $Id$
# Maintainer: dale <dale@archlinux.org>

pkgname=jpilot
pkgver=0.99.9
pkgrel=1
pkgdesc="A desktop organizer application for the palm pilot"
arch=(i686 x86_64)
depends=('openssl>=0.9.8c' 'gtk2>=2.10.4' 'pilot-link>=0.12.1')
options=('nolibtool')
url=(http://jpilot.org/)
source=(http://jpilot.org/jpilot-${pkgver}.tar.gz)
md5sums=('c39df29aeed57b84a674524856ebc290')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --disable-pl-test
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
