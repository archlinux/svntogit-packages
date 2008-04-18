# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xulrunner
pkgver=1.8.1.13
pkgrel=1
pkgdesc="Mozilla Runtime Environment"
arch=(i686 x86_64)
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2>=2.12' 'pango>=1.18.4' 'gcc-libs' 'libidl2' 'mozilla-common' 'nss>=3.11.7' 'libxt')
makedepends=('zip' 'pkgconfig' 'diffutils' 'gcc')
provides=(gecko-sdk)
replaces=(gecko-sdk)
url="http://wiki.mozilla.org/XUL:Xul_Runner"
source=(http://www.archlinux.org/~alexander/src/${pkgname}-${pkgver}-source.tar.bz2
	about-plugins.patch
        mozconfig
        moz310924.patch
        moz325644.patch
        firefox-visibility.patch
        firefox-1.5-new-gtkim.patch
        firefox-2.0-buildversion.patch
        firefox-1.5-pango-underline.patch
        firefox-1.5-pango-justified-range.patch
        firefox-1.5-xft-rangewidth.patch
        firefox-1.5-theme-change.patch
        iceweasel_2.0.0.12-1_part.patch)

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/moz310924.patch || return 1
  patch -Np0 -i ${startdir}/src/moz325644.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-new-gtkim.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-2.0-buildversion.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-underline.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-pango-justified-range.patch || return 1
  patch -Np1 -i ${startdir}/src/firefox-1.5-xft-rangewidth.patch || return 1
  patch -Np0 -i ${startdir}/src/firefox-1.5-theme-change.patch || return 1
  patch -Np1 -i ${startdir}/src/iceweasel_2.0.0.12-1_part.patch || return 1

  if [ "${CARCH}" = "x86_64" ]; then
    echo "ac_cv_visibility_pragma=no" >> ${startdir}/src/mozconfig
  fi

  sed "s/#CFLAGS#/${CFLAGS}/g" ${startdir}/src/mozconfig >.mozconfig

  make -f client.mk build || return 1
  make DESTDIR=${startdir}/pkg DISTDIR=${startdir}/pkg install || return 1

  cd ${startdir}/pkg/usr/lib && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/usr/include && ln -sf xulrunner-${pkgver} xulrunner
  cd ${startdir}/pkg/usr/share/idl && ln -sf xulrunner-${pkgver} xulrunner

  rm -rf ${startdir}/pkg/usr/bin/defaults

  #NSPR and NSS aren't built anyways, remove pkgconfig files for it
  rm -f ${startdir}/pkg/usr/lib/pkgconfig/xulrunner-ns{s,pr}.pc
  #Remove versioned directories from .pc files, fixes problems with updates
  sed -i -e "s/xulrunner-${pkgver}/xulrunner/" \
  	${startdir}/pkg/usr/lib/pkgconfig/*.pc
}
md5sums=('8ad7fd1133a952af39e4cdb099247b49'
         'b2b5ce5ddf6e84858b8acb1e71b4682f'
         '220bc99298cf55b4f2cb9f82f80d7ebc'
         '29194973e2a535b460c6b7f92c635eaf'
         '2082c2a2d1cedd08e83179271aacf337'
         '362f9e0b0f25b964f7120b68fb629ee0'
         '60b4bbe73d2e919ee4a6476dca6705b6'
         '11b221ff41078d97c131e17361072e47'
         '713a9587dd024f5d03f1fe9c095da9de'
         '4d0713c0a94a367a4e84d5f7e56de631'
         'affb470ca6bac11a7f3005e2508621a8'
         '51681f096254c07149f687fdc4c3c5b7'
         '0878e1b02081e1ed71929e7553cbe04c')
