# Maintainer: Hailey Somerville <aur@hailey.lol>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
#
# Forked from https://aur.archlinux.org/packages/spotify/

pkgname=spotify-noshows
pkgver=1.1.72.439
epoch=1
_commit=gc253025e
pkgrel=3
pkgdesc='Patched version of spotify AUR package excluding podcast recommendations from the home page'
arch=('x86_64')
license=('custom')
url='https://www.spotify.com'
depends=('alsa-lib>=1.0.14' 'gtk3' 'libxss' 'desktop-file-utils' 'openssl' 'nss' 'at-spi2-atk' 'libcurl-gnutls' 'libsm')
optdepends=('ffmpeg-compat-57: Adds support for playback of local files'
            'zenity: Adds support for importing local files'
            'libnotify: Desktop notifications')
makedepends=('zip' 'unzip')
options=('!strip')

# NOTE: We switched from stable to testing on 18th march, as the spotify
# stable repository is always outdated. Testing seems to be in sync with snap:
# https://snapcraft.io/spotify
# http://repository.spotify.com/dists/testing/Release
# http://repository.spotify.com/dists/testing/non-free/binary-amd64/Packages
# http://repository.spotify.com/dists/testing/Release.gpg
source=('spotify.protocol'
        'LICENSE'
        "${pkgname}-${pkgver}-x86_64.deb::http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_${pkgver}.${_commit}_amd64.deb"
        # GPG signature check
        "${pkgname}-${pkgver}-${pkgrel}-Release::http://repository.spotify.com/dists/testing/Release"
        "${pkgname}-${pkgver}-${pkgrel}-Release.sig::http://repository.spotify.com/dists/testing/Release.gpg"
        "${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages::http://repository.spotify.com/dists/testing/non-free/binary-amd64/Packages")
sha512sums=('999abe46766a4101e27477f5c9f69394a4bb5c097e2e048ec2c6cb93dfa1743eb436bde3768af6ba1b90eaac78ea8589d82e621f9cbe7d9ab3f41acee6e8ca20'
            '2e16f7c7b09e9ecefaa11ab38eb7a792c62ae6f33d95ab1ff46d68995316324d8c5287b0d9ce142d1cf15158e61f594e930260abb8155467af8bc25779960615'
            '65cec95448d936b7be93b0d16f29927a298b5b56aa2bc4834a5d357e341c78486fa69e61b3b6cf9fbe7da88c8d3b6ce3bccb5e963ed1b5a23320c0c808ccb385'
            'SKIP'
            'SKIP'
            'SKIP')
# Import key with:
# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import -
validpgpkeys=('F9A211976ED662F00E59361E5E3C45D7B312C643') # Spotify Public Repository Signing Key <tux@spotify.com>
# Old Keys:
# 8FD3D9A8D3800305A9FFF259D1742AD60D811D58
# 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
# 2EBF997C15BDA244B6EBF5D84773BD5E130D1D45

prepare() {
    # Validate hashes from the PGP signed "Release" file
    echo "$(grep non-free/binary-amd64/Packages ${pkgname}-${pkgver}-${pkgrel}-Release | tail -n 2 | head -n 1 | awk '{print $1}') ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages" \
        > "${pkgname}-${pkgver}-x86_64-Packages.sha256"
    sha256sum -c "${pkgname}-${pkgver}-x86_64-Packages.sha256"

    echo "$(grep SHA512 ${pkgname}-${pkgver}-${pkgrel}-x86_64-Packages | head -n 1 | awk '{print $2}') ${pkgname}-${pkgver}-x86_64.deb" \
        > "${pkgname}-${pkgver}-x86_64.deb.sha512"
    sha512sum -c "${pkgname}-${pkgver}-x86_64.deb.sha512"
}

package() {
    cd "${srcdir}"

    tar -xzf data.tar.gz -C "${pkgdir}"

    # Enable spotify to open URLs from the webapp
    sed -i 's/^Exec=.*/Exec=spotify --uri=%U/' "${pkgdir}"/usr/share/spotify/spotify.desktop

    install -Dm644 "${pkgdir}"/usr/share/spotify/spotify.desktop "${pkgdir}"/usr/share/applications/spotify.desktop
    install -Dm644 "${pkgdir}"/usr/share/spotify/icons/spotify-linux-512.png "${pkgdir}"/usr/share/pixmaps/spotify-client.png

    for size in 22 24 32 48 64 128 256 512; do
        install -Dm644 "${pkgdir}/usr/share/spotify/icons/spotify-linux-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/spotify.png"
    done

    # Move spotify binary to its proper location
    mkdir -p "${pkgdir}"/opt/spotify
    mv "${pkgdir}/usr/share/spotify" "${pkgdir}/opt/"

    # Symlink spotify binary which is located in /opt
    ln -sf /opt/spotify/spotify "${pkgdir}/usr/bin/spotify"

    # Copy protocol file for KDE
    install -Dm644 "${srcdir}/spotify.protocol" "${pkgdir}/usr/share/kservices5/spotify.protocol"

    # Install license
    # https://www.spotify.com/legal/end-user-agreement
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    chmod -R go-w "${pkgdir}"

    # Patch to remove shows from homepage
    unzip -qo "${pkgdir}/opt/spotify/Apps/xpui.spa" xpui.js
    sed -i 's/,show,/,/' xpui.js
    zip -qf "${pkgdir}/opt/spotify/Apps/xpui.spa" xpui.js
}
