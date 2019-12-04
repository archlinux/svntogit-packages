# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=btrfs-progs
pkgver=5.4
pkgrel=1
pkgdesc='Btrfs filesystem utilities'
arch=('x86_64')
makedepends=('git' 'asciidoc' 'xmlto' 'systemd' 'python' 'python-setuptools')
depends=('glibc' 'libutil-linux' 'e2fsprogs' 'lzo' 'zlib' 'zstd')
optdepends=('python: libbtrfsutil python bindings')
url='https://btrfs.wiki.kernel.org'
replaces=('btrfs-progs-unstable')
conflicts=('btrfs-progs-unstable')
provides=('btrfs-progs-unstable')
license=('GPL2')
validpgpkeys=('F2B41200C54EFB30380C1756C565D5F9D76D583B')
source=("https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v$pkgver.tar."{sign,xz}
        'initcpio-install-btrfs'
        'initcpio-hook-btrfs'
        'btrfs-scrub@.service'
        'btrfs-scrub@.timer')
install=btrfs-progs.install
options=(!staticlibs)
sha224sums=('SKIP'
            '52a095044192383736f2e387ba1528dda78dd8179ff5822d377f37ef'
            '9a20f841f572d97eaecaa25f5641eee143bc4c5ded79198b15d6691d'
            '650621f98192cc9c8cc4ecfdcf560db88011dbc07c5df1d7bdae0ae2'
            'c1477fc473324a7f3057f3e5e258b6462d596d1447fad8651ccb872c'
            '1425cb4ded552dc69048f46147ecf5d3b8879e65ec0893d0dca149a2')

prepare() {
  cd $pkgname-v$pkgver
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
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-v$pkgver
 ./btrfs filesystem show
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install install_python

  # install bash completion (FS#44618)
  install -Dm644 btrfs-completion "$pkgdir/usr/share/bash-completion/completions/btrfs"

  # install mkinitcpio hooks
  cd "$srcdir"
  install -Dm644 initcpio-install-btrfs "$pkgdir/usr/lib/initcpio/install/btrfs"
  install -Dm644 initcpio-hook-btrfs "$pkgdir/usr/lib/initcpio/hooks/btrfs"

  # install scrub service/timer
  install -Dm644 btrfs-scrub@.service "$pkgdir/usr/lib/systemd/system/btrfs-scrub@.service"
  install -Dm644 btrfs-scrub@.timer "$pkgdir/usr/lib/systemd/system/btrfs-scrub@.timer"
}

# vim:set ts=2 sw=2 ft=sh et:
