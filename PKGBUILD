# Maintainer: Kristian <morguldir@protonmail.com
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]

pkgname=osu-lazer
pkgver=2019.126.0
pkgrel=1

dotnet_version=2.2

pkgdesc="The new open source version of osu!, the free-to-win rhythm game"
arch=('x86_64')
license=('MIT' 'custom:CC-BY-NC 4.0')
url='https://osu.ppy.sh/'

depends=(ffmpeg libgl sdl2 shared-mime-info "dotnet-runtime>=$dotnet_version.0")
makedepends=(git "dotnet-sdk>=$dotnet_version.0")

provides=(osu-lazer)
conflicts=(osu-lazer-git)

source=(
    "osu-$pkgver::git+https://github.com/ppy/osu.git#tag=$pkgver"
    'git+https://github.com/ppy/osu-resources.git'
    'osu-launcher'
    'osu-lazer.desktop'
    'osu-lazer.png'
    'x-osu-lazer.xml'
)

sha256sums=(
    SKIP
    SKIP
    a34d37ed6d35788501985ad3c8f63888849734549113e11f43321917fdfa16bf
    9935414fdd95c02c7fd2d0d200ce1037dfce95cd7f1d04b25a275ce0902401c6
    3b3a9075f79ca7f2a4fd34eb182a5c1ada6eb118a95e49c1526df516365bbfe5
    d842b333a014a666012548097ddf80a6f147896ad5460365560ce7f11834297f
)

prepare()
{
    cd "osu-$pkgver"
    git submodule init
    git config submodule.osu-resources.url $srcdir/osu-resources
    git submodule update
}

build()
{
    cd "osu-$pkgver"

    dotnet publish          osu.Desktop                 \
        --framework         netcoreapp$dotnet_version   \
        --configuration     Release                     \
        --runtime           linux-x64                   \
        --self-contained    false                       \
        /property:Version=$pkgver                       \
        --output            ./bin/Release/netcoreapp$dotnet_version/linux-x64
}

package()
{
    # Wrapper script
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 'osu-launcher' "$pkgdir/usr/bin/osu-lazer"

    # MIME types
    mkdir -p "$pkgdir/usr/share/mime/packages"
    install -m644 "x-$pkgname.xml" "$pkgdir/usr/share/mime/packages/x-$pkgname.xml"

    # Add .desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Application icon
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Compiled binaries
    cd "$srcdir/osu-$pkgver/osu.Desktop/bin/Release/netcoreapp$dotnet_version/linux-x64"
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    for binary in *.so *.dll *.json *.pdb; do
        install -m755 "$binary" "$pkgdir/usr/lib/$pkgname/$binary"
    done

    # osu-lazer licence
    cd "$srcdir/osu-$pkgver/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/osu-lazer/"
    install -m644 "LICENCE" "$pkgdir/usr/share/licenses/$pkgname/osu-lazer/MIT"

    # osu-resources licence
    cd "$srcdir/osu-$pkgver/osu-resources/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/osu-resources/"
    install -m644 "LICENCE.md" "$pkgdir/usr/share/licenses/$pkgname/osu-resources/CC-BY-NC 4.0"
}

# vim: set sw=4 ts=4 et:
