# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgbase=xsane
pkgname=('xsane' 'xsane-gimp')
pkgver=0.999
pkgrel=3
arch=(x86_64)
url="https://gitlab.com/sane-project/frontend/xsane"
license=('GPL2')
makedepends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg' 'gimp')
source=(http://http.debian.net/debian/pool/main/x/$pkgname/${pkgname}_$pkgver.orig.tar.gz
	xsane-0.995-xdg-open.patch
	0165-xsane-0.999-lcms2.patch
	0001-lcms2_configure.patch)
sha512sums=('73ec961fce1a86b5d6f5bac0995d222785eb4b077dc8e72492b092d2bf4500455426e80e4d27233721cd38ec84f77fb9f92190a6afe45bdaf7ffd1ee50b431ed'
            'ed1c1b0fab10b456f7dc6befd6f91eb8d3e1bae0f1be3abf71d334d4a2ae8f8335ba37fdd73f336f7c5f45916df917dc77fd792e6b849a87bde95babc698bf39'
            '557913adab90b2ba051a2988bdbfc600ca6a33f099810f5f867c8d8b2c5a45b0468dd8a1a1593ff33d149b4a5917b24d716b54ae2605b3a2e19053e02e5b64c6'
            'a8b5e0466c1306b8df68d814a3f02bc74e4d470aa42b9e0eebad41d2e274ff74328a837dd9a0b5ca59e4df63ecbb53b268f6d4948a690d9346c5399bb5b3d1e4')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # fix use "xdg-open" instead of "netscape" to launch help browser - taken from Fedora
  patch -Np1 -i "${srcdir}/xsane-0.995-xdg-open.patch"
  sed -i -e 's:png_ptr->jmpbuf:png_jmpbuf(png_ptr):' src/xsane-save.c
  patch -Np1 -i "${srcdir}/0165-xsane-0.999-lcms2.patch"
  patch -Np1 -i "${srcdir}/0001-lcms2_configure.patch"
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-gimp
  make
  mv src/xsane src/xsane-gimp

  # build again with gimp enabled
  make clean
  ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man --disable-gimp
  make
}

package_xsane() {
  pkgdesc="A GTK-based X11 frontend for SANE and plugin for Gimp."
  install=$pkgname.install
  depends=('gtk2' 'lcms2' 'sane' 'zlib' 'libjpeg')  
  optdepends=('xsane-gimp: for gimp plugin support')
  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
}

package_xsane-gimp() {
  pkgdesc="XSane Gimp plugin"
  depends=('xsane' 'gimp')
  cd "$srcdir/$pkgbase-$pkgver"
  install -D -m755 src/xsane-gimp "${pkgdir}/usr/bin/xsane-gimp"

  ## For making Gimp Plugin available 
  mkdir -p "$pkgdir/usr/lib/gimp/2.0/plug-ins"
  ln -sf /usr/bin/xsane-gimp $pkgdir/usr/lib/gimp/2.0/plug-ins/xsane
  #cd "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
  #/bin/ln -s ../../../../bin/xsane-gimp xsane

# http://cvs.fedoraproject.org/viewvc/rpms/xsane/devel/xsane.spec?revision=1.80&view=markup
# when makepkg will allow splitted pkg install file support we might change add a xsane-gimp.install file with the commands that are used by fedora, 
# gentoo has something similar
#%post gimp
#107 	if [ -x "%{_sbindir}/gimp-plugin-mgr" ]; then
#108 	%{_sbindir}/gimp-plugin-mgr --install xsane
#109 	fi
#110 	
#111 	%preun gimp
#112 	if [ $1 = 0 ]; then
#113 	if [ -x "%{_sbindir}/gimp-plugin-mgr" ]; then
#114 	%{_sbindir}/gimp-plugin-mgr --uninstall xsane
#115 	fi
#116 	fi 
}
