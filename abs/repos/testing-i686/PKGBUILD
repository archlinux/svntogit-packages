# $Id: PKGBUILD,v 1.3 2008/01/08 01:16:23 travis Exp $
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Travis Willard <travis@archlinux.org>	

pkgname=abs
pkgver=2.0
pkgrel=2
pkgdesc="Utilities to download and work with the Arch Build System (ABS)"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/git/?p=abs.git"
license=('GPL')
groups=('base-devel')
depends=('bash' 'rsync')
backup=(etc/abs/abs.conf)
source=(ftp://ftp.archlinux.org/other/abs/$pkgname-$pkgver.tar.gz)
md5sums=('d5a254606f401fa1b0136ad8b73a088f')

build() {
  cd $startdir/src/$pkgname

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # Add readme file, and make base /var/abs path
  install -dm0755 $startdir/pkg/var/abs/local/
  install -Dm0644 $startdir/src/abs/README $startdir/pkg/var/abs/README

  # change ABS tags for x86_64 to correct values
  if [ "$CARCH" = "x86_64" ]; then
    sed -i "s|i686|x86_64|g" $startdir/pkg/etc/abs/abs.conf
  fi
}

# vim: set ts=2 sw=2 noet:
