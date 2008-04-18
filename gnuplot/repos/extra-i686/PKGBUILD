# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gnuplot
pkgver=4.2.3
pkgrel=1
pkgdesc="Plotting package which outputs to X11, PostScript, PNG, GIF, and others"
arch=('i686' 'x86_64')
url="http://www.gnuplot.info"
license=('custom')
depends=('libpng' 'libx11' 'gd' 'wxgtk')
makedepends=('texinfo')
install=gnuplot.install
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('6b6d22662df5101b308c465a722c43ce')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man \
              --libexecdir=/usr/bin \
              --with-gihdir=/usr/share/gnuplot \
              --datadir=/usr/share \
              --with-readline=gnu
  make pkglibexecdir=/usr/bin || return 1
  make prefix=$startdir/pkg/usr libexecdir=$startdir/pkg/usr/bin \
       mandir=$startdir/pkg/usr/share/man \
       pkglibexecdir=$startdir/pkg/usr/bin \
       GIHDIR=$startdir/pkg/usr/share/gnuplot \
       TEXMFLOCAL=$startdir/pkg/usr/share/texmf-dist \
       datadir=$startdir/pkg/usr/share install

  install -D -m644 lisp/dotemacs $startdir/pkg/usr/share/emacs/site-lisp/dotemacs
  install -D -m644 Copyright $startdir/pkg/usr/share/licenses/$pkgname/Copyright

  rm -f $startdir/pkg/usr/share/texmf-dist/ls-R

}


