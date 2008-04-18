# $Id$
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar
pkgver=0.9.0
pkgrel=2
pkgdesc="new modern file manager for Xfce"
arch=(i686 x86_64)
license=('GPL2' 'LGPL2')
url="http://thunar.xfce.org"
groups=('xfce4') 
depends=('exo>=0.3.4' 'shared-mime-info' 'pcre' \
         'desktop-file-utils' 'libexif' 'hal' 'fam' \
         'startup-notification')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.4.2/src/Thunar-${pkgver}.tar.bz2 \
        http://foo-projects.org/pipermail/thunar-dev/attachments/20071203/a44d5411/thunar-vfs-volume-hal_missing-audio-cds-for-volman.bin \
		  http://bugzilla.xfce.org/attachment.cgi?id=1452
)
md5sums=('0fc5008858661c0abd0399acbe30ef28' 'dbdaeefe5a636f14c5abc8048ed1d0ee' \
         '47ba8457095999a6e759ce0168bdbabe')

build() {
  cd ${startdir}/src/Thunar-${pkgver}
  patch -Np0 -i ../thunar-vfs-volume-hal_missing-audio-cds-for-volman.bin || return 1
  patch -Np0 -i ../attachment.cgi?id=1452 || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static \
    --disable-gnome-thumbnailers --enable-exif --enable-pcre
  make || return 1
  make DESTDIR=${startdir}/pkg install
  sed -i 's:x-directory/gnome-default-handler;::' ${startdir}/pkg/usr/share/applications/Thunar-folder-handler.desktop
}
