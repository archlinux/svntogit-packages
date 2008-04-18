# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=monotone
pkgver=0.38
pkgrel=1
pkgdesc="A modern distributed version control system, like hg, darcs, or git"
url="http://www.monotone.ca"
license="GPL"
arch=(i686 x86_64)
depends=('boost')
install=monotone.install
source=(http://www.monotone.ca/downloads/$pkgver/$pkgname-$pkgver.tar.gz \
		limits.patch )

build() {
  cd $startdir/src/$pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install

  # install completion scripts
  mkdir -p $startdir/pkg/etc/bash_completion.d
  mkdir -p $startdir/pkg/usr/share/zsh/site-functions/
  install -m644 contrib/monotone.bash_completion $startdir/pkg/etc/bash_completion.d/monotone
  install -m644 contrib/monotone.zsh_completion $startdir/pkg/usr/share/zsh/site-functions/monotone
}

md5sums=('c1a0d2619f451a664289b042c104860d'
         '7dbb57c7823a815dc4ac0718d565a1e9')
sha1sums=('6c546ec6122f56dfc8253323e8dc45167d0918c4'
          '6c6e7b6d1a1ea8a3603f649a6350404496a6f242')
