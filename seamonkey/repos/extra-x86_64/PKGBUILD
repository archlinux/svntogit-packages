# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=seamonkey
pkgver=1.1.6
pkgrel=1
pkgdesc="SeaMonkey internet suite"
arch=(i686 x86_64)
license=('MPL')
depends=('gtk2>=2.12.0' 'libidl2' 'mozilla-common' 'nss>=3.11.7' 'libxt' 'gcc-libs')
makedepends=('zip' 'pkgconfig' 'diffutils' 'gcc')
replaces=('mozilla')
url="http://www.mozilla.org/projects/seamonkey"
source=(ftp://ftp.mozilla.org/pub/mozilla.org/seamonkey/releases/${pkgver}/seamonkey-${pkgver}.source.tar.bz2
        mozconfig 
        seamonkey.desktop
	moz310924.patch
	moz325644.patch
	firefox-visibility.patch
	firefox-1.5-new-gtkim.patch
	firefox-1.5-pango-cursor-position.patch
	firefox-2.0-add-ldflags.patch
        firefox-2.0-pango-ligatures.patch
        firefox-1.5-pango-underline.patch
        firefox-1.5-pango-justified-range.patch
        firefox-1.5-xft-rangewidth.patch)

build() {
  cd ${startdir}/src/mozilla
  patch -Np0 -i ${startdir}/src/moz310924.patch || return 1
  patch -Np0 -i ${startdir}/src/moz325644.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-new-gtkim.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-cursor-position.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-add-ldflags.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-2.0-pango-ligatures.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-underline.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-justified-range.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-xft-rangewidth.patch || return 1

  if [ "$CARCH" = "x86_64" ]; then
    patch -Np0 -i ../firefox-visibility.patch || return 1
  fi

  export MAKEFLAGS="-j1"

  sed -e "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig > .mozconfig

  export MOZ_PROJECT=suite

  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/usr/lib/seamonkey-${pkgver}
  export MOZ_DISABLE_GNOME=1
  export MOZTMP=`mktemp -d -p ${startdir}/src`
  LD_LIBRARY_PATH=`pwd` HOME=${MOZTMP} ./seamonkey-bin -register
  rm -rf ${MOZTMP}
  cd chrome
  find . -maxdepth 1 -type d -exec rm -rf {} \;

  # Remove common mozilla aclocal stuff
  rm -rf ${startdir}/pkg/usr/share
  rm -rf ${startdir}/pkg/usr/include
  rm -rf ${startdir}/pkg/usr/lib/pkgconfig
	  
  cd ${startdir}/pkg/usr/lib && ln -sf seamonkey-${pkgver} seamonkey

  rm -rf ${startdir}/pkg/usr/bin/defaults

  mkdir -p ${startdir}/pkg/usr/share/applications
  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  install -m644 ${startdir}/src/mozilla/suite/branding/icons/gtk/seamonkey.png \
                ${startdir}/pkg/usr/share/pixmaps/
  install -m644 ${startdir}/src/seamonkey.desktop ${startdir}/pkg/usr/share/applications/

  mkdir -p ${startdir}/pkg/usr/lib/seamonkey-${pkgver}/chrome/icons/default
  install -m644 ${startdir}/src/mozilla/suite/branding/icons/gtk/default.xpm \
	${startdir}/pkg/usr/lib/seamonkey-${pkgver}/chrome/icons/default/
}
md5sums=('bd3f4d3232a1c936a20fd76785f3e395'
         '53813886c6fd5fb616918703479ba522'
         '448848e65efcbf1b2be2873b66b6cd48'
         '29194973e2a535b460c6b7f92c635eaf'
         '2082c2a2d1cedd08e83179271aacf337'
         '362f9e0b0f25b964f7120b68fb629ee0'
         '60b4bbe73d2e919ee4a6476dca6705b6'
         '288fb7db871700ff5cf7286db6192b45'
         '25f355113cdee6800380c6e1a4cd38f0'
         '505728f57ff903e68afd3abea01be2e4'
         '713a9587dd024f5d03f1fe9c095da9de'
         '4d0713c0a94a367a4e84d5f7e56de631'
         'affb470ca6bac11a7f3005e2508621a8')
