# $Id$
# Maintainer: judd <jvinet@zeroflux.org>

pkgname=grub
pkgver=0.97
pkgrel=12
pkgdesc="A GNU multiboot boot loader"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grub/"
groups=('base')
depends=('ncurses' 'diffutils' 'sed')
source=(ftp://alpha.gnu.org/gnu/grub/grub-$pkgver.tar.gz
        menu.lst
        install-grub
        040_all_grub-0.96-nxstack.patch
        05-grub-0.97-initrdaddr.diff
        i2o.patch
        special-devices.patch
        more-raid.patch
        intelmac.patch
        grub-inode-size.patch
	grub-0.97-gpt.patch)
backup=('boot/grub/menu.lst')
md5sums=('cd3f3eb54446be6003156158d51f4884'
         'cce52ae9ee1f8686cd700b3c967e78f9'
         '3182c4ae4963a16930bc772bba89dacf'
         'eb9d69c46af3a0667c1f651817d7f075'
         'ccd2d757e79e3a03dc19ede7391ed328'
         '826fdbf446067f9861baf9f6a69a4583'
         '49f6d4bcced0bc8bbcff273f3254bbfa'
         'f41f702014a064918d7afc6fc23baa6e'
         '175dc6b9f4ab94e8056c3afb3e34460a'
         'ada26cbc681907823cc4ff2a55b97866'
         '52cd09a6966f12961d11f7b3b7e76bd2')

build() {
  cd $startdir/src/$pkgname-$pkgver

  #set destination architecture here
  DESTARCH="i686"
  #DESTARCH="x86_64"

  # optimizations break the build -- disable them
  # adding special devices to grub, patches are from fedora
  patch -Np1 -i ../special-devices.patch || return 1
  patch -Np1 -i ../i2o.patch || return 1
  patch -Np1 -i ../more-raid.patch || return 1
  patch -Np1 -i ../intelmac.patch || return 1
  # Add support for bigger inode size to e2fs_stage1_5
  patch -Np1 -i ../grub-inode-size.patch || return 1
  # Add gpt support
  # http://bugs.archlinux.org/task/9864
  patch -Np1 -i ../grub-0.97-gpt.patch || return 1

  #arch64 fixes for static build
  if [ "$CARCH" = "x86_64" ]; then
    echo "this package has to be built on i686, won't compile on x86_64"
    sleep 5
  else
    if [ "$DESTARCH" = "x86_64" ]; then
      # patch from gentoo for fixing a segfault
      patch -Np1 -i ../040_all_grub-0.96-nxstack.patch || return 1
      # patch from frugalware to make it boot when more than 2GB ram installed
      patch -Np1 -i ../05-grub-0.97-initrdaddr.diff || return 1
      CFLAGS="-static" ./configure --prefix=/usr --bindir=/bin --sbindir=/sbin
    else
      CFLAGS= ./configure --prefix=/usr --bindir=/bin --sbindir=/sbin
    fi
  fi

  CFLAGS= make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../menu.lst $startdir/pkg/boot/grub/menu.lst
  install -D -m755 ../install-grub $startdir/pkg/sbin/install-grub

  if [ "$DESTARCH" = "x86_64" ]; then
    # fool makepkg into building a x86_64 package
    export CARCH="x86_64"
  fi
}
