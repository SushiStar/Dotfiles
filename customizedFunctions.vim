" Config start on netrew if no file or dir specified
au VimEnter * if eval("@%") == "" | e . | endif

" Setting status line
 let g:currentmode={
       \ 'n'  : ' NORMAL ',
       \ 'v'  : ' VISUAL ',
       \ 'V'  : ' V·Line ',
       \ ''   : 'V·Block ',
       \ 'i'  : ' INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace',
       \ 'c'  : 'COMMAND ',
	   \ 't'  : 'Terminal',
       \}

let separator = ' || '
set statusline=									" clear the statusline for when vimrc is reloaded
set statusline+=\ %{currentmode[mode()]}		"mode
set statusline+=%{separator}
set statusline+=%t\%m							" file name & modification indicate
set statusline+=%=                         		" right align
set statusline+=%{separator}
set statusline+=LINE:\ %l/%L,\ COL:\ %c
set statusline+=%{separator}
set statusline+=%p%%							" percentage of file
set statusline+=%{separator}

function CentreText()
    40vnew
    set invnumber invrelativenumber
    wincmd l
endfunction

tnoremap <silent> <C-[><C-[> <C-\><C-n>
function GetTerm()
    15new
    set invnumber invrelativenumber
    set nocursorline
    terminal
endfunction


