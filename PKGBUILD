# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-git
pkgver=4.2.2.r0.g43bdfbf17
pkgrel=2
pkgdesc='Official Telegram Desktop client'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt-git')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=("telegram-desktop")
conflicts=("telegram-desktop")
_kcoreaddons_version="5.98.0"
## source array generated from:
# python -c 'import configparser, os.path; c=configparser.ConfigParser();c.read(".gitmodules"); print("\n".join(f"\t\"telegram-desktop-{path}::git+{u}\"" for s in c.sections() if (url:=c[s]["url"], path:=os.path.basename(c[s]["path"]), u:= url if url.endswith(".git") else url+".git")))'
source=("tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#branch=dev"
        "telegram-desktop-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
        "telegram-desktop-GSL::git+https://github.com/Microsoft/GSL.git"
        "telegram-desktop-xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "telegram-desktop-rlottie::git+https://github.com/desktop-app/rlottie.git"
        "telegram-desktop-lz4::git+https://github.com/lz4/lz4.git"
        "telegram-desktop-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "telegram-desktop-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "telegram-desktop-lib_base::git+https://github.com/desktop-app/lib_base.git"
        "telegram-desktop-codegen::git+https://github.com/desktop-app/codegen.git"
        "telegram-desktop-lib_ui::git+https://github.com/desktop-app/lib_ui.git"
        "telegram-desktop-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
        "telegram-desktop-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
        "telegram-desktop-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
        "telegram-desktop-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
        "telegram-desktop-cmake::git+https://github.com/desktop-app/cmake_helpers.git"
        "telegram-desktop-expected::git+https://github.com/TartanLlama/expected.git"
        "telegram-desktop-QR::git+https://github.com/nayuki/QR-Code-generator.git"
        "telegram-desktop-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
        "telegram-desktop-hunspell::git+https://github.com/hunspell/hunspell.git"
        "telegram-desktop-range-v3::git+https://github.com/ericniebler/range-v3.git"
        "telegram-desktop-fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
        "telegram-desktop-nimf::git+https://github.com/hamonikr/nimf.git"
        "telegram-desktop-hime::git+https://github.com/hime-ime/hime.git"
        "telegram-desktop-fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git"
        "telegram-desktop-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
        "telegram-desktop-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
        "telegram-desktop-lib_webview::git+https://github.com/desktop-app/lib_webview.git"
        "telegram-desktop-jemalloc::git+https://github.com/jemalloc/jemalloc.git"
        "telegram-desktop-dispatch::git+https://github.com/apple/swift-corelibs-libdispatch.git"
        "telegram-desktop-plasma-wayland-protocols::git+https://github.com/KDE/plasma-wayland-protocols.git"
        "telegram-desktop-wayland-protocols::git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git"
        "telegram-desktop-kimageformats::git+https://github.com/KDE/kimageformats.git"
        "https://invent.kde.org/frameworks/kcoreaddons/-/archive/v$_kcoreaddons_version/kcoreaddons-v$_kcoreaddons_version.tar.gz"
        "teolegram-desktop-cmake-bundled-kcoreaddons::git+https://github.com/ilya-fedin/cmake_helpers.git#branch=bundled-kcoreaddons" # using bundled-kcoreaddons branch from ilya-fedin
	"bundled-kcoreaddons.patch::https://github.com/ilya-fedin/cmake_helpers/compare/bundled-kcoreaddons...desktop-app:cmake_helpers:master.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'd84f0d0c29f819488fd7632df28b8a9da5fb3a0724652529d3f8a59b62ea12f5f0a1755b346d2d8b015ec492dd0fead8b74199f9a7e7ada26d45b8fd7ada21c8'
            'SKIP'
            'cac45e8ea316e86ad3719f5e2ea1bea328d14e7c01a7b9425a05fe1a1e7b3364f6881a75d14dee28335c0c1e7290d5545a24a9c17c805686cefef3ba2d662e60')
pkgver() {
    cd "$srcdir/tdesktop"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/tdesktop"
    mv "$srcdir/kcoreaddons-v$_kcoreaddons_version" "Telegram/ThirdParty/kcoreaddons"
    ## git config generated by
    # python -c 'import configparser, os.path; c=configparser.ConfigParser();c.read(".gitmodules"); print("\n".join(f"    git config submodule.{path}.url \"$srcdir/telegram-desktop-{p}\"" for s in c.sections() if (url:=c[s]["url"], path:=c[s]["path"], p:=os.path.basename(path))))'
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/telegram-desktop-libtgvoip"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/telegram-desktop-GSL"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/telegram-desktop-xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/telegram-desktop-rlottie"
    git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/telegram-desktop-lz4"
    git config submodule.Telegram/lib_crl.url "$srcdir/telegram-desktop-lib_crl"
    git config submodule.Telegram/lib_rpl.url "$srcdir/telegram-desktop-lib_rpl"
    git config submodule.Telegram/lib_base.url "$srcdir/telegram-desktop-lib_base"
    git config submodule.Telegram/codegen.url "$srcdir/telegram-desktop-codegen"
    git config submodule.Telegram/lib_ui.url "$srcdir/telegram-desktop-lib_ui"
    git config submodule.Telegram/lib_lottie.url "$srcdir/telegram-desktop-lib_lottie"
    git config submodule.Telegram/lib_tl.url "$srcdir/telegram-desktop-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "$srcdir/telegram-desktop-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "$srcdir/telegram-desktop-lib_storage"
    git config submodule.cmake.url "$srcdir/telegram-desktop-cmake"
    git config submodule.Telegram/ThirdParty/expected.url "$srcdir/telegram-desktop-expected"
    git config submodule.Telegram/ThirdParty/QR.url "$srcdir/telegram-desktop-QR"
    git config submodule.Telegram/lib_qr.url "$srcdir/telegram-desktop-lib_qr"
    git config submodule.Telegram/ThirdParty/hunspell.url "$srcdir/telegram-desktop-hunspell"
    git config submodule.Telegram/ThirdParty/range-v3.url "$srcdir/telegram-desktop-range-v3"
    git config submodule.Telegram/ThirdParty/fcitx-qt5.url "$srcdir/telegram-desktop-fcitx-qt5"
    git config submodule.Telegram/ThirdParty/nimf.url "$srcdir/telegram-desktop-nimf"
    git config submodule.Telegram/ThirdParty/hime.url "$srcdir/telegram-desktop-hime"
    git config submodule.Telegram/ThirdParty/fcitx5-qt.url "$srcdir/telegram-desktop-fcitx5-qt"
    git config submodule.Telegram/lib_webrtc.url "$srcdir/telegram-desktop-lib_webrtc"
    git config submodule.Telegram/ThirdParty/tgcalls.url "$srcdir/telegram-desktop-tgcalls"
    git config submodule.Telegram/lib_webview.url "$srcdir/telegram-desktop-lib_webview"
    git config submodule.Telegram/ThirdParty/jemalloc.url "$srcdir/telegram-desktop-jemalloc"
    git config submodule.Telegram/ThirdParty/dispatch.url "$srcdir/telegram-desktop-dispatch"
    git config submodule.Telegram/ThirdParty/plasma-wayland-protocols.url "$srcdir/telegram-desktop-plasma-wayland-protocols"
    git config submodule.Telegram/ThirdParty/wayland-protocols.url "$srcdir/telegram-desktop-wayland-protocols"
    git config submodule.Telegram/ThirdParty/kimageformats.url "$srcdir/telegram-desktop-kimageformats"
    git submodule update

    cd cmake
    EMAIL=root@localhost git am "$srcdir/bundled-kcoreaddons.patch"
    cd ..

    # Upstream suggested sed headers: https://github.com/telegramdesktop/tdesktop/issues/25073#issuecomment-1253908867
    find . -type f \( -iname '*.h' -or -iname '*.cpp' \) -print0 | xargs -0 sed -i 's/<KUrlMimeData>/<kurlmimedata.h>/g;s/<KShell>/<kshell.h>/g;s/<KSandbox>/<ksandbox.h>/g'
}

build() {
    cd "$srcdir/tdesktop"

    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    # Use Qt5 for the time being until kwayland has an easier way to work with Qt6.
    ninja -C build
}

package() {
    cd "$srcdir/tdesktop"
    DESTDIR=$pkgdir ninja -C build install
}
