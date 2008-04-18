# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=moon-lander
pkgver=1.0
pkgrel=3
pkgdesc="An addictive game of skill where you must land a space-ship on the moon at a perfect speed."
depends=('sdl' 'sdl_mixer' 'sdl_image' 'libvorbis')
url="None"
source=(http://distro.ibiblio.org/pub/linux/distributions/sorcerer/sources/moon-lander/1.0/$pkgname-$pkgver.tar.bz2)
md5sums=('0bc53b06c268442a0dedfbc14583ecb3')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  mkdir -p $startdir/pkg/usr/share/games/$pkgname
  chmod 755 $startdir/pkg/usr/share/games
  cp -rp images sounds fonts moon-lander.bin $startdir/pkg/usr/share/games/$pkgname
  chmod 755 $startdir/pkg/usr/share/games/moon-lander/images
  chmod 644 $startdir/pkg/usr/share/games/moon-lander/images/*
  chmod 755 $startdir/pkg/usr/share/games/moon-lander/images/backgrounds
  chmod 644 $startdir/pkg/usr/share/games/moon-lander/images/backgrounds/*
  chmod 755 $startdir/pkg/usr/share/games/moon-lander/images/kablam
  chmod 644 $startdir/pkg/usr/share/games/moon-lander/images/kablam/*
  chmod 755 $startdir/pkg/usr/share/games/moon-lander/sounds
  chmod 644 $startdir/pkg/usr/share/games/moon-lander/sounds/*
  chmod 755 $startdir/pkg/usr/share/games/moon-lander/fonts
  chmod 644 $startdir/pkg/usr/share/games/moon-lander/fonts/*
  install -D -m 755 moon-lander $startdir/pkg/usr/bin/moon-lander
}
