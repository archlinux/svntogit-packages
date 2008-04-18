# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=a2ps
pkgver=4.13c
pkgrel=1
pkgdesc="a2ps is an Any to PostScript filter"
arch=(i686 x86_64)
license=('GPL')
depends=('ghostscript' 'psutils' 'imagemagick' 'perl')
options=('nolibtool')
replaces=('a2ps-lprng')
provides=('a2ps-lprng')
source=(http://www.archlinux.org/~jgc/${pkgname}/${pkgname}-${pkgver}.tar.gz
        http://www.archlinux.org/~jgc/${pkgname}/${pkgname}-4.13c-ja_nls.patch.gz
	4.13c-gcc34.patch
	a2ps-4.13-fixcachecheck.patch
	a2ps-4.13-manpage-chmod.patch
	a2ps-4.13-select-freebsd.patch
	a2ps-4.13c-fixps.patch
	a2ps-4.13c-psmandup.diff
	a2ps-4.13c-psset.patch
	a2ps-4.13c-stdarg.patch)
url="http://www.inf.enst.fr/~demaille/a2ps/"

build() {
  cd ${startdir}/src/${pkgname}-4.13
  patch -Np0 -i ${startdir}/src/a2ps-4.13-select-freebsd.patch || return 1
  patch -Np1 -i ${startdir}/src/a2ps-4.13c-stdarg.patch || return 1
  patch -Np1 -i ${startdir}/src/4.13c-gcc34.patch || return 1
  patch -Np1 -i ${startdir}/src/a2ps-4.13c-ja_nls.patch || return 1
  patch -Np0 -i ${startdir}/src/a2ps-4.13c-fixps.patch || return 1
  patch -Np0 -i ${startdir}/src/a2ps-4.13c-psmandup.diff || return 1
  patch -Np1 -i ${startdir}/src/a2ps-4.13c-psset.patch || return 1
  patch -Np1 -i ${startdir}/src/a2ps-4.13-fixcachecheck.patch || return 1
  patch -Np1 -i ${startdir}/src/a2ps-4.13-manpage-chmod.patch || return 1
  libtoolize --force --copy || return 1
  autoreconf -I m4 || return 1
  ./configure --prefix=/usr --sysconfdir=/etc/a2ps \
              --includedir=/usr/include --enable-nls
  export LANG=C
  make || return 1
  make DESTDIR=${startdir}/pkg install
  sed -i "s:^countdictstack: \0:" ${startdir}/pkg/usr/bin/psset || return 1
}
