# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=emovix-codecs
pkgver=0.9.0rc1
pkgrel=1
pkgdesc="extra codecs for emovix"
source=(http://www1.mplayerhq.hu/MPlayer/releases/codecs/rp9codecs-20050115.tar.bz2 \
	http://www1.mplayerhq.hu/MPlayer/releases/codecs/rp9codecs-win32-20050115.tar.bz2 \
	http://www1.mplayerhq.hu/MPlayer/releases/codecs/xanimdlls-20040626.tar.bz2 \
	http://www1.mplayerhq.hu/MPlayer/releases/codecs/win32codecs-20040703.tar.bz2 \
	http://www1.mplayerhq.hu/MPlayer/releases/codecs/qt65dlls-20040704.tar.bz2)
url="http://movix.sourceforge.net/"
depends=('emovix')


build()        {
        cd $startdir/src/
        for i in *.tar.bz2
        do install -D -m644 $i $startdir/pkg/usr/share/emovix/codecs/$i
        done
}
md5sums=('a32f4fa1f77593536a57e4b662fde7aa' '6b56c1c127f5ac0c4c8a9878f24477ca'\
         'a7c980a1a94fbac6ebd34c7485a1891d' '90ba6a76ded2f9fd9f865024bd8de3d3'\
         '9fb88417aef157e2f1f5b7be57eaed7b')
