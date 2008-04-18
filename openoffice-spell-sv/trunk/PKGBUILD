# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-sv
pkgver=20040425
pkgrel=3
pkgdesc="OpenOffice swedish spellchecker files"
arch=(i686 x86_64)
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/sv_SE-pack.zip spell.sv)
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
md5sums=('b5d5332fa6633376a0425e97aa5e9fd3' '2a9814110016b9b486a97745aa855884')
