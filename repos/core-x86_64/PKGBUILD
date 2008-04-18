# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=ntfs-3g
pkgver=1.2310
pkgrel=1
pkgdesc="Third generation Linux NTFS driver"
arch=(i686 x86_64)
url="http://www.ntfs-3g.org"
license=('GPL')
#depends=('fuse')
depends=('glibc')
makedepends=('pkgconfig')
source=(http://www.ntfs-3g.org/${pkgname}-${pkgver}.tgz)
md5sums=('70579e20da7cb5c1649096c6bf6d1b73')
options=(!libtool)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ac_cv_path_LDCONFIG=/bin/true ./configure --prefix=/usr #--with-fuse=external
  make || return 1
  make DESTDIR=$startdir/pkg install
}
