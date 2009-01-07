# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=pacman
pkgver=3.2.2
pkgrel=1
pkgdesc="A library-based package manager with dependency support"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
groups=('base')
depends=('bash' 'libarchive>=2.6.0' 'libdownload>=1.3' 'pacman-mirrorlist')
optdepends=('fakeroot: for makepkg usage as normal user'
            'python: for rankmirrors script usage')
backup=(etc/pacman.conf etc/makepkg.conf etc/pacman.d/mirrorlist)
install=pacman.install
options=(!libtool)
source=(ftp://ftp.archlinux.org/other/pacman/$pkgname-$pkgver.tar.gz
        pacman.conf)
md5sums=('8404fc38566bb52f8eee2ea483a41051'
         '27271a59b9c9f748547ef4feae90bc5c')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # install arch specific stuff
  mkdir -p $pkgdir/etc
  install -m644 $srcdir/pacman.conf $pkgdir/etc/

  # install completion files
  mkdir -p $pkgdir/etc/bash_completion.d/
  install -m644 contrib/bash_completion $pkgdir/etc/bash_completion.d/pacman
  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  install -m644 contrib/zsh_completion $pkgdir/usr/share/zsh/site-functions/_pacman
}

# vim: set ts=2 sw=2 et:
