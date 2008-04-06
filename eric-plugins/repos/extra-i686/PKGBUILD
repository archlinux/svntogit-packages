# $Id: PKGBUILD,v 1.3 2008/03/03 02:29:59 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=eric-plugins
pkgver=4.1.1
pkgrel=2
pkgdesc="Plugins for the eric  Python IDE"
arch=('i686' 'x86_64')
url="http://www.die-offenbachs.de/eric/index.html"
license=('GPL2')
depends=('eric')
makedepends=('unzip')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Checker_PyLint-$pkgver.tar.gz \
        http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Packager_CxFreeze-$pkgver.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Refactoring_BRM-$pkgver.tar.gz \
 	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Refactoring_Rope-1.0.0.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Tools_CharTables-4.1.2.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Vcs_CVS-$pkgver.tar.gz)
md5sums=('bbefc943dee01fb7bd0dd7baee82dbe3' '3f1652a646922fef124e4585583813ff'\
         '1fba0d9fefa47a784b2d8b99c42a1946' 'c425511060a1a91cad5444f02050c6b9'\
         '33425f7f2df59addb9d84cfba19bd920' '7851dad74971e5c945a0d9dc263beb91')
sha1sums=('0eb68e0128c9e6f229469fd955701a6c3d8643fe'
          'c662ae8142f7b21785e98cd31ad763541efd3c4e'
          'd2e17d2295020bf1ae862d3b9784e38e859299dc'
          '087bc8ab4beb10fd60549e93a4d199b1bdf12b79'
          'd477dd0da276c73eb0c79bbfb75e71f7b931dc0b'
          '912041b74339f970fe16e8f70ca71f8e754a6265')

build() {
  cd $startdir/src
  install -d  $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins

  for plugin in Checker_PyLint Packager_CxFreeze Refactoring_BRM Vcs_CVS ; do
    unzip Plugin_$plugin-$pkgver/*.zip -d $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
    rm -r $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins/{VERSION,*/Documentation}
  done

  unzip Plugin_Refactoring_Rope-1.0.0/*.zip -d $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  rm -r $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins/{VERSION,*/Documentation}

  unzip Plugin_Tools_CharTables-4.1.2/*.zip -d $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  rm -r $startdir/pkg/usr/lib/python2.5/site-packages/eric4plugins/{VERSION,*/Documentation}

  find $startdir/pkg -type d -exec chmod 755 {} \;
}
