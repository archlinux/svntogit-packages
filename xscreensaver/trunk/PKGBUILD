# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=5.19
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86vm' 'libglade' 'mesa' 'xorg-appres' 'libxmu' \
         'perl-libwww' 'perl-http-message')
makedepends=('bc' 'libxpm' 'gdm')
optdepends=('gdm: for login manager support')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
        add-electricsheep.diff xscreensaver.pam LICENSE)
sha1sums=('16437d45f568ded8721a917e082f9b4d948954ec'
          '677496218b81a42d90bee400026e94dd87fb8ffb'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i "${srcdir}/add-electricsheep.diff"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --with-login-manager --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 ../xscreensaver.pam "${pkgdir}/etc/pam.d/xscreensaver"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
