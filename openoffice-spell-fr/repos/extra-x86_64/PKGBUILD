# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-fr
pkgver=20050609
pkgrel=3
pkgdesc="OpenOffice french spellchecker files"
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/fr_FR-pack.zip spell.fr)
install=dictionary.install
md5sums=('e0d3eb94d782cbfce644a2d2eb845a59' '527c8edf7c93536dc5e4fc72d1172309')

build() {
 cd $startdir/src
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt thes2.txt
 rm *.zip
 
 # clean files that no conflicts will arise with openoffice-base package

 
 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
