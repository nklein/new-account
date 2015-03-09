if [ ! "$0" = "`basename ${SHELL}`" ]; then
    for file in sh-tset interactive; do
        if [ -f ${HOME}/.dotenvs/${file} ]; then
            . ${HOME}/.dotenvs/${file}
        fi
    done

    PS1="  "
fi
