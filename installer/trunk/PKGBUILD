pkgname=installer
pkgver=2008.04.09
pkgrel=1
pkgdesc="The Archlinux installation scripts"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/"
license=('GPL')
depends=()
makedepends=('git')

_gitroot="git://projects.archlinux.org/installer.git"

build() {
  cd $startdir/src

  if [ -d $startdir/src/installer ] ; then
    cd installer && git-pull origin master
  else
    git clone $_gitroot
  fi

  git checkout $pkgver
  make install DESTDIR=$startdir/pkg
}

# vim:set ts=2 sw=2 et:
