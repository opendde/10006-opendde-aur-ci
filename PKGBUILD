pkgname=(husky-tosser husky-msged)
_realpkg=husky
pkgver=1.9_20150211
pkgrel=1
pkgdesc="Husky Fido Tosser"
arch=('x86_64')
license=('GPL')
url="http://husky.sourceforge.net/hpt.html"
source=('huskymak.cfg'
  'areastat_makefile'
  'nltools_makefile'
  'smapi_makefile'
  'msged_makefile'
  'msged_maps_makefile'
  'http://downloads.sourceforge.net/project/husky/husky/1.9-current/2015.02.11/husky-all-1.9-source-20150211.tgz'
  )
_buildModules="huskylib fidoconf smapi areafix hpt areastat bsopack nltools htick msged"
_tosserModules="huskylib fidoconf smapi areafix hpt areastat bsopack nltools htick"
prepare() {
    cp -f huskymak.cfg ${_realpkg}/
    cp -f areastat_makefile ${_realpkg}/areastat/Makefile
    cp -f nltools_makefile ${_realpkg}/nltools/Makefile
    cp -f smapi_makefile ${_realpkg}/smapi/Makefile
    cp -f msged_makefile ${_realpkg}/msged/Makefile
    cp -f msged_maps_makefile ${_realpkg}/msged/maps/makefile.husky
}

build() {
    export LD_BACKUP="$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_BACKUP:${srcdir}/${_realpkg}/huskylib:${srcdir}/${_realpkg}/fidoconf"
    for i in $_buildModules; do
         cd "${srcdir}/${_realpkg}/${i}"
         # if more than -j1, then build fails. Say hello to upstream
         make -j1
    done
    # We need original LD_LIBRARY_PATH for package() and further
    export LD_LIBRARY_PATH="$LD_BACKUP"
    export LD_BACKUP=""
}

package_husky-tosser() {
    pkgdesc='Husky Fido Tosser Bundle - hpt, areafix and other tools'
    for i in $_tosserModules; do
        cd "${srcdir}/${_realpkg}/${i}"
        make DESTDIR="$pkgdir" install
    done
}
package_husky-msged() {
    pkgdesc='msged from Husky Fido Tosser bundle'
    depends=('husky-tosser')
    cd "${srcdir}/${_realpkg}/msged"
    make DESTDIR="$pkgdir" install
}

md5sums=('799c230ec374e22abcdb0b5452dce37c'
         '0ec212f2bb31d149cd1717ab681f519a'
         '48ba1f5f4ded114e500ef83ce1fe407a'
         'c7238eec644bd1aeaf0a0c993f5dd8fc'
         '0d09d7d863f9511d6ab9c49c636a8ad3'
         '4c66c7fcb56605e9a691a085c85e1080'
         '6dc36f0c2d0a49a603a107035ba5f07a')
