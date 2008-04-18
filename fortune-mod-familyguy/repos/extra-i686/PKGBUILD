# $Id$
# Contributor : lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-familyguy
pkgver=0.2
pkgrel=1
pkgdesc="Family Guy fortune cookie files"
arch=(i686 x86_64)
url="http://jon.oberheide.org/projects/familyguy/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://jon.oberheide.org/projects/familyguy/$pkgname-$pkgver.tar.gz)

build() {

    cd $startdir/src/$pkgname-$pkgver

    install -D -m644 $startdir/src/$pkgname-$pkgver/familyguy \
        $startdir/pkg/usr/share/fortune/familyguy

    install -D -m644 $startdir/src/$pkgname-$pkgver/familyguy.dat \
        $startdir/pkg/usr/share/fortune/familyguy.dat

}
