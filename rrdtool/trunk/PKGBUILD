# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=rrdtool
pkgver=1.7.2
pkgrel=1
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
source=(https://oss.oetiker.ch/rrdtool/pub/rrdtool-${pkgver}.tar.gz)
sha256sums=('a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db')

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
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" includedir=/usr/include install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
