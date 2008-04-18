# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=gawk
pkgver=3.1.6
pkgrel=2
pkgdesc="Gnu version of awk"
arch=(i686 x86_64)
url="http://www.gnu.org/directory/GNU/gawk.html"
license=('GPL')
groups=('base')
provides=('awk')
replaces=('mawk')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('bash' 'glibc')
md5sums=('b237751aef53c9ead9644e376bc53386')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/usr/libexec $startdir/pkg/usr/lib
  mkdir $startdir/pkg/bin
  mv $startdir/pkg/usr/bin/gawk* $startdir/pkg/bin/
  mv $startdir/pkg/usr/bin/awk $startdir/pkg/bin/
  # don't use hardlinks to manpages, it messes up our compression stuff
  rm $startdir/pkg/usr/share/man/man1/pgawk.1
  ln -s gawk.1 $startdir/pkg/usr/share/man/man1/pgawk.1
  ln -s gawk.1 $startdir/pkg/usr/share/man/man1/awk.1
}
