# $Id$
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Maintainer: James Rayner <iphitus@gmail.com>

pkgname=ipw3945-mm
pkgver=1.2.1
pkgrel=2
pkgdesc="Driver for the Intel PRO/Wireless 3945ABG miniPCI express adapter. For kernel26mm"
arch=(i686 x86_64)
url="http://ipw3945.sourceforge.net"
license=""
depends=('wireless_tools' 'kernel26mm' 'ipw3945-ucode' 'ipw3945d')
install=ipw3945.install
source=(http://optusnet.dl.sourceforge.net/sourceforge/ipw3945/ipw3945-$pkgver.tgz)

_kernver=2.6.23-mm

build() {
  cd $startdir/src/ipw3945-$pkgver
  sed -i -e "s:^#\(CONFIG_IPW3945_QOS\)=.*:\1=y:" \
           -e "s:^# \(CONFIG_IPW3945_MONITOR\)=.*:\1=y:" \
           -e "s:^# \(CONFIG_IEEE80211_RADIOTAP\)=.*:\1=y:" \
           -e "s:^# \(CONFIG_IPW3945_PROMISCUOUS\)=.*:\1=y:" \
           Makefile
  make KSRC=/lib/modules/${_kernver}/build IEEE80211_IGNORE_DUPLICATE=y
  #Install kernel module
  install -D -m 644 ipw3945.ko  $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless/ipw3945/ipw3945.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
md5sums=('9d6b2116122beb33a0d1d923ea49065c')
sha1sums=('adadefc7b9f6af8faa9fb57bace25ad543fd631d')
