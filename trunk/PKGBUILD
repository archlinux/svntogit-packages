# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>
pkgname=thunderbird
pkgver=2.0.0.12
pkgrel=1
pkgdesc="Standalone Mail/News reader"
arch=('i686' 'x86_64')
license=('MPL' 'GPL')
url="http://www.mozilla.org/projects/thunderbird"
provides=('mozilla-thunderbird')
conflicts=('mozilla-thunderbird')
replaces=('mozilla-thunderbird')
depends=('gtk2>=2.12.0' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss>=3.11.5' 'libxt')
makedepends=('zip' 'pkgconfig' 'imagemagick' 'diffutils' 'patch' 'make' 'gcc')
source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/${pkgver}/source/thunderbird-${pkgver}-source.tar.bz2
	mozconfig
        launcher.patch
        thunderbird.desktop
        thunderbird-1.5-lang.patch
        firefox-visibility.patch
        firefox-1.5-new-gtkim.patch
        firefox-1.5-pango-cursor-position.patch
        firefox-2.0-link-layout.patch
        firefox-1.5-pango-underline.patch
        firefox-1.5-pango-justified-range.patch
        firefox-1.5-xft-rangewidth.patch
        firefox-1.5-theme-change.patch
        firefox-2.0.0.4-undo-uriloader.patch
        firefox-1.5-bullet-bill.patch)
options=('!makeflags')

build() {
  cd ${startdir}/src/mozilla
  patch -Np0 -i ${startdir}/src/launcher.patch || return 1
  patch -Np1 -i ${startdir}/src/thunderbird-1.5-lang.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-new-gtkim.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-cursor-position.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-2.0-link-layout.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-underline.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-justified-range.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-xft-rangewidth.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-1.5-theme-change.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-2.0.0.4-undo-uriloader.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-bullet-bill.patch || return 1

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np0 -i ${startdir}/src/firefox-visibility.patch || return 1
  fi

  sed "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig >.mozconfig
  
  export MOZ_PROJECT=mail

  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/usr/lib/thunderbird-${pkgver}
  export MOZ_DISABLE_GNOME=1
  export MOZTMP=`mktemp -d -p ${startdir}/src`
  LD_LIBRARY_PATH="`pwd`" HOME="${MOZTMP}" ./thunderbird-bin -register
  rm -rf "${MOZTMP}"
  cd chrome
  find . -maxdepth 1 -type d -exec rm -rf {} \;

  # Remove common mozilla aclocal stuff, XULRunner has it
  rm -rf ${startdir}/pkg/usr/share
  rm -rf ${startdir}/pkg/usr/include
  rm -rf ${startdir}/pkg/usr/lib/pkgconfig

  cd ${startdir}/pkg/usr/lib && ln -sf thunderbird-${pkgver} thunderbird
  
  rm -rf ${startdir}/pkg/usr/bin/defaults

  mkdir -p ${startdir}/pkg/usr/share/{applications,pixmaps}
  convert ${startdir}/src/mozilla/mail/app/default.xpm \
      ${startdir}/pkg/usr/share/pixmaps/thunderbird.png
  install -m644 ${startdir}/src/thunderbird.desktop \
      ${startdir}/pkg/usr/share/applications/

  mkdir -p ${startdir}/pkg/usr/lib/thunderbird/chrome/icons/default
  install -m644 ${startdir}/src/mozilla/mail/app/default.xpm \
      ${startdir}/pkg/usr/lib/thunderbird/chrome/icons/default/
  install -m644 ${startdir}/src/mozilla/mail/app/default.xpm \
      ${startdir}/pkg/usr/lib/thunderbird/icons/

  #Move RSS support
  mv ${startdir}/pkg/usr/lib/thunderbird/defaults/isp/* \
    ${startdir}/pkg/usr/lib/thunderbird/isp/
  rmdir ${startdir}/pkg/usr/lib/thunderbird/defaults/isp

  #fix #6512
  install -m644 ${startdir}/src/mozilla/dist/bin/chrome/icons/default/*.xpm \
      ${startdir}/pkg/usr/lib/thunderbird/chrome/icons/default/
}
