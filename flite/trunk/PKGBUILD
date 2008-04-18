# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
pkgname=flite
pkgver=1.3
pkgrel=2
pkgdesc="A lighweight version of festival speech synthesis"
url="http://fife.speech.cs.cmu.edu/flite/"
license=""
depends=('glibc')
source=(http://fife.speech.cs.cmu.edu/flite/packed/$pkgname-$pkgver/$pkgname-$pkgver-release.tar.gz)
md5sums=('ae0aca1cb7b4801f4372f3a75a9e52b5')

build() {
  cd $startdir/src/$pkgname-$pkgver-release
  ./configure --prefix=/usr

  #we want the 16k, not 8k voice
  sed -i 's/cmu_us_kal/cmu_us_kal16/' config/config
  
  make || return 1
  
  #Ugly hack for bad makefile (lib isn't a dir)
  sed -i 's#@ $(MAKE) -C lib --no-print-directory install#$(INSTALL) -m 644 build/i386-linux-gnu/lib/*.a $(INSTALLLIBDIR)#g' Makefile

  make prefix=$startdir/pkg/usr install
}
