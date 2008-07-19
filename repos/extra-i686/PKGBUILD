# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Sean Middleditch <elanthis@awesomeplay.com>

pkgname=xscreensaver
pkgver=5.06
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86misc' 'libglade' 'mesa' 'pam' 'xorg-res-utils')
makedepends=('bc')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
	xscreensaver.pam LICENSE)
md5sums=('c6b2cab02aaea32684d37a9a76488e0f' '367a3538f54db71f108b34cfa31088ac'\
         '5e7f3f2a63d20a484742f5b4cb5d572c')
sha1sums=('3310789ecf1ed8ff790d94512fe536857e793e4c'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
       --libexecdir=/usr/lib \
       --with-x-app-defaults=/usr/share/X11/app-defaults \
       --with-pam --without-motif \
       --with-gtk --without-gnome --with-xml --with-gl \
       --without-gle --with-xpm --with-pixbuf --with-jpeg \
       --with-fortune="/bin/cat /etc/arch-release" || return 1
  make || return 1
  make install_prefix=${pkgdir} install || return 1
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  install -D -m644 ${srcdir}/xscreensaver.pam ${pkgdir}/etc/pam.d/xscreensaver || return 1
  chmod 755 ${pkgdir}/usr/bin/xscreensaver || return 1
  echo "NotShowIn=KDE;GNOME;" >> ${pkgdir}/usr/share/applications/xscreensaver-properties.desktop || return 1
}
