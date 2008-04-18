# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=gtksourceview-sharp-2.0
pkgver=0.10
pkgrel=5
pkgdesc="a C# binding to gtksourceview"
url="http://www.mono-project.com/"
depends=('gtksourceview' 'gtk-sharp-2>=2.6')
conflicts=(gtksourceview-sharp)
provides=(gtksourceview-sharp)
source=(http://go-mono.com/sources/gtksourceview-sharp-2.0/gtksourceview-sharp-2.0-${pkgver}.tar.gz
				dont-install-langdata.patch)
md5sums=(2179634b8931e6be849a1e1f82c834e3 eeab3108b82d5590f2adab826ae91cc2)

build() {
	[ -z "${GNOMEDIR}" ] && . /etc/profile.d/gnome.sh
 # get rid of that .wapi errors; thanks to brice
	export MONO_SHARED_DIR=${startdir}/src/weird
	mkdir -p ${MONO_SHARED_DIR}
 # build
  cd ${startdir}/src/gtksourceview-sharp-2.0-${pkgver}
	patch -Np0 -i ${startdir}/src/dont-install-langdata.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" \
    DESTDIR=${startdir}/pkg install
 # housecleaning
  rm -rf ${MONO_SHARED_DIR}
}
# vim: ft=sh ts=2
