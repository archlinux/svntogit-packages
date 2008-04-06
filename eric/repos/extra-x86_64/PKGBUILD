# $Id: PKGBUILD,v 1.28 2008/03/03 02:26:11 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: riai <riai@bigfoot.com>, Ben <ben@benmazer.net>

pkgname=eric
pkgver=4.1.1
pkgrel=1
pkgdesc="A full-featured Python IDE that is written in PyQt4 using the QScintilla2 editor widget"
arch=('i686' 'x86_64')
url="http://www.die-offenbachs.de/eric/index.html"
license=('GPL2')
depends=('python-qscintilla')
conflicts=('eric4')
replaces=('eric4')
install=eric.install
source=(http://downloads.sourceforge.net/sourceforge/eric-ide/eric4-$pkgver.tar.gz)
md5sums=('361c01fe5039cf399487df1e0d9fffe5')
sha1sums=('fe97f9150b2ba83ad40f3843b39684ba46e58157')

build() {
  cd $startdir/src/eric4-$pkgver
  sed -i "s|pdir = os.path.join(cfg\['mdir'\], \"eric4plugins\")|pdir = \"/usr/lib/python2.5/site-packages/eric4plugins\"|"  install.py || return 1

  python install.py -c -b /usr/bin -d /usr/lib/python2.5/site-packages -i $startdir/pkg || return 1

# Creating version independant symlinks
  ln -s /usr/bin/eric4 $startdir/pkg/usr/bin/eric
  ln -s /usr/bin/eric4-api $startdir/pkg/usr/bin/eric-api
  ln -s /usr/bin/eric4-compare $startdir/pkg/usr/bin/eric-compare
  ln -s /usr/bin/eric4-configure $startdir/pkg/usr/bin/eric-configure
  ln -s /usr/bin/eric4-diff $startdir/pkg/usr/bin/eric-diff
  ln -s /usr/bin/eric4-doc $startdir/pkg/usr/bin/eric-doc
  ln -s /usr/bin/eric4-helpviewer $startdir/pkg/usr/bin/eric-helpviewer
  ln -s /usr/bin/eric4-qregexp $startdir/pkg/usr/bin/eric-qregexp
  ln -s /usr/bin/eric4-re $startdir/pkg/usr/bin/eric-re
  ln -s /usr/bin/eric4-tray $startdir/pkg/usr/bin/eric-tray
  ln -s /usr/bin/eric4-trpreviewer $startdir/pkg/usr/bin/eric-trpreviewer
  ln -s /usr/bin/eric4-uipreviewer $startdir/pkg/usr/bin/eric-uipreviewer
  ln -s /usr/bin/eric4-unittest $startdir/pkg/usr/bin/eric-unittest
}
