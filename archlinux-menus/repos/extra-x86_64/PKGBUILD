# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=archlinux-menus
pkgver=2.0
pkgrel=1
pkgdesc="Archlinux specific XDG-compliant menu"
arch=(i686 x86_64)
url="http://www.archlinux.org/"
license=(GPL)
depends=('xdg-utils')
source=(Arch-AUR.desktop
	Arch-Bugs.desktop
	Arch-CVS.desktop
	Arch-Developers.desktop
	Arch-Documentation.desktop
	Arch-Donate.desktop
	Arch-Forum.desktop
	Arch-Homepage.desktop
	Arch-Schwag.desktop
	Arch-Wiki.desktop
	arch-logo.png
	Archlinux.directory)
md5sums=('10c21e959cf9c7d4b4adc9bb65ee1eaf' '7aed9d8c71c412ed18370f48d0067844'\
         '90a90c9202056066b46443ba47ceb6ea' '91bca0f264df70648d15a9063b39bfad'\
         'af03973daef93f9d07eacec3b9ed1836' '06270c11acb7a4ba48a089569301cae7'\
         'eca89be6c5e1a0b8b70c52eb45d0004c' '5e44fd143d27837c2508141262d65ce2'\
         'edeb91193798bbb3e2bdc016cee38900' '778e89765c5bef94e72e3aadccb6c1a6'\
         '7ca3b587c44b8fdbff2074b753fb76f7' '8ae5ce06452232b8545ebb738b3e2a54')

build() {
  cd ${startdir}/src
  install -m755 -d ${startdir}/pkg/usr/share/desktop-directories
  install -m755 -d ${startdir}/pkg/usr/share/applications
  install -m755 -d ${startdir}/pkg/usr/share/pixmaps

  install -m644 *.desktop ${startdir}/pkg/usr/share/applications/
  install -m644 arch-logo.png ${startdir}/pkg/usr/share/pixmaps/
  install -m644 Archlinux.directory ${startdir}/pkg/usr/share/desktop-directories/
}
