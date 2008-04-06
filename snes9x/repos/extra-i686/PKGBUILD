# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=snes9x
pkgver=1.51
pkgrel=1
pkgdesc="A portable Emulator for the Super Nintento Entertainment System"
arch=(i686 x86_64)
url="http://www.snes9x.com"
license="Freeware"
# remove nasm on non x86 platforms
depends=('zlib' 'libpng' 'sdl' 'nasm' 'mesa')
install=snes9x.install
source=(http://www.geocities.co.jp/SiliconValley-PaloAlto/2560/release/${pkgname}-${pkgver}-src.tar.bz2 \
        snes9x-fixes2.patch)
build() {
  mkdir -p ${startdir}/pkg/usr/bin

  cd ${startdir}/src/${pkgname}-${pkgver}-src
  #patch -Np1 -i ${startdir}/src/snes9x-fixes2.patch || return 1

  # build snes9x with opengl
  ./configure --prefix=/usr \
              --with-sdd1-decomp \
              --with-opengl \
              --with-netplay
  make || return 1
  install -D ${startdir}/src/${pkgname}-${pkgver}-src/osnes9x ${startdir}/pkg/usr/bin/osnes9x

  # build snes9x with glide
  #cd $startdir/src/$pkgname-$pkgver-src
  #./configure --prefix=/usr --with-sdd1-decomp --with-glide
  #make || return 1
  #install -D ${startdir}/src/${pkgname}-${pkgver}-src/osnes9x ${startdir}/pkg/usr/bin/3dfxsnes9x

  # build snes9x without opengl
  ./configure --prefix=/usr \
              --with-sdd1-decomp \
              --with-netplay
  make clean || return 1
  make || return 1
  install -D ${startdir}/src/${pkgname}-${pkgver}-src/snes9x ${startdir}/pkg/usr/bin/snes9x
}
md5sums=('a1038cc761f400318cdced960972f8a7' '395bea78242afc82b3756225fe4ff954')
