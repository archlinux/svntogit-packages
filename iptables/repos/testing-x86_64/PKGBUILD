# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=iptables
pkgver=1.8.0
pkgrel=2
pkgdesc='Linux kernel packet control tool'
arch=(x86_64)
license=(GPL2)
url='http://www.netfilter.org/projects/iptables/index.html'
depends=(glibc bash libnftnl libpcap)
makedepends=(linux-api-headers)
provides=(ebtables arptables)
conflicts=(ebtables arptables)
replaces=(ebtables arptables)
source=(http://www.netfilter.org/projects/iptables/files/${pkgname}-${pkgver}.tar.bz2{,.sig}
        empty.rules
        simple_firewall.rules
        empty-{filter,mangle,nat,raw,security}.rules
        {iptables,ip6tables,ebtables,arptables}.service
        iptables-flush arptables ebtables)
sha1sums=('04924fd00dbaf8189f0777af90f7bdb73ac7e47c'
          'SKIP'
          '83b3363878e3660ce23b2ad325b53cbd6c796ecf'
          'f085a71f467e4d7cb2cf094d9369b0bcc4bab6ec'
          'd9f9f06b46b4187648e860afa0552335aafe3ce4'
          'c45b738b5ec4cfb11611b984c21a83b91a2d58f3'
          '1694d79b3e6e9d9d543f6a6e75fed06066c9a6c6'
          '7db53bb882f62f6c677cc8559cff83d8bae2ef73'
          'ebbd1424a1564fd45f455a81c61ce348f0a14c2e'
          '49be9443fc302dd0fda78b63d64e884cadb61603'
          '9cec592787e32451f58fa608ea057870e07aa704'
          '052fe6a802d5c7be015881787ed716819db1ca0a'
          'f15bd7937a10fbfcc6443f55a25cd566a460ebe7'
          'e7abda09c61142121b6695928d3b71ccd8fdf73a'
          '1502ebe011f44e5553d9cbd5023755cd9f3e8c75'
          '436f8adb727e93e92a07834ba0e93f4364587901')
validpgpkeys=('C09DB2063F1D7034BA6152ADAB4655A126D292E4') # Netfilter Core Team

prepare() {
  cd $pkgname-$pkgver

  # use system one
  rm include/linux/types.h
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/iptables \
    --with-xtlibdir=/usr/lib/iptables \
    --enable-bpf-compiler \
    --enable-devel \
    --enable-shared

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm644 empty.rules "$pkgdir/etc/iptables/empty.rules"
  install -Dm644 simple_firewall.rules "$pkgdir/etc/iptables/simple_firewall.rules"

  install -d "$pkgdir"/var/lib/{iptables,ip6tables}
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/iptables"
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/ip6tables"

  for unit in iptables ip6tables arptables ebtables; do
    install -Dm644 ${unit}.service "$pkgdir/usr/lib/systemd/system/${unit}.service"
  done

  for helper in iptables-flush arptables ebtables; do
    install -Dm755 $helper \
      "$pkgdir/usr/lib/systemd/scripts/$helper"
  done

  # install iptables-apply
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 $pkgname/iptables-apply \
      "$pkgdir/usr/bin/iptables-apply"
  gzip --to-stdout --best $pkgname/iptables-apply.8 > \
      "$pkgdir/usr/share/man/man8/iptables-apply.8.gz"
}
