pkgname=briar-desktop
pkgver=0.1.0.beta
pkgrel=1
_bin_ver=0.1.0
_build_type=beta
pkgdesc='Prototyping the next generation for Briar on desktop devices'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.briarproject.org/briar/briar-desktop"
license=('GPL')
depends=('java-runtime>=17' 'bash' 'briar-headless')
makedepends=('git' 'jdk-openjdk>=17')
source=("${pkgname}::git+https://code.briarproject.org/briar/briar-desktop.git#tag=${_bin_ver}-${_build_type}"
        "briar::git+https://code.briarproject.org/briar/briar#commit=24d058cdccc286b410f28a29642b4aff70fe1926")
sha256sums=('SKIP'
            'SKIP')

case "$CARCH" in
  armv7h)
    _gradle_arch='armhf'
  ;;
  aarch64)
    _gradle_arch='aarch64'
  ;;
  *)
    _gradle_arch='x64'
  ;;
esac

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule.briar.url "$srcdir/briar"
  git submodule update --init --recursive
}

build() {
  cd "${pkgname}"
  export PATH="/usr/lib/jvm/java-17-openjdk/jre/bin/:$PATH"
  # export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  ./gradlew -Dorg.gradle.java.home=/usr/lib/jvm/java-17-openjdk --no-daemon -PbuildType=${_build_type} packageUberJarForCurrentOS
}

package() {
  cd "${pkgname}/"
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/briar-desktop.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -m 644 -D "build/compose/jars/Briar-linux-${_gradle_arch}-0.1.0-${_build_type}.jar" "$pkgdir/usr/share/java/$pkgname.jar"
}
