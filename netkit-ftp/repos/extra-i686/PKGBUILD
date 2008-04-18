# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
#Contributor: dorphell <dorphell@archlinux.org>

pkgname=netkit-ftp
pkgver=0.17
pkgrel=5
pkgdesc="Commandline ftp client"
arch=('i686' 'x86_64')
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/"
license=('BSD')
depends=('ncurses' 'readline')
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${pkgname}-${pkgver}.tar.gz LICENSE)
md5sums=('94441610c9b86ef45c4c6ec609444060' '55ab9bfe93bc63699857622ec2960557')
sha1sums=('815541a33bf02a43b5b41194389b8435e7890935'
          'ab9c93ba8b1b02ee5b3b321d780d8010019980ef')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  mkdir -p ${startdir}/pkg/usr/{bin,share/man/man1,share/man/man5}
  make INSTALLROOT=${startdir}/pkg MANDIR=/usr/share/man install
  rm -f ${startdir}/pkg/usr/share/man/man1/pftp.1 ${startdir}/pkg/usr/bin/pftp
  install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
