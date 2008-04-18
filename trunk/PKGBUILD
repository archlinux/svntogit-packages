# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Sean Middleditch <elanthis@awesomeplay.com>

pkgname=xscreensaver
pkgver=5.05
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
backup=('etc/pam.d/xscreensaver')
depends=('libxxf86misc' 'libglade' 'mesa' 'pam' 'xorg-res-utils')
makedepends=('bc')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
	xscreensaver.pam LICENSE)
md5sums=('d759262b10d76f87f1a7fc50ae8664d4' '367a3538f54db71f108b34cfa31088ac'\
         '5e7f3f2a63d20a484742f5b4cb5d572c')
sha1sums=('6f23422b17dd8a06cdaf419fd16d398eee50601b'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
       --libexecdir=/usr/lib \
       --with-x-app-defaults=/usr/share/X11/app-defaults \
       --with-pam --without-motif \
       --with-gtk --without-gnome --with-xml --with-gl \
       --without-gle --with-xpm --with-pixbuf --with-jpeg \
       --with-fortune="/bin/cat /etc/arch-release" || return 1
  make || return 1
  make install_prefix=${startdir}/pkg install || return 1
  install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p ${startdir}/pkg/etc/pam.d
  install -m644 ${startdir}/src/xscreensaver.pam ${startdir}/pkg/etc/pam.d/xscreensaver
  chmod 755 ${startdir}/pkg/usr/bin/xscreensaver

  mv ${startdir}/pkg/usr/share/applications/gnome-screensaver-properties.desktop \
     ${startdir}/pkg/usr/share/applications/xscreensaver-properties.desktop
  echo "NotShowIn=KDE;GNOME;" >> ${startdir}/pkg/usr/share/applications/xscreensaver-properties.desktop
}
