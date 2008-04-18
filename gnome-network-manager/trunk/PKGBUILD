# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contrinutor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

pkgname=gnome-network-manager
pkgver=0.6.5
pkgrel=1
pkgdesc="GNOME frontends to NetWorkmanager"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=('pkgconfig' 'perlxml')
depends=('networkmanager>=0.6.5' 'libgnomeui>=2.18.1' 'libnotify>=0.4.4' 'notification-daemon')
install=gnome-network-manager.install
source=(http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.6/NetworkManager-${pkgver}.tar.bz2
        http://ftp.gnome.org/pub/GNOME/sources/network-manager-applet/0.6/network-manager-applet-${pkgver}.tar.bz2
	policy.patch)
md5sums=('b827d300eb28458f6588eb843cba418d' '1c94a41e2399d261985a75f0cd3b895b'
         'd5ef69a18071d9f4ba48cd0a0af243b7')

build() {
  cd ${startdir}/src/NetworkManager-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
        --with-distro=arch --localstatedir=/var
  make DESTDIR=${startdir}/pkg install-autostartDATA
  pushd utils
  make || return 1
  popd
  pushd gnome
  sed -i -e 's/ libnm_glib / /' Makefile
  sed -i -e 's|$(top_builddir)/libnm-util/libnm-util.la|-lnm-util|g' */Makefile
  make || return 1
  make DESTDIR=${startdir}/pkg install
  popd

  cd ${startdir}/src/nm-applet-${pkgver}
  patch -Np3 -i ${startdir}/src/policy.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
