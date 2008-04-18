# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=obconf
pkgver=2.0.3
pkgrel=1
pkgdesc="A gtk2 based configuration tool for the Openbox windowmanager"
arch=(i686 x86_64)
license=('GPL')
url="http://tr.openmonkey.com/pages/obconf/"
depends=('openbox>=3.4.5' 'gtk2' 'libglade')
install=${pkgname}.install
source=(http://icculus.org/openbox/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        http://icculus.org/openbox/mw/images/8/80/Obconf-72.png)
md5sums=('b22e273721851dedad72acbc77eefb68' '340ae4732e76731d2838473541eb8d4e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  sed -i 's/=openbox/=obconf/' obconf.desktop
  make DESTDIR=${startdir}/pkg install
  install -Dm644 ../Obconf-72.png ${startdir}/pkg/usr/share/pixmaps/obconf.png
}
