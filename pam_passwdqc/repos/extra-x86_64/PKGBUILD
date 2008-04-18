# $Id$
# Maintainer: juergen <juergen@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=pam_passwdqc
pkgver=1.0.4
pkgrel=1
pkgdesc="A password strength checking module for PAM-aware password changing programs."
arch=(i686 x86_64)
url="http://www.openwall.com/passwdqc"
depends=('pam')
license=('BSD')
source=(http://www.openwall.com/pam/modules/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('44dcb7e94b75272fed3d9cedeaf0c45c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$startdir/pkg MANDIR=/usr/man install || return 1
}
# vim: ts=2 sw=2 et ft=sh
