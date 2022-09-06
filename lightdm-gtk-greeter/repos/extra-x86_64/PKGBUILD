# Maintainer: Maxime Gauduin <alucrydarchlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=lightdm-gtk-greeter
pkgver=2.0.8
pkgrel=3
epoch=1
pkgdesc='GTK+ greeter for LightDM'
arch=(x86_64)
url=https://github.com/Xubuntu/lightdm-gtk-greeter
license=(
  GPL3
  LGPL3
)
depends=(
  gtk3
  lightdm
)
makedepends=(
  exo
  git
  gobject-introspection
  intltool
  xfce4-dev-tools
)
backup=(etc/lightdm/lightdm-gtk-greeter.conf)
_tag=8008f297f7d0b34b875a837d41f77cf57e7b3f7c
source=(git+https://github.com/Xubuntu/lightdm-gtk-greeter.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd lightdm-gtk-greeter
  git describe --tags | sed 's/^lightdm-gtk-greeter-//'
}

prepare() {
  cd lightdm-gtk-greeter
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd lightdm-gtk-greeter
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/lightdm \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-libxklavier \
    --enable-kill-on-sigterm \
    --disable-at-spi-command \
    --disable-indicator-services-command \
    --disable-libido \
    --disable-libindicator \
    --disable-static
  make
}

package() {
  make DESTDIR="${pkgdir}" -C lightdm-gtk-greeter install
}

# vim: ts=2 sw=2 et:
