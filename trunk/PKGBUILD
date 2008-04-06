# Contributor: iztok pizorn <pizorn@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=wpa_supplicant
pkgver=0.5.10
_madwifi_ver=0.9.4
pkgrel=1
pkgdesc="A utility providing key negotiation for WPA wireless networks"
arch=('i686' 'x86_64')
makedepends=('kernel26>=2.6.24' 'kernel26<2.6.25')
depends=('openssl')
license=('GPL')
groups=('base')
backup=('etc/wpa_supplicant.conf')
url="http://hostap.epitest.fi/wpa_supplicant"
source=(http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz
        config
	http://downloads.sourceforge.net/sourceforge/madwifi/madwifi-${_madwifi_ver}.tar.gz)
install='wpa_supplicant.install'
md5sums=('9e7b99da67c47d81121368c6d580d069'
         '87a7bb38e0b4820b29065a9b3e8f4e06'
         '399d20de8d855a59f20058857c2178ad')

build() {
  cd ${startdir}/src/
  mv madwifi-${_madwifi_ver} madwifi
  cd $startdir/src/$pkgname-$pkgver
  cp ../config ./.config
  sed -i 's@/usr/local@$(PREFIX)@g' Makefile
  sed -i 's@dynamic_eap_methods@@g' Makefile
  make || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1
  install -D -m644 wpa_supplicant.conf $startdir/pkg/etc/wpa_supplicant.conf || return 1
  install -d -m755 $startdir/pkg/usr/man/man{5,8} || return 1
  install -m644 doc/docbook/wpa_supplicant.conf.5 $startdir/pkg/usr/man/man5 || return 1
  install -m644 doc/docbook/{wpa_background,wpa_cli,wpa_passphrase,wpa_supplicant}.8 $startdir/pkg/usr/man/man8 || return 1
}
