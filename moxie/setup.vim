set keywordprg=perl\ -CA\ keywordprg.pl
set guifont=Andale\ Mono\ 13
set sw=4
cal setreg('d',"        if (!defined($mems{$item})) {\n          say $f_undef \"item $item not defined\", __LINE__, $F[0];\n          next;\n        }\n")
cal setreg('a',"        $matches[$i]++;\n        next;\n    }\n    $linenums[$i] = __LINE__ if $j == 0; $i++;\n")
" imap <Enter> <Esc>jA
let g:syntastic_disabled_filetypes=['asm']
silent SyntasticToggleMode
set iskeyword=@,48-57,_,192-255,.
