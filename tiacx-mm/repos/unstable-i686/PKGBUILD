# Maintainer: James Rayner <iphitus@gmail.com>
_kernver=2.6.23-mm

pkgname=tiacx-mm
pkgver=20070101
pkgrel=1
pkgdesc="OpenSource module for Texas Instruments ACX100/ACX111 wireless chips. For kernel26mm."
arch=(i686 x86_64)
url="http://acx100.sourceforge.net/"
depends=('wireless_tools' 'kernel26mm' 'tiacx-firmware')
install=acx.install
source=(http://www.cmartin.tk/acx/acx-$pkgver.tar.bz2 kernel-2.6.22.patch)

build() {
    cd $startdir/src/acx-$pkgver
    patch -Np1 -i ../kernel-2.6.22.patch || return 1
    make -C /lib/modules/$_kernver/build M=`pwd`
    install -D acx.ko $startdir/pkg/lib/modules/$_kernver/extra/acx.ko
    sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
md5sums=('ec6322b9c82781897a9433ef0cefda6f'
         'fb53485b5d8c9b7bdefd870cd25bf51b')
sha1sums=('5c7259c09bc754529910aceead6087876177a143'
          'a00449d4165c73e838692b1e0c5e5457f71646f9')
