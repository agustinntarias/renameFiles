renameFiles () {
	for file in "$1"/*
	do 
		exp1='\(^.*\)\([^0-9]\)\([0-9]\)$'
		exp2='\(^.*\)\([^0-9]\)\([0-9]\{2\}\)$'
	
		new_name="$(echo $file | sed "/$exp1/ s/$exp1/\1\200\3/; /$exp2/ s/$exp2/\1\20\3/")"
		if [ $new_name != $file ]
		then
			echo "Changing $file to  $new_name"
			mv "$file" "$new_name"
		fi
	done
}
