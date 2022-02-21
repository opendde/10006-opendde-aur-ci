# Maintainer: robertoszek <robertoszek@robertoszek.xyz>
pkgname=python-pleroma-bot
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Bot for mirroring one or multiple Twitter accounts in Pleroma/Mastodon."
arch=("any")
url="https://github.com/robertoszek/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("f7272844170a746a73781dc26539deddb1de36f36b2199ac308a0b69a37ee510")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py build
  python -m setuptools.launch setup.py build
}

package() {
  depends=("python-oauthlib" "python-requests-oauthlib" "python-requests" "python-pyaml")
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  mkdir -p "${pkgdir}/var/log/pleroma-bot"
  install -Dm 600 "${srcdir}/${_name}-${pkgver}/config-minimal.yml.sample" ${pkgdir}/etc/pleroma-bot/config.yml
  install -Dm 644 "${srcdir}/${_name}-${pkgver}/pleroma-bot.service" "${pkgdir}/usr/lib/systemd/system/pleroma-bot.service"
}

