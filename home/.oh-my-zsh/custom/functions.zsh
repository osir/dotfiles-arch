# Reads stdin from parameters and returns stripped string in stdout
stripSpecialCharacters ()
{
   sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" >&1
}

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
# Params: (wip) [mac], [interface]
fake-mac() {
    macchanger --mac=00:12:34:56:78:90 wlp4s0;
}

# Searches for a process with a regex
# Params: regex
psfind() {
    local regex="${1}"
    ps -A \
        | grep -e "${regex}"
}
