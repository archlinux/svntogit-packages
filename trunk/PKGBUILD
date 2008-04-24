# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

# NOTE: ImageMagick builds against an existing installation
# uninstall ImageMagick before building, or build it, install it, build it.

pkgname=imagemagick
pkgver=6.4.0.9
pkgrel=1
pkgdesc="An image viewing/manipulation program"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('lcms' 'libwmf' 'librsvg' 'libxt' 'gcc-libs' 'ghostscript' 'openexr' 'libtool>=2.2')
#makedepends=('ghostscript' 'openexr')
options=('!makeflags')
source=(ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick-${pkgver%.*}-${pkgver##*.}.tar.bz2 \
        libpng_mmx_patch_x86_64.patch add_delegate.patch)
md5sums=('3d11d8a4490065a8fca838ecf919297a' '069980fc2590c02aed86420996259302'\
         '7f5851c4450b73d52df55c7e806cc316')
sha1sums=('dd191376fdc299ad50f3f0e04a7d4aac104440eb'
          'e42f3acbe85b6098af75c5cecc9a254baaa0482c'
          '19b40dcbc5bf8efb8ce7190fed17e2921de32ea5')

build() {
  cd ${startdir}/src/ImageMagick-${pkgver%.*}

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ${startdir}/src/libpng_mmx_patch_x86_64.patch || return 1
  fi

  patch -p0 < ../add_delegate.patch || return 1

  ./configure --prefix=/usr --without-modules --disable-static --disable-openmp \
              --with-x --with-wmf --with-openexr \
              --with-gslib --with-gs-font-dir=/usr/share/fonts/Type1 \
              --with-perl --with-perl-options="INSTALLDIRS=vendor" \
              --without-gvc --without-djvu --without-jp2 \
              --without-jbig --without-fpx --without-dps

  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 NOTICE ${startdir}/pkg/usr/share/licenses/${pkgname}/NOTICE

  #Cleaning
  find ${startdir}/pkg -name '*.bs' -exec rm {} \;
  find ${startdir}/pkg -name '.packlist' -exec rm {} \;
  find ${startdir}/pkg -name 'perllocal.pod' -exec rm {} \;

  rm -f ${startdir}/pkg/usr/lib/*.la
}
