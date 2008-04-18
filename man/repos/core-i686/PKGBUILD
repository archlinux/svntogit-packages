# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=man
pkgver=1.6f
pkgrel=2
pkgdesc="A utility for reading man pages"
arch=('i686' 'x86_64')
url="http://primates.ximian.com/~flucifredi/man/"
license=('GPL')
groups=('base')
depends=('groff' 'less' 'gzip' 'awk' 'coreutils' 'sh' 'diffutils')
backup=(etc/man.conf)
source=(http://primates.ximian.com/~flucifredi/man/man-$pkgver.tar.gz \
        whatis.cron.daily man-troff.patch)
md5sums=('67aaaa6df35215e812fd7d89472c44b6'
         'b86a5f2dd87c6be30421a8813547229d'
         '21541cb3073259f7fb9335675ca41b0e')
options=(!emptydirs)

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../man-troff.patch || return 1
  ./configure -confdir='/etc' -d +lang all -mandir=/usr/share/man
  make || return 1
  make PREFIX=$startdir/pkg install || return 1

  sed -i "s|-Tlatin1||g" $startdir/pkg/etc/man.conf

  #install whatis cron script
  install -D -m744 ../whatis.cron.daily $startdir/pkg/etc/cron.daily/whatis
}
