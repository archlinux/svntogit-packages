# $Id$
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Maintainer: damir <damir@archlinux.org>

pkgname=vnc
pkgver=4.1.2
origver=4_1_2
pkgrel=1
pkgdesc="The original open-source cross-platform remote control solution (without xvnc)"
#source=(http://www.realvnc.com/dist/free4/src/unix/$pkgname-$origver-unixsrc.tar.gz)

url="http://www.realvnc.com"
depends=('gcc' 'libxtst' 'libsm')
conflicts=('tightvnc')
build() {
  cd $startdir/src/ && rm *
  wget "http://www.realvnc.com/cgi-bin/download.cgi?product=free4/src/unix&filetype=tar_gz&haveDetails=1&acceptLicense=1"

  tar xvf download.cgi*
  cd $startdir/src/$pkgname-$origver-unixsrc/unix || return 1

  # making vnc (without Xvnc)
  ./configure || return 1
  make || return 1

  # installling:
  mkdir -p $startdir/pkg/usr/{bin,man/man1}
  ./vncinstall $startdir/pkg/usr/bin $startdir/pkg/usr/man

}

