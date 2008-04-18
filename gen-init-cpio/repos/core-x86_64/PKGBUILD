# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=gen-init-cpio
pkgver=2.6.17
pkgrel=3
pkgdesc="Program to compress initramfs images"
arch=(i686 x86_64)
license=('custom:none')
groups=('base')
url="http://www.kernel.org/"
depends=('glibc')
source=(Makefile gen_init_cpio.c)
md5sums=('8e3a142a522d65121c3bead41013be98' 'fe53a05f5fcfca9e4dd8d67d29190f6e')

build()
{
  cd $startdir/src/
  make || return 1
  make DESTDIR=$startdir/pkg install
}
