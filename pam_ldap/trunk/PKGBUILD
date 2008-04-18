# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Comete <la_comete@tiscali.fr>
pkgname=pam_ldap
pkgver=184
pkgrel=1
pkgdesc="The pam_ldap module provides the means for Solaris and Linux workstations to authenticate against LDAP directories, and to change their passwords in the directory."
arch=(i686 x86_64)
url="http://www.padl.com/OSS/pam_ldap.html"
license=('LGPL')
depends=(libldap pam)
conflicts=()
replaces=()
backup=("etc/$pkgname.conf")
install=
source=(http://www.padl.com/download/$pkgname-$pkgver.tar.gz)
md5sums=('01bf1ad8576f0d1b58d9eddc68987a47')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure \
         --libdir=/lib \
         --with-ldap-conf-file=/etc/$pkgname.conf
  make || return 1
  mkdir -p $startdir/pkg/lib
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/etc/ldap.conf $startdir/pkg/etc/$pkgname.conf
  mkdir $startdir/pkg/usr
  mv $startdir/pkg/man $startdir/pkg/usr
}
