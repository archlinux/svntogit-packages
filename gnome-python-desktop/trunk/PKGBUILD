# $Id$
# Maintainer: Arjan <arjan@archlinux.org>
#             Jan de Groot <jgc@archlinux.org>
# Contributer: Wael Nasreddine <gandalf@siemens-mobiles.org>

pkgname=gnome-python-desktop
pkgver=2.22.0
pkgrel=1
pkgdesc="Gnome Python interfaces for libraries not part of the core platform"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gnome-desktop>=2.22.0' 'gnome-python>=2.22.0')
options=('!libtool')
makedepends=('perlxml' 'pkgconfig' 'gnome-media>=2.22.0' 'gnome-panel>=2.22.0' 'gtksourceview>=1.8.5' 'libgnomeprintui>=2.18.2' 'libgtop>=2.2i2.0' 'totem-plparser>=2.22.1' 'bug-buddy>=2.22.0' 'metacity>=2.22.0' 'nautilus-cd-burner>=2.22.0')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('504877a973f6abc0788283232cd703cb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./waf configure --prefix=/usr || return 1
  ./waf build ${MAKEFLAGS} || return 1
  ./waf install --destdir=${startdir}/pkg || return 1
}
