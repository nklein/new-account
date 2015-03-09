for file in sh-subs env; do
    if [ -f ${HOME}/.dotenvs/${file} ]; then
	. ${HOME}/.dotenvs/${file}
    fi
done

. ${HOME}/.profile
