# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.10
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=('x86_64')
url='https://bird.network.cz/'
license=('GPL2')
backup=('etc/bird.conf')
depends=('glibc' 'readline' 'ncurses' 'libssh')
replaces=('bird6')
options=(!emptydirs)
source=("https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
        'bird.service'
        )
sha256sums=('7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b')

prepare() {
  cd $pkgname-$pkgver
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
