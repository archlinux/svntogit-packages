# $Id$
# Maintainer: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=aif
pkgver=2011.10.09
pkgrel=2
pkgdesc="The ArchLinux Installation Framework"
arch=('any')
url="http://projects.archlinux.org/?p=aif.git;a=summary"
license=('GPL3')
depends=('util-linux' 'bash' 'pacman' 'coreutils' 'grub' 'grep' 'awk' 'sed' 'libui-sh')
optdepends=('markdown: to generate the html installation guide'
            'cryptsetup: for encryption support'
            'lvm2: for LVM support'
            'dhcpd: for dhcp networking support'
            'btrfs-progs-unstable: Btrfs support'
            'e2fsprogs: Ext support'
            'jfsutils: JFS support'
            'reiserfsprogs: ReiserFS support'
            'nilfs-utils: Nilfs2 support'
            'xfsprogs: XFS support'
            'ntp: setting date with NTP'
            'dialog: for ncurses support'
            'curl: for the aif-report-issues.sh script'
            'syslinux: syslinux support'
            )
source=(ftp://ftp.archlinux.org/other/aif/aif-$pkgver.tar.gz)
md5sums=('fd52c99e9146da6caf95069e62b83696')

build() {
  cd $srcdir/aif-$pkgver/
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

