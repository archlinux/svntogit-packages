# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-phone-manager
pkgver=0.40
pkgrel=1
pkgdesc="Control your mobile phone from your GNOME 2 desktop."
arch=('i686' 'x86_64')
url="http://live.gnome.org/PhoneManager"
license=('GPL')
depends=('evolution-data-server>=1.12.1' 'gnokii>=0.6.22' 'gnome-bluetooth>=0.9.1'
         'gstreamer0.10>=0.10.14' 'gnome-icon-theme>=2.20.0' 'gconf>=2.18.0.1-4')
makedepends=('perlxml')
options=('!emptydirs')
install=gnome-phone-manager.install
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-phone-manager/0.40/${pkgname}-${pkgver}.tar.bz2)
md5sums=('38537c212e9b2395cf89187ab2be3b9a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
