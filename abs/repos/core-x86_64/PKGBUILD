# $Id: PKGBUILD,v 1.3 2008/01/08 01:16:23 travis Exp $
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Travis Willard <travis@archlinux.org>	

pkgname=abs
pkgver=1.0
pkgrel=1
pkgdesc="Utilities to download and work with the Arch Build System (ABS)"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/git/?p=abs.git"
license=('GPL')
groups=('base-devel')
depends=('bash' 'csup')
backup=(etc/abs/abs.conf 
				etc/abs/supfile.{core,extra,community,testing,unstable} )
source=(ftp://ftp.archlinux.org/other/abs/$pkgname-$pkgver.tar.gz)
md5sums=('7867aad8f8876c4119fa508a473bcdc9')

build() {
  cd $startdir/src/$pkgname
  
  make DESTDIR=$startdir/pkg install || return 1

	# Add readme file, and make base /var/abs path
	mkdir -p /var/abs
	install -Dm0644 $startdir/src/abs/README $startdir/pkg/var/abs/README

  # change ABS tags for x86_64 to correct values
  if [ "$CARCH" = "x86_64" ]; then
    sed -i "s|CURRENT|CURRENT-64|g" \
        $startdir/pkg/etc/abs/supfile.{core,extra,community,unstable}
    sed -i "s|TESTING|TESTING-64|g" $startdir/pkg/etc/abs/supfile.testing
  fi
}

# vim: set ts=2 sw=2 noet:
