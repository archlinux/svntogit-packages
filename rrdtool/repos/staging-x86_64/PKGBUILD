# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=rrdtool
pkgver=1.7.1
pkgrel=2
pkgdesc="Data logging and graphing application"
arch=('x86_64')
url="https://www.rrdtool.org"
license=('GPL' 'custom')
depends=('libxml2' 'pango' 'ttf-dejavu')
makedepends=('intltool' 'ruby' 'python2-setuptools' 'tcl' 'lua51')
optdepends=('perl: to use corresponding binding'
	    'tcl: to use corresponding binding'
            'python2: to use corresponding binding'
            'ruby: to use corresponding binding'
            'lua51: to use corresponding binding')
options=('!emptydirs' '!makeflags')
source=(https://oss.oetiker.ch/rrdtool/pub/rrdtool-${pkgver}.tar.gz
        rrdtool-fix-build.patch::"https://github.com/oetiker/rrdtool-1.x/commit/865a9bad.patch")
sha256sums=('989b778eda6967aa5192c73abafe43e7b10e6100776971a7e79d249942781aae'
            'ff415f4f52353dc5685c21ddbad74995f1ca4454348e52a07096aceac5089284')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|/usr/bin/python|/usr/bin/python2|' examples/stripes.py

  patch -p1 -i ../rrdtool-fix-build.patch
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
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" includedir=/usr/include install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
