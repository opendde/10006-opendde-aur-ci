# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>
# Contributor: Cameron Katri <katri.cameron@gmail.com>
# Contributor: Plague-doctor <plague <at>> privacyrequired <<dot>> com >
# Contributor: me at oguzkaganeren dot com dot tr
# Contributor: Rowisi < nomail <at> private <dot> com >

pkgname=vscodium-bin
_pkgname=VSCodium
pkgver=1.63.1
pkgrel=1
pkgdesc="Binary releases of VS Code without MS branding/telemetry/licensing."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/VSCodium/vscodium"
license=('MIT')
depends=(
        fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss
        'glibc>=2.28-4'
        )
optdepends=(
        'gvfs: For move to trash functionality'
        'libdbusmenu-glib: For KDE global menu'
)
provides=('codium' 'vscodium')
conflicts=('vscodium' 'vscodium-git')

sha256sums=('a665ef6e2a1711df2552d7ae49fd7f30f7a2d7e0dea71c7c5f4c90764d8c37ce'
            'fd6b46c021e4f0b75d27fcf67481019dbbaa7059ea186437a47a6b6ae8bb574f')
sha256sums_x86_64=('983719c723a2b30bae940ad023bd7fd0addc81436fab31e1dbed525af75df9dc')
sha256sums_aarch64=('a5c62fb072e15eec131d90fd35be7dda4b4409ff45a243fb4e491b96923df17a')
sha256sums_armv7h=('9637018014223ca1c9ce7cb1bda60c3b1766e887d8444074f128d5dd235961e5')
source=('vscodium-bin.desktop'
        'vscodium-bin-uri-handler.desktop')
source_x86_64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.tar.gz")
source_armv7h=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-armhf-${pkgver}.tar.gz")
source_aarch64=("https://github.com/VSCodium/vscodium/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.tar.gz")

shopt -s extglob

package() {
  install -d -m755 ${pkgdir}/opt/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
  cp -r ${srcdir}/!(vscodium-bin.desktop|${pkgname}-${pkgver}.tar.gz) ${pkgdir}/opt/${pkgname}
  ln -s /opt/${pkgname}/bin/codium ${pkgdir}/usr/bin/codium
  ln -s /opt/${pkgname}/bin/codium ${pkgdir}/usr/bin/vscodium
  install -D -m644 ${srcdir}/vscodium-bin.desktop ${pkgdir}/usr/share/applications/codium.desktop
  install -D -m644 ${srcdir}/vscodium-bin-uri-handler.desktop ${pkgdir}/usr/share/applications/codium-uri-handler.desktop
  install -D -m644 ${srcdir}/resources/app/resources/linux/code.png \
          ${pkgdir}/usr/share/pixmaps/vscodium.png
}
