# Maintainer: Sébastien Luttringer

pkgname=bird
pkgver=2.0.9
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
        'bird.service'
        'https://gitlab.nic.cz/labs/bird/-/commit/fcb4dd0c831339c4374ace17d8f2ae6ebfeed279.patch'
        )
sha256sums=('504a0f313c74238d16d7c6000fabeee02adf116b78ddb805696d9e7abb8a0b7d'
            '4aa1e8d41229badd276aa3747f613e7df34761892add2258c63bdb5097dfeb2b'
            '3c48294673862dad68ac724310795b967561055bfb5ce28f47bd0cd7050cc4c4')

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
