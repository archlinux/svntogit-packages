# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Jeramy Rutley <jrutley@gmail.com>

pkgname=(ruby ruby-docs)
pkgver=3.0.4
pkgrel=1
arch=(x86_64)
url='https://www.ruby-lang.org/en/'
license=(BSD custom)
makedepends=(gdbm openssl libffi doxygen graphviz libyaml ttf-dejavu tk)
options=(!emptydirs !lto) # Disable LTO until fixes for https://bugs.ruby-lang.org/issues/18062 released
source=(https://cache.ruby-lang.org/pub/ruby/${pkgver:0:3}/ruby-${pkgver}.tar.xz)
sha512sums=('53bf7dd403b0c68af9691882ad8ed7422c8d1f496627428fb4c3caf0b0313715524b744c5f453aced2d49e16e55f3f45b46b9a77aa3097dbfcae7caa0208194b')

build() {
  cd ruby-${pkgver}

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sharedstatedir=/var/lib \
    --libexecdir=/usr/lib/ruby \
    --enable-shared \
    --disable-rpath \
    --with-dbm-type=gdbm_compat

  make
}

check() {
  cd ruby-${pkgver}

  make test
}

package_ruby() {
  pkgdesc='An object-oriented language for quick and easy programming'
  depends=(gdbm openssl libffi libyaml libxcrypt gmp zlib rubygems ruby-irb)
  optdepends=(
      'ruby-docs: Ruby documentation'
      'tk: for Ruby/TK'
  )

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-nodoc

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby/BSDL"

  rubyver=${pkgver:0:3}.0

  # remove rubygems as it shipped as a separate package
  rm -r "${pkgdir}"/usr/lib/ruby/${rubyver}/{rubygems,rubygems.rb}
  rm "${pkgdir}"/usr/bin/gem

  # remove bundler as it shipped as a separate package
  rm -r "${pkgdir}"/usr/lib/ruby/${rubyver}/{bundler,bundler.rb}
  rm "${pkgdir}"/usr/bin/{bundle,bundler}
  rm "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/specifications/default/bundler-*.gemspec

  # remove bundled rdoc gem
  rm -r "${pkgdir}"/usr/lib/ruby/${rubyver}/{rdoc,rdoc.rb}
  rm "${pkgdir}"/usr/bin/{rdoc,ri}
  rm "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/specifications/default/rdoc-*.gemspec
  rm "${pkgdir}"/usr/share/man/man1/ri.1

  # remove irb as it is a separate package now
  rm -r "${pkgdir}"/usr/lib/ruby/${rubyver}/{irb,irb.rb}
  rm "${pkgdir}"/usr/bin/irb
  rm "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/specifications/default/irb-*.gemspec
  rm "${pkgdir}"/usr/share/man/man1/irb.1

  # remove other binaries that are shipped as separate packages
  rm "${pkgdir}"/usr/bin/{rake,rbs,typeprof,erb,racc}
  rm "${pkgdir}"/usr/share/man/man1/erb.1

  # remove all bundled gems to avoid conflicts with ruby-* Arch packages
  rm -r "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/gems/*
  rm "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/specifications/*.gemspec
  rm "${pkgdir}"/usr/lib/ruby/gems/${rubyver}/cache/*.gem
}

package_ruby-docs() {
  pkgdesc='Documentation files for ruby'

  cd ruby-${pkgver}

  make DESTDIR="${pkgdir}" install-doc install-capi

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/ruby-docs/LICENSE"
  install -D -m644 BSDL "${pkgdir}/usr/share/licenses/ruby-docs/BSDL"
}
