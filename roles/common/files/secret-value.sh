function Secret-Value {
    local DATABASE=~/Dropbox/.keepass/keepass.kdbx
    local ENTRY=${1}
    local WHAT=${2}
    secret-tool lookup application keepass | \
        keepassxc-cli show --quiet --show-protected --attributes "${WHAT}" "${DATABASE}" "${ENTRY}"
}
