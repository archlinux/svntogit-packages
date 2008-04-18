# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sash
pkgver=3.7
pkgrel=3
pkgdesc="Stand-alone shell with many commands but does not require glibc"
arch=(i686 x86_64)
license=('custom')
install=${pkgname}.install
source=(http://www.canb.auug.org.au/~dbell/programs/${pkgname}-${pkgver}.tar.gz
sash-3.7-add_fs_inc.patch)
url="http://www.canb.auug.org.au/~dbell/"
md5sums=('ee7c7ed5aad76599974d016a6f201ef4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../sash-3.7-add_fs_inc.patch
  /usr/bin/make || return 1
  /bin/mkdir -p ${startdir}/pkg/usr/bin ${startdir}/pkg/usr/share/man/man1
  /usr/bin/make BINDIR=${startdir}/pkg/usr/bin MANDIR=${startdir}/pkg/usr/share/man/man1 install || return 1

  # Only license mentioned is in the *.c files.
  install -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  sed -n '1,\%^ \*/$% p' sash.c \
      >${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
# vim: ts=2 sw=2 et ft=sh
