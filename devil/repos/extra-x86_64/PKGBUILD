# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>

pkgname=devil
pkgver=1.6.7
pkgrel=5
pkgdesc="Library for reading several different image formats"
arch=(i686 x86_64)
url="http://openil.sourceforge.net/"
depends=('allegro>=4.2.2' 'sdl' 'libpng' 'zlib' 'libjpeg' 'libtiff' 'libmng')
makedepends=('bash')
options=('!libtool')
license=('GPL')
source=(http://puzzle.dl.sourceforge.net/sourceforge/openil/DevIL-$pkgver.tar.gz)
md5sums=('0d0c3842196d85c4e24bedabcd84f626')

build()
{
   cd $startdir/src/DevIL-$pkgver

   # configure and build
   ./configure --prefix=/usr --with-gnu-ld
   make || return 1
   make prefix=$startdir/pkg/usr install   

   # fix upstream bug http://sourceforge.net/tracker/index.php?func=detail&aid=1651292&group_id=4470&atid=104470
   # archlinux bug ref: http://bugs.archlinux.org/task/7573
   for header in `echo $startdir/pkg/usr/include/IL/*.h`; do
     sed -i 's|(ILvoid)|(void)|g' $header
   done

}
