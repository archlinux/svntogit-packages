# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca
pkgver=2.22.0
pkgrel=1
pkgdesc="A scriptable screen reader and magnifier"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.gnome.org/projects/orca"
install=orca.install
options=('!libtool')
depends=('gnome-python>=2.22.0' 'gnome-speech>=0.4.18' 'gnome-mag>=0.15.0' 'brltty' 'libgail-gnome')
makedepends=('perlxml' 'pkgconfig')
replaces=('gnopernicus')
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a49e1c39261c916e8d9c7bc26740d085')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
