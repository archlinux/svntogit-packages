# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>
pkgname=wavpack
pkgver=4.41.0
pkgrel=3
pkgdesc="A completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('custom')
depends=('glibc')
options=('!libtool')
source=(http://www.wavpack.com/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6a13edeae437498db78fe528d9e95144')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-mmx --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
  rm -f ${startdir}/pkg/usr/lib/*.a
}
