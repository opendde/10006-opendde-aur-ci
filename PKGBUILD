# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
_pkgname=ttf-iosevka-custom
pkgname=${_pkgname}-git
pkgver=r2317.a3fab8995
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs>=12.16.0' 'npm' 'ttfautohint')
depends=()
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(
  'git+https://github.com/be5invis/Iosevka#branch=dev'
  'private-build-plans.toml.example'
)
sha256sums=(
  'SKIP'
  'fae9ae12fbf94d4276916b0aecc57fb5eb816c5bba03af2127483dbe068896b3'
)

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  buildplans="$HOME/.config/iosevka/private-build-plans.toml"
  if [[ -f "$buildplans" ]]; then
    cp "$buildplans" Iosevka/
  else
    echo ">>> $buildplans not found, using private-build-plans.toml.example"
    cp private-build-plans.toml.example Iosevka/private-build-plans.toml
  fi
}

build() {
  cd Iosevka
  npm install
  npm update
  npm run build -- ttf::${_pkgname#*-}
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
