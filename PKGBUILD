# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.22.2
pkgrel=2
pkgdesc='Docker-powered PaaS that helps build and manage the lifecycle of applications'
arch=('any')
url='https://github.com/dokku/dokku'
license=('MIT')
depends=(
  'bind-tools'
  'cpio'
  'docker'
  'dos2unix'
  'go'
  'gliderlabs-sigil'
  'herokuish'
  'net-tools'
  'nginx'
  'openbsd-netcat'
  'plugn'
  'procfile-util'
  'rsyslog'
  'sshcommand'
)
source=("https://github.com/dokku/dokku/archive/v$pkgver.zip"
        "$pkgname.install"
        "LICENSE")
sha256sums=('2e8027b79828988ab58ab3cdbfd1fa9259fb5f1fb1db42f456bddcf6d7f305ee'
            'd6887859d5c43febf6591c32d8b4706797a28ce308050b62871bc3f7f9df418e'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')
install="$pkgname.install"

build() {
  export GOPATH="$srcdir/gopath"

  cd "$pkgname-$pkgver"

  # Add .core and build go plugins
  for plugin in plugins/*; do
    if [ -e "$plugin/Makefile" ]; then make -C $plugin build; fi
    touch "$plugin/.core"
  done

  # Clean go plugins
  for plugin in plugins/*; do
    if [ -e "$plugin/Makefile" ]; then make -C $plugin src-clean; fi
  done
}

package() {
  # Install executable and license
  install -Dm755 "$pkgname-$pkgver/dokku" "$pkgdir/usr/bin/dokku"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dokku/LICENSE"

  # Move all files in place
  mkdir -p "$pkgdir/var/lib/dokku/core-plugins/available"
  cp -R "$srcdir/$pkgname-$pkgver/plugins/." "$pkgdir/var/lib/dokku/core-plugins/available"

    # Version
  echo $pkgver > "$pkgdir/var/lib/dokku/VERSION"
}
