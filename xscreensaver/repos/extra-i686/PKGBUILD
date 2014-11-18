# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=5.31
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww')
makedepends=('bc' 'intltool' 'libxpm' 'gdm')
optdepends=('gdm: for login manager support')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz
        xscreensaver-add-electricsheep.diff LICENSE
	xscreensaver-5.31-1001-binaryring.c-include-stdint.patch)
sha1sums=('1b023a3b01f1f23aa136d13c37f79c0c01c3f1e6'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '3eedb8b91b13c29df9b1fe5cbb027e1470b802d2'
          '5a91e707f6482a3349609e8016b7668e3cd53161')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
  patch -p1 -i "${srcdir}/xscreensaver-5.31-1001-binaryring.c-include-stdint.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
