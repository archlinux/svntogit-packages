# $Id$
# Contributor: Ben <ben@benmazer.net>
# Maintainer: damir <damir@archlinux.org>

pkgname=j
pkgver=0.21.0
pkgrel=1
pkgdesc="Text editor written in java"
url="http://www.armedbear.org"
depends=('j2sdk' 'bash' 'clisp')

source=(http://belnet.dl.sourceforge.net/sourceforge/armedbear-j/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-jdk=/opt/java/
  make || return 1
  make  prefix=$startdir/pkg/usr \
        exec_prefix=$startdir/pkg/usr \
        datadir=$startdir/pkg/usr/share \
        libdir=$startdir/pkg/usr/lib \
        install
}
