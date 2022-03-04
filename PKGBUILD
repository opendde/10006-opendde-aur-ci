# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=MatriX.112
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686')
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver")
conflicts=("torrserver")
depends=("glibc")
install=torrserver.install

source=("https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service" "systemd.patch")
source_x86_64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64")
source_i686=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386")
source_arm=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5")
source_armv7h=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7")
source_aarch64=("https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64")

case "$CARCH" in
  x86_64) _CARCH=amd64 ;;
  i686) _CARCH=386 ;;
  arm) _CARCH=arm5 ;;
  armv7h) _CARCH=arm7 ;;
  aarch64) _CARCH=arm64 ;;
  *) return 1 ;;
esac

prepare() {
    patch -uN --follow-symlinks torrserver.service --input="${srcdir}/systemd.patch"
}

package() {
    install -Dm644 "${srcdir}/torrserver.service" "${pkgdir}/usr/lib/systemd/system/torrserver.service"
    install -Dm755 "${srcdir}/TorrServer-linux-${_CARCH}" "${pkgdir}/usr/bin/torrserver"
}

b2sums=('7b2dbfd1486e3abbe6977f5229746943ed4dbb588100d8bc768068574a3a3d2a01915a54e57a9203445fc4e3e72f09b562894d4164a854bc6dc56cab4764d4ad'
        '20d847419c499b2286abe6d12113443446feff6aa6c2dac5e60d4c1bbfb0845d682761bde2880eacb2f9b29c12f3213ef6f9f3ae7e141586bd8483da00b9f440')
b2sums_x86_64=('cfb12219c41f89001548f62aba1cf77ff5864ce8bcd2595873463818f0295fc3374995d9ea7ab23931f2d36e4d1d80e694ad20e79f0149975887664023f49385')
b2sums_arm=('b89e2815e462aeff9a13bdaa90c957f81665015b5847b140395fc94bf4aa1e5397be6e930efe1034dea1a9451613ec3d1895af903f5f1ffd99d6810b369cb368')
b2sums_armv7h=('ac936178d26faaf22a6f8a685c0835ceea6cb684d4a19dfbfddcf55e12ab9146149913762377559985c35570e4722daccdf53f707b5516fd2cda1e7be4df3f2e')
b2sums_aarch64=('3e1ac0c4faf14a7ea9ddfcd96d669e9bca059837bffaf08d7557b9db0382257b5c7faa79e90d162872cafa3419a2a0402846f1fa18fd3da4d58542c3f98daf53')
b2sums_i686=('49ac2cf195024d612be67c2f3063484eaf44a76cf4f17c37f9f8b4e2fd3c5411db6d4de77bbae9feae12acb2e7872032e58d2306fdd7775339c160e3391b5ddf')
