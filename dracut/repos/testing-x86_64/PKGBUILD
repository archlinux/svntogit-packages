# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=050
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
            'hardlink: --hardlink option support'
            'multipath-tools: dmraid dracut module support'
            'pigz: faster gzip compression'
            'sbsigntools: uefi_secureboot_cert/key configuration option support')
provides=('initramfs')
backup=('etc/dracut.conf')
source=(https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut/dracut-050.tar{.gz,.sign})
sha512sums=('41ab9e089b91f8cd037dc545c164bbd63fe470bc5475d887f98d291ed5da24876b4cdfc4ae259151e52bfdcb599dce87c0b19d753c97cb4a25b664d8f5b39487'
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
