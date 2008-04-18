# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=davfs2
pkgver=1.3.0
pkgrel=1
pkgdesc="File system driver that allows you to mount a WebDAV server as a local disk drive."
arch=(i686 x86_64)
url="http://dav.sourceforge.net"
license="GPL"
depends=('neon>=0.27.2')
backup=(etc/davfs2/davfs2.conf etc/davfs2/secrets)
install=davfs2.install
source=(http://mesh.dl.sourceforge.net/sourceforge/dav/$pkgname-$pkgver.tar.gz
        davfs2-buildsystem.patch)
md5sums=('944613c18338630399099601f00fa633'
         'e4ac935855de9b99f06c6c3fc5d8efd5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i $startdir/src/davfs2-buildsystem.patch || return 1
  dav_user=nobody dav_group=network ./configure --prefix=/usr --sysconfdir=/etc --disable-debug
  make || return 1
  # Create some dirs
  install -d -m755 $startdir/pkg/sbin
  make DESTDIR=$startdir/pkg install || return 1

  rm -f $startdir/pkg/usr/share/davfs2/{BUGS,COPYING,FAQ,NEWS,TODO,ChangeLog,GPL,README,THANKS}
}
