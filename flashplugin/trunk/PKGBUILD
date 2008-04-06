# $Id: PKGBUILD,v 1.22 2007/12/22 16:14:58 alexander Exp $
# Maintainer: Dale Blount <dale@archlinux.org>
# Parts Borrowed from Woody Gilk's <woody@archlinux.org> fp9 beta PKGBUILD
pkgname=flashplugin
pkgver=9.0.115.0
pkgrel=2
pkgdesc="Macromedia flash plugin for Netscape/Mozilla (nonfree)"
depends=('mozilla-common' 'libxt' 'gtk2')
replaces=('flashplugin-beta')
url="http://www.macromedia.com/software/flashplayer/"
license="custom"
source=(http://fpdownload.macromedia.com/get/flashplayer/current/install_flash_player_9_linux.tar.gz
        adobe_eula.txt)
arch=('i686')

build() {
  mkdir -p $startdir/pkg/usr/lib/mozilla/plugins
  install -m755 $startdir/src/install_flash_player_9_linux/libflashplayer.so \
    $startdir/pkg/usr/lib/mozilla/plugins || return 1
  #install license
  install -D -m644 $startdir/src/adobe_eula.txt \
    $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
md5sums=('93b7c48eaa492237b807a3ae1de65cf9'
         '7d8638844b8be3e841ff29e0162577cb')
