# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-twisted
pkgver=22.8.0
pkgrel=1
pkgdesc="Asynchronous networking framework written in Python"
arch=('any')
url="https://twistedmatrix.com/"
license=('MIT')
depends=('python-zope-interface' 'python-constantly' 'python-incremental' 'python-automat'
         'python-hyperlink' 'python-attrs' 'python-typing_extensions')
makedepends=('python-setuptools')
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
              'python-cython-test-exception-raiser' 'python-pyopenssl' 'python-service-identity')
# Conflicts with the command line tools used to be provided by the python2 package.
conflicts=("python2-twisted<=20.3.0-3")
source=("https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz")
sha512sums=('890a11ca55fd88636f404678c6fad3fcea9d0604b1b37681a4b92ea74952bc4d1b96a571dde39a4aa82d966121156801f6b42dbd0bb5a309503591a7a77c6d71')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
