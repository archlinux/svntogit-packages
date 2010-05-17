# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Sean Middleditch <elanthis@awesomeplay.com>

pkgname=xscreensaver
pkgver=5.11
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
depends=('libxxf86misc' 'libglade' 'mesa' 'pam' 'xorg-res-utils')
makedepends=('bc')
backup=('etc/pam.d/xscreensaver')
source=(http://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz \
        add-electricsheep.diff xscreensaver.pam LICENSE)
md5sums=('80f981b86734ccb31c5b3b24af3930ae' 'f82524626ed8a6832cd279e0548a9b46'\
         '367a3538f54db71f108b34cfa31088ac' '5e7f3f2a63d20a484742f5b4cb5d572c')
sha1sums=('8cc46c4e80124fba0890fa9e37e3b4ff87c6a8cf' '65c2933380267475f2c4560bc22f4350393b00ce'\
         '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8' '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/add-electricsheep.diff" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --without-motif --with-gtk --without-gnome --with-xml --with-gl \
    --without-gle --with-xpm --with-pixbuf --with-jpeg || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install_prefix="${pkgdir}" install || return 1
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
  install -D -m644 ../xscreensaver.pam "${pkgdir}/etc/pam.d/xscreensaver" || return 1
  chmod 755 "${pkgdir}/usr/bin/xscreensaver" || return 1
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop" || return 1
}
