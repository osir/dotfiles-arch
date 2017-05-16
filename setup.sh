#!/usr/bin/env bash

readonly config="${0%/*}/setupconfig.sh"
source "$config"

main() {
    cd "$dotfiles_dir" || exit 1
    local mode="$1"

    case "$mode" in
        'link'|'Link')
            echo 'Creating links:'
            for i in "${!links[@]}"; do
                local src="$i"
                local dest="${links[$i]}"
                if [ -L "$dest" ]; then
                    printf '[INFO] Skiping existing link: %s\n' "$dest"
                    continue
                fi
                printf '[INFO] Linking: %s => %s\n' "$src" "$dest"
                ln --symbolic "$PWD/$src" "$dest"
            done
            ;;
        'clean'|'Clean')
            echo 'Removing links:'
            for i in "${!links[@]}"; do
                local link="${links[$i]}"
                printf '[INFO] Removing: %s\n' "$link"
                if [ -L "$link" ]; then
                    rm --verbose "$link"
                fi
            done
            ;;
        *)
            printf 'Unknown option "%s".\n' "$mode"
            printf 'Usage: setup.sh {link|clean}\n'
            printf '\nOptions:\n'
            printf '\t%s\t%s\n' 'link:'  'Links files to installation destinations'
            printf '\t%s\t%s\n' 'clean:' 'Removes created files'
            ;;
    esac
}

main $*

