# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>
pkgname=ttf-cheapskate
pkgver=2.0
pkgrel=5
pkgdesc="TTFonts collection from dustimo.com"
arch=(i686 x86_64)
url="http://dustismo.com/"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
makedepends=(unzip)
install=ttf.install
source=(http://www.dustismo.com/fonts/Domestic_Manners.zip
        http://www.dustismo.com/fonts/PenguinAttack.tgz
        http://www.dustismo.com/fonts/Dustismo.tgz
        http://www.dustismo.com/fonts/El_Abogado_Loco.zip
        http://www.dustismo.com/fonts/Progenisis.zip
        http://www.dustismo.com/fonts/flatline.zip
        http://www.dustismo.com/fonts/MarkedFool.zip
        http://www.dustismo.com/fonts/Junkyard.zip
        http://www.dustismo.com/fonts/ItWasntMe.zip
        http://www.dustismo.com/fonts/balker.zip
        http://www.dustismo.com/fonts/Swift.zip
        http://www.dustismo.com/fonts/Wargames.zip
        http://www.dustismo.com/fonts/Winks.zip
        http://www.dustismo.com/fonts/Domestic_Manners.zip)
md5sums=('3f5d0178f3b9f9bbabd697090f89c3b9' 'c17ae1d47f8f90e676dda0855da07fe4'\
         'b4176e3c8c9083a0a8afe38e94d6c763' 'a76dcaff5af2d92668d7b2f20d44a644'\
         '57096a1974b4bf33cd1e9beb951e205b' '104c2d8783ec7689bdddc0683b9321fd'\
         'bf678fc9e281eeb57e62c2fb5223ce2c' '1285f1274ee1630b60946df8eb894ad9'\
         'f6f2e5b2aaa9f87dbce1b81d7808dcff' '6faef32e5a6372e2c31a6c16da6a14f5'\
         'b588d221c4925c463025d6a493fc814a' '6e2a2583f79b512579587b441a25694f'\
         'd0bb2c842b19a563287da590662e7f30' '3f5d0178f3b9f9bbabd697090f89c3b9')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/fonts/TTF
  install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF/
}
