# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce4-session
pkgver=4.4.2
pkgrel=1
pkgdesc="A session manager for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.2' 'libxfce4mcs>=4.4.2' 'bash')
makedepends=('xfce-mcs-manager>=4.4.2' 'pkgconfig')
replaces=('xfce4-toys')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2 \
        ftp://archlinux.org/other/xfce4-graphics/ArchLinux-xfce4-balou.tar.gz)
md5sums=('4c3d1acb8ce37ea4dd55d82aeb38e9e7' 'c5daea785ed798147eae2fb443dfe452')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static \
    --enable-legacy-sm --disable-gnome --enable-session-screenshots \
    --with-shutdown-style=auto
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/themes
  cp -r ../ArchLinux ${startdir}/pkg/usr/share/themes
  # FIXME: remove some leftover files from artwork package
  rm -rf ${startdir}/pkg/usr/share/themes/ArchLinux/balou/.thumbnails
}
