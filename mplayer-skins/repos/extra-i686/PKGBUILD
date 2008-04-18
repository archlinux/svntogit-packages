# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mplayer-skins
pkgver=0.2
pkgrel=1
pkgdesc="Additional Skins for the MPlayer"
depends=('mplayer')
url="http://www.mplayerhq.hu/"

# if you want to see more skins in this list, feel free to contact me
#
# i will not add any xmms-lookalike skins, as you can use xmms itself
# as frontend by using xmms-mplayer plugin

source=(http://www1.mplayerhq.hu/MPlayer/skins/Blue-small-1.3.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/Abyss-1.1.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/disappearer-1.1.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/OSX-Brushed-2.3.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/tvisor-1.1.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/Ater-1.2.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/Corelian-1.1.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/mplayer_red-1.0.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/neutron-1.5.tar.bz2 \
        http://www1.mplayerhq.hu/MPlayer/skins/krystal-1.1.tar.bz2 \
        )

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/mplayer/skins
  mv $startdir/src/{Abyss,Blue-small,disappearer,OSX-Brushed,tvisor,Ater,Corelian,mplayer_red,neutron,krystal} $startdir/pkg/usr/share/mplayer/skins/
}

md5sums=('5d6597fa4b5d53ab981cdc68a9f45653' 'dfc8f52d1b5fd6625c90b89e884c924d'\
         '393d6bcd46fde0ece1b637099b815b52' '7707a3e5342863bb9edbab49ddd02f52'\
         'e17a63ba81e6ce56d8c6ad7c1971a8c3' '3a15aed3dda867f5f50779768b77ed2c'\
         '521215258065bf87a8114f673df49e7c' 'b0fc80c45bd79cb6f46291a9cd7be368'\
         'a56e37c017eca456c94f6e8976550b2f' 'ebb9356cbc10e002bf65bc2955abd9f2')
