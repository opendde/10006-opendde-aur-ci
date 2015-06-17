## arg 1:  the new package version
pre_install() {
    return
}

## arg 1:  the new package version
post_install() {
    cat << __EOF__
Add the following to the respective sections of your UnrealTournament.ini
only if you also have ut1999-bonuspack1 installed:
    [Engine.GameEngine]
    ServerPackages=RocketArenaMultiMesh
__EOF__
}

## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
    return
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
    return
}

## arg 1:  the old package version
pre_remove() {
    return
}

## arg 1:  the old package version
post_remove() {
    cat << __EOF__
Remove the following from the respective sections of your UnrealTournament.ini:
    [Engine.GameEngine]
    ServerPackages=RocketArenaMultiMesh
__EOF__
}

## vim: filetype=sh
