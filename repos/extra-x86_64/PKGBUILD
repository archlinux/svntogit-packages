# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=049
# tag commit of the pkgver
_tag_blob='1a3447fa9bbf0954d62025957362536a482f1f79'
pkgrel=1
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://dracut.wiki.kernel.org"
license=('GPL')
groups=()
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'procps-ng' 'sed' 'systemd' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'gcc' 'git' 'pkgconf')
provides=("${pkgname}")
# do not conflict on mkinitcpio yet
conflicts=("${pkgname}")
backup=('etc/dracut.conf')
source=("git+https://github.com/dracutdevs/dracut#tag=${_tag_blob}?signed")
md5sums=('SKIP')
validpgpkeys=(
  '4C96E1500F9421CCF82D5DCA034EB370014DF270' # Harald Hoyer <harald@redhat.com>
)

build() {
  local prefix=/usr sysconfdir=/etc
  
  cd "$srcdir/${pkgname}"

  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

package() {
  cd "$srcdir/${pkgname}"

  DESTDIR="$pkgdir" make install
}
