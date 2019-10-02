# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=049
# tag commit of the pkgver
_tag_blob='1a3447fa9bbf0954d62025957362536a482f1f79'
pkgrel=4
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://dracut.wiki.kernel.org"
license=('GPL')
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'pkgconf' 'procps-ng' 'sed' 'systemd' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'git')
provides=('initramfs')
backup=('etc/dracut.conf')
source=("git+https://github.com/dracutdevs/dracut#tag=${_tag_blob}?signed")
sha512sums=('SKIP')
validpgpkeys=(
  '4C96E1500F9421CCF82D5DCA034EB370014DF270' # Harald Hoyer <harald@redhat.com>
)

_backports=(
  #Replace $(arch) by $(uname -m)
  '0585725908c9238e5da6b7768c05bf0ac0a0a015'
)

_reverts=(
)

prepare() {
  cd "$srcdir/${pkgname}"

  local _c
  
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"  
    git cherry-pick -n "${_c}"
  done

  for _c in "${_reverts[@]}"; do
    git log --oneline -1 "${_c}"
    git revert -n "${_c}"
  done
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
