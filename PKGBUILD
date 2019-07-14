# Maintainer: James Brink <brink.james@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: p <parimal@beyond8labs.com>
# Contributor: Victor <victor@xirion.net>
# Contributor: Jan-Tarek Butt <tarek AT ring0 DOT de>
# Contributor: Erik Beran <eberan AT gmail DOT com>
# Contributor: Thor K. H. <thor at roht dot no>
# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: mikezackles
# Contributor: z33ky
# Contributor: stykr
# Contributor: Svenstaro
# Contributor: KaiSforza
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: shmilee
# Contributor: foobster
# Contributor: archdria
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: edacval
# Contributor: MarcelPa
# Contributor: Trent
# Contributor: urxvtcd-256

#=========================================================================================================#
#                                          Build Options                                                  #
#=========================================================================================================#
_omnisharp="y"
_gocode="y"
_rust="n"
_tern="y"
_typescript="y"
_java="y"
_use_system_clang="ON"
_use_python2="OFF"

_neovim="$NEOVIM_YOUCOMPLETEME"

#=========================================================================================================#
#                                    Default PKGBUILD Configuration                                       #
#=========================================================================================================#
pkgname=vim-youcompleteme-git
pkgver=r2535.04c35051
pkgver() {
	cd "YouCompleteMe" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=2
pkgdesc="A code-completion engine for Vim"
arch=('x86_64')
url='https://ycm-core.github.io/YouCompleteMe/'
license=('GPL3')
groups=('vim-plugins')
depends=('boost' 'boost-libs' 'python' 'python2' 'nodejs' 'vim' 'clang')
makedepends=('cmake' 'git' 'make' 'curl')
install="install.sh"
source=(
	'git+https://github.com/bottlepy/bottle.git'
	'git+https://github.com/certifi/python-certifi.git'
	'git+https://github.com/chardet/chardet.git'
	'git+https://github.com/davidhalter/jedi.git'
	'git+https://github.com/davidhalter/parso.git'
	'git+https://github.com/kjd/idna.git'
	'git+https://github.com/micbou/regex.git'
	'git+https://github.com/Pylons/waitress.git'
	'git+https://github.com/PythonCharmers/python-future.git'
	'git+https://github.com/requests/requests.git'
	'git+https://github.com/ross/requests-futures.git'
	'git+https://github.com/slezica/python-frozendict.git'
	'git+https://github.com/urllib3/urllib3.git'
	'git+https://github.com/ycm-core/ycmd.git'
	'git+https://github.com/ycm-core/YouCompleteMe.git')

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

#=========================================================================================================#
#                                     Applying PKBUILD Build Options                                      #
#=========================================================================================================#

if [[ "$_gocode" == "y" ]]; then
	# ycmd
	source+=('git+https://github.com/mdempsky/gocode.git'
		'git+https://github.com/rogpeppe/godef.git')
	sha256sums+=('SKIP' 'SKIP')
	makedepends+=('go')
fi

# TODO use the existing omnisharp AUR package if possible
if [[ "$_omnisharp" == "y" ]]; then
	source+=('https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.33.0/omnisharp.http-linux-x64.tar.gz')
	sha256sums+=('74cecc6265969d312b8124cb88152cdd9874f1027957d88ec0268d9c3e6cd3f1')
	depends+=('mono' 'libuv')
	makedepends+=('mono' 'libuv')
fi

if [[ "$_rust" == "y" ]]; then
	depends+=('rustup')
	makedepends+=('rustup')
fi

if [[ "$_tern" == "y" ]]; then
	# ycmd
	makedepends+=('npm')
fi

#=========================================================================================================#
#                                           Utility Functions                                             #
#=========================================================================================================#

gitprepare() {
	local cd_dir=$1
	local git_prefix=$2
	local c=0
	for val in "$@"; do
		if [ $c -gt 1 ]; then
			local feed[$c]=$val
		fi
		c=$((c + 1))
	done

	cd "$srcdir/$cd_dir" || exit

	git submodule init
	for gitsubvar in "${feed[@]}"; do
		git config submodule."$git_prefix$gitsubvar".url "$srcdir/$gitsubvar"
	done

	git submodule update
	unset -v feed
}

#=========================================================================================================#
#                                     Standard PKGBUILD Functions                                         #
#=========================================================================================================#

prepare() {
	# Add the java completion engine dynamically...
	if [[ "$_java" == "y" ]]; then
		echo 'Parsing out the JDTLS package version from upstream...'
		local jdtls_package_name="jdt-language-server"
		local jdtls_milestone=$(egrep '^JDTLS_MILESTONE' "$srcdir/ycmd/build.py" | sed -e "s/.* = //g" -e "s/'//g")
		local jdtls_buildstamp=$(egrep '^JDTLS_BUILD_STAMP' "$srcdir/ycmd/build.py" | sed -e "s/.* = //g" -e "s/'//g")

		if [[ "$jdtls_milestone" != "" ]] && [[ "$jdtls_buildstamp" != "" ]]; then
			echo 'JDTLS package version matched. Downloading...'
			curl -LO http://download.eclipse.org/jdtls/milestones/${jdtls_milestone}/${jdtls_package_name}-${jdtls_milestone}-${jdtls_buildstamp}.tar.gz
			tar xf ${jdtls_package_name}-${jdtls_milestone}-${jdtls_buildstamp}.tar.gz
		else
			echo 'Mismatched JDTLS version'
			exit 1
		fi
	fi

	echo 'Setting up Git submodules...'

	local YouCompleteMe=("requests-futures" "ycmd" "python-future")
	local YouCompleteMeRequestsDeps=("idna" "python-certifi" "chardet" "urllib3" "requests")
	gitprepare "YouCompleteMe" "third_party/" "${YouCompleteMe[@]}"
	gitprepare "YouCompleteMe" "third_party/requests_deps/" "${YouCompleteMeRequestsDeps[@]}"

	local ycmd=("bottle" "regex" "python-frozendict" "python-future" "waitress")

	if [[ "$_omnisharp" == "y" ]]; then
		ycmd+=("OmniSharpServer")
	fi

	if [[ "$_rust" == "y" ]]; then
		ycmd+=("rust-completer")
	fi

	gitprepare "YouCompleteMe/third_party/ycmd" "third_party/" "${ycmd[@]}"

	local ycmdJediDeps=("jedi" "parso")
	gitprepare "YouCompleteMe/third_party/ycmd" "third_party/jedi_deps" "${ycmdJediDeps[@]}"

	local ycmdRequestsDeps=("python-certifi" "chardet" "idna" "requests" "urllib3")
	gitprepare "YouCompleteMe/third_party/ycmd" "third_party/requests_deps" "${ycmdRequestsDeps[@]}"

	if [[ "$_gocode" == "y" ]]; then
		ycmd+=("go-completer")
	fi

	if [[ "$_omnisharp" == "y" ]]; then
		cd "$srcdir" || exit
		cp -r omnisharp YouCompleteMe/third_party/ycmd/third_party/omnisharp-roslyn
	fi
}

build() {
	echo 'Purging unneeded files...'
	rm -r "$srcdir/YouCompleteMe/python/ycm/tests"

	echo 'Building ycmd...' # BuildYcmdLibs()
	mkdir -p "$srcdir/ycmd_build"
	cd "$srcdir/ycmd_build" || exit
	cmake -G "Unix Makefiles" -DUSE_PYTHON2=$_use_python2 -DUSE_SYSTEM_LIBCLANG="$_use_system_clang" . "$srcdir/YouCompleteMe/third_party/ycmd/cpp"
	make ycm_core

	if [[ "$_gocode" == "y" ]]; then
		cd "$srcdir"/YouCompleteMe/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls || exit
		go build
	else
		echo 'Skipping Gocode completer...'
	fi

	# TODO there has to be a better way of doing this.
	if [[ "$_rust" == "y" ]]; then
		echo 'Building Rust completer...'
		if [ -d "$srcdir/YouCompleteMe/third_party/ycmd/third_party/rls" ]
		then
			rm -rf "$srcdir/YouCompleteMe/third_party/ycmd/third_party/rls"
		fi
		mkdir -p "$srcdir/rust-tmp"
		cd "$srcdir/rust-tmp" || exit
		export RUSTUP_HOME="$(pwd)"
		rustup toolchain install nightly
		rustup default nightly
		rustup component add rls rust-analysis rust-src
		cp -rv "$srcdir/rust-tmp/toolchains/nightly-$CARCH-unknown-linux-gnu" "$srcdir/YouCompleteMe/third_party/ycmd/third_party/rls"
	else
		echo 'Skipping Rust completer...'
	fi

	if [[ "$_typescript" == "y" ]]; then
		echo 'Building Typescipt completer...'
		cd "$srcdir/YouCompleteMe/third_party/ycmd/" || exit
		npm install -g --prefix third_party/tsserver typescript
	else
		echo 'Skipping Typescipt completer...'
	fi

	if [[ "$_tern" == "y" ]]; then
		echo 'Building Tern completer...'
		cd "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tern_runtime" || exit
		if [[ "$_use_python2" == "ON" ]]; then
			npm install --production --python=python2
		else
			npm install --production --python=python3
		fi
	else
		echo 'Skipping Tern completer...'
	fi

	if [[ "$_java" == "y" ]]; then
		echo 'Injecting Java completer...'

		# Remove stale java completer data if any
		rm -rf "$srcdir/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository"

		# Continue populating directory
		mkdir -p "$srcdir/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository"
		mv "$srcdir"/{config_linux,features,plugins} "$srcdir/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository"
	else
		echo 'Skipping Java completer...'
	fi
}

package() {
	local vimfiles_dir=usr/share/vim/vimfiles
	if [[ "$_neovim" == "y" ]]; then
		vimfiles_dir=usr/share/nvim/runtime
	fi

	mkdir -p "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/requests_deps"
	mkdir -p "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/jedi_deps"

	mkdir -p "$pkgdir/$vimfiles_dir/third_party/requests_deps"

	cp -r "$srcdir/YouCompleteMe/"{autoload,doc,plugin,python} \
		"$pkgdir/$vimfiles_dir"
	cp -r "$srcdir/YouCompleteMe/third_party/"{pythonfutures,requests-futures,python-future} \
		"$pkgdir/$vimfiles_dir/third_party"
	cp -r "$srcdir/YouCompleteMe/third_party/requests_deps/"{certifi,chardet,idna,requests,urllib3} \
		"$pkgdir/$vimfiles_dir/third_party/requests_deps"

	cp -r "$srcdir/YouCompleteMe/third_party/ycmd/"{ycmd,ycm_core.so,CORE_VERSION} \
		"$pkgdir/$vimfiles_dir/third_party/ycmd"
	cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/"{bottle,clang,cregex,frozendict,python-future,waitress} \
		"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party"
	cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/requests_deps/"{certifi,chardet,idna,requests,urllib3} \
		"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/requests_deps"
	cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/jedi_deps/"{jedi,parso} \
		"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/jedi_deps"

	if [[ "$_omnisharp" == "y" ]]; then
		cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/omnisharp-roslyn" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/omnisharp-roslyn"

		# There seems to be a case senitivity issue with the packaged release of omnisharp-roslyn
		# and the filename that ycm expects so we link it.
		if [ -f "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/omnisharp-roslyn/OmniSharp.exe" ]
		then
			ln -s "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/omnisharp-roslyn/OmniSharp.exe" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/omnisharp-roslyn/Omnisharp.exe"
		fi
	fi

	if [[ "$_gocode" == "y" ]]; then
		cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/go" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/go"
	fi

	if [[ "$_rust" == "y" ]]; then
		cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/rls" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/rls"
	fi

	if [[ "$_tern" == "y" ]]; then
		cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tern_runtime" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party"
	fi

	if [[ "$_typescript" == "y" ]]; then
		cp -r "$srcdir/YouCompleteMe/third_party/ycmd/third_party/tsserver" \
			"$pkgdir/$vimfiles_dir/third_party/ycmd/third_party"
	fi

	if [[ "$_java" == "y" ]]; then
		mv "$srcdir/YouCompleteMe/third_party/ycmd/third_party/eclipse.jdt.ls" "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party"
		# Force the java completion engine to create its workspace at /tmp instead which is writeable by every user
		ln -sf /tmp "$pkgdir/$vimfiles_dir/third_party/ycmd/third_party/eclipse.jdt.ls/workspace"
	fi

	# Remove all the unnecessary git repositories
	find "$pkgdir" -name .git -exec rm -fr {} +

	# Remove tests files
	find "$pkgdir" -name tests -exec rm -fr {} +

	# Remove unneeded docs
	find "$pkgdir" -name docs -exec rm -fr {} +

	# Finally compile all the python files to bytecode.
	if [[ "$_use_python2" == "ON" ]]; then
		python2 -m compileall "$pkgdir" || :
	else
		python3 -m compileall "$pkgdir" || :
	fi
}
