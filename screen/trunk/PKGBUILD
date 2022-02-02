# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Committer: dorphell <dorphell@gmx.net>

pkgname=screen
pkgver=4.9.0
pkgrel=1
pkgdesc='Full-screen window manager that multiplexes a physical terminal'
url='https://www.gnu.org/software/screen/'
arch=('x86_64')
license=('GPL')
depends=('ncurses' 'pam')
validpgpkeys=('2EE59A5D0C50167B5535BBF1B708A383C53EF3A4'
              '71AA09D9E8870FDB0AA7B61E21F968DEF747ABD7'
              'B4560FD8C9F2DE3BE308EBA3933AD21886F69FBF')
source=("https://ftp.gnu.org/gnu/screen/screen-${pkgver}.tar.gz"{,.sig}
        'tmpfiles.d'
        'pam.d')
sha256sums=('f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4'
            'SKIP'
            '1f33ce4faca7bd05dd80403411af31e682d5d23e79558e884ae5a35f1dd96223'
            '971c25929ea97422c09e10679ab98e9e6c59295aae1a4a9970909d2206e23090')

backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!makeflags')

_ptygroup=5 #the UID of our PTY/TTY group

prepare() {
  cd ${pkgname}-${pkgver}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --enable-colors256 \
    --enable-pam \
    --enable-rxvt_osc \
    --enable-telnet \
    --with-pty-group=$_ptygroup \
    --with-socket-dir=/run/screens \
    --with-sys-screenrc=/etc/screenrc \
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 ../pam.d "${pkgdir}"/etc/pam.d/screen
  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/screen.conf

  install -Dm644 etc/etcscreenrc "${pkgdir}"/etc/screenrc
  install -Dm644 etc/screenrc "${pkgdir}"/etc/skel/.screenrc
}
