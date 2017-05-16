# Searches files in Directory for lines matching the Pattern and prints them to stdout
# Params: pattern, [directory]
find-lines()
{
    if [ -z "$1" ]; then
        echo "Usage: findLines <pattern> [directory]"
    elif [ -z "$2" ]; then
        grep -Irnw '.' -e $1
    else
        grep -Irnw $2 -e $1
    fi
}

# Creates a directory and CDs into it
# Params: directory name
mkcd()
{
    if [ -z "$*" ]; then
        echo "Usage: mkcd <directory name>"
        return 1
    fi
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

# Clones a repository from github
# Params: repository owner, repository name
gh-clone()
{
    if [ -z "$*" ]; then
        echo "Usage: gh-clone <repository owner> <repository name>"
        return 1;
    fi
    local url="https://github.com/$1/$2"
    git clone $url
}

#
#
add-path(){
    if [ -z "$*" ]; then
        echo "Usage: add-path <path/to/program> <programname>";
        return 1;
    fi
    sudo ln -s `realpath $1` "/usr/local/bin/$2";
}

# Sets the MAC Address of Wifi Interface
# Params: [mac], [interface]
fake-mac() {
    if [ "$1" != "" ]; then
        local new_mac="$1";
    else
        local new_mac="00:12:34:56:78:90";
    fi
    if [ "$2" != "" ]; then
        local interface="$2";
    else
        local interface="wlp4s0";
    fi
    if [ "$new_mac" != "rand" ]; then
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

# Shows a graphical representation of the current sub-directories
# Params: [base dir]
tree() {
    echo
    if [ "$1" != "" ]  #if parameter exists, use as base folder
    then cd "$1"
    fi
    pwd
    ls -R | grep ":$" |   \
    sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
    # 1st sed: remove colons
    # 2nd sed: replace higher level folder names with dashes
    # 3rd sed: indent graph three spaces
    # 4th sed: replace first dash with a vertical bar

    if [ $(ls -F -1 | grep "/" | wc -l) = 0 ]   # check if no folders
    then echo "   -> no sub-directories"
    fi
    echo
}

# Teleports to a corresponding link in ~/tp/
# Params: [link name]
tp() {
    local linkdir="$HOME/.tp"
    local target="$1"
    if [ -z "$target" ]; then
        \ls -1 "$linkdir"
        return 0
    fi
    cd $(head -n 1 "$linkdir/$target"*) || return 2
}

