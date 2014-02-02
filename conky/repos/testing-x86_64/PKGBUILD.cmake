# $Id: PKGBUILD 118899 2011-04-09 10:32:42Z bisson $
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=conky
pkgver=1.8.2git20111021
pkgrel=1
pkgdesc='Lightweight system monitor for X'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('pkg-config' 'cmake' 'git' 'docbook2x')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'libxdamage' 'imlib2' 'lua')

replaces=('torsmo')

build() {
	cd "${srcdir}"

	cd conky && { git pull origin; cd ..; } || git clone git://git.omp.am/conky.git
	rm -fr build; mkdir build; cd build

	cmake \
		-D CMAKE_BUILD_TYPE:STRING="Release" \
		-D MAINTAINER_MODE:BOOL=ON \
		-D BUILD_CURL:BOOL=ON \
		-D BUILD_IMLIB2:BOOL=ON \
		-D BUILD_LUA_IMLIB2:BOOL=OFF \
		-D BUILD_MYSQL:BOOL=OFF \
		-D BUILD_RSS:BOOL=ON \
		-D BUILD_WEATHER_METAR:BOOL=ON \
		-D BUILD_WEATHER_XOAP:BOOL=ON \
		-D BUILD_WLAN:BOOL=ON \
		-D CMAKE_INSTALL_PREFIX:PATH=/usr \
		../conky

	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 ../conky/{COPYING,LICENSE}* "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
