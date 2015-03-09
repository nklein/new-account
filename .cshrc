foreach file (csh-subs env)
    if ( -f ${HOME}/.dotenvs/${file} ) then
	source ${HOME}/.dotenvs/${file}
    endif
end

if ( "$0" != "`basename ${SHELL}`" ) then
    foreach file (csh-tset interactive)
        if ( -f ${HOME}/.dotenvs/${file} ) then
            source ${HOME}/.dotenvs/${file}
        endif
    end

    set prompt="  "
endif
