# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-pt
pkgver=20040425
pkgrel=4
pkgdesc="OpenOffice portuguese spellchecker files"
arch=(i686 x86_64)
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/pt_PT-pack.zip spell.pt)
install=dictionary.install
md5sums=('e13173c67d3365d3f772bf81bc02ee24' '1a6d5edeae12ab5112844f0050a04623')

build() {
 cd $startdir/src
 # unzip the dictionaries
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt
 rm *.zip
 
 # clean files that no conflicts will arise with openoffice2 package
 
 
 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}

