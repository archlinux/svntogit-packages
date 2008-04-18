# $Id$
# Maintainer Tobias Powalowski <tpowa@archlinux.org>
# Contributor Vladimir Marteev <admin@archlinux.ru>
pkgname=openoffice-spell-ru
pkgver=20040425
pkgrel=3
pkgdesc="OpenOffice russian spellchecker files"
arch=(i686 x86_64)
url="http://www.openoffice.org"
depends=('openoffice-base')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/ru_RU-pack.zip spell.ru)
install=dictionary.install
build() {
 cd $startdir/src
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt
 rm *.zip
 
 # clean files that no conflicts will arise with openoffice2 package
 rm hyph_ru_RU.dic
 
 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
md5sums=('3dcd23c1617932ba9df5bd47a3cf34ba')
