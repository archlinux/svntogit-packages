# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-de
pkgver=20051111
pkgrel=3
pkgdesc="OpenOffice german spellchecker files"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/de_DE-pack.zip spell.de)
install=dictionary.install
md5sums=('7ab494ee1b627b37d0946a78d1fa0af8'
         'f792a73ae3c1bfbeec26c2065a21ca01')

build() {
 cd $startdir/src
 # unzip the dictionaries
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt thes2.txt
 rm *.zip
 
 # clean files that no conflicts will arise with openoffice-base package
 rm README_de_AT.txt
 rm README_de_CH.txt
 rm README_de_DE.txt
 rm README_hyph_de_DE.txt
 rm de_AT.aff
 rm de_AT.dic
 rm de_CH.aff
 rm de_CH.dic
 rm de_DE.aff
 rm de_DE.dic
 rm README_th_de_DE_v2.txt
 rm th_de_DE_v2.dat
 rm th_de_DE_v2.idx

 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
