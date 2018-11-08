# Maintainer: Sébastien Luttringer

pkgname=ipset
pkgver=7.0
pkgrel=1
pkgdesc='Administration tool for IP sets'
arch=('x86_64')
url='http://ipset.netfilter.org/'
license=('GPL2')
depends=('glibc' 'libmnl')
backup=("etc/$pkgname.conf")
source=("http://ipset.netfilter.org/$pkgname-$pkgver.tar.bz2"
        "$pkgname.service")
md5sums=('64c4e2e7123481c9db7ee1df127d9531'
         'e20fe62881993078591f1bb8b2fa22bb')

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
  # needed because we patch configure.ac (TO BE REMOVED)
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --with-kmod=no
  make
}

package() {
  pushd $pkgname-$pkgver
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
}

# vim:set ts=2 sw=2 et:
