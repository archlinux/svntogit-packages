# $Id$
#Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
#Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=cmt
pkgver=1.16
pkgrel=1
pkgdesc="CMT for LADSPA"
arch=(i686 x86_64)
license=('GPL')
url="http://www.ladspa.org"
depends=('ladspa' 'gcc-libs')
source=(http://www.ladspa.org/download/$pkgname\_src_$pkgver.tgz)
groups=('ladspa-plugins')

build() {
  cd $startdir/src/$pkgname/src
  if [ "$CARCH" = "x86_64" ]; then
    # from Gentoo
    sed -i -e "/^CFLAGS/ s/-O3/${CFLAGS}/" makefile
    # gcc-4 bails
    sed -i -e 's|-Werror||g' makefile 
  fi
  make
  mkdir -p $startdir/pkg/usr/lib/ladspa
  cp $startdir/src/$pkgname/plugins/cmt.so $startdir/pkg/usr/lib/ladspa
}
md5sums=('15a875e5aaf79c209c223babfb41cb1c')
