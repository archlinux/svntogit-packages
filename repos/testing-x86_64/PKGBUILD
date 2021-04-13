# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.8
pkgrel=2
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
replaces=('bird6')
options=(!emptydirs)
source=("https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
        'bird.service')
sha256sums=('19d2de83ee25a307b9e5b9e58797dd68766d439bcee33e3ac617ed502370e7f6'
            'bb6d98a63dfff649143e01ebac8dc20d5850232d906169adfc69871fa9c9542f')

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
    --runstatedir=/run/$pkgname \
    --docdir=/usr/share/doc/$pkgname
  make
}

package () {

  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install

  # systemd
  install -D -m 644 "$srcdir/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"
}

# vim:set ts=2 sw=2 et:
