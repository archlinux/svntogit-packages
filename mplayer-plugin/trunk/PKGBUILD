# $Id$
# Mantainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=mplayer-plugin
pkgver=3.50
pkgrel=3
pkgdesc="mplayerplug-in is a browser plugin that uses mplayer to play videos from websites."
arch=(i686 x86_64)
license=('GPL')
url="http://mplayerplug-in.sourceforge.net/"
depends=('gcc' 'mozilla-common>=1.1-2' 'mplayer' 'libxi' 'libxt' 'libxpm')
makedepends=('xulrunner>=1.8.1.11-1' 'pkgconfig')
backup=(etc/mplayer-plugin.conf)
install=mplayer-plugin.install
source=(http://dl.sourceforge.net/sourceforge/mplayerplug-in/mplayerplug-in-${pkgver}.tar.gz
        mplayerplug-in.conf)

build() {
  # temporarily use static paths during the transition to /usr
  export MOZ_PLUGIN_PATH=/usr/lib/mozilla/plugins
  
  cd ${startdir}/src/mplayerplug-in
  sed -e 's/mozilla-plugin/xulrunner-plugin/g' \
      -i configure configure.in
  ./configure --prefix=/usr --with-faad --enable-gtk2 --enable-wmp \
              --enable-qt --enable-rm --enable-gmp
  make LDFLAGS="" || return 1
  mkdir -p $startdir/pkg/${MOZ_PLUGIN_PATH}
  
  mkdir -p ${startdir}/pkg/usr/${MOZ_PLUGIN_PATH}
  install -m755 mplayerplug-in*so ${startdir}/pkg/${MOZ_PLUGIN_PATH}
  install -m755 mplayerplug-in*xpt ${startdir}/pkg/${MOZ_PLUGIN_PATH}

  mkdir -p ${startdir}/pkg/etc
  install -m644 ${startdir}/src/mplayerplug-in.conf ${startdir}/pkg/etc/mplayerplug-in.conf
}
md5sums=('7a9306c39f6550090c16b9c1d87e3168'
         'a4b9d00153f3794feda4332662cc795e')
