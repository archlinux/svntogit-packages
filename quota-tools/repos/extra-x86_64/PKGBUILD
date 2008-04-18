# $Id$
# Maintainer: Judd <judd@archlinux.org>
pkgname=quota-tools
pkgver=3.15
pkgrel=1
pkgdesc="Tools to manage kernel-level quotas in Linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/linuxquota/"
license=('GPL' 'BSD')
depends=('e2fsprogs')
backup=('etc/warnquota.conf' 'etc/quotatab' 'etc/quotagrpadmins')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/linuxquota/quota-$pkgver.tar.gz LICENSE)
md5sums=('5a1c2f5e669aba825e0126d2f30ee622' 'dd792440e684043e4e4ef80963d0237b')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make ROOTDIR=$startdir/pkg install || return 1
  install -D -m644 ../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

  # remove conflicts
  # glibc
  rm $startdir/pkg/usr/include/rpcsvc/rquota.h || return 1
  rm $startdir/pkg/usr/include/rpcsvc/rquota.x || return 1
  # man-pages
  rm $startdir/pkg/usr/share/man/man2/quotactl.2 || return 1
  rm $startdir/pkg/usr/share/man/man8/rquotad.8 || return 1 
  # nfs-utils
  rm $startdir/pkg/usr/sbin/rpc.rquotad || return 1

}
