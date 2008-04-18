# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Fabio Scotoni <fabio@esse.ch>

pkgname=alpine
pkgver=1.10
pkgrel=1
pkgdesc="The Apache-licensed PINE (a tool for reading, sending, and managing electronic messages)"
arch=('i686' 'x86_64')
url="http://www.washington.edu/alpine/"
license=('APACHE')
depends=('libldap' 'heimdal' 'gettext')
provides=('pine')
conflicts=('pine')
replaces=('pine')
options=('!makeflags')
install=alpine.install
source=(ftp://ftp.cac.washington.edu/${pkgname}/${pkgname}.tar.bz2 \
        http://staff.washington.edu/chappa/alpine/patches/${pkgname}-${pkgver}/all.patch.gz)
md5sums=('c507684620766ed091186785a0dccbca' '41e354b6d02e358d3bb993086b4dee4a')
sha1sums=('fe8f83ad9f5b8e528ee61960877443d518af9eed' '3f791eccd60c2ac769eb6472477c0dcdb2d7b8ec')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -p1 < ../all.patch || return 1
  ./configure --prefix=/usr --without-passfile --without-tcl \
    --disable-shared --with-system-pinerc=/etc/alpine.d/pine.conf \
    --with-system-fixed-pinerc=/etc/alpine.d/pine.conf.fixed
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
