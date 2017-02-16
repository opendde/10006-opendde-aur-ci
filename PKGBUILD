# Generated by gem2arch (https://github.com/anatol/gem2arch)
# Maintainer : David Phillips <dbphillipsnz@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=rest-client
pkgname=ruby-${_gemname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple HTTP and REST client for Ruby, inspired by the Sinatra microframework style of specifying actions"
arch=("any")
url="https://github.com/rest-client/rest-client"
license=('MIT')
depends=('ruby>=1.9.2'
         'ruby-http-cookie>=1.0.2'
         'ruby-mime-types>1.16'
         'ruby-netrc>=0.7')
options=("!emptydirs")
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('67c5503b4862a7ca6ad5ee0a3449654f399abcb2acdbe94faa59ac4ba3b852ec')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"

	gem install \
		--ignore-dependencies \
		--no-user-install \
		-i "${pkgdir}/${_gemdir}" \
		-n "${pkgdir}/usr/bin" \
		"${_gemname}-${pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

	install -D -m644 \
		"${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
