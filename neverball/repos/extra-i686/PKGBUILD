# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgname=neverball
pkgver=1.4.0
pkgrel=4
pkgdesc="3D game similar to Super Monkey Ball or Marble Madness"
arch=('i686' 'x86_64')
url="http://icculus.org/neverball/"
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'libgl')
source=(http://icculus.org/$pkgname/$pkgname-$pkgver.tar.gz \
        neverball neverball.desktop neverball.png neverputt neverputt.desktop neverputt.png)
md5sums=('a6cd860f1c2b7d8cecbcfc05ff228ef0' '63631b77a11c38e1d16677fcff76d58f'\
         'ecd21cf59609e9aa570f92bb514214c1' '641e993d13029b5abb8c4a1cd40750fa'\
         '705fc97a4ef38965c22ab8c2a0e52f1f' '01c0219b7627b5880bf46a84f39255a4'\
         'df67293e4e7318d11ea85450e00be35a')
sha1sums=('630aab5b4149d6ffb781cc38c4ce26dd6b048b40'\
          'f98c551178888aaeab9bb5bc947eaf81401ef8e5'\
          '7b6630a114f3f351c1e9e0d6420508e0bc4cdae5'\
          '148009f39e7a646f7db4c4bf8dd7b5bd3effa2bc'\
          'cba82ce4eebc60eca334cc36e0111a23df788638'\
          '1d00c887021306342363557fae8845becd83e0c7'\
          '1270cfbd1e736927e8d438c75e35c52ce44ace36')
    
build() {
  cd $startdir/src/$pkgname-$pkgver
  [ "$CARCH" = "i686" ]   && sed -i 's/-O3/-O2 -march=i686   -mtune=generic -pipe/' Makefile
  [ "$CARCH" = "x86_64" ] && sed -i 's/-O3/-O3 -march=x86-64 -mtune=generic -pipe/' Makefile
  make || return 1
  install -D -m755 neverball $startdir/pkg/usr/share/neverball/bin/neverball
  install -D -m755 neverputt $startdir/pkg/usr/share/neverball/bin/neverputt
  install -D -m755 ../neverball $startdir/pkg/usr/bin/neverball
  install -D -m755 ../neverputt $startdir/pkg/usr/bin/neverputt
  install -D -m644 ../neverball.desktop $startdir/pkg/usr/share/applications/neverball.desktop
  install -D -m644 ../neverball.png $startdir/pkg/usr/share/pixmaps/neverball.png
  install -D -m644 ../neverputt.desktop $startdir/pkg/usr/share/applications/neverputt.desktop
  install -D -m644 ../neverputt.png $startdir/pkg/usr/share/pixmaps/neverputt.png
  cp -r data/ $startdir/pkg/usr/share/neverball
  find ${startdir}/pkg/usr/share/neverball/data -type f -exec chmod 644 {} \;
}
