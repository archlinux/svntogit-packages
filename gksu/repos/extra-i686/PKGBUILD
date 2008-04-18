# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Lopes (eduol@gmx.net)

pkgname=gksu	
pkgver=2.0.0
pkgrel=2
pkgdesc="A graphical frontend for su"
arch=(i686 x86_64)
url="http://www.nongnu.org/gksu/index.html"
license=('GPL')
depends=('libgksu>=2.0.4')
makedepends=('gtk-doc' 'pkgconfig' 'nautilus>=2.18.1')
options=('nolibtool')
source=(http://people.debian.org/~kov/gksu/${pkgname}-${pkgver}.tar.gz)
md5sums=('f517302cff6f09e4f2f312c4b618bd40')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e 's|/usr/bin/x-terminal-emulator|gnome-terminal|g' gksu.desktop
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
