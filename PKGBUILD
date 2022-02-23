# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt
pkgver=2.0.4
pkgrel=1
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPLv3")
conflicts=("liquidprompt-git")
depends=("ncurses"
	     "grep"
	     "gawk"
	     "sed"
	     "procps-ng"
	     "coreutils")
optdepends=("acpi: Battery and temperature status"
	        "lm_sensors: Temperature status"
            "screen: Show detached GNU Screen session status"
            "tmux: Show detached tmux session status"
            "git: Show Git repository status"
            "mercurial: Show Mercurial repository status"
            "subversion: Show Subversion repository status"
            "breezy: Show Bazaar repository status"
            "fossil: Show Fossil repository status")
source=(https://github.com/nojhan/liquidprompt/archive/v$pkgver.tar.gz)
sha256sums=('9e770029e78e0669031320b27e7614dea42547653c9bdc459f4f45c7627df0b2')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 liquidprompt "$pkgdir/usr/bin/liquidprompt"
	install -Dm644 liquidpromptrc-dist "$pkgdir/etc/liquidpromptrc"
}

# vim: set ts=8 sw=8 tw=0 noet :
