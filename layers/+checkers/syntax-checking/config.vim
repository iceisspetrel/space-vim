scriptencoding utf-8

if LayerLoaded('syntax-checking')

    " ale
    if IsDir('ale')
        let g:ale_linters = {
                    \   'sh' : ['shellcheck'],
                    \   'vim' : ['vint'],
                    \   'html' : ['tidy'],
                    \   'python' : ['flake8'],
                    \   'markdown' : ['mdl'],
                    \   'javascript' : ['eslint'],
                    \}
        " If emoji not loaded, use default sign
        try
            let g:ale_sign_error = emoji#for('boom')
            let g:ale_sign_warning = emoji#for('small_orange_diamond')
        catch
            " Use same sign and distinguish error and warning via different color
            let g:ale_sign_error = '•'
            let g:ale_sign_warning = '•'
        endtry
        let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
        let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
        " For a more fancy ale statusline
        function! ALEGetError()
            let l:res = ale#statusline#Status()
            if l:res ==# 'OK'
                return ''
            else
                let l:e_w = split(l:res)
                if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
                    return ' •' . matchstr(l:e_w[0], '\d\+') .' '
                endif
            endif
        endfunction
        function! ALEGetWarning()
            let l:res = ale#statusline#Status()
            if l:res ==# 'OK'
                return ''
            else
                let l:e_w = split(l:res)
                if len(l:e_w) == 2
                    return ' •' . matchstr(l:e_w[1], '\d\+')
                elseif match(l:e_w, 'W') > -1
                    return ' •' . matchstr(l:e_w[0], '\d\+')
                endif
            endif
        endfunction
        if g:spacevim_gui_running
            let g:ale_echo_msg_error_str = 'Error'
            let g:ale_echo_msg_warning_str = 'Warning'
        else
            let g:ale_echo_msg_error_str = '✹ Error'
            let g:ale_echo_msg_warning_str = '⚠ Warning'
        endif
    endif

    " syntastic
    if IsDir('syntastic')
        let g:syntastic_python_checkers=['pyflakes']
        let g:syntastic_javascript_checkers=['jsl', 'jshint']
        let g:syntastic_html_checkers=['tidy', 'jshint']
        let g:syntastic_error_symbol='✹'
        let g:syntastic_warning_symbol='✴'
        let g:syntastic_aggregate_errors=1

        nnoremap <Leader>ts :SyntasticToggleMode<CR>
    endif

endif
