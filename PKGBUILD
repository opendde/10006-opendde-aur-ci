# Maintainer: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-esr-i18n
pkgver=91.7.1
pkgrel=1
pkgdesc="Language pack for Firefox ESR"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/organizations/"

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()
_url=https://ftp.mozilla.org/pub/firefox/releases/${pkgver}esr/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-esr-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-esr-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=(${source[@]%%::*})

_package() {
  pkgdesc="$2 language pack for Firefox ESR"
  depends=("firefox-esr>=$pkgver")
  install -Dm644 firefox-esr-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('454d1806b635a01936ae65db43d3013d51636b9d1198012f169a32d904409433'
            '3b6a591c4c90100b8e72022ee311ea482fcdd1054f0760e9d88ba8edd4cbed3b'
            'dc71c52f13ce942484b07966c5d50433f311f3356fc6056188f081ace8f7e312'
            '37c19e290aee590969c73aa54d685e948a3c47893d0bf9e6c97820f6ebc1937e'
            '0546302cce9192368741cf94037ebebdea9466efd3711f77a9b8787c7eafe99a'
            'aa3b3826b1ab675932219727f0e0a002a66acdec83ae86f5f24703917fcee670'
            'e3b3b8506f341edf0a28a653afb65a946e8531f11281250e3b6cdbe19fdc9ab2'
            'e86ec9762b272d87cae563eacd1283a9d7750335eb6ffc8d51491e8b225697a7'
            'cfbc2387cef7531babc2bef0513b909075529bc33f1ca27f4bdb6076ae6eb440'
            '823e1d27a93d4f7ac7d538e2c28e91796fd5ea5b38400e54fd914bb106f811d1'
            'bfdc972b43a7ba896341ac10494b1d77eb21d51fb386aa26abd6cb31720d9d70'
            'dcd47bdea95be51dbea19288f94d430691630d61dc4aaf182a862b9899135e6d'
            '2d9dc046966089c2725ad8fb84fb67f4712118e6d29b7f0d3e216f8c09506f5f'
            '06ede9afea9fd7023068c630cbcf52e2d60351663626847e1d53b7da4ca316b7'
            '8c4917227a725e4813eb5b14d7464d258413c74d7eeea9be9b4cd7b426ac66c2'
            '13d8859386ff1527bfd5e9ac3ded44d3a0845a5569b22696a7bdc298fb05839b'
            'f159e7eeae80e10d22a452af02c23661c9f82de888263808ed029991462f3c3c'
            'e0bf6e690e79d94b51501f6f17caf5b958f576f604defd5f6e4f545e92890afd'
            '4cc314a1bb104cd4a6c383cfb502e6ffbe632d3f330ca2a6b9f35e8bfac6b540'
            '0bd90092e68dfa1eb97e24c9cbb293c22fa68a8a0635d3349688dc07a19ce22f'
            'f8a4032ba1d76cf09198e1e5bfc999d719f8df0981dd6a62ea20942d3f7ffddf'
            '6f0c5d00e9b9b504dedd3f950fb01dfa244ca5da9d3c6c890aea404e10cb933f'
            '00f6e77b9214d856c34e976edf3972762c15f2247b3ea6146f6cb081d47c29d2'
            '97a315ef8efe69f51a6bcff96ec7b117e67e6717026ab0ce225a8f697bf5354f'
            '2bdab1dd697bf812038a4cce91f6f13edc4575960ec3760ca76bb8379ca50975'
            'dfeddeb09163c64df4a020b34be5ec44a55581284b9f3102f78a6affb6ad112f'
            '1b5a9e2cbc88f92d4ca2c9f3792b6758b36dca4fb1eaf8aa5cff650193663a52'
            'fe56c38eb939cbd06514efc8e67f453609fdfcccd1508c0ca9207b79d29ea072'
            '6f78e77ea0d46131b1b447cdb134c09ca7293a7cd929422270f26bcb5ce3f454'
            'd79d642a6fcf4c1a19d8448adbf303bd29298b8b075b9d23510dab0ac560b309'
            '6d645bc873b216fb4c94369caf27127139e20441615c44a3529a8db89c0f8001'
            '61a24ad7fe42168967cbaaf590cb994da89426a3d0e69e300463f5d80672bf78'
            'e7d7abe8b523163f66ca25b5c105954fd0156f55ab32ebf9f9e3d131bcc5d70f'
            '1fb3e22e5e874599511ab54e943344ad01a8e8f5c126822f8a2076c8c5f44bef'
            'e166904ad0632d86476641df979c9cea1dc4e777380a5b63f7e4a7d86501ead5'
            '1da872ecf45b4fd25f04984ff36585f972c807816cb32bf570d689167cf5fa77'
            '147ebdbcc730d70591a4a010196763f5b514f515829d31635d72ad2c20e8d9ce'
            'e679516560be284483b3c0252bf22ebfab583b443aea0a7ed395fc4871da0c6b'
            '01e90775a55d95071c324780ae6e167b07f008df9c00be14f28fa07854fe6267'
            'bb44552dc30562dae94538beb6ada81ac151eccc6380f6edc31269ae7ecd917b'
            '477464aa32243dc46adc20a1c1cc99fe46bf6366e11b2f90b30b63101f4ff184'
            '481adc04ecb6a291df898ca6f0ba86d31fcb1a7e1e30bbabe01a787468cccf73'
            '20a35095b30f9113c60c20d8c252d843ce33f4de03763cd68eeddd312eb4a089'
            '01b27402f7da0ae88579c76d147d2f8a9d404c121431f71e5bb1097989908068'
            '28d7e312c1da7cc242403d0c0d5a50ce8e770755373afecbe7e52ae910409aa1'
            '5c5f340dfab47c18c798a9db91950c1d74364b60f58a5db72265d7d83b2e795a'
            '7f76c1689e144ccd78d9424d10d53deab970500b704c9746b00ed69d6be4fe1c'
            'e800a35a995790e97762cecbbda1b4317ce5419dbbd0e53ecd3c47a0370e2d1b'
            '911484e18343ed98d820335e6d4f606e98afb98c36813e3c36824b26013d529f'
            '6ab46c557558e826e43b5d2fb4fdd071c2b66743c2582a45a059da4adea5bc00'
            'b46916bd3b1bfbf22833e19bcc789c9a18d7c88afbdb9b217b41a29f4a923123'
            '48b7948c07535ab8b206df891964de8bf2fdb81895a74a5338a0e7fc4700ffaf'
            '580a5da729939a80c6b44fb73211ac134bd079d74b9ea868b6b55466277cc638'
            '3c44a20e5791158e66ce29b173d189d7160ee74973b6244fd6a31b49a7914f25'
            '470eda2c505dc9e664c50c4d0c0f5110417b097e19da232233fec60dd9613c22'
            '8954c4fd7168f09f615a32a6c24121757a399504aa5835de645355158d490f14'
            '822ec6e4275109d5351f8ad025055e10fdea780dcc4e12788ea73a5e8bcf8f3e'
            '9c4d3f1c21e93a8ec2618ab933e66e8c8682c0290f1ad7812f6cfcc2c6166f31'
            '9eb8c3610baecb6561b1f9acf348db2fb4fd953dbbbc09ef24f2b502ba4e9e5a'
            'ffd8a3f93bdcaba0534229251a2db2c4d8fdaa03dda45a2f29b40bc6795d4469'
            '40f7062cae18935a08de42659b8ec5e3f9c27cb866c6426204bfd0685fad1540'
            '21e6fc670e7b2d753ae986bdea0e4b0376fb44d04e66ea3464cdfc9f39f072a9'
            'a227fc86251498516a04ac6d174540c30ea3185080e25c1cb4e6e285e2558253'
            '2ec6932b6fdf72445a992163277f090cdee0759a5b2716a3f024143c2bf4d30e'
            'b444dbd8d16ec9049e167515399ad0104255a2742a56e43872f1a1672b05c77b'
            'b1dbf860eb99744cccedd73cf8ad73211299fb1444248d863700a4ab0f606717'
            'f4c4ac25f97c86214e82c179d9d39a711a7907e040941c1cf844cfede8de32ad'
            '8f68ceeaf86c83444ea96fa3b2f5c70945003df87c92d85eda3f7a0fd19c7376'
            'c46213b2fefe4ef7292686c666e4b33ce63550e19d6f844724f05d57a9b1817c'
            '4d496d853f1d1cc2fb7df9d0ea5a9ba4a4d86e95c0811acffdb4e1ae1009db3b'
            'b447df14addf1d13644e7dba49619d2d83d3fec4420b38afc26cdd602f7b7ace'
            '79b4d39944a33a0cbb02eac2a8fb8b56cb886fe24503314bf7efe50a0b97d31c'
            '2860df5f5329bda907ca60dbe3312722a71a5b1d8607fbf0d1cdf3a7088b1238'
            'b26a5ccef9986ebba9726fea0037601d1773025d9dc83ffb3a72cdd71f04d2b7'
            '37445c709b8ec7cf5b0e9cb6b0e852592da1d31a58794b597d05c99d788ec3f8'
            '09ee1a1ba961ae444fde88b96136a96370098b78cb77ef211d86b02786ee4d01'
            '95a0e87a27dde4c9ee2391795dee97f092d5f730d1ba1221f0f96d4cffbf3da7'
            'b8a3e52dc504a1770f3954150a1745a98bc2f568d1b21df9e5c630e20862b284'
            'f454a765f5f6b4d13e6dc2a0e30355c4908f73b9e8bd43a7f731388e1786a578'
            '7d6c275b3a335fd07841cf9607e9350d79989c44d9b54647108384eb9c3d246c'
            'db55e257cdcc3f42fc29413039b9260693593b86ef0ab5b612ea23b72f876fc6'
            '9287d626111af6807f11bfea37b2ef87736faf890e0d31541bb76262847f340b'
            '685ef7d5ac825b27a3843e156975fbec2d4facae927d382f6ac532d2d0c7d2d6'
            '1afc1bbb2c0b9668c9c89f254da3cde0ce7311abd1ad52ad51aa27dd9d823210'
            '1f6a41bba0d13f83bd94fc08f39a758302c13ac2fb4e6f0574d0bee80915f679'
            '73572ebdcff852e247ecf45721e5d0518235aeeb2e208374ecf4cfff39dd8075'
            '818bd4643763536d06fef4f9054eb4db61a6469683658faa1ea76eaa8006b0cf'
            '05b537ff3e39d2064241726ba7215c4afcdd5a2a60b70ab0789aeefde4faaa1e'
            '4918b5a13a5e1051665509d4c376638b9b07ccfa7bfd48b64d10198bc9b9ba9f'
            'ab0e6aac4ae127e58fc38d218a170f903f2f2dee69f347eef344b7b73506afa9'
            'efbcbbc9e2e9ba0ca9595bbb7e2f5ee65824a2576671cfdf4bbbd3b8ddb71168'
            '6d1aa30569d30998fb99065e218f1f1286ca72e5a60abb0580d348e6d5d283af'
            'b56c442da3d17e58c671bdb493f0ddc42e1b8da201123afc64b46c07ffa34e51'
            '5d1eebcdf894741eabd01846516861c9a569ab2f18cfbbcf040ddf5b253dab8c'
            'c17a3b00125ddc2a06cb327e6c7e41e7648dd68e7ab92f99c6798b9f2a78b387'
            '8141ec717b397fbbc388e0bbe8a26779fee9d9aa899343f9b58981da1b43d305')
