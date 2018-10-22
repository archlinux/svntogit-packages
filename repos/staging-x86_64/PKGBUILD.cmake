# $Id: PKGBUILD 305444 2017-09-13 20:29:19Z andyrtr $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: tobias <tobias@archlinux.org>

pkgname=inkscape
pkgver=0.92.2
pkgrel=3
pkgdesc='Professional vector graphics editor'
url='https://inkscape.org/'
license=('GPL' 'LGPL')
arch=('x86_64')
makedepends=('boost' 'intltool' 'cmake')
depends=('gc' 'gsl' 'gtkmm' 'gtkspell' 'imagemagick' 'libxslt' 'poppler-glib'
         'popt' 'potrace' 'ttf-dejavu' 'python' 'libcdr' 'libvisio' 'libwpg'
         'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('gvfs: import clip art'
            'pstoedit: latex formulas'
            'scour: optimized SVG output'
            'texlive-core: latex formulas'
            'python-numpy: some extensions'
            'python-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats')
source=("https://media.inkscape.org/dl/resources/file/${pkgname}-${pkgver}.tar.bz2"
        poppler-0.58.patch)
sha256sums=('a628d0e04c254e9840947e6d866974f92c68ae31631a38b94d9b65e5cd84cfd3'
            'af6796619a74b392432c72abdb703971fbcaf1c8ff196ce5bb37505914d38f5a')

# NB: Some CDN nodes appear to be distributing an outdated version of this file.

prepare() {
	cd ${pkgname}-${pkgver}

	mkdir ../build

	# https://gitlab.com/inkscape/inkscape/commit/93ccf03162cd2e46d962822d5507865f3451168c
	patch -Np1 -i ../poppler-0.58.patch
}

build() {
	cd build
	cmake ../${pkgbase}-${pkgver} \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	  -DINCLUDE_INSTALL_DIR:PATH=/usr/include \
	  -DLIB_INSTALL_DIR:PATH=/usr/lib \
	  -DSYSCONF_INSTALL_DIR:PATH=/etc \
	  -DSHARE_INSTALL_PREFIX:PATH=/usr/share \
	  -DCMAKE_ENABLE_LCMS=ON \
	  -DCMAKE_ENABLE_POPPLER_CAIRO=ON \
	  -DCMAKE_WITH_NLS=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install

	# cleanup
	rm $pkgdir/usr/include/*.a
}
