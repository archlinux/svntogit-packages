# $Id$
# Maintainer: Tom Killian <tom@arclinux.org>

pkgname=openswan
pkgver=2.4.11
pkgrel=1
pkgdesc="Open Source implementation of IPsec for the Linux operating system"
url="http://www.openswan.org"
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('iproute' 'gmp' 'perl')
backup=(etc/ipsec.conf etc/ipsec.d/examples/no_oe.conf \
        etc/ipsec.d/policies/{block,clear,clear-or-private,private,private-or-clear})
source=(http://www.openswan.org/download/openswan-$pkgver.tar.gz \
	openswan.rc.d)

build() {
  # Create /etc/rc.d for init script, and license directory
  mkdir -p $startdir/pkg/{etc/rc.d,usr/share/licenses/openswan}

  cd $startdir/src/openswan-$pkgver

  # Change install paths to Arch defaults
  sed -i 's|/usr/local|/usr|;s|libexec/ipsec|lib/openswan|' Makefile.inc

  make programs || return 1
  make DESTDIR=$startdir/pkg install

  # Remove SysV rc*.d directories
  rm -r $startdir/pkg/etc/rc[0-6].d

  # Change permissions in /var
  chmod 755 $startdir/pkg/var/run/pluto
  
  # Copy License
  cp LICENSE $startdir/pkg/usr/share/licenses/openswan
  
  # Install init script
  install -Dm755 ../openswan.rc.d $startdir/pkg/etc/rc.d/openswan
}
md5sums=('6cac660e0beb6db101bac5b86c743aab'
         '543d84162761b9cc9ec319e938c4dd2a')
