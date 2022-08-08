# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>
# Generated by gem2arch (https://github.com/anatol/gem2arch)

_gemname_="curses"
pkgname="ruby-${_gemname_}"
pkgver=1.4.4
pkgrel=1
pkgdesc="Ruby binding for curses, ncurses, and PDCurses"
arch=("x86_64")
url="https://github.com/ruby/curses"
license=("Ruby" "BSD-2-Clause")
depends=("ruby")
makedepends=("ruby-rdoc")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")

package() {
	local _gemdir_="$(ruby -e'puts Gem.default_dir')"

	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir_}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"

	rm "${pkgdir}/${_gemdir_}/cache/${_gemname_}-${pkgver}.gem"
}

sha256sums=('a360d7aef049b3a60343b086d47f3cdd5b4dd7b4b0e621b3eaceb94fd379c903')
