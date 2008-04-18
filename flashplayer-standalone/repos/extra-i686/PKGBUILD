# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=flashplayer-standalone
pkgver=9.0.48.0
pkgrel=1
pkgdesc="Macromedia standalone flash player (nonfree)"
url="http://www.macromedia.com/software/flashplayer/"
license="custom"
depends=('gtk2')
conflicts=('gflashplayer-beta')
replaces=('gflashplayer-beta')
source=(http://download.macromedia.com/pub/flashplayer/updaters/9/flash_player_9_linux_dev.tar.gz \
        adobe_eula.txt)
arch=('i686')
md5sums=('cd0ca45c56f81f94e806125d39374c07' '7d8638844b8be3e841ff29e0162577cb')
build() {
  cd $startdir/src/
  tar xzf flash_player_9_linux_dev/standalone/release/flashplayer.tar.gz
  install -D -m755 flashplayer $startdir/pkg/usr/bin/flashplayer || return 1
  install -D -m644 ../adobe_eula.txt $startdir/pkg/usr/share/licenses/custom/flashplayer-standalone/adobe_eula.txt
}
