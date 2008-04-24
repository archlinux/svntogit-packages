# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=nip2
pkgver=7.14.1
pkgrel=2
pkgdesc="nip2 is a frontend to the vips image library"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.vips.ecs.soton.ac.uk/index.php"
depends=('vips>=7.14.1' 'gtk2' 'gsl' 'imagemagick>=6.4.0.2' 'shared-mime-info' 'desktop-file-utils')
makedepends=('perlxml' 'gnome-doc-utils>=0.11.2')
install=$pkgname.install
source=("http://www.vips.ecs.soton.ac.uk/supported/${pkgver%.*}/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/share/mime/{mimeinfo.cache,mime.cache,XMLnamespaces,aliases,globs,magic,subclasses}
  rm -f $startdir/pkg/usr/share/applications/mimeinfo.cache
}


md5sums=('b2ea46b0e72eea5f7c79b7e9e0ee6b0d')
