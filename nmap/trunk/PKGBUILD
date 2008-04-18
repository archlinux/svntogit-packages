# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=nmap
pkgver=4.60
pkgrel=1
pkgdesc="A network exploration tool and security/port scanner"
arch=(i686 x86_64)
url="http://nmap.org"
license=('custom:GPL')
depends=('pcre' 'openssl' 'libpcap>=0.9.8' 'lua')
# python is needed for zenmap
makedepends=('python')
options=('!makeflags')
source=(http://download.insecure.org/nmap/dist/$pkgname-$pkgver.tgz
        zenmap_pixmaps.patch)

build() {
  cd $startdir/src/$pkgname-$pkgver
  # patch so zenmap pixmaps are installed in a subdirectory
  patch -Np1 < ../zenmap_pixmaps.patch
  # super ugly- we have to move these in the source too
  mkdir zenmap/share/pixmaps/zenmap
  mv zenmap/share/pixmaps/{*.png,*.svg} zenmap/share/pixmaps/zenmap/

  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$startdir/pkg" install
  
  # remove zenmap uninstall script
  rm "$startdir/pkg/usr/bin/uninstall_zenmap"

  # install custom GPL2 license
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('084a1c7edded963d6082f8ca72ff8636'
         'ff5513b71f055cfb8094ef8bf4c74008')
