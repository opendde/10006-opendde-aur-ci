#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('kingstvis')
pkgver=3.4.2
pkgrel=1
pkgdesc="KingstVIS软件可以采集记录多路数字信号，可测量信号脉宽、周期、频率、占空比等，可依据多种标准协议解析出通信数据，具备演示模式可让你购买之前体验全部功能。"
provides=("kingstvis")
url='http://www.qdkingst.com/cn'
arch=('x86_64')
depends=('qt5-base' 'qt5-svg')
source=("${pkgname}.tar.gz::http://www.qdkingst.com/kfs/KingstVIS_v${pkgver}.tar.gz"
kingstvis.desktop
logo-0.png
logo-1.png
logo-2.png
logo-3.png
logo-4.png
)
md5sums=('18e3967942ed1a01d0b26d2ca45cd889'
SKIP
SKIP
SKIP
SKIP
SKIP
SKIP
)

package(){
	 install -Dm755 "${srcdir}"/KingstVIS/KingstVIS "${pkgdir}"/opt/kingstvis/KingstVIS
	 install -Dm755 "${srcdir}"/KingstVIS/Updater "${pkgdir}"/opt/kingstvis/Updater
	 
	 install -Dm755 "${srcdir}"/KingstVIS/libAnalyzer.so "${pkgdir}"/opt/kingstvis/libAnalyzer.so
	 
	 install -Dm755 "${srcdir}"/KingstVIS/libicudata.so.56 "${pkgdir}"/opt/kingstvis/libicudata.so.56
	 
	 install -Dm755 "${srcdir}"/KingstVIS/libicui18n.so.56 "${pkgdir}"/opt/kingstvis/libicui18n.so.56
	 
	 install -Dm755 "${srcdir}"/KingstVIS/libicuuc.so.56 "${pkgdir}"/opt/kingstvis/libicuuc.so.56
	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/Resource
	 install -Dm644 "${srcdir}"/KingstVIS/Resource/* "${pkgdir}"/opt/kingstvis/Resource
	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/Language
	 install -Dm644 "${srcdir}"/KingstVIS/Language/* "${pkgdir}"/opt/kingstvis/Language
	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/Analyzer
	 install -Dm644 "${srcdir}"/KingstVIS/Analyzer/* "${pkgdir}"/opt/kingstvis/Analyzer
	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/Driver
	 install -Dm644 "${srcdir}"/KingstVIS/Driver/* "${pkgdir}"/opt/kingstvis/Driver
	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/imageformats
	 install -Dm644 "${srcdir}"/KingstVIS/imageformats/* "${pkgdir}"/opt/kingstvis/imageformats
	 	 
	 mkdir -p "${pkgdir}"/opt/kingstvis/platforms
	 install -Dm644 "${srcdir}"/KingstVIS/platforms/* "${pkgdir}"/opt/kingstvis/platforms
	 
	 install -Dm644 "${srcdir}"/KingstVIS/README "${pkgdir}"/opt/kingstvis/README	 
	 
	 install -Dm644 "${srcdir}"/KingstVIS/Driver/99-Kingst.rules "${pkgdir}"/etc/udev/rules.d/99-Kingst.rules
	 
	 install -Dm755 "${srcdir}"/kingstvis.desktop "${pkgdir}"/usr/share/applications/kingstvis.desktop
	 
	 # Icons
	 #/usr/share/icons/hicolor/16x16/apps/
	 install -Dm644 "${srcdir}"/logo-0.png "${pkgdir}"/usr/share/icons/hicolor/64x64/KingstVIS.png
	 install -Dm644 "${srcdir}"/logo-0.png "${pkgdir}"/usr/share/icons/KingstVIS.png
	 install -Dm644 "${srcdir}"/logo-1.png "${pkgdir}"/usr/share/icons/hicolor/48x48/KingstVIS.png
	 install -Dm644 "${srcdir}"/logo-2.png "${pkgdir}"/usr/share/icons/hicolor/32x32/KingstVIS.png
	 install -Dm644 "${srcdir}"/logo-3.png "${pkgdir}"/usr/share/icons/hicolor/20x20/KingstVIS.png
	 install -Dm644 "${srcdir}"/logo-4.png "${pkgdir}"/usr/share/icons/hicolor/16x16/KingstVIS.png
}
