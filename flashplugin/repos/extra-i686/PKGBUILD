# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Parts Borrowed from Woody Gilk's <woody@archlinux.org> fp9 beta PKGBUILD
pkgname=flashplugin
pkgver=9.0.124.0
pkgrel=1
pkgdesc="Macromedia flash plugin for Netscape/Mozilla (nonfree)"
depends=('mozilla-common' 'libxt' 'gtk2')
replaces=('flashplugin-beta')
url="http://www.macromedia.com/software/flashplayer/"
license="custom"
source=(http://fpdownload.macromedia.com/get/flashplayer/current/install_flash_player_9_linux.tar.gz
        adobe_eula.txt)
arch=('i686')
md5sums=('a311fd97aa6c214f63dc089a20cf7a39'
         '7d8638844b8be3e841ff29e0162577cb')

build() {
  mkdir -p $startdir/pkg/usr/lib/mozilla/plugins
  install -m755 $startdir/src/install_flash_player_9_linux/libflashplayer.so \
    $startdir/pkg/usr/lib/mozilla/plugins || return 1
  #install license
  install -D -m644 $startdir/src/adobe_eula.txt \
    $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
