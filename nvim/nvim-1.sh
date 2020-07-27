
export NVIM_LISTEN_ADDRESS=127.0.0.1:6789 
nvr="/c/Python36/Scripts/nvr.exe"
nvim="/d/usr/Neovim/bin/nvim-qt.exe"

# colorscheme="summerfruit"
# airlinetheme="serene"

colorscheme="iceberg"
# airlinetheme="iceberg"

pid=`netstat -an -p tcp -o | grep 6789 | grep 'LISTENING' | awk '{ print $5 }'`

if [ "$pid" == "" ]; then

	echo "not running"

	$nvim --maximized -- &
	ret=$?

	sleep 3

	if [ "$colorscheme" != "" ]; then
		$nvr --nostart -s --remote-send "<esc>:colorscheme ${colorscheme}<cr>"
	fi
	if [ "$airlinetheme" != "" ]; then
		$nvr --nostart -s --remote-send "<esc>:let g:airline_theme= '${airlinetheme}'<cr>"
	fi

	$nvr --nostart -s --remote-send "<esc>:set titlestring=NVIM-1:\ %t%(\ %M%)%(\ (%{expand(\\\"%:~:.:h\\\")})%)%(\ %a%)<cr>"

	$nvr --nostart -s --remote-send "<esc>:cd ~<cr>"

	$nvr --nostart -s --remote-send "<f11>"


	if [ "$1" != "" ]; then
		$nvr --nostart -s --remote-send ":e $1<cr>"
	fi

	exit $ret

else

	echo "running: pid ${pid}"

	# $nvr --nostart -s --remote-tab-silent "$@"
	$nvr --nostart -s --remote-send "<esc>:tab drop $@<cr>"
	ret=$?

	cscript //nologo ~/.nvim/focus-NVIM.js

	exit $ret

fi

exit 0

