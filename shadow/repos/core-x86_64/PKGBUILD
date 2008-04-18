# $Id$
# Maintainer: judd <jvinet@zeroflux.org>

pkgname=shadow
pkgver=4.0.18.2
pkgrel=2
pkgdesc="Shadow password file utilities"
arch=(i686 x86_64)
url='http://pkg-shadow.alioth.debian.org/'
license=('custom')
groups=('base')
backup=(etc/login.defs
        etc/pam.d/{chage,login,passwd,shadow,useradd,usermod,userdel}
        etc/pam.d/{chpasswd,newusers,groupadd,groupdel,groupmod}
	etc/pam.d/{chfn,chgpasswd,groupmems,chsh}
        etc/default/useradd)
depends=('pam')
source=(ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-$pkgver.tar.bz2
        login passwd useradd login.defs adduser shadow.cron.daily
        useradd-default.patch xstrdup.patch shadow-4.0.18.2-useradd-fix-1.patch)
options=(!libtool)
install='shadow.install'

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../xstrdup.patch || return 1
  patch -Np1 -i ../shadow-4.0.18.2-useradd-fix-1.patch || return 1
  # patch etc/default/useradd for Arch defaults - Tom K
  patch -Np1 -i ../useradd-default.patch || return 1
  
  # supress etc/pam.d/*, we provide our own
  sed -i '/^SUBDIRS/s/pam.d//' etc/Makefile.in

  ./configure \
  	--prefix=/usr --libdir=/usr/lib \
	--mandir=/usr/man --sysconfdir=/etc \
	--enable-shared --with-libpam --without-selinux
  make || return 1
  make DESTDIR=$startdir/pkg install

  # license
  install -v -D -m644 COPYING $startdir/pkg/usr/share/licenses/shadow/COPYING

  # interactive useradd
  install -v -D -m755 ../adduser $startdir/pkg/usr/sbin/adduser

  # cron job
  install -v -D -m744 ../shadow.cron.daily $startdir/pkg/etc/cron.daily/shadow

  # login.defs
  install -v -D -m644 ../login.defs $startdir/pkg/etc/login.defs

  # PAM config
  local file
  for file in login passwd; do
    install -v -D -m644 ../$file $startdir/pkg/etc/pam.d/$file
  done
  # we use the 'useradd' PAM file for other similar utilities
  for file in chage chpasswd chfn chsh groupadd groupdel groupmod \
      newusers shadow useradd usermod userdel; do
    install -v -D -m644 ../useradd $startdir/pkg/etc/pam.d/$file
  done
  # add leftover pam files
  for i in chgpasswd groupmems; do 
	install -v -D -m644 etc/pam.d/$i $startdir/pkg/etc/pam.d/$i
  done

  cd $startdir/pkg

  # Remove su - using su from coreutils instead
  rm -v bin/su
  find usr/man -name 'su.1' -exec rm -v {} \;

  # Move shared libs to /lib
  mkdir -pv lib
  mv -v usr/lib/libshadow.so.* lib/
  ln -svf ../../lib/libshadow.so.0 usr/lib/libshadow.so
}
md5sums=('b900467e5c60c78b6d84b0353d1769d5'
         '0aa429de6773ebcdf89db80165379cc6'
         'b84204ab731bd02dca49d0637d44ebec'
         'a31374fef2cba0ca34dfc7078e2969e4'
         '3699bed31154051c0508a890d6d95027'
         '6ce67e423ee19c87ae64f661310b2408'
         '1d64b4113e1d402746d9dd65f28a2c6f'
         '1e49ee3b5b96b47782b22237b95c4bc2'
         '576c00b284b9c180667a56c6cd326f0c'
         '5c0b58c8bee13a57244ec783a8194970')
