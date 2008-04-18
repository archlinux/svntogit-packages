# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Maintainer: roberto <roberto@archlinux.org>
pkgname=xconq
pkgver=20071021
pkgrel=1
pkgdesc="Xconq is a general strategy game system."
arch=(i686 x86_64)
url="http://sources.redhat.com/xconq/"
license=('GPL')
depends=('tk')

build() {
  cvs -z 9 -d :pserver:anoncvs:anoncvs@sources.redhat.com:/cvs/xconq login
  cvs -z 9 -d :pserver:anoncvs@sources.redhat.com:/cvs/xconq co xconq
  cd $startdir/src/xconq
  mkdir -p $startdir/pkg/var/lib/xconq/scores
  ./configure --prefix=/usr --enable-alternate-scoresdir=$startdir/pkg/var/lib/xconq/scores \
  --enable-alternate-gameuser=root --enable-alternate-gamegroup=root
  make || return 1
  make prefix=$startdir/pkg/usr install
}
