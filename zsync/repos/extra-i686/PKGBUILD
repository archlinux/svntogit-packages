# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=zsync
pkgver=0.5
pkgrel=1
pkgdesc="zsync is a file transfer program able to connect to rsync servers"
arch=(i686 x86_64)
url="http://zsync.moria.org.uk/"
depends=('glibc')
license=('artistic')
#source=(http://belnet.dl.sourceforge.net/sourceforge/zsync/zsync-$pkgver.tar.gz)
source=("http://zsync.moria.org.uk/download/zsync-$pkgver.tar.bz2")

 build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr
   make || return 1
   make prefix=$startdir/pkg/usr install
 }

md5sums=('08beaf3fa95f16d8a2db2f7f3ea21196')
