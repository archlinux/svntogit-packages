# $Id$
# Maintainer: damir <damir@archlinux.org>
# Packager: Maksim Sipos (maxsipos at gmail dot com)

pkgname=plotutils
pkgver=2.5
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Set of utilities and libraries for plotting."
url="http://directory.fsf.org/graphics/plotutils.html"
license=("GPL")
depends=("libpng" "gcc-libs" "libxaw" "libxmi")
makedepends=("flex")
# _patches=""
source=("http://ftp.gnu.org/pub/gnu/plotutils/$pkgname-$pkgver.tar.gz" \
	${_patches})
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
#   for patch in ${_patches}
#   do
#     patch -Np1 -i $startdir/src/$patch 
#   done
  ./configure --prefix=/usr \
	--with-gnu-ld \
	--with-x \
	--enable-libplotter \
	--enable-libxmi=no # is separate pkg in arch
  make || return 1
  make DESTDIR=$startdir/pkg install
  # disabling the build of libxmi does not work, so lets remove it simply:
  rm $startdir/pkg/usr/{include/xmi.h,lib/libxmi.{a,so,so.0,so.0.1.3}}
}
md5sums=('0d6855cce17832afe2ff75c26a57be49')
