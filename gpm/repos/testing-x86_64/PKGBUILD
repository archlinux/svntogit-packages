# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gpm
pkgver=1.20.3
pkgrel=1
pkgdesc="A mouse server for the console and xterm"
arch=('i686' 'x86_64')
url="http://unix.schottelius.org/gpm/"
license=('GPL')
depends=('ncurses')
backup=(etc/conf.d/gpm)
options=('!makeflags')
source=(http://unix.schottelius.org/gpm/archives/${pkgname}-${pkgver}.tar.bz2 \
        gpm gpm.conf.d)
md5sums=('dd6054c488fc36fec327acc5b1f3e7d6' 'c4d42a4725503a5524cae060a959a3d3'\
         '5f109341a7d1bb18c59d7c3a395d848a')
sha1sums=('352e1b40702ef5e8c088d61d70dd62fb24a6732e'
          'c13ad1422d24af320e2abb9786c7eacef39b293c'
          '3bcb67027f0ad7dc393388fb02c261126671f9f5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
# cleaning source directory
  rm src/prog/open_console.o

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m755 ../gpm ${startdir}/pkg/etc/rc.d/gpm
  install -D -m644 ../gpm.conf.d ${startdir}/pkg/etc/conf.d/gpm

# library fixes
  cd ${startdir}/pkg/usr/lib/
  ln -s libgpm.so.* libgpm.so.1
  chmod 755 ${startdir}/pkg/usr/lib/libgpm.so.*
}
