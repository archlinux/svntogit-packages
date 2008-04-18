# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox3
pkgver=3.0b5
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2>=2.12.0' 'pango>=1.18.0' 'gcc-libs' 'libxt' 'libidl2' 'mozilla-common' 'desktop-file-utils' 'cairo' 'curl' 'nss>=3.11.7' 'dbus-glib' 'libpng>=1.2.24-3')
makedepends=('zip' 'imagemagick' 'pkgconfig' 'python')
install=firefox.install
url="http://www.mozilla.org/projects/firefox"
source=(http://releases.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}/source/firefox-${pkgver}-source.tar.bz2
        mozconfig
        firefox3.desktop
        firefox3-safe.desktop
        mozilla-firefox-1.0-lang.patch)
options=('!makeflags')

build() {
  cd ${startdir}/src/mozilla
  patch -Np1 -i $startdir/src/mozilla-firefox-1.0-lang.patch || return 1

  export MOZ_PROJECT=browser

  sed "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig >.mozconfig
  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/opt/mozilla/lib/firefox-${pkgver}
  export MOZ_DISABLE_GNOME=1
  export MOZTMP=`mktemp -d -p ${startdir}/src`
  LD_LIBRARY_PATH=`pwd` HOME=${MOZTMP} ./firefox-bin -register
  rm -rf ${MOZTMP}
  cd chrome
  find . -maxdepth 1 -type d -exec rm -rf {} \;

  #Remove mozilla devel stuff, this is in XULRunner now
  rm -rf ${startdir}/pkg/opt/mozilla/share
  rm -rf ${startdir}/pkg/opt/mozilla/include
  rm -rf ${startdir}/pkg/opt/mozilla/lib/pkgconfig
  rm -rf ${startdir}/pkg/opt/mozilla/lib/firefox-devel-${pkgver}

  cd ${startdir}/pkg/opt/mozilla/lib && ln -sf firefox-${pkgver} firefox3

  rm -rf ${startdir}/pkg/opt/mozilla/bin/defaults

  mkdir -p ${startdir}/pkg/usr/share/applications
  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  install -m644 ${startdir}/src/mozilla/browser/app/default48.png ${startdir}/pkg/usr/share/pixmaps/firefox3.png
  install -m644 ${startdir}/src/firefox3.desktop ${startdir}/pkg/usr/share/applications/
  install -m644 ${startdir}/src/firefox3-safe.desktop ${startdir}/pkg/usr/share/applications/

  mkdir -p ${startdir}/pkg/opt/mozilla/lib/firefox3/chrome/icons/default
  install -m644 ${startdir}/src/mozilla/browser/app/mozicon50.xpm ${startdir}/pkg/opt/mozilla/lib/firefox3/chrome/icons/default/default.xpm
  install -m644 ${startdir}/src/mozilla/browser/app/mozicon50.xpm ${startdir}/pkg/opt/mozilla/lib/firefox3/icons/default.xpm

  cd ${startdir}/pkg/opt/mozilla/bin && mv firefox firefox3
}

md5sums=('6a97a0933f8cd71b34436daa41530c29'
         '3beb3a46e2f15b55678d253bc1fed3e4'
         'ff1c7b1fb25fee646a0c6d2b08d3b98c'
         '370aa36551a70150c1c6f07672ca0f32'
         'bd5db57c23c72a02a489592644f18995')
