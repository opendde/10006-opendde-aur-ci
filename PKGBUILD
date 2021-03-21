# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=hdhomerun-firmware-bin
pkgver=20210227
pkgrel=1
pkgdesc="Firmwares for hdhomerun devices put into /opt/hdhomerun/firmware/"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
install=$pkgname.install
optdepends=('libhdhomerun: command line hdhomerun tool'
            'hdhomerun_config_gui: hdhomerun configuration gui')
_HDHR_US=20200225
_HDHR_EU=20200225
_HDHR3_US=20200225
_HDHR3_DT=20200225
_HDHR3_EU=20200225
_HDHR3_CC=20210210
_HDHR3_4DC=20210210
_HDHR4_2US=20210210
_HDHR4_2DT=20210210
_HDHR4_2IS=20210210
_HDTC_2US=20210210
_HDHR5_2US_4US=20210224
_HDHR5_4DC=20210224
_HDHR5_2DT_4DT=20210224
_HDVR_2US_4US_1TB=20210227
_HDVR_4K_1TB=20210227
_HHDD_2TB=20210227


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
	"https://download.silicondust.com/hdhomerun/hdhomerun_dvr_atsc3_firmware_${_HDVR_4K_1TB}.bin"
        "http://download.silicondust.com/hdhomerun/hdhomerun_hdd_firmware_${_HHDD_2TB}.bin")
sha512sums=('b1ce0348f76614833fa410b54c188ea2f302d95641fe977f76709d070b22ff562f017f0c5cc4529d279ae8d12696c7c39a0e057d95b288aa59111bc4973fd53c'
            'ca3aaa7dcb5a8b21f8bab382b59034d83047c3f64dba16c0747dcae87262ec457b87caf63eeba0487b26cd102498dabdc3347e90a39c8f2f0c2852e2a1eba80c'
            'a4210bfb1eeb3773da71c15a00b464b0123bce7dbb2be039273ecf83dc422698cbb4c00e7c1ce4ad98d45b475c23154a5e6188c2821475a0e641cbfc89e3f106'
            '0c7e44c70c350f054980853ce450b356e2e7d321d4f1ed654763ac23b970c2bab6a404bbfe78315d15ecb9b25622abaf724ff7f05a69d196f39cb105a33a8f71'
            'b3d464684ac52b8096bf6f88f8d445e0f8075064871e3dab79a7d16698df6c72d87d021d4bbf1ed6a32dda27589c7320199a8f63c87b633bb4faad5c593f0fc6'
            '4667ef29ff37e0b46987c0021b946304bf837d59939fa4f069d5e97c739a16d51af13e51c14ac92e7a740ffa0df6ee71acb439e6e9ada27a31bbedf109d8d67c'
            '068d5966f7e2024c01bcbad75b8c34aee930decc060daf6155ffc089b19ca7dba9f9b568aceec603e6ae7ea2c0f853194a2f763e074ab90d7d4e6789b77f777c'
            '5f6dfa2ba6fa8c51b15022a9824cd705e1406d11f469ac57762b27dec30b34358a6eda81be7537183f69e9f8899acf312ff24b0e4fefbfa494035e95dd16ce61'
            'ac26127ffb178216dfe648c08762857f96240c41c27dccd2283a16d48f2e077a6143f64d6b4f422df827a5ed2124cde941d55dccc898b601db113a4e35a701b4'
            '78f15db9246fc2ce08838b437acd10c7c8f82ebd6efb263486866c32b6da1d7dc6e505a73fe6c2c85fb39f74bce7697ea0d15cec0ef85037d327c8072578b9bd'
            'f1d759539610fca1ba465bedb2ed627135da0ee0a0259e57cb686cb8a9e64829576960ba6b45fcfbeddcf20179a67f7cb7263d275796be9966e9d3b3ca355952'
            '196b19a1fd8b55e2c5795379ee7a44befc7691398d3a4a962515545f31cfd88931f85ed52bb6de5eebb7342244b172b6132d2c08a09c8c30b3a3706f31a03911'
            'ad1573d8f882ac45368b8a7b7647283407563c36f751d888b9fddad1211c619952ce9d05a5a62336558a50da0e070dd50054e60e53f97e36da8a458dff11d27e'
            '1e7b961c03671e08eb2a1c45cdbe16d08c5917f770af2e058fcc45a90cdc386522e926eeae67038a467e42a0c3eac0c1549b97de9b6ae0275551acf89c5e8ea4'
            'a39a1730ddceb972be7c0a661f25d58b1fcd98041f70b8b4b1ff780f18e1fe898150714c72d21f5b746341f4a1679169b1a6cc24a555e73385aaa64da8dafb0e'
            '56cf30c8c38774028bddbf9cce315fb0c1ed75a0400fa83a66b62f1be4996439bf8dc3ea3c2445dd75d149de81b0c1df1e3f19dd573936576c2a336686abffa0'
            '7bd0a6e1b6db88277f4ff8bf487eed37afad1c4de775ad84a2d016dadf7c8b17eda3cdbeeea05e6d55793965858d019d2d8448c6d63eb987241c83ddbda0d53a')

package() {
  cd "$srcdir/"

  install -D -m 755 *.bin -t $pkgdir/opt/hdhomerun/firmware/
}
