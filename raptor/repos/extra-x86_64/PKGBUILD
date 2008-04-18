# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=raptor
pkgver=1.4.16
pkgrel=1
pkgdesc="A C library that parses RDF/XML/N-Triples into RDF triples"
arch=('i686' 'x86_64')
url="http://librdf.org/raptor"
depends=('libxml2' 'curl>=7.16.2' 'zlib' 'openssl>=0.9.8a' 'glib2>=2.10.0' 'bash' 'libxslt')
license=('LGPL')
options=('!libtool')
source=(http://librdf.org/dist/source/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('49c16262e0aed0197a3e60ade7bec205')
