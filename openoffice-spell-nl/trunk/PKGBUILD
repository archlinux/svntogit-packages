# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openoffice-spell-nl
pkgver=20050720
pkgrel=4
pkgdesc="OpenOffice dutch spellchecker files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.openoffice.org"
depends=('openoffice-base' 'ed')
mirror=(ftp://sunsite.informatik.rwth-aachen.de/pub/mirror/OpenOffice/contrib/dictionaries)
source=($mirror/nl_NL-pack.zip spell.nl)
md5sums=('fca0a67a4255a59254c3e5f53c481e8f'
         '7f480d1cdf3b0ad85828ec277541f139')

build() {
 cd $startdir/src
 for i in *.zip
 do
 unzip -o $i
 done
 rm spell.txt hyph.txt
 rm *.zip

 # install files
 mkdir -p $startdir/pkg/opt/openoffice/share/dict/ooo
 install -m 644 * $startdir/pkg/opt/openoffice/share/dict/ooo
}
