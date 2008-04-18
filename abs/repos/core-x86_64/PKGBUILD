# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Travis Willard <travis@archlinux.org>	

pkgname=abs
pkgver=2.0
pkgrel=3
pkgdesc="Utilities to download and work with the Arch Build System (ABS)"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/git/?p=abs.git"
license=('GPL')
depends=('bash' 'rsync')
groups=('base-devel')
backup=(etc/abs.conf)
install=abs.install
source=(ftp://ftp.archlinux.org/other/abs/$pkgname-$pkgver.tar.gz)
md5sums=('559049b56b7de70f4824c20785835194')

build() {
  cd $startdir/src/$pkgname

  make CONFDIR=/etc/ || return 1
  make CONFDIR=/etc/ DESTDIR=$startdir/pkg install || return 1

  # Add readme file, and make base /var/abs path
  install -dm0755 $startdir/pkg/var/abs/local/
  install -Dm0644 $startdir/src/abs/README $startdir/pkg/var/abs/README

  # change ABS tags for x86_64 to correct values
  if [ "$CARCH" = "x86_64" ]; then
    sed -i "s|i686|x86_64|g" $startdir/pkg/etc/abs.conf
  fi
}

# vim: set ts=2 sw=2 noet:
