#!/bin/tcsh
source scripts/colors.sh

echo "${Green}--> Compiling imperio components... ${NC}"

echo "${Green}Compiling component:   ${Brown} Imperio components ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

set LIB=imperio_lib

echo "${Green}library: ${LIB} ${NC}"
rm -rf ${MSIM_LIBS_PATH}/${LIB}

vlib ${MSIM_LIBS_PATH}/${LIB}
vmap ${LIB} ${MSIM_LIBS_PATH}/${LIB}

vlog -work ${LIB} -quiet -sv ../imperio/sourcecode/imperio.sv   || exit 1
vlog -work ${LIB} -quiet -sv ../imperio/sourcecode/memwrap.sv   || exit 1

echo "${Cyan}--> Imperio components compilation complete! ${NC}"

