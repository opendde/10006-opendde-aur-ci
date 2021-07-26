# Generated by debtap
# Maintainer: mvnsio
# Maintainer: Jack Rubacha < rubacha.jack03@gmail.com >
# Contributor: grueneerle
pkgname=sidekick-browser-stable-bin
pkgver=90.10.12.11432
_pkgver=90.10.12.11432-49b48bb # includes sequence after the pkgver using CDN source, using wget to see redirect
pkgrel=1
pkgdesc="Sidekick is a revolutionary new work OS based on the Chromium browser. Designed to be the ultimate online work experience, it brings together your team and every web tool you use – all in one interface"
arch=('x86_64')
url="https://www.meetsidekick.com/"
license=('unknown')
groups=('')
depends=('alsa-lib>=1.0.16' 'atk>=2.2.0' 'at-spi2-atk>=2.5.3' 'at-spi2-core>=2.9.90' 'bash-completion' 'ca-certificates' 'cairo>=1.6.0' 'dbus>=1.5.12' 'desktop-file-utils' 'expat>=2.0.1' 'gcc>=3.3' 'gcc-libs' 'gdk-pixbuf2>=2.22.0' 'glib2>=2.39.4' 'glibc>=2.16' 'gtk3>=3.9.10' 'hicolor-icon-theme' 'libcups>=1.4.0' 'libdrm>=2.4.38' 'libx11>=1.4.99.1' 'libxcb>=1.9.2' 'libxcomposite>=0.3' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxkbcommon>=0.4.1' 'libxrandr' 'mesa>=8.1' 'nspr>=4.9' 'nss>=3.22' 'pango' 'ttf-liberation' 'xdg-utils>=1.0.2')
optdepends=('libu2f-host'
            'vulkan-icd-loader')
provides=('www-browser')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://sidekick-cdn-production.meetsidekick.com/builds/sidekick-linux-release-x64-${_pkgver}.deb")
sha512sums=('f00817e0c8285f2c40d4e5225c50b2afb703b042867283d48b227e9ba2cc4b382ab2725cfc82e2143e750560b80dfc26dd06e0b5d26c4a7ddecb1dc2ced3b237')

package(){
# Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

 # Install icons.
  for _size in 16 24 32 48 64 128 256; do
    case "${_size}" in
      *) _branding="${pkgdir}/opt/meetsidekick.com/sidekick/" ;;
    esac
    install -Dm644 "${_branding}/product_logo_${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/sidekick-browser.png"
  done
}
