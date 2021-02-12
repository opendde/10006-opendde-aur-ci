# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.antutu.benchmark
pkgver=1.0.0.550
pkgrel=1
pkgdesc="安兔兔评测 for linux
 安兔兔评测（AnTuTu）是一款跨平台，支持手机、电脑设备的专业性能评定软件。Linux版本的安兔兔支持一键跑分，可评估CPU/GPU/MEM/UX性能。"
arch=("x86_64")
url="https://www.antutu.com/"
license=("custom")
depends=()
options=(!strip)
provides=('antutu')
source=("https://professional-store-packages.chinauos.com/appstore/pool/appstore/c/com.antutu.benchmark/com.antutu.benchmark_1.0.0.550_amd64.deb")
md5sums=('f0575ca54d4e44a4cd8734a5ff1092f7')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"

}

package(){
    cd ${srcdir}
    
    mkdir -p ${pkgdir}/opt/antutu
    mv opt/apps/${pkgname}/files/* ${pkgdir}/opt/antutu/

    mkdir -p ${pkgdir}/usr/share/
    mv opt/apps/${pkgname}/entries/*  ${pkgdir}/usr/share/
    
    sed -i '5c Exec=antutu %U' ${pkgdir}/usr/share/applications/${pkgname}.desktop
    echo '''#!/bin/bash

export LD_LIBRARY_PATH=/opt/antutu:$LD_LIBRARY_PATH
/opt/antutu//bin/benchmark -start $1
''' >  ${pkgdir}/opt/antutu/start.sh
    chmod a+x ${pkgdir}/opt/antutu/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/antutu/start.sh ${pkgdir}/usr/bin/antutu
}
