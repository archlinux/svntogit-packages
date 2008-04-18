# $Id$
# Maintainer: Simo Leone <neotuli@gmail.com>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=python-feedparser
_pkgnameorig=feedparser
pkgver=4.1
pkgrel=1
pkgdesc="Parse RSS and Atom feeds in Python"
url="http://feedparser.sf.net"
license=""
depends=('python' 'libxml2' )
replaces=('feedparser')
source=("http://dl.sourceforge.net/feedparser/$_pkgnameorig-$pkgver.zip")
md5sums=('7ab1140c1e29d4cd52ab20fa7b1f8640')

build() {
  cd $startdir/src/$_pkgnameorig
  python setup.py build
  python setup.py install --root=$startdir/pkg
}
