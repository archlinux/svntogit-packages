# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-screensaver
pkgver=2.22.0
pkgrel=1
pkgdesc="Screensaver designed to integrate well with the GNOME desktop."
arch=(i686 x86_64)
license=('GPL')
url="http://live.gnome.org/GnomeScreensaver"
backup=(etc/pam.d/gnome-screensaver)
depends=('gnome-menus>=2.22.0' 'libxxf86misc' 'libgnomekbd>=2.21.4.1' 'libxss'
	 'libgl' 'libnotify')
makedepends=('pkgconfig' 'gettext' 'perlxml' 'mesa' 'xscreensaver')
groups=('gnome')
options=(!emptydirs)
install=gnome-screensaver.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2
        archify-pam.patch)
md5sums=('3f307d340d511c97192a9dc9b83a69f5' '18c417676f6e8ef16ca2a10be74578a5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/archify-pam.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-screensaver \
              --localstatedir=/var --with-gdm-config=/usr/share/gdm/defaults.conf \
	      --with-xscreensaverdir=/usr/share/xscreensaver/config \
	      --with-xscreensaverhackdir=/usr/lib/xscreensaver \
	      --with-dpms-ext || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  #Migrate xscreensaver configuration files
  cd ${startdir}/pkg/usr/share/applications/screensavers
  ${startdir}/src/${pkgname}-${pkgver}/data/migrate-xscreensaver-config.sh /usr/share/xscreensaver/config/*.xml || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
