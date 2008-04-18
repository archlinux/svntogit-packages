# $Id$
# Committer: jlvsimoes <jlvsimoes@oninet.pt>
# Maintainer: kevin <kevin@archlinux.org>
pkgname=abuse
pkgver=0.7.0
pkgrel=4
pkgdesc="Abuse is an action game that pits you --assuming the role of Nick Vrenna, res stance fighter -- against ruthless alien killers"
url="http://www.labyrinth.net.au/~trandor/abuse"
depends=('alsa-lib' 'sdl' 'gcc')
source=(http://www.labyrinth.net.au/~trandor/abuse/files/abuse_sdl-$pkgver.tar.bz2 http://www.labyrinth.net.au/~trandor/abuse/files/abuse_datafiles.tar.gz abuse.patch)
md5sums=('59ea4498886642aa975f04233cc92558' \
	'2b857668849b2dc7cd29cdd84a33c19e' \
	'd4ab1f9fcbae1d500cbbafd7829a44b4')
install=abuse.install

build() {
  cd $startdir/src/abuse_sdl-$pkgver
  patch -p1 < ../abuse.patch
  ./configure --prefix=/usr --with-x
  make || return 1
  make prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/usr/share/games/abuse
  cd $startdir/pkg/usr/share/games/abuse
  cp $startdir/src/abuse_sdl-$pkgver/gamma.lsp $startdir/pkg/usr/share/games/abuse
  tar -xzf  $startdir/src/abuse_datafiles.tar.gz
  chown -R root:root $startdir/pkg/usr/share
}
