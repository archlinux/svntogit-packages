# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=rockdodger
pkgver=0.6
pkgrel=1
pkgdesc="Space Rocks is a game - Dodge the space rocks, use your shields, fire your thrusters, cross your fingers, and kiss your ship goodbye"
depends=('sdl' 'sdl_mixer' 'sdl_image')
source=(http://dl.sourceforge.net/spacerocks/$pkgname-$pkgver.tar.gz)
url="http://spacerocks.sourceforge.net/"

build() {
 cd $startdir/src/$pkgname-$pkgver
 ./configure --prefix=/usr
 make || return 1
 mkdir -p $startdir/pkg/usr/bin
 cp rockdodger $startdir/pkg/usr/bin
 mkdir -p $startdir/pkg/usr/share/rockdodger/data
 cp data/*.{bmp,png,wav,mod} $startdir/pkg/usr/share/rockdodger/data
 chmod a+r $startdir/pkg/usr/share/rockdodger/data/*
 chmod a+r $startdir/pkg/usr/share/rockdodger/data
 touch $startdir/pkg/usr/share/rockdodger/.highscore
 chmod a+rw $startdir/pkg/usr/share/rockdodger/.highscore
}
