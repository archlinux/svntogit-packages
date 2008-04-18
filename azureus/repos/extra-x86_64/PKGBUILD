# $Id$
# Maintainer: Arjan Timmerman <arjan@soulfly.nl>
# Contributer: Jaroslaw Swierczynski <swiergot@juvepoland.com>

pkgname=azureus
pkgver=3.0.1.6
pkgrel=2
pkgdesc="BitTorrent client with GUI, written in Java"
arch=('i686' 'x86_64')
url="http://azureus.sourceforge.net/"
license=('GPL')
depends=('swt>=3.3' 'gtk2>=2.10.14' 'bcprov>=1.37')
makedepends=('java-gcj-compat' 'apache-ant' 'unzip')
source=(http://downloads.sourceforge.net/sourceforge/azureus/Azureus_${pkgver}_source.zip
	azureus-bcprov-1.35.patch
	azureus-cache-size.patch
	azureus-remove-manifest-classpath.patch
	azureus-remove-win32-PlatformManagerUpdateChecker.patch
	azureus-remove-win32-mediaplayer.patch
	azureus-remove-win32-osx-platforms.patch
	azureus-remove-win32-osx-restarter.patch
	azureus-sunsecurity.patch
	gnu-jessie.patch
	azureus.sh
	azureus.desktop)
noextract=(Azureus_${pkgver}_source.zip)
md5sums=('1f077e3fa3962f6a1f9d3f531ddaea6c'
         '1ac74562ed0ac29781d2a5fa3e57df73'
         '0f08c1d21d220dbf95fc887c8fd58730'
         '6e79e5fb1b83cad2e7d55570eb188ceb'
         'f8146298148078cfb85dfae0ee5d332b'
         'f80a7009367056c171640809496b0276'
         '6ca5b10c8a550720355b6e0f6e09cbc5'
         'fa50eca910235ad82b849c969dd3c0da'
         '509fe2d1264280c7f028ee4a3ac62360'
         '11e2de45ed09fce049864d791bccebbb'
         '38e123386e0979eef4cddac12df5ffec'
         '805945053df79224bdff0634c6a48124')

build() {
  mkdir -p ${startdir}/src/Azureus_${pkgver}_source
  cd ${startdir}/src/Azureus_${pkgver}_source
  unzip -qqo ${startdir}/src/Azureus_${pkgver}_source.zip
  patch -Np1 -i ${startdir}/src/azureus-bcprov-1.35.patch || return 1
  patch -Np0 -i ${startdir}/src/azureus-cache-size.patch || return 1
  patch -Np0 -i ${startdir}/src/azureus-remove-manifest-classpath.patch || return 1
  patch -Np0 -i ${startdir}/src/azureus-remove-win32-PlatformManagerUpdateChecker.patch || return 1
  patch -Np1 -i ${startdir}/src/azureus-remove-win32-mediaplayer.patch || return 1
  patch -Np0 -i ${startdir}/src/azureus-remove-win32-osx-platforms.patch || return 1
  patch -Np1 -i ${startdir}/src/azureus-remove-win32-osx-restarter.patch || return 1
  patch -Np0 -i ${startdir}/src/azureus-sunsecurity.patch || return 1
  patch -Np0 -i ${startdir}/src/gnu-jessie.patch || return 1

  rm -fr org/gudy/azureus2/ui/swt/osx org/gudy/azureus2/platform/macosx || return 1
  rm -fr org/gudy/azureus2/ui/swt/win32 org/gudy/azureus2/platform/win32 com/aelitis/azureus/util/win32 || return 1
  rm -fr org/gudy/azureus2/ui/swt/test || return 1
  rm -fr org/bouncycastle || return 1

  mkdir -p build/libs
  ln -sf /usr/share/java/swt.jar build/libs/ || return 1
  ln -sf /usr/share/java/bcprov.jar build/libs/ || return 1

  ant jar || return 1

  mkdir -p ${startdir}/pkg/usr/share/java
  install -m644 dist/Azureus2.jar ${startdir}/pkg/usr/share/java/ || return 1

  mkdir -p ${startdir}/pkg/usr/bin
  install -m755 ${startdir}/src/azureus.sh ${startdir}/pkg/usr/bin/azureus || return 1

  mkdir -p ${startdir}/pkg/usr/share/pixmaps
  install -m644 org/gudy/azureus2/ui/icons/a32.png ${startdir}/pkg/usr/share/pixmaps/Azureus.png || return 1

  mkdir -p ${startdir}/pkg/usr/share/applications
  install -m644 ${startdir}/src/azureus.desktop ${startdir}/pkg/usr/share/applications/ || return 1
}
