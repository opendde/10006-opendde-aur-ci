# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: David Strawn <isomarcte a__t gmail d__o__t c__o__m>
pkgname='metals'
pkgver='0.11.5'
pkgrel=1
epoch=
pkgdesc='Language Server For Scala'
url='https://scalameta.org/metals/'
arch=(any)
license=('Apache')
groups=()
depends=('java-environment>=8' 'findutils' 'python')
makedepends=('sbt' 'sed' 'grep' 'coreutils')
checkdepends=()
optdepends=('bloop')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scalameta/$pkgname/archive/v$pkgver.tar.gz" 'metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh' 'version-fix.patch' 'JREMajorVersion.java')
noextract=()
md5sums=('0fe247c10e15995aa03637fd464dbd78'
         'af44c1849b0dcfed177bd6fae1d30413'
         'ad97e9262c7b22dd71b017a6402f612a'
         '000bd73ebc3ea46b23e2c418ef97f4c7'
         '83b5669127510100d6e7ab4094877a6e'
         '38c34ab96f6cf637f7be9f72b7400983'
         '52bfbf7ded1c4aca96ba27520af3a12d'
         '8ddf6b592e6167de2df073016a9b042d')
sha1sums=('8b7f63dfc13d6e134b83b9e8f9a0962b6364ed97'
          '8989fcd5e0d6f25976fc2646d7542d0ed2f04f28'
          'b498568936dcfd03a06d7b41f76bbb7fffbc3bdf'
          '3882901e88f4a85f85d67dcda53f83c89d4563c6'
          'f2d0e8aa2744697d4dad0a7c10f835fe5814524b'
          'b2577ac4ee93e3a611558294378c185227ed8321'
          'bf9c7cef82c4794ad21cc7ba3d6caea10cb37ac3'
          '1f659a83c4403c038bb33026fc69a73c4ac4d76d')
sha224sums=('1284d22b74fb88ef4822aefa3d59ab02e592829bc0cf9e1544c82b4a'
            '77db230a65c8b75858ce6f4f52a3ae709072004ae5a0fc3d1072e415'
            '43d2f6b0b4b7ef539f5109b1127dcd88828f2f8ae0b9c052899af1c9'
            'a99d9457fd6cf582b349e56e5e8e9cece30e33ff6866c5969f090f5e'
            '6ffcb9ee870dd260f90e333082e90b9b30212f1f21dd3d3a0048a67e'
            'fff5cbeed72e44f9159872f59a0ca0a19fc81a8ed943500373e9108e'
            'dc898c7a685786213d44289736ce41a9cdcaa09602a0b5970a558fbc'
            'd48db6d9e58e19bbd7715aef204c04d01953479e9d5ca7aba94b8f36')
sha256sums=('a4c07d37204c4809f7a9e462c474553b733ca8360dd15aca8257966085527c5f'
            '3d533b5191154ed9d8dbcc27a286f8da6a0e6031bca0e6d6fc0987f9fe6484c0'
            'b3579e68cee7f23f6f6a12fe0bc6396f1722434d23ce3c58e7c9fac2233cd1d3'
            'e9bbc61ec99dc0893560a12a8a0f56c9f27016895e177a164019ab9174fe94e2'
            'c2213c8d4a1a0fe5bb12d5bcde53ab04d9b0aa08ddcabd60de938a8d480e49d5'
            'fb42157046a11089fa69e0120ae83ff3bc354709e2add4644fe3fc60aa80c984'
            '16a5a64c102168a880481fe8ab8c3427cf5f0dc121012cad4823fcd852efeb40'
            '9b5fcbcd9628d2c003d48d8e5dbbc3cb1de8dd4fa4c272cafed4f1d027e67bdb')
sha384sums=('5eb1706dae8d9fafa212f3b3bc738167f24ec64426d39d00f70d764e04832f4b57cd71148290b439c2feedd4d5eddbeb'
            'd2bdfdbba7f0aa0e6589b43aaffd0c7b1fc5c7231767e30c4680fa9a2e5166ed94e4bdfe6e4465613f739854660ebecb'
            '762dd7c73e994b74ebeb5c975ca0b53ddf4cbf181664d465bd9c543798333dcc4939c360a4b5b8b1b162810ea363d288'
            '6bee0d21d0fcf3d8f5ee14545be63fb2bbababb0665020540daafc708939bbc539ab940cfe122b2281156bc78d401768'
            '26859b59a04e38a5e7d02e188643765d06b893385232895f5b1435fb3d4fa4d676e8d43bbc80360f9ee7a2ee01e64d2c'
            '8b9204ce4a60890eb94f0fe673504a9a10c583b9814e844da14b8d1313db7f8cf7d5f9a7b8db0bbd25fb2f9263e434b7'
            'c6c339670c6775306f83b666bd16c49852cb0e99b51c17c392e42ee385f93ed822fa02e58723b9e1afc64b1c1676b3f3'
            '021c3837df318b14a5b4547717b4b19436a07edf61d735ce05d2fe57f23ca2d1c9787c8b86a08f43547b6d92f935476c')
sha512sums=('3126ffb7176f963652cc521ac64babc47c2b80df56c51cbc55349c14e462b7ca1197a7e628d1f283a402db5b0bf16c44b40ec2e54c45b2849566199dc5bc9266'
            'd0539dfd53e95bea29cb92d634dd2df259d9db8ad568c6ec368ddaeaf53e1f6b946218820bd2aa0e4726a21225e863dc55b2ddd8a0ee12fc1426fdd34feb856a'
            'bd26818e43627c4e20aa931663b4623e45ade0930a29952d6508fa6e1302f5140afed7f57a796c12da3e9ae256ff7c0b3eb2e5075b00ceda9d2e4ddc22e89205'
            '16d01a820f1ed93ae46194d3d77187adf6fd4e9764fcf99554430e3e2f2af4cc2b6f7918f595febd3c5e6a380bbfb930bb47a3dd2ba93c60b2ca1f874f264fee'
            '722770a6c30ccf75c73ae9be19655cdff00561c62bf15b619dfa618cdd636e97aaf5a6aca1297add4e6a54274cd49e81781d98a59986526d0077a6c64855562d'
            '9f32d0ead26fad866f52209c0f6dabdaa3481bafd6121134b2fde6e95a80b5d2757c17ca6f1804b6e060b839efa9a9f7d342d48ad8d22b767e13c585e209045b'
            'c28883d727afb7ae1225f973c0ea4cbc5a4c7843d226b73402afc7de2d367a42b03f32ba4d9964c0116d32e75aa8dc88de181c207ad7edd7b927326758203d34'
            '7e9f198f0141cf750cb67ac0b350fb0fa2c204f5a8a271e475b2699ecf0f46cf20219cea3fd12bb5edeb8fb08159069d03afc1dd6626703e8eeddee9b365d191')
validpgpkeys=()
install=metals.install

prepare() {
    cd "$pkgname-$pkgver"

    # The build currently does not set the correct version unless
    # built from git with the environment variable CI set. See
    # https://github.com/scalameta/metals/issues/662
    patch -p1 -i ../version-fix.patch
}

build() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT
    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -Dsbt.supershell=false"

    local -r _ORG_PATH="$PATH"
    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    local -r -a _JAVA_ARCH_PACKAGE_PATHS=('/usr/lib/jvm/java-17-openjdk/bin'
                                          '/usr/lib/jvm/java-11-openjdk/bin'
                                          '/usr/lib/jvm/java-8-openjdk/jre/bin'
                                         )
    local -r _LEN="${#_JAVA_ARCH_PACKAGE_PATHS[@]}"

    cd "$pkgname-$pkgver"
    # Build JREMajorVersion.java
    cp ../JREMajorVersion.java ./
    javac -source 7 -target 7 -Xlint -Xlint:-options JREMajorVersion.java

    # Attempt to build with a JDK supported by metals
    local _INDEX=0
    while [ $_INDEX -lt "$_LEN" ]
    do
        local _PACKAGE_PATH="${_JAVA_ARCH_PACKAGE_PATHS[$_INDEX]}"
        if [ -d "$_PACKAGE_PATH" ]
        then
            export PATH="$_PACKAGE_PATH:$PATH"
            break
        else
            _INDEX=$((_INDEX + 1))
            continue
        fi
    done

    # When run with some AUR helpers, in particular `yay`, for a
    # reason I do not understand `sbt` will regularly attempt to
    # resolve the Scala compiler in a local-preloaded-ivy cache
    # _only_, and not attempt to download it. However if you just run
    # it again, it then tries to download it. This does not happen
    # when run locally, for me at least, with makepkg or in a
    # systemd-nspawn with extra-x86_64-build.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile || sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" clean compile

    # Reset PATH
    export PATH="$_ORG_PATH"
}

check() {
    export COURSIER_CACHE="./.cache/coursier/v1"
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT

    local -r _SBT_DIR="./.sbt"
    local -r _SBT_IVY="./.ivy2"
    cd "$pkgname-$pkgver"
    ## Tests on most recent release currently fail
    # sbt test
}

package() {
    export COURSIER_CACHE='./.cache/coursier/v1'
    export CI="TRUE" # Needed so the build will not think it is a SNAPSHOT
    export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -Dsbt.supershell=false"

    ## Constants ##
    local -r _SBT_DIR='./.sbt'
    local -r _SBT_IVY='./.ivy2'
    local -r _TARGET_DIR='/usr/share/java/metals'
    local -r _DEST_DIR="$pkgdir$_TARGET_DIR"
    local -r _BIN_DEST_DIR="$_DEST_DIR/bin"
    local -r _LIB_DEST_DIR="$_DEST_DIR/lib"
    local -r _JAR_DEST_DIR="$_DEST_DIR/jars"
    local -r _UTIL_DEST_DIR="$_DEST_DIR/util"
    local -r _USR_BIN="$pkgdir/usr/bin"
    local -r _TEMP_FILE="$(mktemp)"
    local -r _LAUNCHER_SCRIPTS=('metals-client.sh' 'metals-emacs.sh' 'metals-vim.sh' 'metals-vscode.sh' 'metals-sublime.sh')
    local -r _ORG_PATH="$PATH"
    local -r -a _JAVA_ARCH_PACKAGE_PATHS=('/usr/lib/jvm/java-17-openjdk/bin'
                                          '/usr/lib/jvm/java-11-openjdk/bin'
                                          '/usr/lib/jvm/java-8-openjdk/jre/bin'
                                         )

    local -r _LEN="${#_JAVA_ARCH_PACKAGE_PATHS[@]}"

    # Attempt to build with a JDK supported by metals
    local _INDEX=0
    while [ $_INDEX -lt "$_LEN" ]
    do
        local _PACKAGE_PATH="${_JAVA_ARCH_PACKAGE_PATHS[$_INDEX]}"
        if [ -d "$_PACKAGE_PATH" ]
        then
            export PATH="$_PACKAGE_PATH:$PATH"
            break
        else
            _INDEX=$((_INDEX + 1))
            continue
        fi
    done

    ## Change Into Correct Directory ##
    pushd "$pkgname-$pkgver"

    ## Create lib, bin and util Directories ##
    install -d "$_LIB_DEST_DIR"
    install -d "$_BIN_DEST_DIR"
    install -d "$_UTIL_DEST_DIR"

    # Install JREMajorVersion.class
    install -o root -g root -m 644 "./JREMajorVersion.class" "$_UTIL_DEST_DIR"

    ## Install Class Files And Jars ##

    ### Determine Dependencies ###

    # If you're reading this and you know of a better way to get all
    # the dependencies from SBT directly, please let me know.
    sbt -sbt-dir "$_SBT_DIR" -ivy "$_SBT_IVY" compile 'show metals/dependencyClasspath' 2>/dev/null | grep Attributed | sed 's/^[^\*]\+\* Attributed(\([^)]\+\).*/\1/g' > "$_TEMP_FILE"
    while read dep
    do
        local _SANATIZED_DEP="${dep##*${pkgname}-$pkgver/}"
        # Sort out directories from modules from third-party jars.
        if [ -d "$_SANATIZED_DEP" ]
        then
            pushd "$_SANATIZED_DEP"
            cp -r ./* "$_LIB_DEST_DIR/"
            popd
        else
            if [ ! -e "$_JAR_DEST_DIR" ]
            then
               install -d "$_JAR_DEST_DIR"
            fi
            local _JAR_PATH="${dep##*/maven2}"

            install -D "$_SANATIZED_DEP" "$_JAR_DEST_DIR$_JAR_PATH"
        fi
    done<"$_TEMP_FILE"

    ## Install Metals Class Files ##

    install -d "$_DEST_DIR/metals"
    pushd 'metals/target/scala-2.13/classes'
    cp -r ./*  "$_DEST_DIR/metals/"
    popd

    ## Install And Symlink Launcher Scripts ##
    for launcher in "${_LAUNCHER_SCRIPTS[@]}"
    do
        local _LINK_NAME="${launcher##*/}"
        _LINK_NAME="${launcher%%.*}"
        if [ ! -e "$_USR_BIN" ]
        then
            install -d "$_USR_BIN"
        fi
        install -m 755 "../$launcher" "$_BIN_DEST_DIR"
        ln -s "$_TARGET_DIR/bin/$launcher" "$_USR_BIN/$_LINK_NAME"
    done

    # Add symbolic install for "generic" metals client.
    ln -s "$_TARGET_DIR/bin/metals-client.sh" "$_USR_BIN/metals"

    ## Ensure Correct Permissions ##

    chown root:root -R "$_DEST_DIR"
    chmod u=rwX -R "$_DEST_DIR"
    chmod u=rwX -R "$_BIN_DEST_DIR"
    chmod og=rX -R "$_DEST_DIR"

    ## Cleanup ##
    rm "$_TEMP_FILE"
    popd
    # Reset PATH
    export PATH="$_ORG_PATH"
}
