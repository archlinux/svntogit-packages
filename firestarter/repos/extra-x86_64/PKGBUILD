# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# kernel_log_path.patch by Darwin Bautista
# initscript by Graham Forest

pkgname=firestarter
pkgver=1.0.3
pkgrel=7
arch=(i686 x86_64)
license=('GPL')
pkgdesc="A frontend for the ip-tables netfilter, a kernel based firewall."
url="http://www.fs-security.com/"
depends=('libgnomeui>=2.18.1-2' 'iptables' 'logger' 'dhcp')
install=firestarter.install
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz
        firestarter.rc.d
        firestarter-1.0.3-kernel_log_path.patch)
md5sums=('f46860a9e16dac4b693bd05f16370b03' 'a2d2a7c06ea4f680754e7109a45d78f0' \
         '9d6e37da8eb0d2f78ffc51f0f81b266e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/

  patch -Np1 -i ../firestarter-1.0.3-kernel_log_path.patch || return 1

  # Fix hardcoded binary calls from the executables
  sed -i 's|/sbin/iptables|/usr/sbin/iptables|' src/firestarter.c
  sed -i 's|/sbin/iptables|/usr/sbin/iptables|' src/netfilter-script.c

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas

  # install initscript
  install -Dm755 ../firestarter.rc.d ${startdir}/pkg/etc/rc.d/firestarter

  # we move the .desktop file to a standard location and 
  # provide a second .desktop file that shows up only if gksu is installed
  install -Dm644 ${startdir}/pkg/usr/share/gnome/apps/Internet/${pkgname}.desktop \
    ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${startdir}/pkg/usr/share/gnome/apps/Internet/${pkgname}.desktop \
    ${startdir}/pkg/usr/share/applications/${pkgname}-gksu.desktop

  # tweaks it to use gksu as starter
  sed -i "s|Exec=|TryExec=gksu\n\0gksu |" \
    ${startdir}/pkg/usr/share/applications/${pkgname}-gksu.desktop
  sed -i "s|^Name.*$|\0 gksu|" \
    ${startdir}/pkg/usr/share/applications/${pkgname}-gksu.desktop
  rm -rf ${startdir}/pkg/usr/share/gnome
}
