# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
projectname=skycoin
pkgname=skywire-mainnet
pkgname1=skywire
githuborg=SkycoinProject
pkgdesc="Skywire: Building a New Internet. Skycoin.com"
pkgver='autogenerated'
#pkgver='autogenerated'
pkggopath="github.com/${githuborg}/${pkgname}"
pkgrel=8
#pkgrel=8
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(git go skycoin-keyring)
provides=('skywire')
conflicts=('skywire')
source=("git+${url}.git#branch=${BRANCH:-develop}"
"skywire-scripts.tar.gz"
"skywire-systemd.tar.gz"
"hypervisorconfigPKGBUILD"
"PKGBUILD.sig")
sha256sums=('SKIP'
            'fc3848567394b263f7db70466ac8ff91272ee7340724d7b745c736539890721a'
            '315affd25223a3aff13909d4420eb4818648e53479dd6b9368d57b446b776407'
            '399926d8addcde6bb588a67739971525f953060b83693cb2a7a081480c4c5091'
            'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
              '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>
#tar -czvf skywire-scripts.tar.gz skywire-scripts
#tar -czvf skywire-systemd.tar.gz skywire-systemd
export GOOS=linux
export GOPATH="${srcdir}"
export GOROOT="$builddir"
export GOBIN="$GOROOT"/bin
export GOROOT_FINAL=/usr/lib/go

export CGO_ENABLED=1

case "$CARCH" in
x86)      export GOARCH="386" GO386="387" ;;
x86_64)   export GOARCH="amd64" ;;
arm*)     export GOARCH="arm" ;;
armel)    export GOARCH="arm" GOARM="5" ;;
armhf)    export GOARCH="arm" GOARM="6" ;;
armv7)    export GOARCH="arm" GOARM="7" ;;
armv8)    export GOARCH="arm64" ;;
aarch64)  export GOARCH="arm64" ;;
mips)     export GOARCH="mips" ;;
mips64)   export GOARCH="mips64" ;;
mips64el) export GOARCH="mips64le" ;;
mipsel)   export GOARCH="mipsle" ;;
*)        return 1 ;;
	esac

pkgver() {
	cd "${srcdir}/${pkgname}"
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "${date}.${count}_${commit}"
}

prepare() {
	#gpg --import key
	#verify PKGBUILD signature
	gpg --verify ../PKGBUILD.sig ../PKGBUILD
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
	mkdir -p ${srcdir}/go/src/github.com/${githuborg}/ ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${pkgname} ${srcdir}/go/src/${pkggopath}
  cd ${srcdir}/go/src/${pkggopath}/
  #git submodule --quiet update --init --recursive
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
  msg2 'installing go dependencies'
	go mod vendor -v
  #dep init
  #dep ensure
}

build() {
  export GOPATH=${srcdir}/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
  cd ${srcdir}/go/src/${pkggopath}

	cmddir=${srcdir}/go/src/${pkggopath}/cmd
  #using go build for determinism
	cd ${cmddir}/apps/skychat
  msg2 'building skychat binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/apps/helloworld
  msg2 'building helloworld binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/apps/skysocks
  msg2 'building skysocks binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/apps/skysocks-client
  msg2 'building skysocks-client binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/skywire-visor
  msg2 'building skywire-visor binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/skywire-cli
  msg2 'building skywire-cli binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
	cd ${cmddir}/setup-node
  msg2 'building setup-node binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
	cd ${cmddir}/hypervisor
  msg2 'building hypervisor binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
#	cd ${cmddir}/dmsgpty
#  msg2 'building dmsgpty binary'
#  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  #binary transparency
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)

#	make build
#  make install
#	mv messaging-server ${srcdir}/go/bin/messaging-server
}

package() {
    options=(!strip staticlibs)
  #create directory trees
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/static
  mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/hypervisorconfig/
  #mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname}/setup-node
  export GOPATH=${pkgdir}/usr/lib/${projectname}/go
	export GOBIN=${pkgdir}/usr/lib/${projectname}/go/bin
	#NOT putting the sources in /usr/lib/skycoin/skywire for size considerations
	cp -r ${srcdir}/${pkgname}/static/skywire-manager-src ${pkgdir}/usr/lib/${projectname}/${pkgname}/static/skywire-manager-src
#  cd ${pkgdir}/usr/lib/${projectname}/${pkgname}/static/skywire-manager-src
#  npm install --user root
#  find ${pkgdir}/usr/lib/${projectname}/${pkgname} -type d -exec chmod 755 {} +
  # npm gives ownership of ALL FILES to build user
#  chown -R root:root "$pkgdir"
  msg2 'installing binaries'
  skybins="${srcdir}"/go/bin
  #ln -rTsf ${skybins}/manager-node ${skybins}/${pkgname1}-manager-node
  skywirebins=$( ls ${skybins} )
  for i in ${skywirebins}; do
    install -Dm755 ${srcdir}/go/bin/${i} ${GOBIN}/${i}
    ln -rTsf ${GOBIN}/${i}  ${pkgdir}/usr/bin/${i}
    chmod 755 ${GOBIN}/${i}
  done

  install -Dm755 ${srcdir}/${pkgname1}-scripts/skywire-halt.sh ${GOBIN}/skywire-halt.sh
	ln -rTsf ${GOBIN}/skywire-halt.sh ${pkgdir}/usr/bin/skywire-halt

  install -Dm755 ${srcdir}/${pkgname1}-scripts/skywire-mainnet.sh ${GOBIN}/skywire-mainnet.sh
	ln -rTsf ${GOBIN}/skywire-mainnet.sh ${pkgdir}/usr/bin/skywire-mainnet

  install -Dm755 ${srcdir}/${pkgname1}-scripts/skywire-hypervisor-nohup.sh ${GOBIN}/skywire-hypervisor-nohup.sh
  ln -rTsf ${GOBIN}/skywire-hypervisor-nohup.sh ${pkgdir}/usr/bin/skywire-hypervisor-nohup

  install -Dm755 ${srcdir}/${pkgname1}-scripts/skywire-visor-nohup.sh ${GOBIN}/skywire-visor-nohup.sh
  ln -rTsf ${GOBIN}/skywire-visor-nohup.sh ${pkgdir}/usr/bin/skywire-visor-nohup

  install -Dm755 "${srcdir}/${pkgname1}-scripts/skywire-mainnet-config.sh" "${GOBIN}/skywire-mainnet-config.sh"
	ln -rTsf "${GOBIN}/skywire-mainnet-config.sh" "${pkgdir}/usr/bin/skywire-mainnet-config"

  install -Dm755 ${srcdir}/${pkgname1}-scripts/skywire-setuser.sh ${GOBIN}/skywire-setuser.sh
	ln -rTsf ${GOBIN}/skywire-setuser.sh ${pkgdir}/usr/bin/skywire-setuser

  chmod 755 ${pkgdir}/usr/lib/${projectname}/go/bin/*
  install -Dm644  ${srcdir}/hypervisorconfigPKGBUILD  ${pkgdir}/usr/lib/${projectname}/${pkgname}/hypervisorconfig/PKGBUILD
#prepend name to the symlinks
	cd ${pkgdir}/usr/bin/
	#mv dmsgpty ${pkgname1}-dmsgpty
	mv helloworld ${pkgname1}-helloworld
	mv hypervisor ${pkgname1}-hypervisor
	mv setup-node ${pkgname1}-setup-node
	mv skychat ${pkgname1}-skychat
	mv skysocks ${pkgname1}-skysocks
	mv skysocks-client ${pkgname1}-skysocks-client
  #install the system.d services
	install -Dm644 ${srcdir}/${pkgname1}-systemd/${pkgname1}-hypervisor.service ${pkgdir}/usr/lib/systemd/system/${pkgname1}-hypervisor.service
  install -Dm644 ${srcdir}/${pkgname1}-systemd/${pkgname1}-visor.service ${pkgdir}/usr/lib/systemd/system/${pkgname1}-visor.service

}
