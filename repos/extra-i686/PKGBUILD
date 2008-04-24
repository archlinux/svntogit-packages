# $Id$
# Maintainer: Jan de Groot <jgc@archlinxu.org>
# Contri-butor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

pkgname=networkmanager
pkgver=0.6.6
pkgrel=1
pkgdesc="Network Management daemon"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('wireless_tools' 'iproute' 'dhcdbd' 'hal>=0.5.11rc2' 'libnl>=1.1'
	 'wpa_supplicant>=0.5.10' "libnetworkmanager>=${pkgver}")
makedepends=('pkgconfig' 'perlxml')
options=('!libtool')
source=(http://people.redhat.com/dcbw/NetworkManager/0.6.6/NetworkManager-${pkgver}.tar.gz
	networkmanager-initscript.patch
	dbus-hal-policy.patch
	ntpdate
	netfs)
md5sums=('412ed4db5d2db04285799c4303ddeeed'
         '730a3ebd470986a9f61deaf52cac0cb0'
         '1d52e4852badff1086611d81cc4b99d7'
         '9a3b8da1efac158d91bb9fc699736b03'
         'ee592ee567faf683e7aecf651bd15937')

build() {
  cd ${startdir}/src/NetworkManager-${pkgver}
  patch -Np0 -i ${startdir}/src/networkmanager-initscript.patch || return 1
  patch -Np1 -i ${startdir}/src/dbus-hal-policy.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
      --with-distro=arch --localstatedir=/var \
      --without-gnome --libexecdir=/usr/lib/networkmanager || return 1
  
  make || return 1
  sed -i -e '/\slibnm-util\s/d' -e '/\sinclude/d' -e '/\sgnome\s/d' Makefile
  make DESTDIR=${startdir}/pkg install || return 1
  install -d -m755 ${startdir}/pkg/usr/bin
  install -m755 test/nm-tool ${startdir}/pkg/usr/bin/nm-tool || return 1
  install -m755 ${startdir}/src/ntpdate ${startdir}/pkg/etc/NetworkManager/dispatcher.d/ntpdate || return 1
  install -m755 ${startdir}/src/netfs ${startdir}/pkg/etc/NetworkManager/dispatcher.d/netfs || return 1
}
