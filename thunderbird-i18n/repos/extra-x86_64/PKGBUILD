# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=thunderbird-i18n
pkgver=2.0.0.12
pkgrel=1
_languages=be,bg,ca,cs,da,de,el,en-GB,es-AR,es-ES,eu,fi,fr,ga-IE,hu,it,ja,ko,lt,mk,nb-NO,nn-NO,nl,pa-IN,pl,pt-BR,pt-PT,ru,sk,sl,sv-SE,tr,zh-CN,zh-TW
pkgdesc="Language packs for Thunderbird"
arch=(i686 x86_64)
url="http://www.mozilla.com/"
depends=("thunderbird=$pkgver")
eval conflicts=(mozilla-thunderbird-i18n mozilla-thunderbird-{${_languages}} thunderbird-{${_languages}})
makedepends=('unzip')
eval source=(ftp://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/${pkgver}/linux-i686/xpi/{${_languages}}.xpi)
noextract=($(for i in ${source[@]}; do basename $i; done))

build() {
  cd ${startdir}/src
  for lang in $(echo "${_languages}" | sed 's|,| |g'); do
    unzip -o ${lang}.xpi
    sed -i "s|jar:chrome/${lang}.jar|jar:${lang}.jar|" chrome.manifest || return 1
    install -D -m 644 chrome/${lang}.jar ${startdir}/pkg/usr/lib/thunderbird-${pkgver}/chrome/${lang}.jar || return 1
    install -D -m 644 chrome.manifest ${startdir}/pkg/usr/lib/thunderbird-${pkgver}/chrome/${lang}.manifest || return 1
  done
}
md5sums=('04d35a732caf1660e03e22eb9a4ae2d8'
         '61fc3d3653ae55ba1734f14879f82eeb'
         '53e72e9bd7994d14030301250a3499e8'
         '3eb4da4a393877c25c2abd521d051ba5'
         '9e5f26c5477c5ba217019cf0748e623f'
         'ac0084d424149df6207749e99dd2c457'
         'd3edbe3779bbe2415de5df06094ae20c'
         '4a661d9263d8fff78d0a4dda4509b8b0'
         '0175cb9930c3544ae9f490e42fa15535'
         'fbaa1289c78fa661eb393646e2115a84'
         '05a3b8402d3cc995327304664115c7ce'
         'cb5eab67d98b1ab50808f042be3e5d93'
         'a201216c5a93b334164984a9019043b3'
         '16760acd8c3e4d78ab8d5b9027f9c02f'
         '1fd3766bbbb5b9ca2d47c458e41cec8d'
         '59a8730017495e3f1f697d9c78b4559f'
         '89974dd6f13744a30fc276606ed19266'
         'ae60058d29bda383ba012d2c0df52242'
         '9382aa3b868f89bea0d7224f46cd3910'
         'b5bd9fa27a3baf3d0b7a7f9b5c5df721'
         '142eff48adc99f10f572fad9db931197'
         'c72adf250a0dddf87d23654e35021390'
         '720acfc49ba9c266cead4640f413f9bd'
         'f1277ff35a88ee23f8330c25095fe0b7'
         'dd99e73370921fe8d9546fdc54223f1c'
         '99ed9fb27bffdcea032e330ec23501e0'
         '15f2558bae6e08e7691b60bd5bd5cd39'
         'd73bf3479ee8050506fb267792d6f0fb'
         '9b59fa71090d14863a3c055c87b52f11'
         'd6aaf0b2bc321bd169f198c3d4fea867'
         '4a9541f2e2185a9be7168cf785d88974'
         '3be82d439bcc086d1cfcb5312a7d68de'
         'ce79519902fce2c8f8c63fd1d1627dd6'
         '61cff47169374b6cddc0e3e3c8dcf896')
