# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-es
pkgver=20061104
pkgrel=1
pkgdesc="OpenOffice spanish spellchecker files"
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/es_ES-pack.zip spell.es)
install=dictionary.install
build() {
 cd $startdir/src
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt
 rm *.zip
 
 # clean files that no conflicts will arise with openoffice-base package
 
 
 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
md5sums=('4b6a1d0f9ca7b88b3c2bceda5578c9a9' '2783cb53262cbea9f32a9a6bd95dcfdb')
