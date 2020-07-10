" Config start on netrew if no file or dir specified
 let g:currentmode={
			\ 'n'  		: ' NORMAL ',
			\ 'no'     	: 'N·Operator Pending ',
			\ 'r' 		: ' REPLACE ',
			\ 'v'  		: ' VISUAL ',
			\ 'V'      	: ' V·Line ',
			\ "\<C-V>" 	: ' V·Block ',
			\ 's'      	: ' Select ',
			\ 'S'      	: ' S·Line ',
			\ "\<C-S>" 	: ' S·Block ',
			\ 'i'  		: ' INSERT ',
			\ 'R'       : ' R ',
			\ 'Rv'      : ' V·Replace ',
			\ 'c'       : ' COMMAND ',
			\ 'cv'      : ' Vim Ex ',
			\ 'ce'      : ' Ex ',
			\ 'rm'      : ' More ',
			\ 'r?'      : ' Confirm ',
			\ '!'       : ' Shell ',
			\ 't'       : ' Terminal '
			\}
set statusline=											" clear the statusline for when vimrc is reloaded
set statusline+=\ %{currentmode[mode()]}\|\|			"mode
set statusline+=\ \%t\%m								"file name & modification indicate
set statusline+=\ %{tagbar#currenttag('\-\>\ %s','')}   "Function name
set statusline+=%=                         				"right align
set statusline+=line:\ %l/%L,\ col:\ %c\ 				"line and col
set statusline+=\|\|\ %{strftime('%H:%M')}\ \ 			"time


tnoremap <silent> <C-[><C-[> <C-\><C-n>
function GetTerm()
    15new
    set invnumber invrelativenumber
    set nocursorline
    terminal
endfunction


