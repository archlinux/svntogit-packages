# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=rrdtool
pkgver=1.8.0
pkgrel=2
pkgdesc="Data logging and graphing application"
arch=('x86_64')
url="https://www.rrdtool.org"
license=('GPL' 'custom')
depends=('libxml2' 'pango' 'ttf-dejavu')
makedepends=('intltool' 'ruby' 'python-setuptools' 'tcl' 'lua51' 'systemd')
optdepends=('perl: to use corresponding binding'
            'tcl: to use corresponding binding'
            'python: to use corresponding binding'
            'ruby: to use corresponding binding'
            'lua51: to use corresponding binding')
options=('!emptydirs' '!makeflags')
source=(https://github.com/oetiker/rrdtool-1.x/releases/download/v$pkgver/rrdtool-$pkgver.tar.gz)
sha256sums=('bd37614137d7a8dc523359648eb2a81631a34fd91a82ed5581916a52c08433f4')

prepare() {
  cd ${pkgname}-${pkgver}

  # fix FS#28521 make ruby install to vendor_ruby instead of site_ruby
  sed -e 's/$(RUBY) ${abs_srcdir}\/ruby\/extconf.rb/& --vendor/' -i bindings/Makefile.am

  # https://github.com/oetiker/rrdtool-1.x/issues/1135
  autoreconf -vi
}

build() {
  cd ${pkgname}-${pkgver}
  LUA=/usr/bin/lua5.1 \
    LUA_CFLAGS="-I/usr/include/lua5.1 -llua5.1" LUA_INSTALL_CMOD="/usr/lib/lua/5.1" \
    ./configure --prefix=/usr --localstatedir=/var --disable-rpath \
    --enable-perl --enable-perl-site-install --with-perl-options='INSTALLDIRS=vendor' \
    --enable-ruby --enable-ruby-site-install --enable-python \
    --enable-lua --enable-lua-site-install --enable-tcl --disable-libwrap
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" includedir=/usr/include install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
