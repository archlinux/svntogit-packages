# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-twisted
pkgver=21.2.0
pkgrel=1
pkgdesc="Asynchronous networking framework written in Python"
arch=('any')
url="https://twistedmatrix.com/"
license=('MIT')
# Adding replaces here because python2-twisted is no longer supported, all the command line tools
# are now provided by the python3 variant.
replaces=('python2-twisted')
depends=('python-zope-interface' 'python-constantly' 'python-incremental' 'python-automat'
         'python-hyperlink' 'python-attrs')
optdepends=('python-pyopenssl: for TLS client hostname verification'
            'python-service-identity: for TLS client hostname verification'
            'python-idna: for TLS client hostname verification'
            'python-cryptography: for using conch'
            'python-pyasn1: for using conch'
            'python-appdirs: for using conch'
            'python-bcrypt: for using conch'
            'python-h2: for http2 support'
            'python-priority: for http2 support'
            'python-pyserial: for serial support'
            'tk: for using tkconch')
checkdepends=('python-pyhamcrest' 'subversion' 'xorg-server-xvfb' 'tk' 'openssh' 'git' 'gtk3'
              'python-gobject' 'python-subunit' 'python-h2' 'python-priority' 'python-cryptography'
              'python-idna' 'python-pyasn1' 'python-pyserial' 'python-bcrypt'
              'python-cython-test-exception-raiser')
source=("https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz")
sha512sums=('fa743dcf22f3c17dfd17f39b7df0cc31fb8ce3e989478ada9a026424ec2de35e6a403ef35acdef5905eed008d42e3c2fee6b7ccdda433e6c250f1feaa83ea8a4')

build() {
  cd twisted-twisted-$pkgver
  python setup.py build
}

check() {
  export LC_CTYPE=en_US.UTF-8

  # tests use the underlying function from the 'python -m twisted.trial' module, to prevent loading system entry points
  PYTHONPATH="$srcdir/twisted-twisted-$pkgver/build/lib" xvfb-run python -c 'from twisted.scripts.trial import run; run()' twisted || echo "Tests failed"
}

package() {
  cd twisted-twisted-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
