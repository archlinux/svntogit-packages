# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=esd
pkgver=0.2.38
pkgrel=3
pkgdesc="Enlightened Sound Daemon"
arch=(i686 x86_64)
license=('LGPL')
depends=('audiofile' 'tcp_wrappers' 'alsa-lib')
url="http://www.tux.org/~ricdude/EsounD.html"
backup=('etc/esd.conf')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/esound/0.2/esound-${pkgver}.tar.bz2
	esd-0.2.38-alsa-drain.patch
	esd)
md5sums=('1c48c100b450d617b58dacb59837d34f'
         '3de93efcd1bc196a3585e6aef50eac48'
         'a4c76e7c7f75b201ea7ab6fb15b47472')

build() {
  cd ${startdir}/src/esound-${pkgver}
  patch -Np1 -i ${startdir}/src/esd-0.2.38-alsa-drain.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --with-audiofile --with-libwrap \
	      --enable-alsa --disable-artstest
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m755 ${startdir}/src/esd ${startdir}/pkg/etc/rc.d/esd
}
