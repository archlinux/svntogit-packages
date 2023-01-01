# https://aur.archlinux.org/hplip-lite.git 

_pkgname=hplip
pkgname="$_pkgname"_lite
pkgver=3.22.10
pkgrel=1
pkgdesc="Only Print drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="https://hplipopensource.com"
license=('GPL2' 'custom')
depends=(libjpeg-turbo libcups)
makedepends=(python)
provides=('hplip')
backup=('etc/hp/hplip.conf')
conflicts=('hplip')
optdepends=('cups: for printing support')
source=(https://downloads.sourceforge.net/${_pkgname}/$_pkgname-$pkgver.tar.gz)
sha256sums=('85718493cc8acad0f4e684b274aa75ef75b43b6ea4b40c3f231ff218631cebbc')

prepare() {
 cd "$_pkgname"-$pkgver
 rm -rf ./PPD_HP
}

build() {
 cd "$_pkgname"-$pkgver
 ./configure --prefix=/usr \
    --enable-lite-build \
    --disable-doc-build \
    --disable-fax-build \
    --disable-network-build \
    --disable-scan-build
make
}

package() {
 cd "$_pkgname"-$pkgver
 make DESTDIR="${pkgdir}/" install
    
  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 COPYING
}
