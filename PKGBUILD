# Maintainer: taotieren <admin@taotieren.com>

pkgname=rustdesk-git
pkgver=1.1.8.r1.gb0dfd77
pkgrel=1
pkgdesc="Yet another remote desktop software, written in Rust. Works out of the box, no configuration required. Great alternative to TeamViewer and AnyDesk! "
arch=('any')
url="https://github.com/rustdesk/rustdesk"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git} ${pkgname/git/bin})
#replaces=(${pkgname})
depends=('gtk3' 'xdotool' 'libxcb' 'libxfixes' 'alsa-lib' 'pulseaudio')
makedepends=('unzip' 'yasm' 'nasm' 'clang' 'zip' 'pkg-config' 'make' 'git' 'cmake' 'gcc' 'curl' 'wget' 'rust' 'python')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-git}::git+https://hub.fastgit.org/rustdesk/rustdesk.git"
        "vcpkg::git+https://hub.fastgit.org/microsoft/vcpkg#commit=ec6fe06e8da05a8157dc8581fa96b36b571c1bd5"
        "libsciter-gtk.so::https://raw.fastgit.org/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so"
        "${pkgname}.install")
sha256sums=('SKIP'
            'SKIP'
            'fcf388fc2f1ea41546f5a01104c8764f2467a3c55a3acbbc9b6e4f9807eedc72'
            'b6cf25e231687a6caf178a87113b74482354aea2f8a3f6b8b5800169ce55fb10')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
# install vcpkg
# git clone https://github.com/microsoft/vcpkg --branch 2020.11-1
    vcpkg/bootstrap-vcpkg.sh
    mkdir -pv ${srcdir}/vcpkg
    export VCPKG_ROOT=${srcdir}/vcpkg
    vcpkg/vcpkg install libvpx libyuv opus

# build rustdesk
    cd "${srcdir}/${pkgname%-git}/"
#     RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
    cargo build --release
}

check() {
    cd "${srcdir}/${pkgname%-git}/"
    cargo test --release
}

package() {
# install rustdesk
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}"

    #     find "${srcdir}/${pkgname%-git}/target/debug" \
    find "${srcdir}/${pkgname%-git}/target/release" \
     -maxdepth 1 \
     -executable \
     -type f \
     -exec install -m 0755 "{}" "${pkgdir}/usr/share/${pkgname%-git}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" << EOF
#!/bin/env bash
cd /usr/share/${pkgname%-git}/
./${pkgname%-git}
EOF

# install ui
    cp -r "${srcdir}/${pkgname%-git}/src" "${pkgdir}/usr/share/${pkgname%-git}"

# install libsciter-gtk.so
    cp -r "${srcdir}/libsciter-gtk.so" "${pkgdir}/usr/share/${pkgname%-git}"

    install -Dm0644 "${srcdir}/${pkgname%-git}/logo-header.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service" << EOF
[Unit]
Description=RustDesk
Requires=network.target
After=systemd-user-sessions.service

[Service]
Type=simple
ExecStart=/usr/bin/${pkgname%-git} --service
PIDFile=/var/run/${pkgname%-git}.pid
KillMode=mixed
TimeoutStopSec=30
User=root
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
EOF
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"  << EOF
[Desktop Entry]
Version=${pkgver}
Name=RustDesk
GenericName=Remote Desktop
GenericName[zh_CN]=远程桌面
Comment=Remote Desktop
Comment[zh_CN]=远程桌面
Exec=${pkgname%-git} %u
Icon=${pkgname%-git}.svg
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Other;
Keywords=internet;
Actions=new-window;

X-Desktop-File-Install-Version=0.23

[Desktop Action new-window]
Name=Open a New Window
EOF
}
