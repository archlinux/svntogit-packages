# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: twm

pkgname=mrxvt
pkgver=0.5.3
pkgrel=1
pkgdesc="Mrxvt (previously known as materm) is a multi-tabbed X terminal emulator based on rxvt code"
arch=(i686 x86_64)
url="http://materm.sourceforge.net/index.html"
license="GPL2"
depends=('libpng' 'libjpeg' 'libxft' 'libxpm')
replaces=('materm')
source=(http://dl.sourceforge.net/sourceforge/materm/${pkgname}-${pkgver}.tar.gz \
		  http://dl.sourceforge.net/sourceforge/materm/no-scroll-with-buffer-mrxvt-0.5.3.patch \
        ${pkgname}.desktop)
md5sums=('0dac39bef63a4a69eab35c027e8c5bdf'
         '9032af5f981b91462ed916d27ae286b9'
         '6ba3bcd484c8dad1b0b48465ded54de3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../no-scroll-with-buffer-mrxvt-0.5.3.patch || return 1
   # mrxvt is not a default xterm emulator, let's add some fancy options here, ey
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xft --enable-text-shadow \
    --enable-transparency --enable-smart-resize --enable-menubar \
    --enable-ourstrings --enable-linespace --enable-256colors --enable-xim \
    --enable-thai --enable-greek --enable-cjk --enable-backspace-key \
    --with-save-lines=2048
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 ../${pkgname}.desktop \
    ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
