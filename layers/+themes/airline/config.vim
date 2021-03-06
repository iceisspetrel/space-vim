scriptencoding=utf-8

if LayerLoaded('airline')

    " vim-airline {
    if IsDir('vim-airline')
        let g:airline_theme='violet'
        let g:Powerline_symbols='fancy'
        let g:airline#extensions#default#section_truncate_width = {
                    \ 'b': 79,
                    \ 'x': 60,
                    \ 'y': 88,
                    \ 'z': 45,
                    \ 'warning': 80,
                    \ 'error': 80,
                    \ }
        let g:airline#extensions#default#layout = [
                    \ [ 'a', 'error', 'warning', 'b', 'c' ],
                    \ [ 'x', 'y', 'z' ]
                    \ ]
        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#tabline#buffer_nr_show=1

        " Distinct background color is enough to discriminate the warning and
        " error information.
        let g:airline#extensions#ale#error_symbol = '•'
        let g:airline#extensions#ale#warning_symbol = '•'
    endif

    " }
endif

