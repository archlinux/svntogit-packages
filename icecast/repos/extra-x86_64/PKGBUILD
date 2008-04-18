# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=icecast
pkgver=2.3.1
pkgrel=5
pkgdesc="Streaming OGG and MP3 server.  Replacement for shoutcase."
arch=(i686 x86_64)
license=('GPL')
depends=('libxslt' 'libvorbis' 'curl>=7.16.2' 'speex' 'libtheora')
backup=('etc/icecast.xml')
source=(http://downloads.us.xiph.org/releases/$pkgname/$pkgname-$pkgver.tar.gz
        icecast
        icecast-2.3.1-nocurlpassword.patch)
url="http://www.icecast.org/"

build() {
  cd $startdir/src/$pkgname-$pkgver

  patch -Np0 -i ${startdir}/src/icecast-2.3.1-nocurlpassword.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/usr/share/icecast
  install -D -m644 conf/icecast.xml.dist $startdir/pkg/usr/share/icecast/icecast.xml.dist
  install -D -m755 ${startdir}/src/icecast ${startdir}/pkg/etc/rc.d/icecast
}
md5sums=('2d80a249fa8529f82d018c6216108ea8'
         'fe65f4d6826a750a868227b9d86f1be3'
         'bb715704cf868017a10ec0c03fc18e17')
