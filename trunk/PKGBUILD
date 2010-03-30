# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=imagemagick
pkgver=6.6.0.10
pkgrel=1
pkgdesc="An image viewing/manipulation program"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('libtool' 'lcms' 'libxt' 'gcc-libs' 'bzip2')
makedepends=('ghostscript' 'openexr' 'libwmf' 'librsvg' 'libxml2' 'jasper')
optdepends=('ghostscript: for Ghostscript support' \
            'openexr: for OpenEXR support' \
            'libwmf: for WMF support' \
            'librsvg: for SVG support' \
            'libxml2: for XML support' \
            'jasper: for JPEG-2000 support')
options=('!makeflags' '!docs')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz \
        libpng_mmx_patch_x86_64.patch perlmagick.rpath.patch)
md5sums=('c7682e0711f2966f80b539f870d491ad' '069980fc2590c02aed86420996259302'\
         'ff9974decbfe9846f8e347239d87e4eb')
sha1sums=('1232b5a62f9f6a6c837fd2af76457d891568f064' 'e42f3acbe85b6098af75c5cecc9a254baaa0482c'\
         '23405f80904b1de94ebd7bd6fe2a332471b8c283')

build() {
  cd "${srcdir}/ImageMagick-${pkgver%.*}-${pkgver##*.}"

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 < ../libpng_mmx_patch_x86_64.patch || return 1
  fi

  patch -p0 < ../perlmagick.rpath.patch || return 1

  ./configure --prefix=/usr --with-modules --disable-static --enable-openmp \
              --with-x --with-wmf --with-openexr --with-xml \
              --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
              --with-perl --with-perl-options="INSTALLDIRS=vendor" \
              --without-gvc --without-djvu --without-autotrace --with-jp2 \
              --without-jbig --without-fpx --without-dps || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
  install -D -m644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE" || return 1

  #Cleaning
  find "${pkgdir}" -name '*.bs' -exec rm {} \; || return 1
  rm -f "${pkgdir}"/usr/lib/*.la || return 1
}
