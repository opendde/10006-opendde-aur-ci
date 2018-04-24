#Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=eclipse-jboss
pkgver=4.5.3.Final
eclipsever=oxygen
pkgrel=1
pkgdesc='JBoss application server developer tools plugins for Eclipse IDE'
arch=('any')
url='http://tools.jboss.org/'
license=('LGPL' 'EPL' 'BSD')
depends=('eclipse>=4.5.0')
options=('!strip')
source=("download.zip::http://download.jboss.org/jbosstools/static/${eclipsever}/stable/updates/core/jbosstools-${pkgver}-updatesite-core.zip")
sha256sums=('d083cca4554a6d8063e26624950ec8107a0cf5ef5a204824ef5d728f4db6637c')
          
package() {
  # remove features and plug-ins containing sources
  rm features/*.source_*
  rm plugins/*.source_*
  # remove gz files
  rm plugins/*.pack.gz
  _dest=${pkgdir}/usr/lib/eclipse/dropins/${pkgname/eclipse-}/eclipse
  install -d $_dest
  # extract features (otherwise features are not recognized)
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done
  # copy plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
