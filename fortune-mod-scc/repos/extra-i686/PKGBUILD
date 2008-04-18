# $Id$
# Contributor : lanrat
# Maintainer: damir <damir@archlinux.org>

pkgname=fortune-mod-scc
pkgver=20010929
pkgrel=1
pkgdesc="Sno(w) Chao Cabal fortune cookie files"
url="http://www.scc.mi.org/SCC/sccfortune/"
depends=('fortune-mod')
groups=('fortune-mods')
source=(http://www.scc.mi.org/SCC/sccfortune/sccfortune-${pkgver}.tar.gz)
md5sums=('e763e2daeaeb590ab4c2282889a7cc3f')

build() {

    cd $startdir/src

    mv ./evilplan ./scc-evilplan
    mv ./quotes-${pkgver} ./scc-peewee

    strfile ./scc-evilplan ./scc-evilplan.dat
    strfile ./scc-peewee ./scc-peewee.dat

    install -D -m644 $startdir/src/scc-evilplan \
        $startdir/pkg/usr/share/fortune/scc-evilplan

    install -D -m644 $startdir/src/scc-evilplan.dat \
        $startdir/pkg/usr/share/fortune/scc-evilplan.dat

    install -D -m644 $startdir/src/scc-peewee \
        $startdir/pkg/usr/share/fortune/scc-peewee

    install -D -m644 $startdir/src/scc-peewee.dat \
        $startdir/pkg/usr/share/fortune/scc-peewee.dat

}