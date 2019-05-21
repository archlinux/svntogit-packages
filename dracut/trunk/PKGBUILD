# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=049
# tag commit of the pkgver
_tag_blob='1a3447fa9bbf0954d62025957362536a482f1f79'
pkgrel=2
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://dracut.wiki.kernel.org"
license=('GPL')
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'procps-ng' 'sed' 'systemd' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'git')
backup=('etc/dracut.conf')
source=("git+https://github.com/dracutdevs/dracut#tag=${_tag_blob}?signed"
        "0001-90crypt-Change-the-module-setup.sh-to-use-uname-r-in.patch")
sha512sums=('SKIP'
            'a4ed8da197fde60cf69803431a61273b0db921fe84589879fdd37697df6e0d95275daf6273eee86077ba93687be6e88da0b26fff60451d5dec2a69fafcf6094d')
validpgpkeys=(
  '4C96E1500F9421CCF82D5DCA034EB370014DF270' # Harald Hoyer <harald@redhat.com>
)

prepare () {
  cd "$srcdir/${pkgname}"

  # patch for arch. we only support x86_64
  patch -Np1 < "$srcdir/0001-90crypt-Change-the-module-setup.sh-to-use-uname-r-in.patch"
}

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
