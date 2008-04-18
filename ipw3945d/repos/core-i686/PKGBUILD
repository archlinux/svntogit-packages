# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=ipw3945d
pkgver=1.7.22
pkgrel=4
pkgdesc="Regulatory daemon for IPW3945"
arch=(i686 x86_64)
url="http://www.bughost.org/ipw3945"
license=""
depends=('glibc')
install=ipw3945d.install
source=(http://www.bughost.org/ipw3945/daemon/$pkgname-$pkgver.tgz ipw3945d.rc)

build() {
  cd $startdir/src/$pkgname-$pkgver
  #Install daemon w/ Arch specific fix
  if [ "$CARCH" = "x86_64" ]; then
  install -D -m 755 x86_64/ipw3945d $startdir/pkg/sbin/ipw3945d
  else install -D -m 755 x86/ipw3945d $startdir/pkg/sbin/ipw3945d
  fi
  # Install license
  install -D -m 644 LICENSE.ipw3945d $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
  install -m755 -D $startdir/src/ipw3945d.rc $startdir/pkg/etc/rc.d/ipw3945d || return 
}

md5sums=('097888f5be05eb2b9b87dcdbeeb948ce' '72aafd7cba214592de6175974a48b4f9')
