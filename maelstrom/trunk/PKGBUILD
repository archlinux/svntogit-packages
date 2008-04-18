# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=maelstrom
pkgver=3.0.6
pkgrel=2
pkgdesc="Asteroids-type game with sound and 3D objects"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_net' 'gcc-libs')
backup=('var/games/Maelstrom.scores')
install=maelstrom.install
source=(http://www.devolution.com/~slouken/Maelstrom/src/Maelstrom-${pkgver}.tar.gz
	maelstrom-3.0.6-64bits.patch
	maelstrom-scores.patch
	Maelstrom.desktop)
url="http://www.devolution.com/~slouken/Maelstrom/"
md5sums=('4fbeb6070eebdf161bd156b083b8804e'
         '471ef416576d1ba7dabfa12a4825e271'
         '131dc95ec8d23f510cdec2bb10dbb9b4'
	 '4e9009d8c1b7afd68f54084565135d6c')

build() {
  cd ${startdir}/src/Maelstrom-${pkgver}
  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np0 -i ../maelstrom-3.0.6-64bits.patch || return 1
  fi
  patch -Np0 -i ${startdir}/src/maelstrom-scores.patch || return 1
  sed -i -e 's/games\/\$PACKAGE/share\/\$PACKAGE/g' configure
  ./configure --prefix=/usr || return 1
  make || return 1
  make -j1 prefix=${startdir}/pkg/usr install || return 1

  mkdir -p ${startdir}/pkg/usr/share/applications
  install -m644 ${startdir}/src/Maelstrom.desktop ${startdir}/pkg/usr/share/applications/Maelstrom.desktop || return 1

  chown root:games ${startdir}/pkg/usr/bin/Maelstrom || return 1
  chmod 2555 ${startdir}/pkg/usr/bin/Maelstrom || return 1

  mkdir -p ${startdir}/pkg/var/games
  mv ${startdir}/pkg/usr/share/Maelstrom/Maelstrom-Scores ${startdir}/pkg/var/games/Maelstrom.scores || return 1
  chown root:games ${startdir}/pkg/var/games/Maelstrom.scores || return 1
  chmod 664 ${startdir}/pkg/var/games/Maelstrom.scores || return 1
}
