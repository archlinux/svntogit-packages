# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=tcoffee
pkgver=5.57
pkgrel=1
arch=('i686' 'x86_64')
license=('gpl2')
pkgdesc="Tree based Consistency Objective Function For AlignmEnt Evaluation - T-Coffee"
url="http://www.tcoffee.org/Projects_home_page/t_coffee_home_page.html"
depends=('glibc')
source=("http://www.tcoffee.org/Packages/T-COFFEE_distribution_Version_$pkgver.tar.gz")

build() {
  cd $startdir/src/T-COFFEE_distribution_Version_$pkgver/t_coffee_source
    make clean
    make -i CC=gcc all || return 1
    install -D -m755 ../bin/t_coffee $startdir/pkg/usr/bin/t_coffee || return 1
}

md5sums=('98016341d02511ad9b92ff352834beb2')
