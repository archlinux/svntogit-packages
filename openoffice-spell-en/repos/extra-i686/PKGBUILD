# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-en
pkgver=20060411
pkgrel=3
pkgdesc="OpenOffice english spellchecker files"
arch=(i686 x86_64)
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/en_EN-pack.zip $mirror/thes_en_US_v2.zip spell.en)
md5sums=('ff2884fa2cef6b96a8ffeefaf48d11fd' 'ec611ad21ae4ee2b4415e27e252e4952'\
         '77e7918fa3bc35ff44d83858a205e5ee')
install=dictionary.install

build() {
 cd $startdir/src
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt thes.txt
 rm *.zip
 
 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
