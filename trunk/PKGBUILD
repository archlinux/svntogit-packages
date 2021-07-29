# Maintainer: Sébastien Luttringer

pkgname=lz4
epoch=1
pkgver=1.9.3
pkgrel=2
pkgdesc='Extremely fast compression algorithm'
arch=('x86_64')
url='http://www.lz4.org/'
license=('GPL2')
makedepends=('git')
checkdepends=('diffutils')
depends=('glibc')
source=("git+https://github.com/lz4/lz4.git#tag=v$pkgver"
        'https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7.patch')
sha256sums=('SKIP'
            'c99da650a79a42db4db23e72146701cce9106383ba45709c5ac89022e36dcfb2')

prepare() {
  cd $pkgname
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  # do not use the main makefile, it calls sub make with -e
  # exported CLFAGS by makepkg break the version. see FS#50071
  cd $pkgname
  make -C lib PREFIX=/usr
  make -C programs PREFIX=/usr lz4 lz4c
}

check() {
  rm -f passwd.lz4
  $pkgname/programs/lz4 /etc/passwd passwd.lz4
  $pkgname/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package() {
  cd $pkgname
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
