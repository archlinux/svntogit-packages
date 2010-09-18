# $Id$
# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer: DAniel J Griffiths <ghost1227@archlinux.us>

pkgname=imagemagick
pkgver=6.6.4.3
pkgrel=1
pkgdesc="An image viewing/manipulation program"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('libtool' 'lcms' 'libxt' 'gcc-libs' 'bzip2' 'freetype2' 'fontconfig' 'libxext')
makedepends=('ghostscript' 'openexr' 'libwmf' 'librsvg' 'libxml2' 'jasper')
optdepends=('ghostscript: for Ghostscript support' 
            'openexr: for OpenEXR support' 
            'libwmf: for WMF support' 
            'librsvg: for SVG support'
            'libxml2: for XML support'
            'jasper: for JPEG-2000 support')
options=('!makeflags' '!docs' 'force')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz \
        libpng_mmx_patch_x86_64.patch 
	perlmagick.rpath.patch)
md5sums=('be87050ec143205326f2e9fbbc7da03a' '069980fc2590c02aed86420996259302'\
         'ff9974decbfe9846f8e347239d87e4eb')
sha1sums=('9f6c800560998b6a5e96b1a62d2b13140de9d1d7' 'e42f3acbe85b6098af75c5cecc9a254baaa0482c'\
         '23405f80904b1de94ebd7bd6fe2a332471b8c283')

build() {
	cd "${srcdir}"/ImageMagick-${pkgver%.*}-${pkgver##*.}

	if [ "${CARCH}" = 'x86_64' ]; then
		patch -Np1 < ../libpng_mmx_patch_x86_64.patch
	fi

	patch -p0 < ../perlmagick.rpath.patch

	./configure --prefix=/usr --with-modules --disable-static \
	    --enable-openmp --with-x --with-wmf --with-openexr --with-xml \
	    --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
	    --with-perl --with-perl-options="INSTALLDIRS=vendor" \
	    --without-gvc --without-djvu --without-autotrace --with-jp2 \
	    --without-jbig --without-fpx --without-dps
	make
}

package() {
	cd "${srcdir}"/ImageMagick-${pkgver%.*}-${pkgver##*.}

	make DESTDIR="${pkgdir}" install

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

	#Cleaning
	find "${pkgdir}" -name '*.bs' -exec rm {} \;
	rm -f "${pkgdir}"/usr/lib/*.la
}
