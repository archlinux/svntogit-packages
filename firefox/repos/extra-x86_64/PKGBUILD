# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributer: Nick Penwarden <toth64@yahoo.com>
pkgname=firefox
pkgver=2.0.0.14
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2>=2.12.0' 'pango>=1.16.1' 'gcc-libs' 'libxt' 'libidl2' 'mozilla-common' 'nss>=3.11.7' 'desktop-file-utils')
makedepends=('zip' 'imagemagick' 'pkgconfig' 'gcc' 'diffutils')
replaces=('mozilla-firebird' 'phoenix' 'mozilla-firefox')
conflicts=('mozilla-firefox')
provides=('mozilla-firefox')
install=firefox.install
url="http://www.mozilla.org/projects/firefox"
source=(ftp://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}-source.tar.bz2
        mozconfig
       	launcher.patch
	mozilla-firefox-1.0-lang.patch
        moz310924.patch
	moz325644.patch
	firefox-visibility.patch
	firefox-1.5-new-gtkim.patch
	firefox-2.0-add-ldflags.patch
	firefox-2.0-buildversion.patch
        firefox-1.5-pango-underline.patch
        firefox-1.5-pango-justified-range.patch
        firefox-1.5-xft-rangewidth.patch
	firefox-2.0-pango-printing.patch
	firefox-1.5-theme-change.patch
	iceweasel_2.0.0.12-1_part.patch
        firefox.desktop
	firefox-safe.desktop)
options=('!makeflags')

build() {
  cd ${startdir}/src/mozilla
  patch -Np0 -i ${startdir}/src/moz310924.patch || return 1
  patch -Np0 -i ${startdir}/src/moz325644.patch || return 1
  patch -Np0 -i ${startdir}/src/launcher.patch || return 1
  patch -Np1 -i ${startdir}/src/mozilla-firefox-1.0-lang.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-new-gtkim.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-add-ldflags.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-buildversion.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-underline.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-justified-range.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-xft-rangewidth.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-pango-printing.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-1.5-theme-change.patch || return 1
  patch -Np1 -i ${startdir}/src/iceweasel_2.0.0.12-1_part.patch || return 1

  if [ "$CARCH" = "x86_64" ]; then
    patch -Np0 -i ../firefox-visibility.patch || return 1
  fi

  export MOZ_PROJECT=browser

  sed "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig >.mozconfig
  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/usr/lib/firefox-${pkgver}
  export MOZ_DISABLE_GNOME=1
  export MOZTMP=`mktemp -d -p ${startdir}/src`
  LD_LIBRARY_PATH=`pwd` HOME=${MOZTMP} ./firefox-bin -register
  rm -rf ${MOZTMP}
  cd chrome
  find . -maxdepth 1 -type d -exec rm -rf {} \;

  #Remove mozilla devel stuff, this is in XULRunner now
  rm -rf ${startdir}/pkg/usr/share
  rm -rf ${startdir}/pkg/usr/include
  rm -rf ${startdir}/pkg/usr/lib/pkgconfig


  cd ${startdir}/pkg/usr/lib && ln -sf firefox-${pkgver} firefox

  rm -rf ${startdir}/pkg/usr/bin/defaults

  mkdir -p ${startdir}/pkg/usr/share/applications
  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  convert ${startdir}/src/mozilla/browser/app/default.xpm ${startdir}/pkg/usr/share/pixmaps/firefox.png
  install -m644 ${startdir}/src/firefox.desktop ${startdir}/pkg/usr/share/applications/
  install -m644 ${startdir}/src/firefox-safe.desktop ${startdir}/pkg/usr/share/applications/

  mkdir -p ${startdir}/pkg/usr/lib/firefox/chrome/icons/default
  install -m644 ${startdir}/src/mozilla/browser/app/default.xpm ${startdir}/pkg/usr/lib/firefox/chrome/icons/default/
  install -m644 ${startdir}/src/mozilla/browser/app/default.xpm ${startdir}/pkg/usr/lib/firefox/icons/
}
md5sums=('9e9c13ba7b81f93f2fa10c6f256ee31e'
         'e980891ba998459afb8afe7293f1a2af'
         '224962b5f2446cab7727fdf07fd526de'
         'bd5db57c23c72a02a489592644f18995'
         '29194973e2a535b460c6b7f92c635eaf'
         '2082c2a2d1cedd08e83179271aacf337'
         '362f9e0b0f25b964f7120b68fb629ee0'
         '60b4bbe73d2e919ee4a6476dca6705b6'
         '25f355113cdee6800380c6e1a4cd38f0'
         '11b221ff41078d97c131e17361072e47'
         '713a9587dd024f5d03f1fe9c095da9de'
         '4d0713c0a94a367a4e84d5f7e56de631'
         'affb470ca6bac11a7f3005e2508621a8'
         '52a9fc53aa12117dc392cb1dbdc56ae9'
         '51681f096254c07149f687fdc4c3c5b7'
         '0878e1b02081e1ed71929e7553cbe04c'
         '74ea70c9e935f0e7f7b75436fe33efd5'
         '5e68cabfcf3c021806b326f664ac505e')
