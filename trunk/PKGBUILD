# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=deluge
pkgver=0.5.8.6
pkgrel=1
pkgdesc="Bittorrent client written in PyGTK"
arch=('i686' 'x86_64')
url="http://deluge-torrent.org/"
license=('GPL')
depends=('pygtk' 'boost' 'pyxdg' 'dbus-python' 'librsvg' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('intltool')
install=deluge.install
source=(http://download.deluge-torrent.org/source/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('77035e5656acdf457e66348392f7d94d')
options=('!emptydirs')

build() {
  cd $startdir/src/$pkgname-torrent-$pkgver
  python setup.py install --prefix=/usr --root=$startdir/pkg
  install -D -m644 pixmaps/deluge.svg $startdir/pkg/usr/share/pixmaps/deluge.svg
}
