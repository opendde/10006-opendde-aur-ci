# Maintainer: Sven Greb <development@svengreb.de>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
#
# This package is built according to the AUR Go packaging guidelines:
# https://wiki.archlinux.org/index.php/Go_package_guidelines
pkgname=mage
pkgver=1.13.0
pkgrel=1
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64" "arm" "aarch64")
url="https://magefile.org"
license=("Apache")
makedepends=("git" "go-pie")
# We're building from source to get metadata information for the binary, but using a stable version tag instead of
# the latest commit since this is not a `-git` package.
# See https://man.archlinux.org/man/PKGBUILD.5#USING_VCS_SOURCES for more information.
source=("$pkgname::git+https://github.com/magefile/mage#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cd "$pkgname"

  # mage is build with mage itself, therefore we simluate the execution of the provided `bootstrap.go` installation
  # file that is recommended by the author.
  # The file builds mage when mage itself is not installed on the target system yet and included metadata information
  # for the binary.
  #
  # References:
  #   1. https://github.com/magefile/mage/blob/bf7f17a5/bootstrap.go
  #   2. https://github.com/magefile/mage/blob/fd5011e/magefile.go#L67
  #   3. https://github.com/magefile/mage/blob/fd5011e/magefile.go#L108
  local build_date git_commit_hash git_tag
  build_date=$(command date --rfc-3339=seconds)
  git_commit_hash=$(git rev-parse --short HEAD)
  git_tag=$(git describe --tags)
  if [ -z "$git_tag" ]; then
    git_tag="dev"
  fi

  # References:
  #   1. https://github.com/magefile/mage/blob/fe9f9420/.goreleaser.yml#L27
  #   2. https://github.com/magefile/mage/blob/fe9f9420/.goreleaser.yml#L10
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X \"github.com/magefile/mage/mage.timestamp=$build_date\" \
              -X \"github.com/magefile/mage/mage.commitHash=$git_commit_hash\" \
              -X \"github.com/magefile/mage/mage.gitTag=$git_tag\" \
              -extldflags \"${LDFLAGS}\"" \
    -o build/"$pkgname" .
}

package() {
  cd "$pkgname"
  install -Dm755 build/"$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
