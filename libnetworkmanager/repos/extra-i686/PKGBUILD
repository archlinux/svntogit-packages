# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=libnetworkmanager
pkgver=0.6.6
pkgrel=1
pkgdesc="The Network Manager Library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('libgcrypt' 'dbus-glib>=0.74')
makedepends=('pkgconfig' 'perlxml' 'wireless_tools' 'iproute' 'dhcdbd' 'hal' 'libnl>=1.1' 'wpa_supplicant')
options=('!libtool')
source=(http://people.redhat.com/dcbw/NetworkManager/${pkgver}/NetworkManager-${pkgver}.tar.gz)
md5sums=('412ed4db5d2db04285799c4303ddeeed')

build() {
  cd ${startdir}/src/NetworkManager-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --with-distro=arch --without-gnome || return 1
  for dir in libnm-util utils gnome/libnm_glib include; do
    pushd ${dir} || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install || return 1
    popd
  done
}
