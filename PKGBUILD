# Maintainer: aimileus <me at aimileus dot nl>
# Maintainer: Maciej Borzecki <maciek.borzecki@gmail.com>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Zygmunt Krynicki <me at zygoon dot pl>

pkgname=snapd
pkgdesc="Service and tools for management of snap packages."
depends=('squashfs-tools' 'libseccomp' 'libsystemd')
optdepends=('bash-completion: bash completion support')
pkgver=2.33.1
pkgrel=2
arch=('x86_64')
url="https://github.com/snapcore/snapd"
license=('GPL3')
makedepends=('git' 'go' 'go-tools' 'libseccomp' 'libcap' 'systemd' 'xfsprogs' 'python-docutils')
conflicts=('snap-confine')
options=('!strip' 'emptydirs')
install=snapd.install
source=("$pkgname-$pkgver.tar.xz::https://github.com/snapcore/${pkgname}/releases/download/${pkgver}/${pkgname}_${pkgver}.vendor.tar.xz"
        '0001-dirs-improve-distro-detection-for-Antegros.patch')
sha256sums=('ac36fc0093c3eb3eaf2158db3ad3a26114903724d6cb98b7068fe45d6b440d94'
           'a86152415ff57cd9d4e6bf306fb9a81dc26a762fdbb0785f815eec243a50a377')

_gourl=github.com/snapcore/snapd

prepare() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"

  # Have snapd checkout appear in a place suitable for subsequent GOPATH. This
  # way we don't have to go get it again and it is exactly what the tag/hash
  # above describes.
  mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
  ln --no-target-directory -fs "$srcdir/$pkgname-$pkgver" "$GOPATH/src/${_gourl}"

  patch -Np1 -i "$srcdir/0001-dirs-improve-distro-detection-for-Antegros.patch"
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/go"

  export CGO_ENABLED="1"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  ./mkversion.sh $pkgver-$pkgrel

  gobuild="go build -buildmode=pie"
  gobuild_static="go build -buildmode=pie -ldflags=-extldflags=-static"
  # Build/install snap and snapd
  $gobuild -o $GOPATH/bin/snap "${_gourl}/cmd/snap"
  $gobuild -o $GOPATH/bin/snapctl "${_gourl}/cmd/snapctl"
  $gobuild -o $GOPATH/bin/snapd "${_gourl}/cmd/snapd"
  $gobuild -o $GOPATH/bin/snap-seccomp "${_gourl}/cmd/snap-seccomp"
  # build snap-exec and snap-update-ns completely static for base snaps
  $gobuild_static -o $GOPATH/bin/snap-update-ns "${_gourl}/cmd/snap-update-ns"
  $gobuild_static -o $GOPATH/bin/snap-exec "${_gourl}/cmd/snap-exec"

  # Generate data files such as real systemd units, dbus service, environment
  # setup helpers out of the available templates
  make -C data \
       BINDIR=/bin \
       LIBEXECDIR=/usr/lib \
       SYSTEMDSYSTEMUNITDIR=/usr/lib/systemd/system \
       SNAP_MOUNT_DIR=/var/lib/snapd/snap \
       SNAPD_ENVIRONMENT_FILE=/etc/default/snapd

  cd cmd
  autoreconf -i -f
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/snapd \
    --with-snap-mount-dir=/var/lib/snapd/snap \
    --disable-apparmor \
    --enable-nvidia-biarch \
    --enable-merged-usr
  make $MAKEFLAGS
}


package() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/go"

  # Install bash completion
  install -Dm644 data/completion/snap \
    "$pkgdir/usr/share/bash-completion/completion/snap"
  install -Dm644 data/completion/complete.sh \
    "$pkgdir/usr/lib/snapd/complete.sh"
  install -Dm644 data/completion/etelpmoc.sh \
    "$pkgdir/usr/lib/snapd/etelpmoc.sh"

  # Install systemd units, dbus services and a script for environment variables
  make -C data/ install \
     DBUSSERVICESDIR=/usr/share/dbus-1/services \
     BINDIR=/usr/bin \
     SYSTEMDSYSTEMUNITDIR=/usr/lib/systemd/system \
     SNAP_MOUNT_DIR=/var/lib/snapd/snap \
     DESTDIR="$pkgdir"

  # Install polkit policy
  install -Dm644 data/polkit/io.snapcraft.snapd.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.snapcraft.snapd.policy"

  # Install executables
  install -Dm755 "$GOPATH/bin/snap" "$pkgdir/usr/bin/snap"
  install -Dm755 "$GOPATH/bin/snapctl" "$pkgdir/usr/bin/snapctl"
  install -Dm755 "$GOPATH/bin/snapd" "$pkgdir/usr/lib/snapd/snapd"
  install -Dm755 "$GOPATH/bin/snap-seccomp" "$pkgdir/usr/lib/snapd/snap-seccomp"
  install -Dm755 "$GOPATH/bin/snap-update-ns" "$pkgdir/usr/lib/snapd/snap-update-ns"
  install -Dm755 "$GOPATH/bin/snap-exec" "$pkgdir/usr/lib/snapd/snap-exec"

  # pre-create directories
  install -dm755 "$pkgdir/var/lib/snapd/snap"
  install -dm755 "$pkgdir/var/cache/snapd"
  install -dm755 "$pkgdir/var/lib/snapd/assertions"
  install -dm755 "$pkgdir/var/lib/snapd/desktop/applications"
  install -dm755 "$pkgdir/var/lib/snapd/device"
  install -dm755 "$pkgdir/var/lib/snapd/hostfs"
  install -dm755 "$pkgdir/var/lib/snapd/mount"
  install -dm755 "$pkgdir/var/lib/snapd/seccomp/bpf"
  install -dm755 "$pkgdir/var/lib/snapd/snap/bin"
  install -dm755 "$pkgdir/var/lib/snapd/snaps"
  install -dm755 "$pkgdir/var/lib/snapd/lib/gl"
  install -dm755 "$pkgdir/var/lib/snapd/lib/gl32"
  install -dm755 "$pkgdir/var/lib/snapd/lib/vulkan"
  install -dm755 "$pkgdir/var/lib/snapd/lib/glvnd"
  # these dirs have special permissions
  install -dm000 "$pkgdir/var/lib/snapd/void"
  install -dm700 "$pkgdir/var/lib/snapd/cookie"
  install -dm700 "$pkgdir/var/lib/snapd/cache"

  make -C cmd install DESTDIR="$pkgdir/"
  # move snapd-generator to systemd generators
  install -dm755 "$pkgdir/usr/lib/systemd/system-generators"
  mv "$pkgdir/usr/lib/snapd/snapd-generator" "$pkgdir/usr/lib/systemd/system-generators/"

  # Install man file
  mkdir -p "$pkgdir/usr/share/man/man1"
  "$GOPATH/bin/snap" help --man > "$pkgdir/usr/share/man/man1/snap.1"

  # Install the "info" data file with snapd version
  install -m 644 -D "$GOPATH/src/${_gourl}/data/info" \
          "$pkgdir/usr/lib/snapd/info"

  # Remove snappy core specific units
  rm -fv "$pkgdir/usr/lib/systemd/system/snapd.system-shutdown.service"
  rm -fv "$pkgdir/usr/lib/systemd/system/snapd.autoimport.service"
  rm -fv "$pkgdir"/usr/lib/systemd/system/snapd.snap-repair.*
  rm -fv "$pkgdir"/usr/lib/systemd/system/snapd.core-fixup.*
  # and scripts
  rm -fv "$pkgdir/usr/lib/snapd/snapd.core-fixup.sh"
  rm -fv "$pkgdir/usr/bin/ubuntu-core-launcher"
  rm -fv "$pkgdir/usr/lib/snapd/system-shutdown"
  # apparmor bits
  rm -rfv "$pkgdir"/var/lib/snapd/apparmor
}
