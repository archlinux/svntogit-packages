# $Id$
#Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=bochs
pkgver=2.3.6
pkgrel=1
pkgdesc="A portable x86 PC emulation software package"
arch=(i686 x86_64)
license=('LGPL')
url="http://bochs.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
depends=('gcc-libs' 'libxpm')
md5sums=('5b666fb64d7ccf9baa0122ec15a3f4b9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-vbe --without-wx --enable-cpu-level=6 \
        --enable-4meg-pages --enable-global-pages --enable-pae --enable-fpu \
        --enable-mmx --enable-3dnow --enable-sse --enable-sep
  make || return 1
  make prefix=${startdir}/pkg/usr install
  install -D -m 644 .bochsrc ${startdir}/pkg/etc/bochsrc-sample.txt
}
