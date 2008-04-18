# $Id$
# Maintainer : Damir Perisa <damir.perisa@bluewin.ch>

pkgname=kile
pkgver=2.0
pkgrel=1
pkgdesc="A user friendly TeX/LaTeX frontend for KDE."
arch=("i686" "x86_64")
license=('GPL2')
url="http://kile.sourceforge.net/"
depends=('libx11' 'qt3>=3.3.8' 'kdelibs>=3.5.8' 'tetex' 'psutils')

source=("http://switch.dl.sourceforge.net/sourceforge/kile/$pkgname-$pkgver.tar.bz2")

 build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde
   make || return 1
   make prefix=$startdir/pkg/opt/kde install
   rm $startdir/pkg/opt/kde/share/apps/katepart/syntax/{bibtex,latex}.xml
 }


md5sums=('78fed6091aec3f1357c69f6462528ed2')
