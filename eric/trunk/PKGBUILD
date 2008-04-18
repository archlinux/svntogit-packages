# $Id: PKGBUILD,v 1.28 2008/03/03 02:26:11 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: riai <riai@bigfoot.com>, Ben <ben@benmazer.net>

pkgname=eric
pkgver=4.1.2
pkgrel=1
pkgdesc="A full-featured Python IDE that is written in PyQt4 using the QScintilla2 editor widget"
arch=('i686' 'x86_64')
url="http://www.die-offenbachs.de/eric/index.html"
license=('GPL2')
depends=('python-qscintilla')
conflicts=('eric4')
replaces=('eric4')
install=eric.install
source=(http://downloads.sourceforge.net/sourceforge/eric-ide/eric4-${pkgver}.tar.gz eric.desktop)
md5sums=('aefed64d39ac8f6e2f9a20866b42eee7' '77c494bb839c5744869d34355ea69095')
sha1sums=('44f7328442606ed56e16a811336577e2f7ebdf5f' '7529658c06e6c5c9ab587f0d18a2eafd42b87fee')

build() {
  cd ${startdir}/src/eric4-${pkgver}

  python install.py -c -b /usr/bin -d /usr/lib/python2.5/site-packages -i ${startdir}/pkg || return 1

  install -D -m644 ../eric.desktop ${startdir}/pkg/usr/share/applications/eric.desktop
  install -D -m644 eric/icons/default/eric.png ${startdir}/pkg/usr/share/pixmaps/eric.png

# Creating version independant symlinks
  ln -s /usr/bin/eric4 ${startdir}/pkg/usr/bin/eric
  ln -s /usr/bin/eric4-api ${startdir}/pkg/usr/bin/eric-api
  ln -s /usr/bin/eric4-compare ${startdir}/pkg/usr/bin/eric-compare
  ln -s /usr/bin/eric4-configure ${startdir}/pkg/usr/bin/eric-configure
  ln -s /usr/bin/eric4-diff ${startdir}/pkg/usr/bin/eric-diff
  ln -s /usr/bin/eric4-doc ${startdir}/pkg/usr/bin/eric-doc
  ln -s /usr/bin/eric4-helpviewer ${startdir}/pkg/usr/bin/eric-helpviewer
  ln -s /usr/bin/eric4-qregexp ${startdir}/pkg/usr/bin/eric-qregexp
  ln -s /usr/bin/eric4-re ${startdir}/pkg/usr/bin/eric-re
  ln -s /usr/bin/eric4-tray ${startdir}/pkg/usr/bin/eric-tray
  ln -s /usr/bin/eric4-trpreviewer ${startdir}/pkg/usr/bin/eric-trpreviewer
  ln -s /usr/bin/eric4-uipreviewer ${startdir}/pkg/usr/bin/eric-uipreviewer
  ln -s /usr/bin/eric4-unittest ${startdir}/pkg/usr/bin/eric-unittest
}
