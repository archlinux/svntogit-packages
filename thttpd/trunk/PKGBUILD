# $Id$
# Maintainter: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=thttpd
pkgver=2.25b
pkgrel=1
pkgdesc="tiny/turbo/throttling HTTP server"
url="http://www.acme.com/software/thttpd/"
source=($url/$pkgname-$pkgver.tar.gz \
        thttpd \
        thttpd_config)
backup=('/usr/www/thttpd_config')
conflicts=('apache')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/{man/man1/,www/data/log}
  make prefix=$startdir/pkg/usr WEBGROUP=root install || return 1
  install -D -m755 ../thttpd $startdir/pkg/etc/rc.d/thttpd
  install -D -m755 ../thttpd_config  $startdir/pkg/usr/www/thttpd_config
}

