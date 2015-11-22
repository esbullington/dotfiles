
function ListFileTypes()
	echo join(map(split(globpath(&rtp, 'ftplugin/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")'), "\n");
endfunction
