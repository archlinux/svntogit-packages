# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=coreutils
pkgver=6.11
pkgrel=1
pkgdesc="The basic file, shell and text manipulation utilities of the GNU operating system"
arch=(i686 x86_64)
license=('GPL3')
url="http://www.gnu.org/software/coreutils"
groups=('base')
depends=('glibc>=2.7-7' 'shadow>=4.0.18.2-2' 'pam>=0.99.9.0-2' 'acl>=2.2.45-2')
provides=('mktemp')
conflicts=('mktemp')
replaces=('sh-utils' 'fileutils' 'textutils' 'mktemp')
backup=('etc/pam.d/su')
options=('!emptydirs' !makeflags)
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz
	coreutils-i18n.patch
	coreutils-uname.patch
	coreutils-pam.patch
	coreutils-6.10-configuration.patch
	su)

build() {
  cd $startdir/src/$pkgname-$pkgver
  # added pam patch and i18n patch from fedora cvs
  patch -Np1 -i ../coreutils-pam.patch || return 1
  patch -Np1 -i ../coreutils-i18n.patch || return 1
  patch -Np1 -i ../coreutils-6.10-configuration.patch || return 1
  # from gentoo portage
  patch -Np1 -i ../coreutils-uname.patch || return 1
  # make head and tail recognize the old syntax (eg, tail -10)
  export DEFAULT_POSIX2_VERSION=199209
  autoconf
  ./configure --prefix=/usr ac_cv_func_openat=no --enable-install-program=su --enable-pam
#  make || return 1
  make all su_LDFLAGS="-pie -lpam -lpam_misc" || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/bin/hostname $startdir/pkg/usr/share/man/man1/hostname.1 || return 1
  rm -f $startdir/pkg/usr/bin/uptime $startdir/pkg/usr/share/man/man1/uptime.1 || return 1
  rm -f $startdir/pkg/usr/bin/groups $startdir/pkg/usr/share/man/man1/groups.1 || return 1
  rm -f $startdir/pkg/usr/bin/kill $startdir/pkg/usr/share/man/man1/kill.1|| return 1
  cd $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/bin $startdir/pkg/sbin $startdir/pkg/usr/sbin
  mv su date echo false pwd stty true uname cat tr cut readlink ../../bin
  mv dd cp df du ln ls mv rm dir sync vdir chgrp chmod chown ../../bin
  mv mkdir mknod rmdir shred touch mkfifo dircolors install sleep ../../bin
  mv chroot ../sbin
  ln -sf test [
  ln -sf /bin/sleep $startdir/pkg/usr/bin/sleep
  install -D -m644 $startdir/src/su $startdir/pkg/etc/pam.d/su
}
