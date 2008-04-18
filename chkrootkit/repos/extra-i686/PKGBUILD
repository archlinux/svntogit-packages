# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=chkrootkit
pkgver=0.48
pkgrel=1
pkgdesc="Locally checks for signs of a rootkit."
arch=(i686 x86_64)
url="http://www.chkrootkit.org"
depends=('bash')
license=('BSD')
source=(ftp://ftp.pangeia.com.br/pub/seg/pac/${pkgname}-${pkgver}.tar.gz)
md5sums=('de8b8b5013e7faa2b66c0e33c59677e8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  chown root:root *
  make sense || return 1
  find $startdir/src/$pkgname-$pkgver -perm /u+x -type f \
    -execdir install -D -m755 "{}" $startdir/pkg/usr/bin/"{}" ";"
}
