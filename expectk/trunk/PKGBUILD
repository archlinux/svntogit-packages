# $Id$
# Maintainer: kevin <kevin@archlinux.org>

pkgname=expectk
pkgver=5.44.1.4
pkgrel=1
pkgdesc="An X and Tk variant of expect, a tool for automating interactive applications"
arch=(i686 x86_64)
depends=('tcl>=8.5.0' 'tk>=8.5.0')
tcltkver=8.5.0
source=(ftp://ftp.archlinux.org/expect/expect-$pkgver.tar.bz2
#http://expect.nist.gov/src/expect-$pkgver.tar.gz
http://dl.sourceforge.net/sourceforge/tcl/tk$tcltkver-src.tar.gz
http://dl.sourceforge.net/sourceforge/tcl/tcl$tcltkver-src.tar.gz)
url="http://expect.nist.gov/"


build() {
  BIN="expectk multixterm tknewsbiff tkpasswd xpstat"
  MAN="multixterm tknewsbiff"
  cd $startdir/src/expect-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --with-tcl=/usr/lib --with-tk=/usr/lib \
      --with-tclinclude=$startdir/src/tcl$tcltkver/generic \
      --with-tkinclude=$startdir/src/tk$tcltkver/generic
  # Keep $startdir/pkg out of library search paths.
  sed -e 's/-rpath,${LIB_RUNTIME_DIR}:/-rpath,/' -i Makefile
  # expect needed during build.
  make -j1 expect $BIN || return 1

  # install binaries and manpages.
  for i in $BIN ; do
      install -D -m755 $i $startdir/pkg/usr/bin/$i
  done
  install -D -m644 expectk.man $startdir/pkg/usr/man/man1/expectk.1
  for i in $MAN ; do
      install -D -m644 example/$i.man $startdir/pkg/usr/man/man1/$i.1
  done
}
md5sums=('bbfd5ef50f3c1df4fe79e5a20a947d41'
         'bc217c45ed6b2f5b8d3120df63fa13bd'
         'd890c505465411b25050b6cd95971d2c')
