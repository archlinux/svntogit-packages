# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.2
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babbel routing daemon'
arch=('x86_64')
url='http://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
replaces=('bird6')
source=("ftp://bird.network.cz/pub/bird/$pkgname-$pkgver.tar.gz"
        'bird.service')
md5sums=('de17645b045fa13912409aea59420132'
         '69221e063a3f07dcad519d5eeacaae75')

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
