# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=readline
pkgver=5.2
pkgrel=7
pkgdesc="GNU readline library"
arch=(i686 x86_64)
url="ftp://ftp.cwru.edu/pub/bash/"
license=('GPL')
groups=('base')
depends=(glibc ncurses)
backup=("etc/inputrc")
source=(ftp://ftp.cwru.edu/pub/bash/readline-${pkgver}.tar.gz
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-001
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-002
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-003
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-004
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-005
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-006
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-007
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-008
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-009
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-010
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-011
	ftp://ftp.cwru.edu/pub/bash/readline-5.2-patches/readline52-012
        inputrc)
md5sums=('e39331f32ad14009b9ff49cc10c5e751'
         '9d4d41622aa9b230c57f68548ce87d8f'
         'f03e512d14206e37f7d6a748b56b9476'
         '252b42d8750f1a94b6bdf086612dceb2'
         'a32333c2e603a3ed250514e91050e552'
         '8106796c09b789523a3a78ab69c04b6d'
         '512188e2bf0837f7eca19dbf71f182ae'
         'ac17aca62eb6fb398c9f2fe9de540aff'
         '2484c392db021905f112cf97a94dfd4c'
         'fc6eb35d07914fae5c57d49c12483ff7'
         '7a2bf3dc7ac7680b1461a5701100e91b'
         'ef6cef6822663470f6ac8c517c5a7ec6'
         'e3e9f441c8111589855bc363e5640f6c'
         'e5fc955f56d9fa5beb871f3279b8fa8b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  for i in 001 002 003 004 005 006 007 008 009 010 011 012; do
    patch -Np2 -i ${startdir}/src/readline52-${i} || return 1
  done
  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  
  mkdir -p ${startdir}/pkg/etc
  install -m644 ../inputrc ${startdir}/pkg/etc/inputrc

  cd ${startdir}/pkg
  mkdir -pv lib
  mv -v usr/lib/lib{readline,history}.so.5* lib/
  ln -svf ../../lib/libreadline.so.5 usr/lib/libreadline.so
  ln -svf ../../lib/libhistory.so.5 usr/lib/libhistory.so
}
