# Maintainer: Shen ZhongLi <szl921818@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
#mindmaster 中文版

pkgname=mindmaster_cn
pkgver=8.5.2
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=("mindmaster" "mindmaster-cn")
pkgdesc="多功能，高颜值，易使用的专业思维导图软件"
license=('Commercial')
url="https://www.edrawsoft.cn/mindmaster/"
source_x86_64=("https://www.edrawsoft.cn/2download/x86_64/mindmaster_8.5.2_cn.x86_64.deb")
sha256sums_x86_64=("2cda609b477d69fec0bdd8a10a21511f9d1c4fc6cfab2c3789e7cd58c6ff5991")
source=("mindmaster-cn.desktop")
sha256sums=('f2564bd74618688a9e6dd39c71ddeac965cfcc3e3fd9306c1548258097878e5a')
package() {	
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
    
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/icons
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes
    mkdir -p ${pkgdir}/usr/share/mime/packages
    
    ln -f -s /opt/MindMaster-8/MindMaster "${pkgdir}/usr/bin/mindmaster"
    
    ln -f -s /opt/MindMaster-8/mindmaster.png "${pkgdir}/usr/share/icons/mindmaster.png"
    
    ln -f -s /opt/MindMaster-8/emmx.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    
    ln -f -s /opt/MindMaster-8/mindmaster.xml "${pkgdir}/usr/share/mime/packages/mindmaster.xml"
    
    install -Dm644 "${srcdir}/mindmaster-cn.desktop" "${pkgdir}/usr/share/applications/mindmaster.desktop"
#    cp /usr/lib/qt/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so "${pkgdir}/opt/MindMaster-8/plugins/platforminputcontexts/"
    
}
