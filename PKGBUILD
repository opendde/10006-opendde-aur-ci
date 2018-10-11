# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-slab-custom-git
pkgver=r1145.68b55c13
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
provides=()
source=(
  "git+https://github.com/be5invis/Iosevka"
  "private-build-plans.toml"
)
md5sums=(
  'SKIP'
  '7d6b77730ff5400d69e004cc1921ea19'
)

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  buildplans="$HOME/.config/iosevka/private-build-plans.toml"
  [[ -f "$buildplans" ]] && cp "$buildplans" ../ || echo "$buildplans not found, using pkgbuild creator's"
  cp ../private-build-plans.toml Iosevka/
}

build() {
  cd Iosevka
  npm install
  npm run build -- ttf:iosevka-term-slab-custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
