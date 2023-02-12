# Maintainer: Sébastien Luttringer

pkgname=ipset
pkgver=7.17
pkgrel=1
pkgdesc='Administration tool for IP sets'
arch=('x86_64')
url='https://netfilter.org/projects/ipset/'
license=('GPL2')
makedepends=('git')
depends=('glibc' 'libmnl')
backup=("etc/$pkgname.conf")
source=("git://git.netfilter.org/ipset.git#tag=v$pkgver"
        "$pkgname.service")
sha256sums=('SKIP'
            '5a0e326a80fd5ab2d9545faa1189b647cc866c9568ab6a9dd0833ba5863f39ce')

prepare() {
  cd $pkgname
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      echo "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --with-kmod=no
  make
}

package() {
  pushd $pkgname
  make DESTDIR="$pkgdir" install
  # install doc
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README UPGRADE ChangeLog "$pkgdir/usr/share/doc/$pkgname"
  # install pkgconfig file
  install -Dm644 lib/libipset.pc "$pkgdir/usr/lib/pkgconfig/libipset.pc"
  popd
  # systemd
  install -Dm 644 $pkgname.service \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  # default config file
  install -Dm 644 /dev/null "$pkgdir/etc/$pkgname.conf"
  # bash completion
  install -Dm 644 ipset/utils/ipset_bash_completion/ipset \
    "$pkgdir/usr/share/bash-completion/completions/ipset"
}

# vim:set ts=2 sw=2 et:
