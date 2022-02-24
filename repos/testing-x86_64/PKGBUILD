# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=056
pkgrel=1
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://dracut.wiki.kernel.org"
license=('GPL')
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'pkgconf' 'procps-ng' 'sed' 'systemd' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'git')
optdepends=('binutils: --uefi option support'
            'elfutils: strip binaries to reduce initramfs size'
            'multipath-tools: dmraid dracut module support'
            'pigz: faster gzip compression'
            'sbsigntools: uefi_secureboot_cert/key configuration option support')
provides=('initramfs')
backup=('etc/dracut.conf')
source=(https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut/dracut-${pkgver}.tar{.gz,.sign})
sha512sums=('3a5b82976bfff9d71ca305b786fd9218849d28e0ef36356b19e558e50fefcca540dc15e6d93a15c7a8ade58d51dc32db8e4b0af924b5a9d85fa56a223501a9b6'
            'SKIP')
validpgpkeys=(
  '7F3D64824AC0B6B8009E50504BC0896FB5693595' # Harald Hoyer <harald@redhat.com>
)

build() {
  local prefix=/usr sysconfdir=/etc
  
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" make install
}
