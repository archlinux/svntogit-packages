# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=daemontools
pkgver=0.76
pkgrel=4
pkgdesc="A collection of tools for managing UNIX services."
depends=('glibc' 'bash')
backup=(etc/inittab)
url="http://cr.yp.to/daemontools.html"
source=(http://cr.yp.to/$pkgname/$pkgname-$pkgver.tar.gz \
        $pkgname-$pkgver-errno.patch $pkgname-$pkgver-head-1.patch)
install="$pkgname.install"
md5sums=('1871af2453d6e464034968a0fbcb2bfc' \
         'c75438b1c3b9d9f67691bd10cf3c8e52' \
         '6ce7442b288dd69b4e456d00690a8344')

build() {
  cd $startdir/src/admin/$pkgname-$pkgver/src
  for PATCH in errno head-1; do 
    /usr/bin/patch -p1 < $startdir/$pkgname-$pkgver-$PATCH.patch
  done
  /bin/echo "gcc ${CFLAGS}" > conf-cc
  /bin/echo "/usr" > home
  /usr/bin/make || return 1
  for BIN in `cat ../package/commands`; do
    /bin/install -D -m755 $BIN $startdir/pkg/usr/bin/$BIN
  done
  /bin/mkdir -p $startdir/pkg/service 
}
# vim: ts=2 sw=2 et ft=sh
