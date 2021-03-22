# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.8
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
replaces=('bird6')
source=("https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
        'bird.service')
sha512sums=('5f8ad63b1dcdcfdfd4c98f55601dda3a07dea3099fc51b52a340650ca475bd943ee6aac31a1e7735b7596b279e338697c65728754b97108ae687a05f566c94e2'
            '7321e51fea464914241b21a40be8de2251b650ff470730b6e460a4476ef10c17be3b2eb9e2ac96a9a956de5cc8e3b92417f9c920ae24ab9b06e58b887dd9e49e')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgbase-$pkgver
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --docdir=/usr/share/doc/$pkgname
  make
}

package () {

  cd $pkgbase-$pkgver
  make \
    prefix="$pkgdir/usr" \
    sysconfdir="$pkgdir/etc" \
    sbindir="$pkgdir/usr/bin" \
    localstatedir="$pkgdir/var" \
    docdir="$pkgdir/usr/share/doc/$pkgname" \
    install

  # no /var inside pkg
  rm -r "$pkgdir/var"

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"

  # overwrite invalid default config file (see FS#57096)
  install -D -m 644 doc/bird.conf.example2 "$pkgdir/etc/bird.conf"
}

# vim:set ts=2 sw=2 et:
