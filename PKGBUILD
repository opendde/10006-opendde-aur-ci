# Maintainer: Donald Webster (fryfrog@gmail.com)

pkgname=unifi-video
pkgver=3.6.3
pkgrel=2
pkgdesc="Centralized management system for Ubiquiti UniFi Surveillance Cameras"
arch=('x86_64')
url="https://www.ubnt.com/"
license=('custom')
depends=('mongodb' 'java-runtime>=8' 'java-jsvc' 'lsb-release')
conflicts=('unifi-video-beta')
install=unifi-video.install
source=("http://dl.ubnt.com/firmwares/unifi-video/${pkgver}/unifi-video_${pkgver}~Ubuntu16.04_amd64.deb"
        'unifi-video.service'
        'unifi-video.sysusers'
        'unifi-video.patch'
        'server.xml.patch')

sha256sums=('2e37248acf0ca15fb864ce71081c22b9ff323414163acc9039da5417c42d1cc9'
            '9df948b046347c25e7c83e4837284ef63d9f8d3f28daa20a6c36e203e3ebfdb3'
            '90fb2f826a70d3b7815cd6a2253c2af6754c17504be28ef92ee223bd02093730'
            '903c8def2668124570986f113fabf7ef03a1c94cde3a42dbf530ad6a19f139e7'
            '0636452a8e45a64f0adf108afbb5823921fb013b427eaf644d9bae0d97c27b93')

check() {
    if ! [[ -x $( which java ) ]]; then
        msg2 "Could not find java, please use archlinux-java to select a default."
        exit 1
    fi
}

package() {
    msg2 "Extracting unifi-video..."
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"/

    msg2 "Removing unwanted /etc with init.d script and sudoers file..."
    rm -r "${pkgdir}/etc"

    msg2 "Moving /usr/sbin -> /usr/bin..."
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

    msg2 "Making files executable..."
    chmod +x ${pkgdir}/usr/bin/unifi-video ${pkgdir}/usr/lib/unifi-video/bin/ubnt.* ${pkgdir}/usr/lib/unifi-video/bin/evo*

    msg2 "Patching out ulimit..."
    cd "${pkgdir}/usr/bin"
    patch -N < "${srcdir}/unifi-video.patch"

    msg2 "Patching off compression..."
    cd "${pkgdir}/usr/lib/unifi-video/conf"
    patch -N < "${srcdir}/server.xml.patch"

    msg2 "Installing systemd files..."
    install -D -m 644 "${srcdir}/unifi-video.service" "${pkgdir}/usr/lib/systemd/system/unifi-video.service"
    install -D -m 644 "${srcdir}/unifi-video.sysusers" "${pkgdir}/usr/lib/sysusers.d/unifi-video.conf"

    msg2 "Creating directories..."
    mkdir -p "${pkgdir}/usr/lib/unifi-video/logs" "${pkgdir}/usr/lib/unifi-video/work"
}

# vim:set ts=2 sw=2 et:
