# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=rrdtool
pkgver=1.7.0
pkgrel=5
pkgdesc="Data logging and graphing application"
arch=('x86_64')
url="http://www.rrdtool.org"
license=('GPL' 'custom')
depends=('libxml2' 'pango' 'ttf-dejavu')
makedepends=('intltool' 'ruby' 'python2-setuptools' 'tcl' 'lua51')
optdepends=('perl: to use corresponding binding'
	    'tcl: to use corresponding binding'
            'python2: to use corresponding binding'
            'ruby: to use corresponding binding'
            'lua51: to use corresponding binding')
options=('!emptydirs' '!makeflags')
source=(http://oss.oetiker.ch/rrdtool/pub/rrdtool-${pkgver}.tar.gz)
sha1sums=('15a2009e2ee67eb41a2598d1a0f1f7cf1a651c78')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|/usr/bin/python|/usr/bin/python2|' examples/stripes.py
  # fix FS#28521 make ruby install to vendor_ruby instead of site_ruby
  sed -e 's/$(RUBY) ${abs_srcdir}\/ruby\/extconf.rb/& --vendor/' -i bindings/Makefile.am
  aclocal
  automake
}

build() {
  cd ${pkgname}-${pkgver}
  PYTHON=python2 LUA=/usr/bin/lua5.1 \
    LUA_CFLAGS="-I/usr/include/lua5.1 -llua5.1" LUA_INSTALL_CMOD="/usr/lib/lua/5.1" \
    ./configure --prefix=/usr --localstatedir=/var --disable-rpath \
    --enable-perl --enable-perl-site-install --with-perl-options='INSTALLDIRS=vendor' \
    --enable-ruby --enable-ruby-site-install --enable-python \
    --enable-lua --enable-lua-site-install --enable-tcl --disable-libwrap
  make LIBS+="-lglib-2.0"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" includedir=/usr/include install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
