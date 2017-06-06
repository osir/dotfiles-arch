# Searches files in Directory for lines matching the Pattern and prints them to stdout
# Params: pattern, [directory]
find-lines()
{
    if [[ -z "$1" ]]; then
        echo "Usage: find-lines <pattern> [directory]"
    elif [[ -z "$2" ]]; then
        grep -Irnw '.' -e "$1"
    else
        grep -Irnw "$2" -e "$1"
    fi
}

# Creates a directory and CDs into it
# Params: directory name
mkcd()
{
    if [[ -z "$*" ]]; then
        echo "Usage: mkcd <directory name>"
        return 1
    fi
    local dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

# Clones a repository from github
# Params: repository owner repository name
ghcl()
{
    if [[ -z "$*" ]]; then
        echo "Usage: gh-cl<repository owner> <repository name>"
        return 1;
    fi
    local url="https://github.com/$1/$2"
    git clone $url
}

#
#
add-path(){
    if [[ -z "$*" ]]; then
        echo "Usage: add-path <path/to/program> <programname>";
        return 1;
    fi
    sudo ln -s `realpath $1` "/usr/local/bin/$2";
}

# Sets the MAC Address of Wifi Interface
# Params: [mac], [interface]
fake-mac() {
    if [[ "$1" != "" ]]; then
        local new_mac="$1";
    else
        local new_mac="00:12:34:56:78:90";
    fi
    if [[ "$2" != "" ]]; then
        local interface="$2";
    else
        local interface="wlp4s0";
    fi
    if [[ "$new_mac" != "rand" ]]; then
        sudo macchanger --mac="$new_mac" "$interface";
    else
        sudo macchanger -A "$interface";
    fi
}

# Searches for a process with a regex
# Params: regex
psfind() {
    local regex="${1}"
    ps -A \
        | grep -e "${regex}"
}

# Teleports to a corresponding link in ~/tp/
# Params: [link name]
tp() {
    local linkdir="$HOME/.tp"
    local target="$1"
    if [[ -z "$target" ]]; then
        for f in "$linkdir/"*; do
            printf '%s\t%s\n' "${f##*/}" $( head -n 1 $f )
        done
        return 0
    fi
    cd $(head -n 1 "$linkdir/$target"*) || return 2
}

# Links an executable to a directory that is in $PATH
# Params: executable [link name]
lnpath() {
    local pathdir='/usr/bin'
    if [[ -z "$1" ]]; then
        echo "Usage: lnpath <executable> [link name]"
        return 1
    else
        local executable=$( realpath "$1" )
    fi
    if [[ -z "$2" ]]; then
        local target="$pathdir/${executable##*/}"
    else
        local target="$pathdir/$2"
    fi

    if [[ -e "$target" ]]; then
        printf '%s already exists\n' "$target"
        return 1
    fi

    sudo ln -s "$executable" "$target"
}

# converts a ssh:// url to an ssh command
# Params: url [username]
ussh() {
    local url="$1"
    local user="$2"
    local cmd=''
    if [[ "$url" != 'ssh://'* ]]; then
        echo 'Invalid URL, has to start with ssh://'
        return 1
    fi
    cmd=$( sed -e 's/:[/]\+/ /' -e 's/:/ -p/' <<< "$url" )
    if [[ -n "$user" ]]; then
        cmd=$( sed "s/ssh\s/ssh $user@/" <<< "$cmd" )
    fi
    eval "$cmd"
}

