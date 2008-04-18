# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=fontconfig
pkgver=2.5.0
pkgrel=1
pkgdesc="A library for configuring and customizing font access"
arch=(i686 x86_64)
url="http://www.fontconfig.org/release/"
license=('custom')
depends=('expat>=2.0' 'freetype2>=2.2.1')
options=('!libtool')
install=fontconfig.install
source=(http://www.fontconfig.org/release/${pkgname}-${pkgver}.tar.gz
	30-replace-bitmap-fonts.conf)
md5sums=('21d14af8ecf645ef76211c782cdd7aeb'
         'fffc6a49ccf13c3224559b0f41a434e5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # enable Position Independent Code for prelinking
  export CFLAGS="${CFLAGS} -fPIC"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -m644 ${startdir}/src/30-replace-bitmap-fonts.conf \
      ${startdir}/pkg/etc/fonts/conf.avail || return 1
  rm -f ${startdir}/pkg/etc/fonts/conf.d/*.conf

  #Install license
  install -Dm0644 $startdir/src/${pkgname}-${pkgver}/COPYING \
  		  $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

