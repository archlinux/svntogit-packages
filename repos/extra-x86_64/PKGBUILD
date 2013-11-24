# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=5.23
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libglade' 'xorg-appres' 'perl-libwww')
makedepends=('bc' 'libxpm' 'gdm')
optdepends=('gdm: for login manager support')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
        xscreensaver-add-electricsheep.diff LICENSE)
sha1sums=('7ed2bf03f84a1e379ce1eca6cd9b587fb98e66cc'
          'e8dc57b6471fb3867ee099304ac6bf628351cb98'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i "${srcdir}/xscreensaver-add-electricsheep.diff"
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
