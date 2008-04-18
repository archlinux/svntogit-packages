# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: phrakture

pkgname=acct
pkgver=6.3.2
pkgrel=1
pkgdesc="A set of utilities which reports and summarizes data about user connect times and process execution statistics"
url="http://www.gnu.org/software/acct/"
depends=('glibc')
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('da0055b254f7da8b8920db83ef1ebba1')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install

  # sysvinit already provides "last":
  rm $startdir/pkg/usr/{bin/last,man/man1/last.1}
}



