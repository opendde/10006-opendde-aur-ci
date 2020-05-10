# Maintainer: ml <ml@visu.li>
# TODO systemd service
pkgname=keys-pub
pkgver=0.0.43
pkgrel=1
pkgdesc='keys.pub CLI client and service (keys, keysd)'
arch=('x86_64' 'i686')
url='https://keys.pub/'
license=('MIT')
depends=('libfido2')
makedepends=('git' 'go' 'gzip')
optdepends=('org.freedesktop.secrets: storing secrets')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/keys-pub/keysd/archive/v${pkgver}.tar.gz")
sha256sums=('710df1fb4c478c3c5768433e60f41f9b3ad3424724a06b6f1dc1b8dbde511377')

prepare() {
  cd "keysd-${pkgver}"
  # replace all keys-pub/keysd modules except http/api (tests fail)
  find -type f -name go.mod -exec sed -i 's#// \?\(replace github.com/keys-pub/keysd\)#\1#g; /^replace github.com\/keys-pub\/keysd\/http\/api/d' {} +

  # add missing replaces
  echo 'replace github.com/keys-pub/keysd/firestore => ../../firestore' >> http/client/go.mod
  for i in service/go.mod wormhole/go.mod; do
    echo 'replace github.com/keys-pub/keysd/firestore => ../firestore' >>"$i"
  done

  # go mod tidy all over the place
  find -type f -name go.mod -execdir go mod tidy \;
}

build() {
  local _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  local -a x=(
    main.version="$pkgver"
    main.commit="${_commit:?}"
    main.date="$(date -u -d @${SOURCE_DATE_EPOCH:-$EPOCHSECONDS} +%FT%TZ)"
  )

  cd "keysd-${pkgver}/service"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'

  go build -o .. -ldflags "${x[*]/#/-X=}" ./{keys,keysd}
  go build -o ../fido2.so -buildmode=plugin ./fido2
}

check() {
  cd "keysd-${pkgver}"
  # firestore tests require external dependencies, http/api never used
  find -type f -name go.mod -not \( -path ./firestore/go.mod -or -path ./http/api/go.mod \) -execdir go test -short ./... \;
}

package() {
  cd "keysd-${pkgver}"
  install -Dm755 keys -t "${pkgdir}/usr/bin"
  install -Dm755 keysd -t "${pkgdir}/usr/lib/${pkgname}"
  install -m644 fido2.so -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # ln keysd so we don't have to put fido2.so inside /usr/bin
  ln -sf "/usr/lib/${pkgname}/keysd" "${pkgdir}/usr/bin/keysd"
}
