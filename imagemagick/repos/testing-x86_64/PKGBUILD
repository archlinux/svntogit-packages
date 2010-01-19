# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

# NOTE: To circumvent linking problems (FS#10574), this package must now be built the following way:
# install old package, build new package, install new package, rebuild
# Just uninstalling ImageMagick before build fails as it is used during the build processs

pkgname=imagemagick
pkgver=6.5.9.0
pkgrel=2
pkgdesc="An image viewing/manipulation program"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('lcms' 'libwmf' 'librsvg' 'libxt' 'gcc-libs' 'ghostscript' 'openexr>=1.6.1' 'libtool' 'heimdal' 'bzip2' 'libxml2' 'jasper')
makedepends=('imagemagick')
options=('!makeflags' '!docs')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.bz2 \
        libpng_mmx_patch_x86_64.patch add_delegate.patch perlmagick.rpath.patch)
md5sums=('58130d17863449ad1b7c6d04cee95943' '069980fc2590c02aed86420996259302'\
         '7f5851c4450b73d52df55c7e806cc316' 'ff9974decbfe9846f8e347239d87e4eb')
sha1sums=('6819bd66e8bc4f9825af7904e78f79878277ac1e' 'e42f3acbe85b6098af75c5cecc9a254baaa0482c'\
         '19b40dcbc5bf8efb8ce7190fed17e2921de32ea5' '23405f80904b1de94ebd7bd6fe2a332471b8c283')

build() {
  cd "${srcdir}/ImageMagick-${pkgver%.*}-${pkgver##*.}"

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 < ../libpng_mmx_patch_x86_64.patch || return 1
  fi

  patch -p0 < ../add_delegate.patch || return 1
  patch -p0 < ../perlmagick.rpath.patch || return 1

 # When there is a soname bump, remove 'LIBS=-lMagickWand' from configure line and build/install. Then, readd 'LIBS=-lMagickWand' and build/install twice.
   LIBS=-lMagickWand ./configure --prefix=/usr --without-modules --disable-static --enable-openmp \
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
