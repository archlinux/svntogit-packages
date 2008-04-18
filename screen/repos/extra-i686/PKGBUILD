# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Committer: dorphell <dorphell@gmx.net>

pkgname=screen
pkgver=4.0.3
pkgrel=5
_ptygroup=5 #the UID of our PTY/TTY group
pkgdesc="Full-screen window manager that multiplexes a physical terminal"
license=('GPL')
arch=('i686' 'x86_64')
install=screen.install
depends=(ncurses libelf shadow gpm)
backup=('etc/screenrc' 'etc/pam.d/screen')
url="ftp://ftp.uni-erlangen.de/pub/utilities/screen"
source=(ftp://ftp.uni-erlangen.de/pub/utilities/screen/screen-${pkgver}.tar.gz \
        screen.pam)
md5sums=('8506fd205028a96c741e4037de6e3c42' '74f7919d7b65436cc2ea5341fa8ca374')

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --enable-pam \
        --with-sys-screenrc=/etc/screenrc --enable-colors256 \
       --enable-rxvt_osc --with-pty-group=$_ptygroup
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${startdir}/pkg/etc/pam.d 
  install -m644 ${startdir}/src/screen.pam ${startdir}/pkg/etc/pam.d/screen

  cd etc/
  mkdir -p ${startdir}/pkg/usr/share/zsh/site-functions/
  install -m644 completer.zsh ${startdir}/pkg/usr/share/zsh/site-functions/screen
  mkdir -p ${startdir}/pkg/etc/skel/
  install -m644 etcscreenrc ${startdir}/pkg/etc/screenrc
  install -m644 screenrc ${startdir}/pkg/etc/skel/.screenrc

  rm -rf ${startdir}/pkg/usr/info
}
