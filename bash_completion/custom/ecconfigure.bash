#!/bin/bash

__ecconfigure_advice(){
    echo ""
    echo -en "\033[0;31m$1\033[0m"
    COMPREPLY=('~=~=~=~=~=~' '=~=~=~=~=~=')
}

__ecconfigure_error(){
    echo ""
    echo -en "\033[0;35m$1\033[0m"
    COMPREPLY=('~=~=~=~=~=~' '=~=~=~=~=~=')
}


__ecconfigure(){

    local cur prev pprev i line

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    pprev="${COMP_WORDS[COMP_CWORD-2]}"

    COMPREPLY=()

    local cmd_exists=0
    local params=()
    local param

    local OLDIFS="$IFS"
    local IFS=$'\n'

    while read line; do

        cmd_exists=1

        if [[ $line =~ --[A-Za-z]+=\<.+\> ]]; then
            param=${BASH_REMATCH[0]}
        elif [[ $line =~ --[A-Za-z]+=[^[:space:]]+ ]]; then
            param=${BASH_REMATCH[0]}
        else
            echo "DOES'T MATCH: $line"
            continue
        fi

        params+=($param)

    done < <("$1" --help 2>/dev/null | grep -E '^  --')

    if [[ $cmd_exists -eq 0 ]]; then
        __ecconfigure_error "Error: command \"$1\" not found!"
        IFS="$OLDIFS"
        return
    fi

    local realparam
    local short_complite=0

    if [[ $cur = '=' ]]; then
        realparam=$prev
        cur=""
    elif [[ $prev = '=' ]]; then
        realparam=$pprev
    fi

    if [[ -n $realparam ]]; then

        for (( i=0; i<=$(( ${#params[*]} - 1 )); i++ )); do

            param="${params[$i]%%=*}"

            if [[ $realparam = $param ]]; then

                COMPREPLY=(${params[$i]})
                short_complite=1

                break
            fi

        done

    else

        COMPREPLY=($(compgen -W '${params[@]}' -- "${cur%%=*}"))

    fi

    if [[ ${#COMPREPLY[*]} -eq 1 ]]; then

        param=${COMPREPLY[0]}
        local skip=0
        local part1
        local part2

        if [[ $param =~ (--[A-Za-z]+=)\<(.+)\> ]]; then

            part1=${BASH_REMATCH[1]}
            part2=${BASH_REMATCH[2]}

            if [[ -n $realparam ]]; then

                if [[ $part2 == *'|'* ]]; then

                    local IFS='|'
                    local args=($part2)
                    local IFS=$'\n'

                    skip=1

                    COMPREPLY=()

                    for (( i=0; i<=$(( ${#args[*]} - 1 )); i++ )); do
                        if [[ $short_complite -eq 1 ]]; then
                            COMPREPLY+=(${args[$i]})
                        else
                            COMPREPLY+=("${part1}${args[$i]}")
                        fi
                    done

                    COMPREPLY=($(compgen -W '${COMPREPLY[@]}' -- "$cur"))

                    compopt +o nospace

                fi

            fi

        elif [[ $param =~ (--[A-Za-z]+=)([^[:space:]]+) ]]; then

            part1=${BASH_REMATCH[1]}
            part2=${BASH_REMATCH[2]}

        fi

        if [[ -n $realparam ]]; then

            if [[ $skip -eq 0 ]]; then
                __ecconfigure_advice "<enter the \"$part2\" here>"
            fi

        else
            COMPREPLY=($part1)
        fi

    fi

    IFS="$OLDIFS"

}

complete -o nospace -F __ecconfigure ecconfigure ecconfigure.exe
