# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>
# Contributor: lydgate

pkgname=mlocate
pkgver=0.18
pkgrel=2
pkgdesc="Faster merging drop-in for slocate"
arch=(i686 x86_64)
url="http://carolina.mff.cuni.cz/~trmac/blog/mlocate"
license=("GPL")
conflicts=('slocate')
provides=('slocate')
replaces=('slocate')
depends=('glibc')
backup=('etc/updatedb.conf')
install=mlocate.install
source=(http://people.redhat.com/mitr/mlocate/mlocate-$pkgver.tar.bz2 \
	updatedb.conf updatedb.cron.daily)
md5sums=('c4352d10b47e569297caedd2c2d22675' '0b12d7a78c8fcbd5fea7f3c9dc55c1bd'\
         'eee7f9db8c6145724313af6fd5fe9d66')

build() {
  cd "$startdir"/src/$pkgname-$pkgver

  # Build!
  sed -i '/^groupname /s/mlocate/locate/' Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib
  make || return 1

  # Set up a default updatedb.conf and a daily cronjob
  install -v -D -m644 ../updatedb.conf "$startdir"/pkg/etc/updatedb.conf
  install -v -D -m744 ../updatedb.cron.daily "$startdir"/pkg/etc/cron.daily/updatedb

  # Install Mlocate
  make DESTDIR="$startdir"/pkg install

  cd "$startdir"/pkg
  ln -sv locate usr/bin/slocate
  chgrp -v 21 usr/bin/locate
  chmod -v 2755 usr/bin/locate

  mkdir -pv var/lib
  install -d -m750 -g21 var/lib/locate
}
