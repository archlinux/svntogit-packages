# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-twisted
pkgver=21.7.0
pkgrel=4
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
              'python-cython-test-exception-raiser' 'python-pyopenssl')
# Conflicts with the command line tools used to be provided by the python2 package.
conflicts=("python2-twisted<=20.3.0-3")
source=("https://github.com/twisted/twisted/archive/twisted-$pkgver.tar.gz"
        python310.patch)
sha512sums=('a946769a6bc6c72af26e7763b9e0675788f134b4d005ea89d935da1b1d5f60d92c84fdb2615e442e7da2b98291ee8a63d5236ec7ba72ef04ad3f847b092feecb'
            '5402256d06cbee74d575bdc57b8a3df2224aad531b083050c7a4e66e61b6ed2610e13de6a4346719318c076cabffce473e5dd0e14638cee6fd1cf930a50608c5')

prepare() {
  cd twisted-twisted-$pkgver
  # Avoid currentThread() DeprecationWarning (breaks tests in other packages)
  # Related upstream PR: https://github.com/twisted/twisted/pull/1671
  patch -Np1 -i ../python310.patch
  # Remove upper bounds
  sed -i 's/, < 4.0//;s/, < 2.0//' setup.cfg
}

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
