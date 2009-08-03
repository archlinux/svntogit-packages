# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pacman
pkgver=3.3.0
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
groups=('base')
depends=('bash' 'libarchive>=2.7.0' 'libfetch>=2.20' 'pacman-mirrorlist')
optdepends=('fakeroot: for makepkg usage as normal user'
            'python: for rankmirrors script usage')
backup=(etc/pacman.conf etc/makepkg.conf)
install=pacman.install
options=(!libtool)
source=(ftp://ftp.archlinux.org/other/pacman/$pkgname-$pkgver.tar.gz
        pacman.conf
        makepkg.conf)
md5sums=('945b95633cc7340efb4d4564b463c6b1'
         '27271a59b9c9f748547ef4feae90bc5c'
         '5e7a2edd59ea5b9ee95a8728f31530ac')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # install arch specific stuff
  mkdir -p $pkgdir/etc
  install -m644 $srcdir/pacman.conf $pkgdir/etc/
  install -m644 $srcdir/makepkg.conf $pkgdir/etc/

  # install completion files
  mkdir -p $pkgdir/etc/bash_completion.d/
  install -m644 contrib/bash_completion $pkgdir/etc/bash_completion.d/pacman
  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
