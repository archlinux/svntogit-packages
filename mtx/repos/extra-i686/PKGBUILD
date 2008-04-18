# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=mtx
pkgver=1.3.11
pkgrel=1
pkgdesc="Send robot commands to tape changer"
arch=('i686' 'x86_64')
url="http://mtx.opensource-sw.net/"
license=('GPL2')
depends=('glibc')
source=(http://downloads.sourceforge.net/mtx/${pkgname}-${pkgver}.tar.gz)
md5sums=('5aa464662450dac9a7e8bd9e136bb83a')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
sed -i 's/static const unsigned char scsi_command_size/const unsigned char scsi_command_size/' sg_err.c || return 1
  ./configure --prefix=/ 
  make || return 1
  make prefix=$startdir/pkg install
  mkdir $startdir/pkg/usr
  mv $startdir/pkg/man $startdir/pkg/usr
  mv $startdir/pkg/sbin $startdir/pkg/bin
}
