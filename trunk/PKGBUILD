# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
pkgname=zsh
pkgver=4.3.5
pkgrel=2
pkgdesc="A very advanced and programmable command interpreter (shell) for UNIX"
arch=('i686' 'x86_64')
url="http://www.zsh.org/"
license=('custom')
depends=('ncurses')
install="zsh.install"
source=(ftp://ftp.zsh.org/pub/$pkgname-$pkgver.tar.bz2 usr_zsh.sh)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --bindir=/bin \
    --enable-etcdir=/etc/zsh \
	--enable-zshenv=/etc/zsh/zshenv \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-zprofile=/etc/profile \
    --enable-zshrc=/etc/zsh/zshrc \
    --enable-maildir-support \
	--with-term-lib="ncursesw" \
	--enable-multibyte \
	--enable-function-subdirs \
	--enable-zsh-mem \
	--with-tcsetpgrp \
    --enable-zsh-secure-free
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m 755 $startdir/src/usr_zsh.sh $startdir/pkg/usr/bin/zsh
  install -D -m644 LICENCE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('db0d4b71da8e5877fa1e29d4cea38b8c'
         '7b7afc638a9274cc16a3546ca2fff2ff')
sha1sums=('9ab505ff4c029b4905d2c4b741f0f0d42e4375c9'
          '762070405771e6392b671d40ad7e85946654b9df')
