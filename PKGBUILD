# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Szymon Jakubczak <szym-at-mit-dot-edu>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs
pkgver=1.6.20
pkgrel=1
pkgdesc="Open source implementation of the AFS distributed file system"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('krb5')
optdepends=('openafs-modules: Kernel module for OpenAFS'
            'openafs-modules-dkms: Kernel module for OpenAFS, built automatically using dkms')
conflicts=('openafs-features')
backup=(etc/conf.d/openafs
	etc/openafs/ThisCell
        etc/openafs/cacheinfo
        etc/openafs/CellServDB)
options=(!emptydirs)
install=openafs.install
source=(http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2
        http://openafs.org/dl/${pkgver}/${pkgname}-${pkgver}-doc.tar.bz2
        0001-Adjust-RedHat-config-and-service-files.patch
        0002-Add-configure-option-to-not-install-kauth.patch
        0003-Do-not-install-kauth-manpages-when-kauth-is-disabled.patch
        tmpfiles.d-openafs.conf)
sha256sums=('7106c63dc7e840689036651830254e0a069cd0e1d466ca88e6b3a59e26495961'
            '518377143fe037be5c890bd5007f1ebc1dc32e8918e9f385651f657782639751'
            '49f8169a20479df0d0b6d9f8829d6ab700cf97f87ff8403ac158bb56e6616792'
            'e7de3cc83b7ff51fde9fefc54697bebd5149b46ce3bf633a607d00a34b53702b'
            'fbb7aa32c033c2a4a00a38f66ecb02e90b4b45bf1c3b0787dd7d34f1638d3bb9'
            '5ef549180d1ac4e9530b65df7ddbdc1eceac6d6d6398fb2f32b06e96c1d9b5f0')

# If you need the kauth tools set this to 1. But be aware that these tools
# are considered insecure since 2003!
ENABLE_KAUTH=0

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Adjust RedHat config and service files to our needs
  patch -p1 < ${srcdir}/0001-Adjust-RedHat-config-and-service-files.patch

  # Backport possibility to disable kauth
  patch -p1 < ${srcdir}/0002-Add-configure-option-to-not-install-kauth.patch
  patch -p1 < ${srcdir}/0003-Do-not-install-kauth-manpages-when-kauth-is-disabled.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  case "$CARCH" in
    "i686")    sysname=i386_linux26 ;;
    "x86_64")  sysname=amd64_linux26 ;;
    "armv7h")  sysname=arm_linux26 ;;
    *)         error "Unknown architecture '$CARCH'" && false
  esac

  if [ $ENABLE_KAUTH -eq 1 ]; then
    kauth="enable-kauth"
  else
    kauth="disable-kauth"
  fi

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --disable-kernel-module \
              --with-afs-sysname=$sysname \
              --$kauth

  make all_nolibafs
}


package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install_nolibafs

  # create cache directory
  install -dm700 ${pkgdir}/var/cache/openafs
  touch ${pkgdir}/var/cache/openafs/.keepdir

  # move PAM libs
  install -dm755 ${pkgdir}/usr/lib/security
  mv ${pkgdir}/usr/lib/pam_afs.krb.so.1 ${pkgdir}/usr/lib/pam_afs.so.1 ${pkgdir}/usr/lib/security/

  # install systemd service files
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-client.service ${pkgdir}/usr/lib/systemd/system/openafs-client.service
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-server.service ${pkgdir}/usr/lib/systemd/system/openafs-server.service

  # install default configs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/afsd/CellServDB ${pkgdir}/etc/${pkgname}/CellServDB
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs.sysconfig ${pkgdir}/etc/conf.d/openafs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-ThisCell ${pkgdir}/etc/${pkgname}/ThisCell
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/packaging/RedHat/openafs-cacheinfo ${pkgdir}/etc/${pkgname}/cacheinfo

  # install license
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # install tmpfiles.d entry for /afs
  install -Dm644 ${srcdir}/tmpfiles.d-openafs.conf ${pkgdir}/usr/lib/tmpfiles.d/openafs.conf

  # if kauth was installed rename kpasswd which is already provided by krb5
  if [ $ENABLE_KAUTH -eq 1 ]; then
    mv ${pkgdir}/usr/bin/kpasswd ${pkgdir}/usr/bin/kpasswd-openafs
    mv ${pkgdir}/usr/share/man/man1/kpasswd.1 ${pkgdir}/usr/share/man/man1/kpasswd-openafs.1
  fi
}
