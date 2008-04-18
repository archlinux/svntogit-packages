# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=emboss
orgname=EMBOSS
pkgver=5.0.0
pkgrel=1
pkgdesc="A collection of molecular biology applications"
arch=(i686 x86_64)
url="http://emboss.sourceforge.net/"
depends=('gd' 'libx11' 'pcre' 'perl' 'jre')
makedepends=('jdk')
options=("!libtool")
license=('GPL2')
source=(ftp://emboss.open-bio.org/pub/EMBOSS/$orgname-$pkgver.tar.gz)
md5sums=('be4c895220ad34afd65d450ba7d8e34b')

build() {
  cd $startdir/src/$orgname-$pkgver
  source /etc/profile.d/jdk.sh
  CFLAGS="${CFLAGS} -I/opt/java/include"
  ./configure --prefix=/usr --enable-large --with-x \
	--with-javaos=/opt/java/include/linux/ --with-java=/opt/java/
  make || return 1
  make prefix=$startdir/pkg/usr install 
  rm -f $startdir/pkg/usr/include/{pcre,pcreposix}.h
}
