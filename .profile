
for file in sh-subs env; do
    if [ -f ${HOME}/.dotenvs/${file} ]; then
	. ${HOME}/.dotenvs/${file}
    fi
done

if [ -n "${FROM_BASHRC}" -o ! "$0" = "`basename ${SHELL}`" ]; then
    for file in sh-tset interactive; do
        if [ -f ${HOME}/.dotenvs/${file} ]; then
            . ${HOME}/.dotenvs/${file}
        fi
    done

    unset FROM_BASHRC
    PS1="  "
fi
