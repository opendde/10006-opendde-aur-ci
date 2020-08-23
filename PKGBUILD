pkgname=ntfs3-dkms
pkgver=0.0.0
pkgrel=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver developed by Paragon Software."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=("https://dl.paragon-software.com/ntfs3/ntfs3.patch"
        Makefile.patch
        dkms.conf)
sha512sums=('a08df1ee6c1f8169fcac6ed0e0065a7d1fc7008cc8ec7c581a95228190ce36b1970a9c9285ba80f486a3db61de6587f6bf1e7b2a6709b2432ab2158f81b466fc'
            'ab49381b37714bc61b17c5a4d857aac776a674574e8dbd46738eab438eef984b7762430cac05860038d8a875d5538347a1e1176acfd2169d9b5a640a9ef04d7c'
            '00cfdd033b79594ae7ce9cb2cfd098eff7ff64d977dd0a61317d6eb894f46f34c8525ddd349b7836e38f6b3c2f1127773543acc8b332b92db6aa8a5738810b71')

prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p3 -N -f -i ../ntfs3.patch || true
  patch -p1 -N -i ../Makefile.patch
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
