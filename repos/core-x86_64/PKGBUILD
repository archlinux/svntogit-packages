# $Id: PKGBUILD,v 1.100 2008/03/10 22:20:47 tpowa Exp $
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=filesystem
pkgver=2008.03
pkgrel=2
pkgdesc="Base filesystem"
arch=(i686 x86_64)
license=('GPL')
url="http://www.archlinux.org"
groups=('base')
install=filesystem.install
#depends=('sh' 'coreutils')
backup=(etc/fstab etc/crypttab etc/group etc/hosts etc/ld.so.conf etc/passwd \
        etc/shadow etc/gshadow etc/resolv.conf etc/motd etc/nsswitch.conf \
        etc/shells etc/host.conf etc/securetty etc/profile etc/issue)
source=(group issue nsswitch.conf securetty host.conf ld.so.conf \
        passwd shadow fstab crypttab hosts motd resolv.conf shells \
        gshadow services protocols profile)
md5sums=('20354fa6fc7a1a98fdc30b201bc5ac21'
         'cda2226890afb19e6bba62ae60716636'
         '775464ba7588b4976e0c2a02b83123f4'
         '655071da46d2ac03e0fb8a071bf193ea'
         'f28150d4c0b22a017be51b9f7f9977ed'
         '2c24792d97ef3cf0d73b60d4c429730b'
         '4eee5140437e09821e82d689f53439b3'
         'c163cae617cbae36d1eb5546bdb59bcb'
         '4e2f238bae5cbf716ff73c9404404269'
         'e5d8323a4dbee7a6d0d2a19cbf4b819f'
         '81b3cb42a6ddabc2ed2310511ee9c859'
         'd41d8cd98f00b204e9800998ecf8427e'
         '6f48288b6fcaf0065fcb7b0e525413e0'
         '40dac0de4c6b99c8ca97effbd7527c84'
         'ffdf350b692604518c3c37248e7009ff'
         '4dbbde7544ea6799acec9fbb191c6b8e'
         'b32c83ae6886e0525995f7028b2c2967'
         'f2a88eacb5c37201368c916d9e594440')

build()
{
  cd $startdir/pkg
  mkdir -p bin boot dev etc home lib mnt proc root sbin tmp usr var opt srv sys
  chmod 555 proc
  mkdir -p media/{fl,cd,dvd}
  mkdir -p usr/{bin,include,lib,sbin,share/misc,src,man}

  mkdir -p usr/share/man/man{1,2,3,4,5,6,7,8}
  ln -s man3 $startdir/pkg/usr/share/man/man3x

  # fhs compliance
  mkdir -p usr/local/{bin,games,include,lib,man,sbin,share,src}
  mkdir -p var/{cache/man,local,lock,opt,run,spool/mail,tmp,games}
  chmod 1777 var/lock
  mkdir -p var/log/old
  mkdir -p etc/{skel,profile.d}
  mkdir -p lib/modules
  (cd $startdir/pkg/usr; ln -s ../var var)
  (cd $startdir/pkg/var; ln -s spool/mail mail)

  # vsftpd won't run with write perms on /home/ftp
  mkdir -p home/ftp
  chown root.ftp home/ftp
  chmod 555 home/ftp

  chmod 1777 var/spool/mail tmp var/tmp
  chmod 0750 root

  #Allow setgid games to write scores:
  chmod 775 ${startdir}/pkg/var/games
  chown root:50 ${startdir}/pkg/var/games

  cd $startdir/src
  cp fstab crypttab group host.conf hosts issue ld.so.conf motd nsswitch.conf \
    passwd protocols resolv.conf securetty services shadow shells profile \
    $startdir/pkg/etc/
  install -m 600 $startdir/src/gshadow $startdir/pkg/etc/gshadow
  chmod 600 $startdir/pkg/etc/shadow
  chmod 600 $startdir/pkg/etc/crypttab

  # no version any more
  #cat issue | sed "s/#VERSION#/$pkgver/" >$startdir/pkg/etc/issue
  
  # re-add /etc/arch-release, some software uses it
  # to check whether arch is running
  touch $startdir/pkg/etc/arch-release
}
