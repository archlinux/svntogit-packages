# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gpm
pkgver=1.20.1
pkgrel=7
pkgdesc="A mouse server for the console and xterm"
arch=('i686' 'x86_64')
url="http://unix.schottelius.org/gpm/"
license=('GPL')
depends=('ncurses')
backup=(etc/conf.d/gpm)
options=('!makeflags')
source=(http://unix.schottelius.org/gpm/archives/$pkgname-$pkgver.tar.bz2 \
        gpm.patch gpm-quietdeath.patch gpm-openmax.patch \
        gpm-1.20.1-nodebug.patch  gpm gpm.conf.d)
md5sums=('2c63e827d755527950d9d13fe3d87692' 'ffcb5ead568a7ce39602e2d39555b251'\
         '583fa2cf2a9db7ca458b23c1d095f667' '6b7be08b0f4e62f1871fa5b3aec25dbd'\
         '285019976ad18695a2d47bcce23cb18c' 'c4d42a4725503a5524cae060a959a3d3'\
         '5f109341a7d1bb18c59d7c3a395d848a')
sha1sums=('c48d937e62abb438c2f6439b34ef3332c89af8d1'
          '16541df8144073b4e79664fd0070ec7233547e72'
          '411f06da13e881dd07d6ea8765decc0eb7acc195'
          '2d47d63b285153bfaa016aa20c342519a4bdb5a1'
          '1491349903987f6b2c4ca0a61dbeeb6ce6335e44'
          'c13ad1422d24af320e2abb9786c7eacef39b293c'
          '3bcb67027f0ad7dc393388fb02c261126671f9f5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../gpm-quietdeath.patch || return 1
  patch -Np1 -i ../gpm.patch || return 1
  patch -Np1 -i ../gpm-openmax.patch || return 1
  patch -Np1 -i ../gpm-1.20.1-nodebug.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc
  make LIBS=-lm || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m755 ../gpm $startdir/pkg/etc/rc.d/gpm
  install -D -m644 ../gpm.conf.d $startdir/pkg/etc/conf.d/gpm
  chmod 755 $startdir/pkg/usr/lib/libgpm.so.*
}
