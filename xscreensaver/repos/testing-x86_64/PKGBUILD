# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver
pkgver=5.44
pkgrel=3
pkgdesc='Screen saver and locker for the X Window System'
url='https://www.jwz.org/xscreensaver/'
arch=('x86_64')
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww' 'libsystemd.so'
         'libxcrypt' 'libcrypt.so' 'libxi' 'libxxf86vm' 'libxrandr' 'libxinerama'
         'libxt' 'libx11' 'libxext' 'pam' 'glibc' 'gdk-pixbuf-xlib')
makedepends=('bc' 'intltool' 'libxpm' 'gdm' 'systemd' 'systemd-libs')
optdepends=('gdm: for login manager support')
backup=('etc/pam.d/xscreensaver')
source=(https://www.jwz.org/xscreensaver/${pkgname}-${pkgver}.tar.gz
        LICENSE)
sha512sums=('9d9144dec6f075c2d6a1c3cd45123a98d6d0cd732d6c3e3389e97b3f802b8f8765a188d1e35f97f123ca0a64661ea616b7b710577063c311da3d99d8439f1dae'
            '863c699479b2ec2775a0d1cba22e615929194a14af164b3513e46a0c04229da6547255a4da8f7f1bbb40906898c124ed3c9ec2436b76b62affcb62385af9783e')
b2sums=('102025aa2f57672ed3547f0e9bab989566fb8e50ecae8b9e4078ec5ee5de3cad09fec107695335ef236ad9fe19b2638978366a180a998d77b0ce8a2a5d1ebde3'
        'cacb6ba39d6ecb8703ef5f5a7dc74de0ca805cce73b43a8b9b6b4c255c909aa9b5e692de76c2fbd4da26ce6efb5f2a46138c43b1b37f53cee6d20fd6ed41f4a9')

prepare() {
  cd ${pkgname}-${pkgver}
  sed 's|-std=c89||' -i configure.in
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam \
    --with-login-manager \
    --with-gtk \
    --with-gl \
    --without-gle \
    --with-pixbuf \
    --with-jpeg
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # remove sticky bit
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}

# vim: ts=2 sw=2 et:
