if LayerLoaded('fzf')

    if !g:spacevim_gui_running
        " fzf.vim {
        if IsDir('fzf.vim')
            " Customize fzf colors to match your color scheme
            let g:fzf_colors = {
                        \ 'fg':      ['fg', 'Normal'],
                        \ 'bg':      ['bg', 'Normal'],
                        \ 'hl':      ['fg', 'Function'],
                        \ 'fg+':     ['fg', 'String', 'CursorColumn', 'Normal'],
                        \ 'bg+':     ['bg', 'Statusline', 'CursorColumn'],
                        \ 'hl+':     ['fg', 'Type'],
                        \ 'info':    ['fg', 'PreProc'],
                        \ 'prompt':  ['fg', 'Conditional'],
                        \ 'pointer': ['fg', 'Error'],
                        \ 'marker':  ['fg', 'String'],
                        \ 'spinner': ['fg', 'Label'],
                        \ 'header':  ['fg', 'Comment'],
                        \   }
            nmap <Leader>? <plug>(fzf-maps-n)
            xmap <Leader>? <plug>(fzf-maps-x)
            omap <Leader>? <plug>(fzf-maps-o)

            nnoremap <Leader>bb :Buffers<CR>

            nnoremap <Leader>b? :Buffers<CR>
            nnoremap <Leader>w? :Windows<CR>
            nnoremap <Leader>f? :Files<CR>

            nnoremap <Leader>ff :Files ~<CR>
        endif
        " }

        " fzf-filemru {
        if IsDir('fzf-filemru')
            nnoremap <Leader>pr :ProjectMru --tiebreak=end<cr>
        endif
        " }
    else
        nnoremap <Leader>? :nmap<CR>
    endif

endif

