# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: juergen <juergen@archlinux.org>

pkgname=ecl
pkgver=0.9i
pkgrel=1
pkgdesc="Embeddable Common Lisp"
arch=(i686 x86_64)
depends=('bash' 'gmp')
makedepends=('texinfo')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}s/${pkgname}-${pkgver}.tgz)
md5sums=('ea47c0a9f47c510ff4654b44b004537a')
url="http://sourceforge.net/projects/ecls/"


build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's|-Wl,--rpath,~A|-Wl,--rpath,/usr/lib/ecl|' src/configure || return 1
  ./configure --build=$CHOST \
              --prefix=/usr       \
              --with-tcp          \
              --with-clos-streams \
              --enable-shared \
              --enable-boehm=local \        # ECL fails to build with a system-installed Boehm GC
              --with-system-gmp \
              --without-x \
              --without-clx \
              --disable-threads

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
