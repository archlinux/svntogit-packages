# $Id$
# Maintainer: simo <simo@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xdelta
pkgver=1.1.4
pkgrel=1
pkgdesc="Used to identify differences between files similar to rsync"
arch=(i686 x86_64)
depends=('glib' 'zlib')
source=("http://xdelta.googlecode.com/files/$pkgname-$pkgver.tar.gz")
url="http://sourceforge.net/projects/xdelta/"
md5sums=('1b896c01ebf0e353b7e3c3071b05f496')

build() {
  cd $startdir/src/$pkgname-$pkgver

   #Arch64 fix
if [ "$CARCH" == "x86_64" ]; then
  rm config.guess config.sub
  ln -s /usr/share/libtool/config.guess config.guess
  ln -s /usr/share/libtool/config.sub config.sub
fi
  
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
