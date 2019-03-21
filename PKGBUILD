# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=flutter-beta
pkgver=1.3.8
pkgrel=1
pkgdesc="A new mobile app SDK to help developers and designers build modern mobile apps for iOS and Android."
arch=("x86_64")
url="https://${pkgname%-beta}.io"
license=("custom" "BSD" "CCPL")
depends=("glu" "java-environment" "lib32-libglvnd")
optdepends=("android-sdk"
            "android-studio"
            "bash"
            "dart"
            "git"
            "intellij-idea-community-edition"
            "intellij-idea-ultimate-edition"
            "perl"
            "python"
            "sh")
makedepends=("git" "python")
provides=("${pkgname%-beta}")
conflicts=("${pkgname%-beta}")
backup=("opt/${pkgname%-beta}/packages/${pkgname%-beta}_test/pubspec.yaml" "opt/${pkgname%-beta}/packages/${pkgname%-beta}/pubspec.yaml")
options=("!emptydirs")
install="${pkgname%-beta}.install"
source=("${pkgname%-beta}-${pkgver}.tar.xz::https://storage.googleapis.com/flutter_infra/releases/beta/linux/${pkgname%-beta}_linux_v${pkgver}-beta.tar.xz"
        "${pkgname%-beta}.sh"
        "${pkgname%-beta}.csh")
sha256sums=("26ba3963ac9e78fe7a690a92ea7efe3bfafd6d00059cfbdd22dd8f5d0ca9d2d3"
            "1dea1952d386c43948b9970382c2da5b65b7870684b8ad2ad89124e873aa485a"
            "7ef10d753cfaac52d243549764a793f44f8284a1f4b11715ccd2fa915b026a6f")

build() {
  cd "${srcdir}/${pkgname%-beta}"
  "${srcdir}/${pkgname%-beta}/bin/${pkgname%-beta}" doctor
}

package() {
  install -Dm644 "${srcdir}/${pkgname%-beta}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname%-beta}.sh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.sh"
  install -Dm755 "${srcdir}/${pkgname%-beta}.csh" "${pkgdir}/etc/profile.d/${pkgname%-beta}.csh"
  install -dm755 "${pkgdir}/opt/${pkgname%-beta}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -ra "${srcdir}/${pkgname%-beta}" "${pkgdir}/opt/"
  find "${pkgdir}/opt/${pkgname%-beta}" -type d -exec chmod a+rx {} +
  find "${pkgdir}/opt/${pkgname%-beta}" -type f -exec chmod a+r {} +
  chmod a+rw "${pkgdir}/opt/${pkgname%-beta}/bin/cache/lockfile" "${pkgdir}/opt/${pkgname%-beta}/version"
  ln -s "/opt/${pkgname%-beta}/bin/${pkgname%-beta}" "${pkgdir}/usr/bin/${pkgname%-beta}"
}
