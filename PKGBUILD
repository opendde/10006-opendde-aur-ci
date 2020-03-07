# Maintainer: Richard Bradfield <bradfier@fstab.me>

pkgname=github-cli
pkgver=0.6.1
pkgrel=1
pkgdesc="The GitHub CLI"
arch=("x86_64")
url="https://github.com/cli/cli"
license=("MIT")
depends=("glibc")
makedepends=("go")
optdepends=("git: To interact with repositories")
source=("$pkgname-$pkgver.tar.gz::https://github.com/cli/cli/archive/v${pkgver}.tar.gz")
sha256sums=('237b18f9e3c82caa1cb06df3ca763ad7b32dab7e9a9a6f89afe7593bc31c3290')

build() {
    cd "cli-$pkgver"
    go build \
        -trimpath \
        -ldflags "-extldflags ${LDFLAGS} -X github.com/cli/cli/command.Version=v${pkgver} -X github.com/cli/cli/command.BuildDate=$(date +%Y-%m-%d)" -o "bin/gh" ./cmd/gh

    # Build shell completion files
    mkdir ./_completions
    bin/gh completion -s bash > ./_completions/bash
    bin/gh completion -s zsh > ./_completions/zsh
    bin/gh completion -s fish > ./_completions/fish
}

package() {
    cd "cli-$pkgver"
    install -Dm755 "bin/gh" "${pkgdir}/usr/bin/gh"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/github-cli"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/github-cli/README.md"

    install -Dm644 "_completions/bash" "${pkgdir}/usr/share/bash-completion/completions/gh"
    install -Dm644 "_completions/zsh" "${pkgdir}/usr/share/zsh/site-functions/_gh"
    install -Dm644 "_completions/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/gh.fish"
}
