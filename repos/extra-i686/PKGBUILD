# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgname=libmpd
pkgver=0.15.0
pkgrel=1
pkgdesc="Signal based wrapper around libmpdclient"
arch=(i686 x86_64)
license=('GPL')
url="http://sarine.nl/libmpd"
depends=('glibc')
options=('!libtool')
source=(http://sarine.nl/index.php\?mact=Uploads,cntnt01,getfile,0\&cntnt01showtemplate=false\&cntnt01upload_id=39\&cntnt01returnid=71)
md5sums=('723f84bb2d42deee76d2ebea6db61656')

build() {
  cd ${startdir}/src
  mv index.php* ./${pkgname}-${pkgver}.tar.gz
  tar xzf ${pkgname}-${pkgver}.tar.gz 
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
