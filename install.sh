post_install() {
    systemctl daemon-reload
}

post_upgrade() {
    systemctl daemon-reload
}

post_remove() {
    systemctl daemon-reload
}
