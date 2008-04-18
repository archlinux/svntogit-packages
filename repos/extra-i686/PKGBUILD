# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=gdm
pkgver=2.20.1
pkgrel=2
pkgdesc="Gnome Display Manager (a reimplementation of xdm)"
arch=(i686 x86_64)
license=('GPL')
depends=('pam>=0.99.8' 'libdmx' 'tcp_wrappers>=7.6' 'libgnomecanvas>=2.20.1' 'librsvg>=2.18.2' 'gksu' 'xorg-xsm' 'dbus-glib>=0.7.4')
makedepends=('perlxml' 'zenity>=2.20.0' 'gnome-doc-utils>=0.12.0' 'pkgconfig')
install=gdm.install
url="http://www.gnome.org"
groups=('gnome-extra')
backup=('etc/gdm/custom.conf' 'etc/pam.d/gdm' 'etc/pam.d/gdm-autologin')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2
	gdm
	defaults.conf
	gdm.pam
	gdm-autologin.pam)
md5sums=('ed7b7efcb7fd97cc400e2416e0093e71' '770fe5aeb8d35271a5a2330ce01508f0'
         '0fbc2d17fad5a3e979e742e0403c19d5' 'b20fe3c8487a039050986d60e45233a9'
	 '157f32e089a7aab50732dc122e592b35')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  sed -i -e 's|/dev/tty%d|/dev/vc/%d|' daemon/getvt.c || return 1

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gdm \
              --localstatedir=/var/lib --disable-static \
	      --with-xevie=yes --disable-scrollkeeper \
	      --enable-secureremote
  sed -i -e 's|${prefix}|/usr|' config.h || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/rc.d

  #PAM, we use our own, not Redhat stuff
  install -m644 ${startdir}/src/gdm-autologin.pam ${startdir}/pkg/etc/pam.d/gdm-autologin
  install -m644 ${startdir}/src/gdm.pam ${startdir}/pkg/etc/pam.d/gdm
  
  #init script and configuration
  install -m755 ${startdir}/src/gdm ${startdir}/pkg/etc/rc.d/ 
  install -m444 ${startdir}/defaults.conf ${startdir}/pkg/usr/share/gdm/ 

  #Remove the session .desktop file, we have this one in gnome-session now.
  rm -rf ${startdir}/pkg/usr/share/xsessions
  
  # fix gdmsetup 
  sed -i -e 's|^Exec=|Exec=gksu |' ${startdir}/pkg/usr/share/gdm/applications/gdmsetup.desktop
}
