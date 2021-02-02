# Maintainer: bobpaul

_pkgbase=mautrix-facebook
pkgname=${_pkgbase}-git
pkgver=r447.19e9e20
pkgrel=1
pkgdesc="A double puppeting Facebook bridge with multi-user support for Hangouts"
arch=(any)
conflicts=(mautrix-facebook)
license=(AGPLv3)
url="https://github.com/tulir/mautrix-facebook"
depends=(python
	     python-aiohttp
	     python-alembic
	     python-sqlalchemy
	     python-commonmark
	     python-ruamel-yaml
	     python-mautrix
	     python-magic-git
	     python-fbchat-asyncio
	     python-beautifulsoup4
	     python-pillow
	     python-yaml
	     python-idna
	     python-future
	     python-pycrypto
	     python-asyncpg
	     sudo
	    )
makedepends=(git)
optdepends=()
source=("${_pkgbase}::git+https://github.com/tulir/${_pkgbase}"
	    "usr-share.patch"
	    "README"
	    "mautrix-facebook-db-upgrade"
	    "sysusers-mautrix-facebook.conf"
	    "tmpfiles-mautrix-facebook.conf"
	    "${_pkgbase}.service")
sha256sums=('SKIP'
            '637a4d95fb551394133562b3be27cc7c2d1d5893096e33c9df86f22697fb087d'
            '4e7cad7b07af957fb85cc45faeee12b6ff78c7a731306984449699c300b94054'
            '793016de273d6dc0a2fdfd1090942aa2ec3cc75c0cad333ed231bb8561fddfd0'
            'd981fb6fef944b83a4089683075ab2ae1cf095a6814e4d3bdce500d3309cb617'
            '9e7d00ea24067447fde0f3c4c08ea70760db85975d93496ed82f597cd8c863d6'
            '76da1de365d5df8f85c90050fc8485b64c4275caa6762326ed3deebb045396a3')

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  git reset --hard
  echo 'Apply patch to follow fileplacement guidelines per `man heir`'
  patch < ../usr-share.patch
  echo 'Applying patch to permit use of newest mautrix version'
  sed -i 's/^mautrix==/mautrix>=/' requirements.txt
}

package() {
  cd "$srcdir/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir/"
  install -Dm644 "$srcdir"/README -t "$pkgdir"/etc/synapse/mautrix-facebook/
  install -Dm755 "$srcdir"/mautrix-facebook-db-upgrade -t "$pkgdir"/usr/bin/
  install -Dm644 ${_pkgbase}.service -t  "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/sysusers-mautrix-facebook.conf "$pkgdir"/usr/lib/sysusers.d/mautrix-facebook.conf
  install -Dm644 "$srcdir"/tmpfiles-mautrix-facebook.conf "$pkgdir"/usr/lib/tmpfiles.d/mautrix-facebook.conf
}
