let path = expand('%:p:h')
let config = [
			\ 'keybinds.vim',
			\ 'plugins/*.vim',
			\]
for files in config
	for file in glob(path.files,1,1)
		exec 'source' f
	endfor
endfor

