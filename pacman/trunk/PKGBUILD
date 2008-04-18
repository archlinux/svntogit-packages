# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pacman
pkgver=3.1.4
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
groups=('base')
depends=('gcc-libs' 'bash' 'libarchive>=2.4.17' 'libdownload>=1.3')
backup=(etc/pacman.conf etc/makepkg.conf etc/pacman.d/mirrorlist)
install=pacman.install
options=(!libtool)
source=(ftp://ftp.archlinux.org/other/pacman/$pkgname-$pkgver.tar.gz
        pacman.conf
        mirrorlist)
md5sums=('dfba385a6675db39938c8cc7581c6325'
         'a960bb221183782e44886555d2dc54a6'
         '3d2f5efe2e85f551c6732a6e0e5f77f8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # install arch specific stuff
  mkdir -p ${startdir}/pkg/etc/pacman.d
  install -m644 ${startdir}/src/pacman.conf ${startdir}/pkg/etc/
  install -m644 ${startdir}/src/mirrorlist ${startdir}/pkg/etc/pacman.d/

  # customize mirrorlist to architecture
  sed -i -e "s/@carch@/${CARCH}/g" ${startdir}/pkg/etc/pacman.d/mirrorlist

  # install completion files
  mkdir -p $startdir/pkg/etc/bash_completion.d/
  install -m644 contrib/bash_completion $startdir/pkg/etc/bash_completion.d/pacman
  mkdir -p $startdir/pkg/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion $startdir/pkg/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
