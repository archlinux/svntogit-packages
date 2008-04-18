# $Id$
# Maintainter: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=fasta
pkgver=35.2.3
pkgrel=1
pkgdesc="fasta: fast protein comparison or a fast nucleotide comparison"
arch=("i686" "x86_64")
license=("custom")
url="ftp://ftp.virginia.edu/pub/fasta"
depends=('glibc')
source=("ftp://ftp.virginia.edu/pub/fasta/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver

  mkdir -p $startdir/pkg/usr/bin

  make XDIR=$startdir/pkg/usr/bin -f Makefile.linux || return 1
  make XDIR=$startdir/pkg/usr/bin -f Makefile.linux install

  install -D -m644 COPYRIGHT ${startdir}/pkg/usr/share/licenses/$pkgname/COPYRIGHT
}

md5sums=('b7548aa930f8df764b3836caef92b886')
