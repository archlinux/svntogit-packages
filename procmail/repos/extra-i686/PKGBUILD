# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=procmail
pkgver=3.22
pkgrel=1
pkgdesc="Highly configurable auto mail processing."
depends=('glibc')
source=(http://www.procmail.org/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  yes n | make LOCKINGTEST="/tmp ." || return 1
  install -d -m755 $startdir/pkg/usr/bin
  install -d -m755 $startdir/pkg/usr/man
  install -d -m755 $startdir/pkg/usr/man/man1
  install -d -m755 $startdir/pkg/usr/man/man5
  install -D -m4755 src/procmail $startdir/pkg/usr/bin/procmail
  install -D -m755 src/formail $startdir/pkg/usr/bin/formail
  install -D -m755 src/lockfile $startdir/pkg/usr/bin/lockfile
  install -m644 man/*.1 $startdir/pkg/usr/man/man1
  install -m644 man/*.5 $startdir/pkg/usr/man/man5
}
