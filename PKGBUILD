# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20200521
legacyver=20200225
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=${legacyver}
_HDHR_EU=${legacyver}
_HDHR3_US=${legacyver}
_HDHR3_DT=${legacyver}
_HDHR3_EU=${legacyver}
_HDHR3_CC=${pkgver}
_HDHR3_4DC=${pkgver}
_HDHR4_2US=${pkgver}
_HDHR4_2DT=${pkgver}
_HDHR4_2IS=${pkgver}
_HDTC_2US=${pkgver}
_HDHR5_2US_4US=${pkgver}
_HDHR5_4DC=${pkgver}
_HDHR5_2DT_4DT=${pkgver}
_HDVR_2US_4US_1TB=${pkgver}
_HHDD_2TB=${pkgver}

source=("http://download.silicondust.com/hdhomerun/hdhomerun_atsc_firmware_${_HDHR_US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_dvbt_firmware_${_HDHR_EU}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_atsc_firmware_${_HDHR3_US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbt_firmware_${_HDHR3_DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbtc_firmware_${_HDHR3_EU}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_cablecard_firmware_${_HDHR3_CC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun3_dvbc_firmware_${_HDHR3_4DC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_atsc_firmware_${_HDHR4_2US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_dvbt_firmware_${_HDHR4_2DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun4_isdbt_firmware_${_HDHR4_2IS}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomeruntc_atsc_firmware_${_HDTC_2US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_atsc_firmware_${_HDHR5_2US_4US}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_dvbc_firmware_${_HDHR5_4DC}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun5_dvbt_firmware_${_HDHR5_2DT_4DT}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc_firmware_${_HDVR_2US_4US_1TB}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_hdd_firmware_${_HHDD_2TB}.bin")
sha512sums=('b1ce0348f76614833fa410b54c188ea2f302d95641fe977f76709d070b22ff562f017f0c5cc4529d279ae8d12696c7c39a0e057d95b288aa59111bc4973fd53c'
            'ca3aaa7dcb5a8b21f8bab382b59034d83047c3f64dba16c0747dcae87262ec457b87caf63eeba0487b26cd102498dabdc3347e90a39c8f2f0c2852e2a1eba80c'
            'a4210bfb1eeb3773da71c15a00b464b0123bce7dbb2be039273ecf83dc422698cbb4c00e7c1ce4ad98d45b475c23154a5e6188c2821475a0e641cbfc89e3f106'
            '0c7e44c70c350f054980853ce450b356e2e7d321d4f1ed654763ac23b970c2bab6a404bbfe78315d15ecb9b25622abaf724ff7f05a69d196f39cb105a33a8f71'
            'b3d464684ac52b8096bf6f88f8d445e0f8075064871e3dab79a7d16698df6c72d87d021d4bbf1ed6a32dda27589c7320199a8f63c87b633bb4faad5c593f0fc6'
            'a678f168f4587d74e5b5113a7cb76947d57ac639908d2636fcc55014bf0da81b1a5939b4a00d949bb7de207fd35556f3c8570093b1335044566dc0a2b190332d'
            '5bae254281502b3daa83e87138f7f6717adae6683532d3ea242d90a47067298fdda1baaa2ba83eac892c1c29e528cd80b5a341029f6525de2922f8f5a1a09aa0'
            'b3572b243a72ddd0df8ad48648e1f63de69d36c5766f041b4a68fc5c9aaee139d1ecf596ec6fd4a5d72d4c599bd8fc1c661671443790f52bfa8a47c9b4da2c29'
            '25b722372a4322ea82ef000e895c87f972a0ee1eac1e21c94bbc59426f97b8f271944ed72fdc9cc65a9927fa2c01fedcf714b5c2cb3738acf5ef537f8d75573e'
            '5385fe288a98d649352ea65f620543d4fe0bd12953e322f419c51b4b5400ccb39019babc8060b2fa97a015b3ef0ac6c74b24e97338c25b00ad6b635ae1890760'
            'bc00d12cf00bf4774e0e590e4c6c306aa11b989e5170bdba20a9187bc2bc4a9770b08361678d6c2b737c0e4b48e7024b3cf1e8dacbb049f8da9f6aaad8a3ee80'
            'bf92ff4590de4891d63d1f8bc6ab3a77f36c62415e45276df56e0f74f4c8d9a47b8a0cd8e079877333faa785bbfeb90efaca8b67c55cef377247cc727d391b3a'
            '57619681779c47f16c800bb77eb11b80960977c1f159a1b127b1d2ac3df3c1887c00d3738822c447e29ec45c1aeff7398e19bc998c1542f0421dbd5325027e9f'
            'cdd6fe9a134e716f2a701bfd1803f99239d772c127824a099b2d3199224d7b3ed0ef9a745ff0fb5a57b5bdbda8595faa4b72d7da87b2f179067b51dab32935cf'
            '70a3732e6487087384a8608e94e96b50037ddbbefec343d742aeb3cf3855c16d10972ca957b81d12d654bc1bee93dc4a7b71e8f8a234114daa2288aaa3fea9c8'
            '7386a2bc949492fcdb5f5c556f69e6e7f6a1b19a2bd921e1ced80798d1729b6532bcc1c7ecc232a72db1df664cfdcb86126049568b45d90ca7d1d33161c53957')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
