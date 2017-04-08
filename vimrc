" http://spf13.com

" Environment {
    " Basics {
        set nocompatible        " Must be first line
        set background=dark     " Assume a dark background
    " }
" }


" Use before && bundles config {
    execute printf("source %s/vimrc.before", g:cc_vimrc_path)
    execute printf("source %s/vimrc.bundles", g:cc_vimrc_path)
" }

" Formatting {
    set shiftwidth=4                " 每一级缩进的长度
    set tabstop=4                   " 一个 tab 显示出来是多少个空格的长度
    set softtabstop=4               " 编辑模式的时候按退格键的时候退回缩进的长度
    set expandtab                   " 输入tab时自动将其转化为空格
" }

" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " 语法高亮
" }

" Vim UI {
    set number                      " 当前行

    if &term == 'xterm' || &term == 'screen'
        set t_Co=256
    endif

    set list                        " 显示非可见字符
    set listchars=tab:>-,trail:-    " 高亮

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " 配色
    endif
" }

" Key (re)Mappings {
    if !exists('g:spf13_leader')
        let mapleader = ','
    else
        let mapleader=g:spf13_leader
    endif

" }

" Plugins {
    " Tabularize {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    " }

    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            "let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    "
    " YouCompleteMe {
        if count(g:spf13_bundle_groups, 'youcompleteme')
            let g:acp_enableAtStartup = 0

            " enable completion from tags
            let g:ycm_collect_identifiers_from_tags_files = 1

            " remap Ultisnips for compatibility for YCM
            let g:UltiSnipsExpandTrigger = '<C-j>'
            let g:UltiSnipsJumpForwardTrigger = '<C-j>'
            let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

            " For snippet_complete marker.
            if !exists("g:spf13_no_conceal")
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif
            endif

            " Disable the neosnippet preview candidate window
            " When enabled, there can be too much visual noise
            " especially when splits are used.
            set completeopt-=preview
        endif
    " }
" }

" fix vimerl && youcompleteme : {
    let g:ycm_cache_omnifunc = 0
" }
"
" Uselocal config {
    execute printf("source %s/vimrc.local", g:cc_vimrc_path)
" }
