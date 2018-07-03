# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=18.2.9
pkgrel=1
pkgdesc="Mycroft Core, the Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('git'
         'python'
         'python-pip'
         'python-setuptools'
         'python-gobject2'
         'libtool'
         'libffi'
         'openssl'
         'autoconf'
         'bison'
         'swig'
         'glib2'
         'portaudio'
         'mpg123'
         'screen'
         'flac'
         'curl'
         'pkg-config'
         'icu'
         'automake'
         'libjpeg-turbo'
         'mimic'
         'jq'
         'fann')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
source=("https://github.com/MycroftAI/mycroft-core/archive/release/v${pkgver}.tar.gz"
        "mycroft-core.install"
        "venv_init"
        "mycroft.service"
        "notify.patch")
sha512sums=('111201b67ea80863460352313922c119dad174e1aa417cdf76397af06a7378222ab74e96af45ee5e172d5f845134fd77d38a06c9d7a840baed5151b92eaf0c3c'
            'f4649e20c2c9f220ac15d8abcade267a3e40e61e2c82175802fc2e5da726dd051c281c21a96641f41f671bef51d44c5f034a87968f8d747909bc979270ce9baa'
            '6773fd4dbf852d4129a97041677311cff0c25e8b9cf1e822a8b63df6fcb16c4af1d1afc128c375488b479f1892e6173d37accf57c28a0f9ceb6e643dd906ecc6'
            '67c228fb4a25d1ce529d1689e81703284015ab2721cecdac8264a94e1a41e629e6b6cb82566d41744ebce0d84b7e5c54156cc62c447f7b10b41e012682d0e146'
            '650503ad33d7b7f8f5d6bbeb20fc0c8b887f2a20d6009bc67c9a75e38d882df9c1edee550d4d16fc4d34e0dd56689c398c6e832230844bd9f0dfedd770d0b925')

prepare() {
  cd $srcdir/$pkgname-release-v$pkgver
  patch -N -i "${srcdir}/notify.patch"
}

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R mycroft-core-release-v${pkgver} ${pkgdir}/usr/share/mycroft-core
  cp venv_init ${pkgdir}/usr/share/mycroft-core

  # Place a link to mimic where mycroft is expecting it
  mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
  ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

  # Set permissions
  chmod -R g+w ${pkgdir}/usr/share/mycroft-core

  # Symtemd unit
  install -D -m644 "${srcdir}/mycroft.service" "${pkgdir}/usr/lib/systemd/user/mycroft.service"
}
