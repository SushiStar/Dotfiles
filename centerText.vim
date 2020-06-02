function CentreText()
    35vnew
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
