# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=buildtools
pkgname=buildozer-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="A command line tool to rewrite Bazel BUILD files using standard conventions"
arch=('x86_64')
license=('Apache')
url="https://github.com/bazelbuild/buildtools"
source=(
  "${pkgname%-bin}-${pkgver}::${url}/releases/download/${pkgver}/${pkgname%-bin}"
  "https://raw.githubusercontent.com/bazelbuild/buildtools/${pkgver}/LICENSE"
)
sha256sums=('1c1a63d786327b0708273290e888d09f6aa93284db78d2cc0e15f7573c7f9e68'
            'e7a03a853a374c80876e6e18920c622bba70090ee8d056b6db8fa88073308268')

package() {
  cd "${srcdir}"

  # Install the license file
  install -D -m 0644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./${pkgname%-bin}-${pkgver}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"
}
