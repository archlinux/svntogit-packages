# $Id$ 
# Maintainer: Tom Killian <tom@archlinux.org>

pkgname=kernel26mm
_basekernel=2.6.24
_basepatch=2.6.25-rc5
#_mmver=${_basekernel}-mm1
_mmver=${_basepatch}-mm1
pkgver=${_mmver//-/.}
pkgrel=1
pkgdesc="The Linux Kernel and modules, Andrew Morton's -mm tree"
arch=(i686 x86_64)
url="http://www.kernel.org"
backup=(etc/mkinitcpio.d/kernel26mm-fallback.conf \
        etc/mkinitcpio.d/kernel26mm.preset)
depends=('module-init-tools' 'mkinitcpio>=0.5.17')
replaces=('rt2x00-cvs-mm' 'iwlwifi-mm')
install=kernel26.install
#options=('!ccache')
license=('GPL')
source=(http://www2.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2
        http://www2.kernel.org/pub/linux/kernel/v2.6/testing/patch-${_basepatch}.bz2
        http://www2.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/${_basepatch}/${_mmver}/${_mmver}.bz2
        #http://www2.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/${_basekernel}/${_mmver}/${_mmver}.bz2
        #Hotfixes etc - add below if necessary
        ide-mm-ide-add-ide-4drives-host-driver-take-3.patch
        config
        config.x86_64
        logo_linux_clut224.ppm
        logo_linux_mono.pbm
        logo_linux_vga16.ppm
        kernel26mm-fallback.conf
        kernel26mm.preset)

build() {
  KARCH=x86

  cd $startdir/src/linux-${_basekernel}

  patch -Np1 -i ../patch-${_basepatch} || return 1
  patch -Np1 -i ../${_mmver} || return 1
  #Apply hotfixes etc if necessary
  #Following patch reversed - ref: http://lkml.org/lkml/2008/3/11/282
  patch -Rfp1 -i ../ide-mm-ide-add-ide-4drives-host-driver-take-3.patch

  # remove the extraversion from Makefile
  sed -i 's|^EXTRAVERSION =.*$|EXTRAVERSION =|g' Makefile  

  # Arch logo!
  cp ../logo_linux_clut224.ppm drivers/video/logo/
  cp ../logo_linux_mono.pbm drivers/video/logo/
  cp ../logo_linux_vga16.ppm drivers/video/logo/
  if [ "$CARCH" == "x86_64" ]; then
    cat ../config.x86_64 > ./.config
  else
    # get rid of the 'i' in i686
    carch=$(echo $CARCH | sed 's|i||')
    cat ../config | sed "s|#CARCH#|$carch|g" >./.config
  fi
  # build the full kernel version to use in pathnames
  . ./.config
  #_kernver=${_basekernel/-*}${CONFIG_LOCALVERSION}
  _kernver=${_basepatch/-*}${CONFIG_LOCALVERSION}

  # load configuration
  yes "" | make config || return 1
  #make oldconfig || return 1
  #make menuconfig || return 1
  
  # STOP HERE
  #msg "Stopping build ..."
  #return 1

  # build!
  make bzImage modules || return 1
  mkdir -p $startdir/pkg/{lib/modules,boot}
  make INSTALL_MOD_PATH=$startdir/pkg modules_install || return 1
  cp System.map $startdir/pkg/boot/System.map26mm
  cp arch/$KARCH/boot/bzImage $startdir/pkg/boot/vmlinuz26mm
  install -D -m644 Makefile \
    $startdir/pkg/usr/src/linux-${_kernver}/Makefile
  install -D -m644 Kbuild \
    $startdir/pkg/usr/src/linux-${_kernver}/Kbuild
  install -D -m644 kernel/Makefile \
    $startdir/pkg/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config \
    $startdir/pkg/usr/src/linux-${_kernver}/.config
  install -D -m644 .config $startdir/pkg/boot/kconfig26mm
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/include

  for i in acpi asm-{generic,x86} config linux math-emu media net pcmcia scsi sound video xen; do
    cp -a include/$i $startdir/pkg/usr/src/linux-${_kernver}/include/
  done
  
  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers $startdir/pkg/usr/src/linux-${_kernver}
  cp -a scripts $startdir/pkg/usr/src/linux-${_kernver}
  # fix permissions on scripts dir
  chmod og-w -R $startdir/pkg/usr/src/linux-${_kernver}/scripts
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/.tmp_versions
  
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/arch/$KARCH/kernel
  cp arch/$KARCH/Makefile $startdir/pkg/usr/src/linux-$_kernver/arch/$KARCH/Makefile
  if [ "$CARCH" = "i686" ]; then
    cp arch/$KARCH/Makefile_32.cpu $startdir/pkg/usr/src/linux-$_kernver/arch/$KARCH
  fi
  cp arch/$KARCH/kernel/asm-offsets.s $startdir/pkg/usr/src/linux-${_kernver}/arch/$KARCH/kernel/
  #cp arch/$KARCH/kernel/asm-offsets.c $startdir/pkg/usr/src/linux-${_kernver}/arch/$KARCH/kernel/
  #cp arch/$KARCH/kernel/sigframe.h $startdir/pkg/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

  # add headers for lirc package
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/drivers/media/video
  cp drivers/media/video/*.h  $startdir/pkg/usr/src/linux-${_kernver}/drivers/media/video/
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo zc0301; do
   mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/drivers/media/video/$i
   cp -a drivers/media/video/$i/*.h $startdir/pkg/usr/src/linux-${_kernver}/drivers/media/video/$i
  done
  # add dm headers
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/drivers/md
  cp drivers/md/*.h  $startdir/pkg/usr/src/linux-${_kernver}/drivers/md
  # add inotify.h
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/include/linux
  cp include/linux/inotify.h $startdir/pkg/usr/src/linux-${_kernver}/include/linux/
  # add CLUSTERIP file for iptables
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/net/ipv4/netfilter/
  cp net/ipv4/netfilter/ipt_CLUSTERIP.c $startdir/pkg/usr/src/linux-${_kernver}/net/ipv4/netfilter/
  # add wireless headers
  mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/net/mac80211/
  cp net/mac80211/*.h $startdir/pkg/usr/src/linux-${_kernver}/net/mac80211/
  # add vmlinux
  cp vmlinux $startdir/pkg/usr/src/linux-${_kernver}
  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do 
    mkdir -p $startdir/pkg/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    cp $i $startdir/pkg/usr/src/linux-${_kernver}/$i
  done

  cd $startdir/pkg/usr/src/linux-${_kernver}/include && ln -s asm-$KARCH asm

  chown -R root.root $startdir/pkg/usr/src/linux-${_kernver}
  cd $startdir/pkg/lib/modules/${_kernver} && \
    (rm -f source build; ln -sf ../../../usr/src/linux-${_kernver} build)
  # install fallback mkinitcpio.conf and preset file
  install -m644 -D $startdir/src/kernel26mm-fallback.conf $startdir/pkg/etc/mkinitcpio.d/kernel26mm-fallback.conf || return 1
  install -m644 -D $startdir/src/kernel26mm.preset $startdir/pkg/etc/mkinitcpio.d/kernel26mm.preset || return 1
  # set correct depmod command for install
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/kernel26.install || return 1
  echo -e "# NEVER EDIT THIS FILE\nALL_kver='${_kernver}'" > ${startdir}/pkg/etc/mkinitcpio.d/kernel26mm.kver || return 1
  
  # remove unneeded architectures
  rm -rf $startdir/pkg/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}
md5sums=('3f23ad4b69d0a552042d1ed0f4399857'
         '6f5fbe9f3655e53c561c4fea9bf2f525'
         '6a31008eadbaf9376dd93871a79651fe'
         'd27f77f42ac274ebe8cfed4e28ecdc1f'
         '026adf59cafa6de3c7c8f822f8dbbd44'
         'bc3cd6b560d947c9bfeac39315110831'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         'a6f0377c814da594cffcacbc0785ec1a'
         '8c579c72a4f7187de6b496aec88250ed'
         '55f6c2c0131cdbafc388ad1d9a3a37c3')
