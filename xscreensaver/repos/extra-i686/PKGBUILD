# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=5.12
pkgrel=2
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86vm' 'libglade' 'mesa' 'pam' 'xorg-appres' 'libxmu')
makedepends=('bc')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
        add-electricsheep.diff xscreensaver.pam LICENSE)
md5sums=('0345c1acb9280729de05c5ca44b401e3' 'f82524626ed8a6832cd279e0548a9b46'\
         '367a3538f54db71f108b34cfa31088ac' '5e7f3f2a63d20a484742f5b4cb5d572c')
sha1sums=('7252540b1b1853459a56453714c0974de26fa4c5' '65c2933380267475f2c4560bc22f4350393b00ce'\
         '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8' '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/add-electricsheep.diff"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --without-motif --with-gtk --with-gl \
    --without-gle --with-xpm --with-pixbuf --with-jpeg
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
