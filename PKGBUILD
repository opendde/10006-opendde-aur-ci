# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2021-07-04.

_pkgname=idos-timetable-tariff-chaps-all
pkgname="${_pkgname}-latest"
epoch=0
pkgver=2021_7_2
pkgrel=1
pkgdesc="Tariff data for the timetable search engines by CHAPS: Czech/Slovak trains + bus, Czech public transport. Note that some data need the purchased version of IDOS to run."
arch=(any)
url="http://chaps.cz/eng/download/idos/zip#kotvatar"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-data"
        )

makedepends=(
  "wget"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  
  "idos-timetable-tariff=${pkgver}"
  
  "idos-timetable-tariff-trains-cz=${pkgver}"
  "idos-timetable-tariff-trains-sk=${pkgver}"
  "idos-timetable-tariff-bus-cz=${pkgver}"
  "idos-timetable-tariff-bus-sk=${pkgver}"
  "idos-timetable-tariff-bus-odis=${pkgver}"
  "idos-timetable-tariff-mhd-as=${pkgver}"
  "idos-timetable-tariff-mhd-benesov=${pkgver}"
  "idos-timetable-tariff-mhd-beroun=${pkgver}"
  "idos-timetable-tariff-mhd-bilina=${pkgver}"
  "idos-timetable-tariff-mhd-idsjmk=${pkgver}"
  "idos-timetable-tariff-mhd-bruntal=${pkgver}"
  "idos-timetable-tariff-mhd-breclav=${pkgver}"
  "idos-timetable-tariff-mhd-bystricenp=${pkgver}"
  "idos-timetable-tariff-mhd-caslav=${pkgver}"
  "idos-timetable-tariff-mhd-ceskalipa=${pkgver}"
  "idos-timetable-tariff-mhd-ceskytesin=${pkgver}"
  "idos-timetable-tariff-mhd-dacice=${pkgver}"
  "idos-timetable-tariff-mhd-decin=${pkgver}"
  "idos-timetable-tariff-mhd-domazlice=${pkgver}"
  "idos-timetable-tariff-mhd-duchcov=${pkgver}"
  "idos-timetable-tariff-mhd-dvurkralovenl=${pkgver}"
  "idos-timetable-tariff-mhd-frydekmystek=${pkgver}"
  "idos-timetable-tariff-mhd-havlickuvbrod=${pkgver}"
  "idos-timetable-tariff-mhd-havirov=${pkgver}"
  "idos-timetable-tariff-mhd-horice=${pkgver}"
  "idos-timetable-tariff-mhd-hradeckralove=${pkgver}"
  "idos-timetable-tariff-mhd-hranice=${pkgver}"
  "idos-timetable-tariff-mhd-iredo=${pkgver}"
  "idos-timetable-tariff-mhd-cheb=${pkgver}"
  "idos-timetable-tariff-mhd-chomutov=${pkgver}"
  "idos-timetable-tariff-mhd-chrudim=${pkgver}"
  "idos-timetable-tariff-mhd-jabloncecnn=${pkgver}"
  "idos-timetable-tariff-mhd-jachymov=${pkgver}"
  "idos-timetable-tariff-mhd-jicin=${pkgver}"
  "idos-timetable-tariff-mhd-jihlava=${pkgver}"
  "idos-timetable-tariff-mhd-jindrichuvhradec=${pkgver}"
  "idos-timetable-tariff-mhd-kadan=${pkgver}"
  "idos-timetable-tariff-mhd-karlovyvary=${pkgver}"
  "idos-timetable-tariff-mhd-karvina=${pkgver}"
  "idos-timetable-tariff-mhd-kladno=${pkgver}"
  "idos-timetable-tariff-mhd-klasterecno=${pkgver}"
  "idos-timetable-tariff-mhd-klatovy=${pkgver}"
  "idos-timetable-tariff-mhd-kolin=${pkgver}"
  "idos-timetable-tariff-mhd-kralupynv=${pkgver}"
  "idos-timetable-tariff-mhd-krnov=${pkgver}"
  "idos-timetable-tariff-mhd-kromeriz=${pkgver}"
  "idos-timetable-tariff-mhd-kutnahora=${pkgver}"
  "idos-timetable-tariff-mhd-liberec=${pkgver}"
  "idos-timetable-tariff-mhd-litomerice=${pkgver}"
  "idos-timetable-tariff-mhd-litomysl=${pkgver}"
  "idos-timetable-tariff-mhd-louny=${pkgver}"
  "idos-timetable-tariff-mhd-lovosice=${pkgver}"
  "idos-timetable-tariff-mhd-marianskelazne=${pkgver}"
  "idos-timetable-tariff-mhd-melnik=${pkgver}"
  "idos-timetable-tariff-mhd-mladaboleslav=${pkgver}"
  "idos-timetable-tariff-mhd-most=${pkgver}"
  "idos-timetable-tariff-mhd-neratovice=${pkgver}"
  "idos-timetable-tariff-mhd-novyjicin=${pkgver}"
  "idos-timetable-tariff-mhd-nymburk=${pkgver}"
  "idos-timetable-tariff-mhd-olomouc=${pkgver}"
  "idos-timetable-tariff-mhd-opava=${pkgver}"
  "idos-timetable-tariff-mhd-orlova=${pkgver}"
  "idos-timetable-tariff-mhd-odis=${pkgver}"
  "idos-timetable-tariff-mhd-ostrov=${pkgver}"
  "idos-timetable-tariff-mhd-pelhrim=${pkgver}"
  "idos-timetable-tariff-mhd-pisek=${pkgver}"
  "idos-timetable-tariff-mhd-plzen=${pkgver}"
  "idos-timetable-tariff-mhd-policka=${pkgver}"
  "idos-timetable-tariff-mhd-pid=${pkgver}"
  "idos-timetable-tariff-mhd-prostej=${pkgver}"
  "idos-timetable-tariff-mhd-prelouc=${pkgver}"
  "idos-timetable-tariff-mhd-prerov=${pkgver}"
  "idos-timetable-tariff-mhd-prestice=${pkgver}"
  "idos-timetable-tariff-mhd-pribram=${pkgver}"
  "idos-timetable-tariff-mhd-rokycany=${pkgver}"
  "idos-timetable-tariff-mhd-roudnicenl=${pkgver}"
  "idos-timetable-tariff-mhd-slany=${pkgver}"
  "idos-timetable-tariff-mhd-sokolov=${pkgver}"
  "idos-timetable-tariff-mhd-strakon=${pkgver}"
  "idos-timetable-tariff-mhd-stribro=${pkgver}"
  "idos-timetable-tariff-mhd-studenka=${pkgver}"
  "idos-timetable-tariff-mhd-sumperk=${pkgver}"
  "idos-timetable-tariff-mhd-tabor=${pkgver}"
  "idos-timetable-tariff-mhd-tachov=${pkgver}"
  "idos-timetable-tariff-mhd-teplicevc=${pkgver}"
  "idos-timetable-tariff-mhd-trutnov=${pkgver}"
  "idos-timetable-tariff-mhd-trebic=${pkgver}"
  "idos-timetable-tariff-mhd-trinec=${pkgver}"
  "idos-timetable-tariff-mhd-turnov=${pkgver}"
  "idos-timetable-tariff-mhd-uherskehradiste=${pkgver}"
  "idos-timetable-tariff-mhd-valasskemezirici=${pkgver}"
  "idos-timetable-tariff-mhd-varnsdorf=${pkgver}"
  "idos-timetable-tariff-mhd-velkemezirici=${pkgver}"
  "idos-timetable-tariff-mhd-vlasim=${pkgver}"
  "idos-timetable-tariff-mhd-vsetin=${pkgver}"
  "idos-timetable-tariff-mhd-zabrehnm=${pkgver}"
  "idos-timetable-tariff-mhd-zlin=${pkgver}"
  "idos-timetable-tariff-mhd-znojmo=${pkgver}"
  "idos-timetable-tariff-mhd-zamberk=${pkgver}"
  "idos-timetable-tariff-mhd-zatec=${pkgver}"
  "idos-timetable-tariff-mhd-zdarns=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  
  "idos-timetable-tariff-trains-cz"
  "idos-timetable-tariff-trains-sk"
  "idos-timetable-tariff-bus-cz"
  "idos-timetable-tariff-bus-sk"
  "idos-timetable-tariff-bus-odis"
  "idos-timetable-tariff-mhd-as"
  "idos-timetable-tariff-mhd-benesov"
  "idos-timetable-tariff-mhd-beroun"
  "idos-timetable-tariff-mhd-bilina"
  "idos-timetable-tariff-mhd-idsjmk"
  "idos-timetable-tariff-mhd-bruntal"
  "idos-timetable-tariff-mhd-breclav"
  "idos-timetable-tariff-mhd-bystricenp"
  "idos-timetable-tariff-mhd-caslav"
  "idos-timetable-tariff-mhd-ceskalipa"
  "idos-timetable-tariff-mhd-ceskytesin"
  "idos-timetable-tariff-mhd-dacice"
  "idos-timetable-tariff-mhd-decin"
  "idos-timetable-tariff-mhd-domazlice"
  "idos-timetable-tariff-mhd-duchcov"
  "idos-timetable-tariff-mhd-dvurkralovenl"
  "idos-timetable-tariff-mhd-frydekmystek"
  "idos-timetable-tariff-mhd-havlickuvbrod"
  "idos-timetable-tariff-mhd-havirov"
  "idos-timetable-tariff-mhd-horice"
  "idos-timetable-tariff-mhd-hradeckralove"
  "idos-timetable-tariff-mhd-hranice"
  "idos-timetable-tariff-mhd-iredo"
  "idos-timetable-tariff-mhd-cheb"
  "idos-timetable-tariff-mhd-chomutov"
  "idos-timetable-tariff-mhd-chrudim"
  "idos-timetable-tariff-mhd-jabloncecnn"
  "idos-timetable-tariff-mhd-jachymov"
  "idos-timetable-tariff-mhd-jicin"
  "idos-timetable-tariff-mhd-jihlava"
  "idos-timetable-tariff-mhd-jindrichuvhradec"
  "idos-timetable-tariff-mhd-kadan"
  "idos-timetable-tariff-mhd-karlovyvary"
  "idos-timetable-tariff-mhd-karvina"
  "idos-timetable-tariff-mhd-kladno"
  "idos-timetable-tariff-mhd-klasterecno"
  "idos-timetable-tariff-mhd-klatovy"
  "idos-timetable-tariff-mhd-kolin"
  "idos-timetable-tariff-mhd-kralupynv"
  "idos-timetable-tariff-mhd-krnov"
  "idos-timetable-tariff-mhd-kromeriz"
  "idos-timetable-tariff-mhd-kutnahora"
  "idos-timetable-tariff-mhd-liberec"
  "idos-timetable-tariff-mhd-litomerice"
  "idos-timetable-tariff-mhd-litomysl"
  "idos-timetable-tariff-mhd-louny"
  "idos-timetable-tariff-mhd-lovosice"
  "idos-timetable-tariff-mhd-marianskelazne"
  "idos-timetable-tariff-mhd-melnik"
  "idos-timetable-tariff-mhd-mladaboleslav"
  "idos-timetable-tariff-mhd-most"
  "idos-timetable-tariff-mhd-neratovice"
  "idos-timetable-tariff-mhd-novyjicin"
  "idos-timetable-tariff-mhd-nymburk"
  "idos-timetable-tariff-mhd-olomouc"
  "idos-timetable-tariff-mhd-opava"
  "idos-timetable-tariff-mhd-orlova"
  "idos-timetable-tariff-mhd-odis"
  "idos-timetable-tariff-mhd-ostrov"
  "idos-timetable-tariff-mhd-pelhrim"
  "idos-timetable-tariff-mhd-pisek"
  "idos-timetable-tariff-mhd-plzen"
  "idos-timetable-tariff-mhd-policka"
  "idos-timetable-tariff-mhd-pid"
  "idos-timetable-tariff-mhd-prostej"
  "idos-timetable-tariff-mhd-prelouc"
  "idos-timetable-tariff-mhd-prerov"
  "idos-timetable-tariff-mhd-prestice"
  "idos-timetable-tariff-mhd-pribram"
  "idos-timetable-tariff-mhd-rokycany"
  "idos-timetable-tariff-mhd-roudnicenl"
  "idos-timetable-tariff-mhd-slany"
  "idos-timetable-tariff-mhd-sokolov"
  "idos-timetable-tariff-mhd-strakon"
  "idos-timetable-tariff-mhd-stribro"
  "idos-timetable-tariff-mhd-studenka"
  "idos-timetable-tariff-mhd-sumperk"
  "idos-timetable-tariff-mhd-tabor"
  "idos-timetable-tariff-mhd-tachov"
  "idos-timetable-tariff-mhd-teplicevc"
  "idos-timetable-tariff-mhd-trutnov"
  "idos-timetable-tariff-mhd-trebic"
  "idos-timetable-tariff-mhd-trinec"
  "idos-timetable-tariff-mhd-turnov"
  "idos-timetable-tariff-mhd-uherskehradiste"
  "idos-timetable-tariff-mhd-valasskemezirici"
  "idos-timetable-tariff-mhd-varnsdorf"
  "idos-timetable-tariff-mhd-velkemezirici"
  "idos-timetable-tariff-mhd-vlasim"
  "idos-timetable-tariff-mhd-vsetin"
  "idos-timetable-tariff-mhd-zabrehnm"
  "idos-timetable-tariff-mhd-zlin"
  "idos-timetable-tariff-mhd-znojmo"
  "idos-timetable-tariff-mhd-zamberk"
  "idos-timetable-tariff-mhd-zatec"
  "idos-timetable-tariff-mhd-zdarns"
)

_target='komplet_p.zip'

source=(
  "${_target}::http://ttakt.chaps.cz/TTAktual/Win/Zip/KOMPLET_P.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "license-dummy.txt"
)

sha256sums=(
  'SKIP'
  "SKIP"
  "c6bb216055d3670d3100b7a74e04ce0644030f365f4349a09e630ef60fbcb9a4"
)

pkgver() {
  wget -nv -O- "${url}" | tr -d '\a' | tr '\n' '\a' | sed  's|^.*File KOMPLET_P.ZIP\(.*\)Zip/KOMPLET_P.ZIP.*$|\1\n|g' | tr '\a' '\n' | grep 'Update date:' | cut -d, -f1 | sed -r 's|([0-9]+)\.([0-9]+)\.([0-9]+).|\n\3_\2_\1\n|g' | grep -E '^[0-9]+_[0-9]+_[0-9]+'
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  install -d -m755 "${_instdir}"

  cp -r "${srcdir}"/Data* "${_instdir}/"
  chmod 755 "${_instdir}"/Data*
  chmod 644 "${_instdir}"/Data*/*

  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  echo "${url}" > "${pkgdir}/usr/share/doc/${_pkgname}/info.url"
  chmod 644 "${pkgdir}/usr/share/doc/${_pkgname}/info.url"

  install -D -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
  install -D -m644 "${srcdir}/IDOS-Licence.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
}
