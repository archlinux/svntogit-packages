# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgbase=imagemagick
pkgname=('imagemagick' 'imagemagick-doc')
pkgver=6.6.9.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('libtool' 'lcms' 'libxt' 'gcc-libs' 'bzip2' 'xz' 'freetype2' 'fontconfig' \
         'libxext' 'libjpeg-turbo')
makedepends=('ghostscript' 'openexr' 'libwmf' 'librsvg' 'libxml2' 'jasper' 'libpng')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.xz \
        libpng_mmx_patch_x86_64.patch perlmagick.rpath.patch)
md5sums=('e9355aa38daa1d2c42d7e37108bc0dfa'
         '069980fc2590c02aed86420996259302'
         'ff9974decbfe9846f8e347239d87e4eb')
sha1sums=('e3cbf6d61bf29ec8be6796c89b04f10495a6e52d'
          'e42f3acbe85b6098af75c5cecc9a254baaa0482c'
          '23405f80904b1de94ebd7bd6fe2a332471b8c283')

build() {
  cd "${srcdir}"/ImageMagick-${pkgver%.*}-${pkgver##*.}

  if [ "${CARCH}" = 'x86_64' ]; then
    patch -Np1 -i ../libpng_mmx_patch_x86_64.patch
  fi

  patch -Np0 -i ../perlmagick.rpath.patch
  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf

  ./configure --prefix=/usr --sysconfdir=/etc --with-modules --disable-static \
    --enable-openmp --with-wmf --with-openexr --with-xml \
    --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
    --with-perl --with-perl-options="INSTALLDIRS=vendor" \
    --without-gvc --without-djvu --without-autotrace --with-jp2 \
    --without-jbig --without-fpx --without-dps --without-fftw
  make
}

package_imagemagick() {
  pkgdesc="An image viewing/manipulation program"
  optdepends=('ghostscript: for Ghostscript support' 
              'openexr: for OpenEXR support' 
              'libwmf: for WMF support' 
              'librsvg: for SVG support' 
              'libxml2: for XML support' 
              'jasper: for JPEG-2000 support' 
              'libpng: for PNG support')
  backup=('etc/ImageMagick/coder.xml'
          'etc/ImageMagick/colors.xml'
          'etc/ImageMagick/delegates.xml'
          'etc/ImageMagick/log.xml'
          'etc/ImageMagick/magic.xml'
          'etc/ImageMagick/mime.xml'
          'etc/ImageMagick/policy.xml'
          'etc/ImageMagick/sRGB.icm'
          'etc/ImageMagick/thresholds.xml'
          'etc/ImageMagick/type.xml'
          'etc/ImageMagick/type-dejavu.xml'
          'etc/ImageMagick/type-ghostscript.xml'
          'etc/ImageMagick/type-windows.xml')
  options=('!makeflags' '!docs')

  cd "${srcdir}"/ImageMagick-${pkgver%.*}-${pkgver##*.}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/imagemagick/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/imagemagick/NOTICE"

#Cleaning
  find "${pkgdir}" -name '*.bs' -delete
  rm -f "${pkgdir}"/usr/lib/*.la
}

package_imagemagick-doc() {
  pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
  depends=()
  options=('!makeflags')

  cd "${srcdir}"/ImageMagick-${pkgver%.*}-${pkgver##*.}
  make DESTDIR="${pkgdir}" install-data-html
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/imagemagick-doc/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/imagemagick-doc/NOTICE"
}
