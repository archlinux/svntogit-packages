# $Id: PKGBUILD,v 1.3 2008/03/03 02:29:59 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=eric-plugins
pkgver=4.1.2
_plugin1ver=4.1.1
_plugin2ver=4.1.2
_plugin3ver=4.1.1
_plugin4ver=1.0.2
_plugin5ver=4.1.2
_plugin6ver=4.1.2
pkgrel=1
pkgdesc="Plugins for the eric Python IDE"
arch=('i686' 'x86_64')
url="http://www.die-offenbachs.de/eric/index.html"
license=('GPL2')
depends=('eric')
makedepends=('unzip')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Checker_PyLint-${_plugin1ver}.tar.gz \
        http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Packager_CxFreeze-${_plugin2ver}.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Refactoring_BRM-${_plugin3ver}.tar.gz \
 	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Refactoring_Rope-${_plugin4ver}.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Tools_CharTables-${_plugin5ver}.tar.gz \
  	http://downloads.sourceforge.net/sourceforge/eric-ide/Plugin_Vcs_CVS-${_plugin6ver}.tar.gz)
md5sums=('bbefc943dee01fb7bd0dd7baee82dbe3' 'b507d067975cbcf37b2313b226f943c3'\
         '1fba0d9fefa47a784b2d8b99c42a1946' '3e42970137732b1e83c230139e94d3cd'\
         '33425f7f2df59addb9d84cfba19bd920' 'bcd691a0e351cfa16fe8ca76d52c69f6')
sha1sums=('0eb68e0128c9e6f229469fd955701a6c3d8643fe'
          '735b02bb793a2c1d653ff1ec5e70a6d47523837c'
          'd2e17d2295020bf1ae862d3b9784e38e859299dc'
          '0f1bfd9d7262a729a1e2279c57ba34fe431d97c8'
          'd477dd0da276c73eb0c79bbfb75e71f7b931dc0b'
          'd6947731de05a260dae3655bc27e53ab19c1046f')

build() {
  cd ${startdir}/src
  install -d  ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins
  unzip -o Plugin_Checker_PyLint-${_plugin1ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  unzip -o Plugin_Packager_CxFreeze-${_plugin2ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  unzip -o Plugin_Refactoring_BRM-${_plugin3ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  unzip -o Plugin_Refactoring_Rope-${_plugin4ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  unzip -o Plugin_Tools_CharTables-${_plugin5ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  unzip -o Plugin_Vcs_CVS-${_plugin6ver}/*.zip -d ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins || return 1
  rm -r ${startdir}/pkg/usr/lib/python2.5/site-packages/eric4plugins/{VERSION,*/Documentation}
  find ${startdir}/pkg -type d -exec chmod 755 {} \;
}
