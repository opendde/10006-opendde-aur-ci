# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

pkgname=mxisd
pkgver=0.8.3
pkgrel=1
pkgdesc="Federated Matrix Identity Server Daemon"
arch=('any')
url="https://github.com/kamax-io/mxisd"
license=('AGPL3')
depends=('java-runtime>=8')
makedepends=('gradle' 'java-environment>=8')
source=("https://github.com/kamax-io/${pkgname}/archive/v${pkgver}.tar.gz"
        "mxisd"
        "mxisd.tmpfiles")
sha256sums=('efde61e550a22123cc6b3762656b4d80a1e6fcf7a6777a1de149d74ad6f44bf8'
            'd8293f3f6ab2b53840a875cd8af035b7d15b3e2fcc643c3faa9000e6dd1fa449'
            'daee6519e67f65e8ec836f80b5853f669ba46e3378b6e29e34550bd136baf718')
install='mxisd.install'

prepare() {
    cd "$pkgname-$pkgver"

    sed -i -e "s|def v = gitVersion()|def v = \"${pkgver}\"|g" build.gradle
    sed -i -e "s|\${gitVersion()}|${pkgver}|g" build.gradle
}

build() {
    cd "$pkgname-$pkgver"
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk/" ./gradlew build
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries
    install -dm 755 "${pkgdir}"/usr/lib/mxisd
    install -dm 755 "${pkgdir}"/usr/bin
    install -m 644 build/libs/mxisd-${pkgver}.jar "${pkgdir}"/usr/lib/mxisd/mxisd.jar
    install -m 755 "${srcdir}"/mxisd "${pkgdir}"/usr/bin/mxisd

    # Configuration
    install -dm 755 "${pkgdir}"/etc/mxisd
    install -m 644 application.example.yaml "${pkgdir}"/etc/mxisd/mxisd.yaml.example

    # Systemd
    install -dm 755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d}
    install -m 644 src/systemd/mxisd.service "${pkgdir}"/usr/lib/systemd/system/mxisd.service
	install -m 644 "${srcdir}"/mxisd.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/mxisd.conf
}
