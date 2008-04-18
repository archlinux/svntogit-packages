# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=sbackup
pkgver=0.10.4
pkgrel=2
pkgdesc="A simple backup solution intended for desktop use"
arch=('i686' 'x86_64')
url="http://sbackup.sourceforge.net"
license=('GPL')
depends=('gksu' 'gnome-python-extras')
backup=('etc/sbackup.conf')
source=(http://dl.sourceforge.net/$pkgname/${pkgname}_${pkgver}.tar.gz makefile.patch)
md5sums=('d93422c486cbbfcce82251828f688c74'
         'cdd036668cd917dbc9550bae6684f5ce')
sha1sums=('9c3b2aa8da6b0cd9f99176af628d49e5a5b3bb49'
          '33fdbc67433ff27ce5e5de6b8be11dcb6adcfdd4')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver

  patch -Np1 -i $startdir/src/makefile.patch
  sed -i -e "s/dpkg --get-selections/pacman -Q/" sbackupd.py
  sed -i -e "s/gksudo/gksu/" sbackup.desktop

  install -dm0755 $startdir/pkg/{usr/share/applications,etc}

  make PREFIX=/usr DESTDIR=$startdir/pkg install
}

