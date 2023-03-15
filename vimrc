runtime! debian.vim

": {{{ Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/vim/bundle')

": {{{ Plugins
Plugin 'VundleVim/Vundle.vim'

"* Misc plugins
Plugin 'tpope/vim-surround'             " Surround selection
Plugin 'google/vim-searchindex'         " Show search index & occurence
Plugin 'airblade/vim-gitgutter'         " Github changes in the gutter (lines)
Plugin 'markonm/traces.vim'             " Live substitute/search
Plugin 'mhinz/vim-startify'             " Start screen
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'vimlab/split-term.vim'          " Vim shell
Plugin 't9md/vim-choosewin'             " Choose window
Plugin 'Galac512/vim-aesenc'            " AES files
Plugin 'skywind3000/quickmenu.vim'      " Menu
"* Markdown
if $TERM =~# '^xterm.*'
	Plugin 'iamcco/markdown-preview.vim'    " Live markdown for vim
endif
"* Indent/Syntax
Plugin 'vim-syntastic/syntastic'        " Syntax checking
Plugin 'octol/vim-cpp-enhanced-highlight' " Syntax coloring for C++
"* Writing
Plugin 'dpelle/vim-Grammalecte'         " Grammar for french
Plugin 'tmsvg/pear-tree' " Automatically double simple/curly/squared brackets...

Plugin 'godlygeek/tabular'              " Better text lining
Plugin 'terryma/vim-multiple-cursors'   " Multiple cursor for vim
Plugin 'tpope/vim-abolish'              " To avoid stupid mistakes
Plugin 'jeetsukumaran/vim-buffergator'
" * Completion
Plugin 'https://github.com/prabirshrestha/async.vim'
Plugin 'https://github.com/prabirshrestha/asyncomplete.vim'
Plugin 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plugin 'https://github.com/prabirshrestha/vim-lsp'
Plugin 'https://github.com/prabirshrestha/asyncomplete-buffer.vim'
Plugin 'https://github.com/prabirshrestha/asyncomplete-emoji.vim'
Plugin 'https://github.com/prabirshrestha/asyncomplete-file.vim'
Plugin 'https://github.com/krzbe/vim-lsp-inactive-regions'
Plugin 'https://github.com/jackguo380/vim-lsp-cxx-highlight'
"* Colorschemes
Plugin 'tlhr/anderson.vim'
Plugin 'romainl/Apprentice'
Plugin 'longhinus/vim-code-dark'        " Theme & colorscheme
Plugin 'flazz/vim-colorschemes'
Plugin 'NLKNguyen/PaperColor-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'chxuan/change-colorscheme'
"* Nerdtree
Plugin 'scrooloose/nerdtree'            " Project tree explorer
Plugin 'jistr/vim-nerdtree-tabs'        " Nerdtree with tabs
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'    "Colored stuff
if $TERM =~# '^xterm.*'
	Plugin 'ryanoasis/vim-devicons'         " Icons for nerdtree
endif
"* ASM
Plugin 'philj56/vim-asm-indent'
" }}}

call vundle#end()            " required
filetype plugin indent on    " required
"}}}


": {{{ nVIM Settings

"* Case insensitive search mode
set ignorecase

"* Faster REGEX
set re=1

"* True colors
if $TERM =~# '^xterm.*'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"* Mouse support
if has('mouse')
    set mouse=a
endif

"* Highlighting
syntax on

"* Splitting configuration
set splitbelow
set splitright

"* Tab
set tabstop=4
set shiftwidth=4
set noexpandtab

"* Use the system's clipboard
set clipboard=unnamedplus

"* Show line number
set number
set relativenumber

"* Colorscheme
set background=dark
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
      \   'theme': {
      \     'default': {
      \       'allow_bold': 1,
      \       'allow_italic': 1,
      \       'transparent_background': 0
      \     }
      \   },
      \   'language': {
      \     'python': {
      \       'highlight_builtins' : 1
      \     },
      \     'c': {
      \       'highlight_standard_library': 1,
      \       'highlight_builtins' : 1
      \     },
      \     'cpp': {
      \       'highlight_standard_library': 1,
      \       'highlight_builtins' : 1
      \     }
      \   }
      \ }

let s:transparent = 0
function! Transparent()
	if s:transparent == 0
		let s:transparent = 1
		let g:PaperColor_Theme_Options = {
				\   'theme': {
				\     'default': {
				\       'transparent_background': 1
				\     }
				\   }
				\ }
        colorscheme PaperColor
		echo("Background is now transparent!")
	else
		let s:transparent = 0
		let g:PaperColor_Theme_Options = {
				\   'theme': {
				\     'default': {
				\       'transparent_background': 0
				\     }
				\   }
				\ }
        colorscheme PaperColor
		echo("Background is no longer transparent!")
	endif
endfunction
nnoremap <A-t> :call Transparent()<CR>

"* Indent
filetype indent on

"* Vim statusline
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)
set laststatus=2

"* Syntax indent
if $TERM =~# '^xterm.*'
	set listchars=tab:▏\ ,trail:·
else
	set listchars=tab:\|\ ,trail:_
endif

"* Spellcheck
let &t_Ce = "\e[4:1m"
hi SpellBad guibg=none ctermbg=none gui=undercurl term=undercurl cterm=undercurl

"* Auto Fold
set foldmethod=marker

"* Other
set list
"}}}


": {{{ General plugin Setting
"* Live Markdown
let g:previm_open_cmd = 'qutebrowser'

"* Window navigator
let g:choosewin_overlay_enable = 1

"* Iris

"* Pear tree
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'}
            \ }
" See pear-tree/ftplugin/ for filetype-specific matching rules

" Pear Tree is enabled for all filetypes by default:
let g:pear_tree_ft_disabled = []

" Pair expansion is dot-repeatable by default:
let g:pear_tree_repeatable_expand = 1

" Smart pairs are disabled by default:
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60

" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)

"* CPP syntax
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

"* GitGutter
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '⬆'
let g:gitgutter_sign_modified_removed = '⬇'

"* Grammalecte
let g:grammalecte_cli_py='~/Downloads/Grammalecte-fr-v0.6.5/grammalecte-cli.py'

"* Startify
function! s:headerMessage() " {{{
	return [
		\ '                       ,,ggddY"""Ybbgg,,',
		\ '                   ,gd""''             `""bg,',
		\ '                 ,gdY                     "Ybg,',
		\ '               ,dY"                          "Yb,',
		\ '             ,dY"                              "Yb,',
		\ '            ,8"           ,8888,                 "8,',
		\ '           ,8''           ,88''''88,                 `8,',
		\ '          ,8''            88''  ''88,                 `8,',
		\ '          d''             8''    ,88,                 `b',
		\ '          8                   ,8888,                 8',
		\ '          8                  ,88''''88,                8',
		\ '          8                 ,88''  ''88,               8',
		\ '          8                ,88''    ''88,  ,8          8',
		\ '          Y,              ,88''      ''88,,88         ,Y',
		\ '          `8,             88''        ''8888''        ,8''',
		\ '           `8,                                    ,8''',
		\ '            `8a                                  a8''',
		\ '             `Yba                              adY''',
		\ '               "Yba                          adY"',
		\ '                 `"Yba,                  ,adY"''',
		\ '                    `"Y8ba,           ,ad8Y',
		\ '                        ``""YYbaaddYY""'''''
		\ ]
endfunction "}}}

function! s:filter_header(lines)
	let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
	let centered_lines = map(copy(a:lines),
		\ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
	return centered_lines
endfunction

let g:startify_custom_header = s:filter_header(s:headerMessage())

let g:startify_custom_footer = [
	\ '                 .88888888:.',
	\ '                88888888.88888.',
	\ '              .8888888888888888.',
	\ '              888888888888888888',
	\ '              88'' _`88''_  `88888',
	\ '              88 88 88 88  88888',
	\ '              88_88_::_88_:88888',
	\ '              88:::,::,:::::8888',
	\ '              88`:::::::::''`8888',
	\ '             .88  `::::''    8:88.',
	\ '            8888            `8:888.',
	\ '          .8888''             `888888.',
	\ '         .8888:..  .::.  ...:''8888888:.',
	\ '        .8888.''     :''     `''::`88:88888',
	\ '       .8888        ''         `.888:8888.',
	\ '      888:8         .           888:88888',
	\ '    .888:88        .:           888:88888:',
	\ '    8888888.       ::           88:888888',
	\ '    `.::.888.      ::          .88888888',
	\ '   .::::::.888.    ::         :::`8888''.:.',
	\ '  ::::::::::.888   ''         .::::::::::::',
	\ '  ::::::::::::.8    ''      .:8::::::::::::.',
	\ ' .::::::::::::::.        .:888:::::::::::::',
	\ ' :::::::::::::::88:.__..:88888:::::::::::''',
	\ '  `''.:::::::::::88888888888.88:::::::::''',
	\ '        `'':::_:'' -- '''' -''-'' `'':_::::''',
	\ ]

function! s:is_repo()
	silent !git -C . log > /dev/null
	return v:shell_error
endfunction

function! s:list_commits()
	let git = 'git -C .'
	let commits = systemlist(git .' log --oneline --pretty=format:''%h%Creset%C(yellow)%d%Creset %s (%cr) <%an>'' --abbrev-commit| head -n10')
	let git = 'G'. git[1:]
	return map(commits, '{"line": v:val, "cmd": "'. git .' --no-pager show ". matchstr(v:val, "^\\x\\+") }')
endfunction

function! s:custom_places()
    return [
          \ { 'line': 'Password Manager', 'cmd': 'e ~/Documents/Passwords.aesf' },
          \ ]
endfunction


if s:is_repo() == 0
	let g:startify_lists = [
				\ { 'type': 'sessions',                 'header': ['  Sessions']       },
				\ { 'type': function('s:list_commits'), 'header': ['  Commits']},
				\ { 'type': 'dir',                      'header': ['  Recent files in '. getcwd()] },
				\ { 'type': 'files',                    'header': ['  Recent files']            },
				\ { 'type': 'bookmarks',                'header': ['  Bookmarks']      },
				\ { 'type': 'commands',                 'header': ['  Commands']       },
				\ ]
else
	let g:startify_lists = [
				\ { 'type': 'sessions',                 'header': ['  Sessions']       },
				\ { 'type': 'dir',                      'header': ['  Recent files in '. getcwd()] },
				\ { 'type': 'files',                    'header': ['  Recent files']            },
				\ { 'type': 'bookmarks',                'header': ['  Bookmarks']      },
				\ { 'type': 'commands',                 'header': ['  Commands']       },
				\ ]
endif

autocmd User Startified setlocal cursorline

"* Split term
let g:disable_key_mappings = 1

"* Nerd tree
if $TERM =~# '^xterm.*'
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
endif
let g:NERDTreeWinPos = 'right'
" }}}


if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif


": {{{ Misc
"* Switch from Dark/Bright theme
let s:dark_theme = 1
function! SwitchTheme()
    if s:dark_theme == 1
        let s:dark_theme = 0
        set background=light
        colorscheme PaperColor
        echo("Switched to bright theme!")
    else
        let s:dark_theme = 1
        set background=dark
        colorscheme PaperColor
        echo("Switched to dark theme!")
    endif
endfunction

nnoremap <A-k> :call SwitchTheme()<CR>
"}}}


": {{{ Keybindings

"* Jump to end of line
imap <C-e> <esc>A

"* Jump to beginning of line
imap <C-a> <esc>I

"* Nerd tree
nmap <C-k> :NERDTreeTabsToggle<CR>

"* Choose windwow
nmap  -  <Plug>(choosewin)

"* Open terminal
nmap <C-b> :10Term<CR>

"* Open calculator
nnoremap <C-c> :2Term python3<CR>

"* Launch python script
map <F5> <ESC> :!python3 %<CR>

"* Hide/Show bar
set noshowmode
set laststatus=0
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set showmode
        set laststatus=0
        echo("Minimized GUI")
    else
        let s:hidden_all = 0
        set noshowmode
        set laststatus=2
        echo("Extended GUI")
    endif
endfunction
nnoremap <C-h> :call ToggleHiddenAll()<CR>

"* Spell checking
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :setlocal spell! spelllang=fr<CR>

"* Easizer resize
nnoremap <silent> <C-up> :vertical resize +4<CR>
nnoremap <silent> <C-down> :vertical resize -4<CR>

"* Navigating with guides
autocmd FileType tex,html,php inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
autocmd FileType tex,html,php vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
autocmd FileType tex,html,php map <Space><Tab> <Esc>/<++><Enter>"_c4l
"}}}


": {{{ SNIPPETS
"* LaTeX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Compile document
autocmd FileType tex inoremap <F5> <Esc>:!pdflatex<space>"%"<Enter>
autocmd FileType tex nnoremap <F5> :!pdflatex<space>"%"<Enter>

"{{{ Snippet menu
function! g:TexSnippets_Vector()
	set cmdheight=2
	call inputsave()
	let l:name = input('Name of the vector: ')
	echo(" ")
	let l:dim = input('Dimension of the vector: ')
	call inputrestore()
	set cmdheight=1

	if l:name != ''
		let l:output = '\overrightarrow{' . l:name . '} \begin{pmatrix} <++> '
	else
		let l:output = '\begin{pmatrix} <++> '
	endif
	let l:i = 1
	while l:i < l:dim
		let l:output = l:output . '\\ <++> '
		let l:i = l:i + 1
	endwhile
	let l:output = l:output . '\end{pmatrix}<++>'
	execute 'normal a' . l:output
endfunction

function! g:TexSnippets_System()
	set cmdheight=1
	call inputsave()
	let l:dim = input('Dimension of the system: ')
	call inputrestore()
	set cmdheight=1

	let l:output = '\begin{cases}\n'
	let l:i = 0
	while l:i < l:dim
		let l:output = l:output . '<++> \\\n'
		let l:i = l:i + 1
	endwhile
	let l:output = l:output . '\end{cases}<++>'
	let l:output = substitute(l:output, '\\n', '\n', 'g')
	execute 'normal a' . l:output
endfunction

function! g:TexSnippets_Matrix()
	set cmdheight=2
	call inputsave()
	let l:dim1 = input('Dimension 1 of the matrix: ')
	echo(" ")
	let l:dim2 = input('Dimension 2 of the matrix: ')
	call inputrestore()
	set cmdheight=1

	let l:i = 1
	let l:line = '<++>'
	while l:i < l:dim2
		let l:line = l:line . ' & <++>'
		let l:i = l:i + 1
	endwhile
	let l:line = l:line . ' \\\n'

	let l:i = 0
	let l:output = '\begin{pmatrix}\n'
	while l:i < l:dim1
		let l:output = l:output . l:line
		let l:i = l:i + 1
	endwhile
	let l:output = l:output . '\end{pmatrix}<++>'
	let l:output = substitute(l:output, '\\n', '\n', 'g')
	execute 'normal a' . l:output
endfunction

function! g:TexSnippets_2DPlotter()
	set cmdheight=6
	call inputsave()
	let l:xmin = input('Xmin: ')
	echo(" ")
	let l:xmax = input('Xmax: ')
	echo(" ")
	let l:ymin = input('Ymin: ')
	echo(" ")
	let l:ymax = input('Ymax: ')
	echo(" ")
	let l:func1 = input('Function (Code): ')
	echo(" ")
	let l:func2 = input('Function (Display): ')
	call inputrestore()
	set cmdheight=1

	let l:output = '\begin{tikzpicture}[domain=' . l:xmin . ':' . l:xmax . ']\n\draw[very thin, color=gray] (' . l:xmin . ',' . l:ymin . ') grid (' . l:xmax . ',' . l:ymax . ');\n\draw[->] (' . l:xmin . ',0) -- (' . l:xmax . ',0) node[right] {$x$};\n\draw[->] (0,' . l:ymin . ') -- (0,' . l:ymax . ') node[right] {$y$};\n\draw[color=red, samples=100] plot (\x, {' . l:func1 . '}) node[right] {$f(x) = ' . l:func2 . '$};\n'


	let l:output = l:output . '\end{tikzpicture}'
	let l:output = substitute(l:output, '\\n', '\n', 'g')
	execute 'normal a' . l:output
endfunction

function! g:TexSnippets()
	let g:quickmenu_options = "HL"
	call g:quickmenu#reset()

	" Title
	call g:quickmenu#header('LaTeX Snippets')

	" Style

	" Math section
	call g:quickmenu#append('# Math', '')

	call quickmenu#append('Vector', 'call g:TexSnippets_Vector()', 'Create a vector')
	call quickmenu#append('System', 'call g:TexSnippets_System()', 'Create a system')
	call quickmenu#append('Matrix', 'call g:TexSnippets_Matrix()', 'Create a matrix')

	" Tikz section
	call g:quickmenu#append('# TikZ', '')

	call quickmenu#append('2D Plotter', 'call g:TexSnippets_2DPlotter()', 'Plot a 2D function')

	call quickmenu#toggle(0)
endfunction
autocmd FileType tex inoremap ,m <Esc>:call g:TexSnippets()<cr>
"}}}

autocmd FileType tex inoremap ,wr \begin{wrapfigure}[]{r}{0.3\textwidth}<Enter><Enter>\end{wrapfigure}<Esc>k
autocmd FileType tex inoremap ,*  \cdot 
autocmd FileType tex inoremap ,ds  \displaystyle 
autocmd FileType tex inoremap ,br  \hfill\break<enter>
autocmd FileType tex inoremap ,v2 \overrightarrow{} \begin{pmatrix}<++> \\ <++>\end{pmatrix}<++><Esc>3T{i
autocmd FileType tex inoremap ,rar \overrightarrow{}<++><Esc>T{i
autocmd FileType tex inoremap ,lar \overleftarrow{}<++><Esc>T{i
autocmd FileType tex inoremap ,fr \frac{}{<++>}<++><Esc>2T{i
autocmd FileType tex inoremap ,fb \framebox{<Enter><Enter>}<Enter><Enter><++><Esc>3ki    
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,un \underline{}<++><Esc>T{i
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd filetype tex inoremap ,ol \begin{enumerate}<enter><enter>\end{enumerate}<enter><enter><++><esc>3ka\item<space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd filetype tex inoremap ,dl \begin{description}<enter><enter>\end{description}<enter><enter><++><esc>3ka\item<space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>
autocmd FileType tex inoremap ,sb <Enter>\subitem<Space>
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"* LaTeX template
autocmd FileType tex inoremap ,tkzgr \begin{tikzpicture}[domain=0:4]<Tab><Enter>\draw[very thin,color=gray] (-0.1,-1.1) grid (3.9,3.9);<Tab><Enter>\draw[->] (-0.2,0) -- (4.2,0) node[right] {$x$}; <Tab><Enter>\draw[->] (0,-1.2) -- (0,4.2) node[above] {$f(x)$};<Tab><Enter>\draw[color=red]    plot (\x,\x)             node[right] {$f(x) =x$}; <Tab><Enter>\end{tikzpicture}

"* PHP/HTML
autocmd FileType php,html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType php,html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType php,html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ,li <Esc>o<li></li><Esc>F>a
autocmd FileType php,html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType php,html inoremap ,td <td></td><++><Esc>Fdcit
autocmd FileType php,html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ,th <th></th><++><Esc>Fhcit
autocmd FileType php,html inoremap ,tab <table><Enter></table><Esc>O
autocmd FileType php,html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType php,html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType php,html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType php,html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType php,html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType php,html inoremap &<space> &amp;<space>

autocmd FileType php,html inoremap ,tex <img src="./tex/.svg" class="tex" alt="<++>"><esc>29ha

"* Markdown
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
"}}}
