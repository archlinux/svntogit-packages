# $Id$
# Maintainer: damir <damir.archlinux.org>

pkgname=muparser
pkgver=1.28
origver=128
pkgrel=1
pkgdesc="a fast math parser library"
arch=(i686 x86_64)
url="http://muparser.sourceforge.net/"
depends=('glibc' 'gcc-libs')
license=('custom')
source=(http://heanet.dl.sourceforge.net/sourceforge/muparser/muparser_v$origver.tar.gz)


build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  sed -i 's|$(libdir)/pkgconfig|$(DESTDIR)$(libdir)/pkgconfig|g' Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install

  # license
  install -D -m644 License.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/License
}
md5sums=('451a322db29d7fed159f4287e8b8e00d')
