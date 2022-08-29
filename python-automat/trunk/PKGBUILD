# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-automat
pkgver=20.2.0
pkgrel=10
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
depends=('python-attrs' 'python-six')
makedepends=('python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-twisted' 'python-graphviz')
optdepends=('python-graphviz: for automat-visualize'
            'python-twisted: for automat-visualize')
source=("https://github.com/glyph/automat/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-setup-modernize-1.patch::https://github.com/glyph/automat/commit/0b740ea1b1f7e9532175db23193edfb3e83f49a6.patch
        $pkgname-setup-modernize-2.patch::https://github.com/glyph/automat/commit/1a687e23fef2895c8acf2f012d77a0f598d28642.patch
        $pkgname-setup-modernize-3.patch::https://github.com/glyph/automat/commit/2562fa4ddeba5b5945d9482baa4c26a414f5e831.patch)
sha512sums=('ccba3e82f589fedb1f83dfb37a6a42b51a78d8c3e6fea22c9518135ff194f5f70e2f9c5f0eab50b6e116dae92c94754aac8dbf0e670a59015c916991736b4076'
            '913c5aad41af2d3c248bebff30c78b055a9b15514546dc157172d8d393a13425fe8fc60e5ec20c41304e932a7fa86d1c908a84027086db49d10b8a9ed2a106bd'
            '4485c482ff204a5dd064be3d62705c7b1af5fa2bcd1f2ad53ee5dabfed5d1f44ac0a9178b84faad27a179cf7bd813925ddb89b7288df608ec94ada790b0bf020'
            'ad2f101c48031e9587f78ade804880e5465b1199021c855cdf52faafa06eb8d83416eaf802eeb4731fcdddde4b0baa4869cfa2c5a2a07958d59f853600b6aa3d')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd automat-$pkgver
  patch -p1 -i ../$pkgname-setup-modernize-1.patch
  patch -p1 -i ../$pkgname-setup-modernize-2.patch
  patch -p1 -i ../$pkgname-setup-modernize-3.patch
}

build() {
  cd automat-$pkgver
  python setup.py build
}

check() {
  cd automat-$pkgver
  python -m pytest --deselect benchmark
}

package() {
  cd automat-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/python-automat/
}
