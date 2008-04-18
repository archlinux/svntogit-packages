# $Id$
# Maintainer: Varun Acharya <varun@archlinux.org>

pkgname=miro
pkgver=1.1
pkgrel=2
pkgdesc="The free and open source internet TV platform"
arch=('i686' 'x86_64')
url="http://www.getmiro.com"
license=('GPL')
depends=('xine-lib' 'boost' 'gnome-python-extras' 'dbus-python' 'pyrex' \
         'nss' 'nspr' 'pygtk' 'gtk2' 'xulrunner>=1.8.1.11' 'sqlite3')
makedepends=('pkgconfig' 'qt3')
conflicts=('democracy')
replaces=('democracy')
provides=('democracy')
source=(http://ftp.osuosl.org/pub/pculture.org/miro/src/Miro-$pkgver.tar.gz)
md5sums=('250b37ced7a4753c5717fb65bd2ad6d3')

build() {
  cd $startdir/src/Miro-$pkgver/
  cd platform/gtk-x11
  python setup.py install --root=$startdir/pkg || return 1
}
