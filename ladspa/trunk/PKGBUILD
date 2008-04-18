# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=ladspa
pkgver=1.13
pkgrel=1
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=("i686" "x86_64")
license=('LGPL')
url="http://www.ladspa.org/"
depends=('gcc>=4.0.2')
source=(http://www.ladspa.org/download/$pkgname\_sdk\_$pkgver.tgz)

build() {
  cd $startdir/src/$pkgname\_sdk/src
  make targets
  make INSTALL_PLUGINS_DIR=$startdir/pkg/usr/lib/ladspa/ \
       INSTALL_INCLUDE_DIR=$startdir/pkg/usr/include/ \
       INSTALL_BINARY_DIR=$startdir/pkg/usr/bin/ install || return 1
  # fix 'Warning: You do not have a LADSPA_PATH environment variable set.'
  mkdir -p $startdir/pkg/etc/profile.d
  echo 'export LADSPA_PATH="/usr/lib/ladspa/"' > $startdir/pkg/etc/profile.d/ladspa.sh
  chmod a+x $startdir/pkg/etc/profile.d/ladspa.sh

}
md5sums=('671be3e1021d0722cadc7fb27054628e')
