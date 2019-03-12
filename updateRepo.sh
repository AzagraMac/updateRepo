#!/bin/bash

#
# Date 12/03/2019
# Update repo github
#

# Comprueba si tiene la carpeta .git 
if [ ! -d '.git' ]; then
	echo 'This folder does not contain a Git repository'
	exit -1
fi

# Comprueba si se le pasa algun parametro 
if [ $# == 0 ]; then
	echo "It cant be empty, You must pass some parameter"
	echo "sample: file1 file2 folder..."
	exit -1
else
	# Comprueba si es fichero o directorio
	for file in $*; do
		if [ ! -e $file ]; then
			echo "$file No such file or directory"
			exit -1
		fi
	done
	
	# Guardamos los cambios en el repositorio local
	git add $*
	
	# Confirmamos los cambios con un commit
	echo "Enter commit: "
	read COMMIT
	git commit -m "$COMMIT"

	# Aplicamos los cambios y los subimos al repositorio, en la rama master. 
	git push origin master

fi
