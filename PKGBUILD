# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=prosody-mod-invites-register
pkgver=2021.06.25
pkgrel=1
_commit="06c9c9ef0a51"
pkgdesc="Allow account registration using invite tokens"
arch=('any')
url="https://modules.prosody.im/mod_invites_register.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_invites_register"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
  find . -type f ! -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
