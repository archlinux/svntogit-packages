# $Id$
# Contributer: Jason Chu <jason@archlinux.org>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=kismet
pkgver=2007_10_R1
_realver=2007-10-R1
pkgrel=1
pkgdesc="802.11b sniffing software"
arch=(i686 x86_64)
license=('GPL')
if [ "${CARCH}" == "x86_64" ]; then
  depends=('gcc-libs' 'libpcap>=0.9.8' 'ncurses' 'dbus')
else
  depends=('gmp' 'imagemagick' 'libpcap>=0.9.8' 'ncurses' 'dbus')
fi
url="http://www.kismetwireless.net/"
backup=('etc/ap_manuf' 'etc/client_manuf' 'etc/kismet.conf' 'etc/kismet_drone.conf' 'etc/kismet_ui.conf')
source=(http://www.kismetwireless.net/code/kismet-$_realver.tar.gz)
md5sums=('2100c667e69db0cde35fa2d06c8516e2')
sha1sums=('a1c682797ad6842b53f9e0f038254aa8326e0fb4')

build() {
   cd $startdir/src/kismet-$_realver
   
   if [ $CARCH == "x86_64" ]; then
     ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
                 --disable-gpsmap
   else
     ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
   fi
   make dep
   make ||return 1
   sed -i 's/prism2/wlanng/g' conf/kismet.conf
   make DESTDIR=$startdir/pkg install

   mkdir -p $startdir/pkg/usr/share/kismet
   install -m 644 $startdir/src/kismet-$_realver/README $startdir/pkg/usr/share/kismet

   # Fix the *.conf unexpanded ${prefix} problems
   sed -i 's%\${prefix}%/usr%' $startdir/pkg/etc/*.conf
}
