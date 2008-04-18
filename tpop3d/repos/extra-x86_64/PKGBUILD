# $Id$
# Contributor: Roberto Braga <rbap@yap.org>
# Maintainer: dale <dale@archlinux.org>

pkgname=tpop3d
pkgver=1.5.3
pkgrel=3
pkgdesc="A high-performance pop3 server with virtualhost and maildir support and several auth method"
arch=(i686 x86_64)
url="http://www.ex-parrot.com/~chris/tpop3d/"
depends=('pam' 'openssl' 'glibc')
backup=('etc/tpop3d.conf' 'etc/conf.d/tpop3d')
source=(http://www.ex-parrot.com/~chris/tpop3d/$pkgname-$pkgver.tar.gz \
	tpop3d \
	tpop3d.conf.d)
md5sums=('dd920c49f4e5879eb3caf7ea047622e9' \
	'002236fdfa9ee65949e51990e03a8767' \
        '295d22c251d9e2cd6e7dd2dd9ae9df2e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/src/tpop3d $startdir/pkg/etc/rc.d/tpop3d
  install -D -m644 ../tpop3d.conf.d $startdir/pkg/etc/conf.d/tpop3d
  install -D -m644 tpop3d.conf.sample $startdir/pkg/etc/tpop3d.conf
}
