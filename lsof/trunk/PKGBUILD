# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=lsof
pkgver=4.78
pkgrel=1
pkgdesc="lsof (LiSt Open Files) lists information about files that are open by the running processes"
arch=(i686 x86_64)
license=(custom)
depends=('glibc')
url="ftp://vic.cc.purdue.edu/pub/tools/unix/lsof/"
source=(ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/${pkgname}_$pkgver.tar.bz2 \
        license.txt)
md5sums=('00360ce2b62de3015fa7e0f8f92179a8' '1b63c76bd10437cabf890508c8e58d36')

build() {
   cd $startdir/src/${pkgname}_${pkgver}
   tar xf ${pkgname}_${pkgver}_src.tar
   cd ${pkgname}_${pkgver}_src
   sed "s|/\* #define\tHASSECURITY\t1 \*/|#define\tHASSECURITY\t1|" -i dialects/linux/machine.h

   ./Configure -n linux
   make || return 1
   install -D -m0755 -o root -g root lsof $startdir/pkg/usr/sbin/lsof
   install -D -m0644 -o root -g root lsof.8 $startdir/pkg/usr/man/man8/lsof.8
   
   install -D -m0644 -o root -g root $startdir/src/license.txt \
        $startdir/pkg/usr/share/licenses/lsof/license.txt
}
