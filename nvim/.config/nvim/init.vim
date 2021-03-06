"  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
" ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███  ███   ███   ███
" ███    ███ ███  ███   ███   ███
"  ▀██████▀  █▀    ▀█   ███   █▀

" General settings {{{
  scriptencoding  utf-16    " allow emojis in vimrc
  set nocompatible          " vim, not vi
  syntax on                 " syntax highlighting
  filetype plugin indent on " try to recognize filetypes and load rel' plugins
" }}}

" Behavior Modifications {{{
  " set leader key
  let mapleader      = ' '
  let maplocalleader = ' '

  " setting general behaviors
  set background=dark   " tell vim what the background color looks like
  set backspace=2       " Backspace deletes like most programs in insert mode
  set history=200       " how many : commands to save in history
  set ruler             " show the cursor position all the time
  set showcmd           " display incomplete commands
  set incsearch         " do incremental searching
  set laststatus=2      " Always display the status line
  set autowrite         " Automatically :write before running commands
  set ignorecase        " ignore case in searches
  set smartcase         " use case sensitive if capital letter present or \C
  set magic             " Use 'magic' patterns (extended regular expressions)
  set noshowmode        " don't show mode as airline already does
  set showcmd           " show any commands
  set foldmethod=manual " set folds by syntax of current language
  set mouse=a           " enable mouse (selection, resizing windows)
  set iskeyword+=-      " treat dash separated words as a word text object
  set softtabstop=2     " indent using two spaces
  set tabstop=2         " Softtabs or die! use 2 spaces for tabs.
  set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
  set expandtab         " insert tab with right amount of spacing
  set shiftround        " Round indent to multiple of 'shiftwidth'
  set termguicolors     " enable true colors
  set hidden            " enable hidden unsaved buffers
  set showmatch         " Briefly move the cursor to the matching brace
  set ttimeoutlen=0     " Eliminate delay when switching modes
  set gdefault          " Add the g flag to search/replace by default
  set noerrorbells      " Disable error bells
  set title             " Show the current mode

  " support italics with tmux...
  set t_ZH=[3m
  set t_ZR=[23m

  " Don't show the intro message when starting Vim
  " Also suppress several 'Press Enter to continue messages' especially
  " with FZF
  set shortmess=aoOtIWcFs

  " Turn off swapfiles
  set noswapfile
  set nobackup
  set nowb

  " Stop vim trying to syntax highlight long lines, typically found in minified
  " files. This greatly reduces lag yet is still wide enough for large displays
  set synmaxcol=500

  " if not neovim
  if !has('nvim')             " does not work on neovim
    set emoji                 " treat emojis 😄  as full width characters
    set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
  end

  set ttyfast           " should make scrolling faster
  set lazyredraw        " should make scrolling faster
  set scrolloff=5       " Start scrolling before cursor gets to the edge
  set sidescrolloff=15
  set sidescroll=1      " smooth horizontal scrolling
  " visual bell for errors
  set visualbell

  " wildmenu
  set wildmenu                        " enable wildmenu
  set wildmode=list:longest,list:full " configure wildmenu

  " text appearance
  set textwidth=100
  set cursorline                      " Highlight current line
  set nostartofline                   " Keep the cursor in the same place when switching buffers
  set nowrap                          " nowrap by default
  set list                            " show invisible characters
  set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

  " Line numbers
  set number
  set numberwidth=1
  set relativenumber

  " Centralize backups, swapfiles and undo history
  set backupdir=~/.config/nvim/backups
  set directory=.,$TEMP " Stop the swp file warning
  " Don’t create backups when editing files in certain directories
  set backupskip=/tmp/*,/private/tmp/*

  " persistent undo between file reloads
  if has('persistent_undo')
    set undodir=~/.config/nvim/undo
    set undofile
    set undolevels=1000
    set undoreload=10000
  endif

  " Respect modeline in files
  set modeline
  set modelines=4

  " Enable per-directory .vimrc files and disable unsafe commands in them
  set exrc
  set secure

  " Open new split panes to right and bottom, which feels more natural
  set splitbelow
  set splitright

  set spelllang=en    " Spell check
  set spellfile=$HOME/.vim-spell-en.utf-8.add
  " Set spellfile to location that is guaranteed to exist, can be symlinked to Dropbox/Git
  let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

  " Don't scan included files. '.tags' file more performant
  set complete-=i
  " Autocomplete with dictionary words when spell check is on
  set complete+=kspell
  " Prevent autocomplete options opening in scratchpad
  set completeopt-=preview

  " This is set low so that gitgutter updates reasonably quickly
  " https://github.com/airblade/vim-gitgutter#when-are-the-signs-updated
  set updatetime=300

  " Always use vertical diffs
  set diffopt+=vertical
  " set shell to zsh
  set shell=/bin/zsh
  " highlight fenced code blocks in markdown
  let g:markdown_fenced_languages = [
        \ 'html',
        \ 'vim',
        \ 'js=javascript',
        \ 'json',
        \ 'python',
        \ 'sql',
        \ 'bash=sh'
        \ ]
  " enable folding in bash files
  let g:sh_fold_enabled=1
" }}}

" Plugin Modifications (BEFORE loading bundles) {{{
  " Shortcut for checking if a plugin is loaded
  " ----------------------------------------------------------------------------
  function! s:has_plugin(plugin)
    let lookup = 'g:plugs["' . a:plugin . '"]'
    return exists(lookup)
  endfunction

  " disable GNU Global message
  let g:loaded_gentags#gtags = 1

  " Neoterm:
  " ----------------------------------------------------------------------------
  if has('nvim')
    " Navigate neovim + neovim terminal emulator with alt+direction
    tnoremap <c-h> <C-\><C-n><C-w>h
    tnoremap <c-j> <C-\><C-n><C-w>j
    tnoremap <c-k> <C-\><C-n><C-w>k
    tnoremap <c-l> <C-\><C-n><C-w>l

    " easily escape terminal
    tnoremap <leader><esc> <C-\><C-n><esc><cr>
    tnoremap <C-o> <C-\><C-n><esc><cr>

    " quickly toggle term
    nnoremap <silent> <leader><tab> :rightbelow Ttoggle<cr><C-w>j
    " close terminal
    tnoremap <silent> <leader><tab> <C-\><C-n>:Ttoggle<cr>

    " send stuff to REPL using NeoTerm
    nnoremap <silent> <c-s>r :TREPLSendLine<CR>
    vnoremap <silent> <c-s>r :TREPLSendSelection<CR>
  endif

  " VimMatchUp:
  " ----------------------------------------------------------------------------
  let g:matchup_transmute_enabled = 1
  let g:matchup_matchparen_deferred = 1

  " UndoTree:
  " ----------------------------------------------------------------------------
  if s:has_plugin('undotree')
    let g:undotree_WindowLayout = 2
    nnoremap <silent> <leader>ut :UndotreeToggle<CR>
    " nnoremap <f5> :UndotreeToggle<cr>
  endif

  " NeovimCompletionManager (NCM):
  " ----------------------------------------------------------------------------
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

  " use tab to cycle through completions
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  let g:cm_sources_override = {
      \ 'cm-ultisnips': { 'enable': 0 }
      \ }

  " CopyRTF: Copy code as RTF
  " ----------------------------------------------------------------------------
  nnoremap <silent> <leader><C-c> :set nonumber<CR>:CopyRTF<CR>:set number<CR>

  " SplitJoin:
  " ----------------------------------------------------------------------------
  if s:has_plugin('splitjoin')
    let g:splitjoin_align = 1
    " let g:splitjoin_trailing_comma = 1
  endif

  " IndentLine
  " ----------------------------------------------------------------------------
  if s:has_plugin('indentLine')
    let g:indentLine_fileType = [
          \ 'java',
          \ 'javascript',
          \ 'javascript.jsx',
          \ 'html',
          \ 'vim'
          \ ]
    let g:indentLine_char = '│'
    let g:indentLine_color_term = 238
    let g:indentLine_color_gui = '#454C5A'
  endif

  " Prettier
  " ---------------------------------------------------------------------------
  if s:has_plugin('vim-prettier')
    let g:prettier#exec_cmd_async = 1
    nmap <leader>pf <Plug>(Prettier)
  endif

  " BufExplorer
  " ----------------------------------------------------------------------------
  if s:has_plugin('bufexplorer')
    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerShowNoName = 1
    nnoremap <leader>B :BufExplorer<cr>
  endif

  " EasyClip
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-easyclip')
    let g:EasyClipUseSubstituteDefaults = 0
    let g:EasyClipUsePasteDefaults = 0
    nmap s <plug>SubstituteOverMotionMap
    xmap s <plug>XEasyClipPaste
    imap <c-v> <plug>EasyClipInsertModePaste
    " Place a mark (m taken by easyclip)
    nnoremap gm m
  endif

  " BufOnly
  " Close all buffers except current
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-bufonly')
    nnoremap <leader>b :BufOnly<cr>
  endif

  " Javascript
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-javascript')
    let g:javascript_plugin_jsdoc=1
  endif

  " Better Whitespace
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-better-whitespace')
    autocmd BufEnter * EnableStripWhitespaceOnSave
    highlight ExtraWhitespace ctermbg=red guibg = #e06c75
  endif

  " Sneak
  " Jump to any location specified by two characters
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-sneak')
    let g:sneak#use_ic_scs = 0
    nmap <leader>s <Plug>Sneak_s
    nmap <leader>S <Plug>Sneak_S
    xmap <leader>s <Plug>Sneak_s
    xmap <leader>S <Plug>Sneak_S
    let g:sneak#streak = 1
  endif

  " EasyMotion
  " Simpler way to navigate through a file
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-easymotion')
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    " `s{char}{char}{label}`
    " Two keystrokes to navigate
    nmap s <Plug>(easymotion-overwin-f2)
    " Turn on case insensitive feature
    let g:EasyMotion_smartcase = 1
    " JK motions: Line motions
    nmap <leader>j <Plug>(easymotion-j)
    nmap <leader>k <Plug>(easymotion-k)
  endif

  " Match Tag Always
  " ----------------------------------------------------------------------------
  if s:has_plugin('MatchTagAlways')
    let g:mta_filetypes = {
          \ 'html' : 1,
          \ 'xhtml' : 1,
          \ 'xml' : 1,
          \ 'javascript': 1,
          \}
    nnoremap <leader>% :MtaJumpToOtherTag<cr>
  endif

  " Polyglot
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-polyglot')
    let g:polyglot_disabled = ['markdown', 'scss']
    let g:jsx_ext_required = 0
  endif

  " SplitJoin
  " ----------------------------------------------------------------------------
  if s:has_plugin('splitjoin.vim')
    let g:splitjoin_split_mapping = ''
    let g:splitjoin_join_mapping = ''
    nmap gj :SplitjoinSplit<cr>
    nmap gk :SplitjoinJoin<cr>
  endif

  " CloseTag
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-closetag')
    let g:closetag_filenames = "*.html,*.js,*.jsx"
    let g:closetag_close_shortcut = ''
    let g:closetag_xhtml_filetypes = 'xhtml,jsx'
  endif

  " Auto Pairing
  " ----------------------------------------------------------------------------
  if s:has_plugin('auto-pairs')
    let g:AutoPairsCenterLine = 0
  endif

  " Taboo
  " Tab management
  " ----------------------------------------------------------------------------
  if s:has_plugin('taboo.vim')
    let g:taboo_tabline = 0 " Let airline handle it all
    let g:taboo_renamed_tab_format = '%l%m'
    nnoremap th :tabprev<cr>
    nnoremap tl :tabnext<cr>
    nnoremap tn :tabnew<cr>
    nnoremap td :tabclose<cr>
    nnoremap to :TabooOpen<space>
    nnoremap tr :TabooRename<space>
  endif

  " NERDTree
  " ----------------------------------------------------------------------------
  if s:has_plugin('nerdtree')
    let g:NERDTreeWinSize = 15
    let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeShowHidden = 1
    let NERDTreeHijackNetrw = 1
    let NERDTreeAutoDeleteBuffer = 1
  endif

  " FZF: Fuzzy File Finder
  " ----------------------------------------------------------------------------
  if s:has_plugin('fzf.vim')
    let g:fzf_height = '30%'
    let g:fzf_commits_log_options = '--color --graph --pretty=format:"%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(bold blue)(%cr) %Cred<%an>%Creset" --abbrev-commit'

    nnoremap <c-p> :FZF<cr>
    nnoremap <c-i> :Buffers<cr>
    nnoremap <c-t> :BLines<cr>
    nnoremap <c-a> :Ag<cr>
    nnoremap <c-c> :Commits<cr>
    nnoremap <c-n> :BCommits<cr>
    nnoremap <silent> <BS> :History:<cr>

    " Allow options to be passed to FZF :Ag
    " Probably quite hacky until a better solution appears
    " https://github.com/junegunn/fzf.vim/issues/92#issuecomment-191248596
    function! s:ag_with_opts(arg, bang)
      let tokens  = split(a:arg)
      let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
      let query   = join(filter(copy(tokens), 'v:val !~ "^-"'))
      call fzf#vim#ag(query, '--hidden --ignore .git', a:bang ? {} : {'down': '40%'})
    endfunction

    if has('autocmd')
      autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)
    endif
  endif

  if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag with ack.vim - https://github.com/ggreer/the_silver_searcher#vim
    let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
  endif

  if executable('jq')
    " JSON beautifier
    nnoremap <leader>z :%!jq '.'<cr>
  endif

  " Airline
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-airline')
    let g:airline#extensions#branch#enabled = 1
    let g:airline_theme='solarized'
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tmuxline#enabled = 0
    let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
    let g:airline#extensions#tabline#buffers_label = ''
    let g:airline#extensions#tabline#fnamemod = ':t' " Show the filename
    let g:airline#extensions#tabline#fnamecollapse = 0
    let g:airline#extensions#tabline#show_tab_nr = 0
    let g:airline#extensions#tabline#buffer_nr_show = 0
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline#extensions#default#layout = [
          \ [ 'a', 'b', 'c' ],
          \ [ 'x', 'z', 'error', 'warning' ]
          \ ]
  endif

  " Git Gutter
  " ----------------------------------------------------------------------------
  if s:has_plugin('vim-gitgutter')
    let g:gitgutter_sign_added = '•'
    let g:gitgutter_sign_modified = '•'
    let g:gitgutter_sign_removed = '•'
    let g:gitgutter_sign_modified_removed = '•'
    let g:gitgutter_map_keys = 0
    nnoremap <silent> + :GitGutterNextHunk<cr>
    nnoremap <silent> _ :GitGutterPrevHunk<cr>
    "nmap [c <Plug>GitGutterPrevHunk
    "nmap ]c <Plug>GitGutterNextHunk
  endif

  " Ale: Best Vim Linter
  " ----------------------------------------------------------------------------
  if s:has_plugin('ale')
    let g:ale_sign_error = 'x'
    let g:ale_sign_warning = '~'
    let airline#extensions#ale#error_symbol = 'Err: '
    let airline#extensions#ale#warning_symbol = 'Warn: '
    let g:ale_echo_msg_format = '%linter% | %s (%code%)'
    let g:ale_lint_delay = 1000
    let g:ale_lint_on_text_changed = 'always'
    let g:ale_linters = {'html': [] }
    let g:ale_fixers = {}
    let g:ale_fixers.javascript = ['standard']
    let g:ale_fix_on_save = 1

    nmap ]a <Plug>(ale_next_wrap)
    nmap [a <Plug>(ale_previous_wrap)
  endif

  " Vim Wiki
  " ----------------------------------------------------------------------------
  let g:vimwiki_list = [{ 'path': '~/Dropbox/Docs/', 'syntax': 'markdown', 'ext': '.md' }]
  nmap <leader>lt :VimwikiToggleListItem<cr>

  " Golden Ratio
  " ----------------------------------------------------------------------------
  let g:golden_ratio_exclude_nonmodifiable = 1
  nnoremap <Leader>gt :GoldenRatioToggle<cr>

  " Limelight + Goyo
  " ----------------------------------------------------------------------------
  nnoremap <Leader>l :Limelight!!<cr>
  nnoremap <Leader>G :Goyo<cr>

  " Limelight :: focus mode
  " default: 0.5
  let g:limelight_default_coefficient = 0.7
  let g:limelight_paragraph_span = 1
  let g:limelight_priority = -1
  " Beginning/end of paragraph
  "   When there's no empty line between the paragraphs
  "   and each paragraph starts with indentation
  let g:limelight_bop = '^\s'
  let g:limelight_eop = '\ze\n^\s'
  let g:goyo_width = '120'

  let g:background_before_goyo = &background

  function! s:goyo_enter()
    let g:background_before_goyo = &background
    if has('gui_running')
      set linespace=7
    elseif exists('$TMUX')
      silent !tmux set status off
    endif
    Limelight
  endfunction

  function! s:goyo_leave()
    if has('gui_running')
      set linespace=0
    elseif exists('$TMUX')
      silent !tmux set status on
    endif
    execute 'Limelight!'
    execute 'set background=' . g:background_before_goyo
  endfunction

  augroup GOYO
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
  augroup END

  " gv.vim / gl.vim
  " ----------------------------------------------------------------------------
  function! s:gv_expand()
    let line = getline('.')
    GV --name-status
    call search('\V'.line, 'c')
    normal! zz
  endfunction

  autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>
" }}}

" Load Plugins {{{
  if filereadable(expand('~/.config/nvim/vimrc.bundles'))
    source ~/.config/nvim/vimrc.bundles
  endif
" }}}

" General Config {{{
  " Theme (light | mirage | dark)
  " let ayucolor="dark"
  colo ayu
  " colo solarized

  " hi Comment cterm=italic
  hi Comment gui=italic

  " Remapping {{{
    fun! OpenConfigFile(file)
      if (&filetype ==? 'startify')
        execute 'e ' . a:file
      else
        execute 'tabe ' . a:file
      endif
    endfun
    " edit vimrc
    nnoremap <silent> <leader>vr :call OpenConfigFile(~/.config/nvim/init.vim)<cr>
    nnoremap <silent> <leader>vb :call OpenConfigFile('~/.config/vim/vimrc.bundles')<cr>
    " reload vimrc
    nnoremap <leader>so :source ~/.config/nvim/init.vim<cr>
    nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
    inoremap jk <ESC>


    " copy to system clipboard
    noremap gy "+y
    " copy whole file to system clipboard
    nnoremap gY gg"+yG
    " Save file
    nnoremap <silent><leader>w :silent w<cr>
    " Save & Exit file
    nnoremap <silent><leader>x :silent x<cr>
    " Switch to last buffer
    nnoremap <leader><leader> <C-^>
    " toggle folds
    nnoremap <leader>F za
    " toggle folds recursively
    nnoremap <leader>f zA
    " save current session
    nnoremap <leader>ss :Obsession<cr>

    " move to beginning/end of line
    nnoremap B ^
    nnoremap E $

    map <C-\> :NERDTreeToggle<cr>

    nnoremap <leader>; :Scratch<cr>
    augroup ScratchToggle
      autocmd!
      autocmd FileType scratch nnoremap <buffer> <leader>sc :q<CR>
    augroup END
  " }}}

" Remap annoying mistakes to something useful
" cnoreabbrev W! w!
" cnoreabbrev Q! q!
" cnoreabbrev q: :q
" cnoreabbrev Qall! qall!
" cnoreabbrev Wq wq
" cnoreabbrev Wa wa
" cnoreabbrev wQ wq
" cnoreabbrev WQ wq
" cnoreabbrev W w
" cnoreabbrev Qa q
" cnoreabbrev Qall qall

" Key mappings
" ------------------------------------------------------------------------------
" Force j and k to work on display lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" Disable arrow keys
noremap <right> <Nop>
noremap <left> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

" Delete line but preserve the space
nnoremap dD S<Esc>
" Make `Y` work from the cursor to the end of line
nnoremap Y y$

" Reformat whole file and move back to original position
nnoremap g= gg=G``

" Use K to join current line with line above, just like J does with line below
nnoremap K kJ

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Split
noremap <silent><leader>h :split<cr>
noremap <silent><leader>vv :vsplit<cr>

" Spellcheck
nnoremap <Leader>sc :setlocal spell!<cr>

" Clear search (highlight)
" nnoremap <silent> <leader>k :noh<cr>

" Automatically 'gv' (go to previously selected visual block)
" after indenting or unindenting.
vnoremap < <gv
vnoremap > >gv

" VimPlug:
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" change dir to current file's dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Press enter for newline without insert
" nnoremap <cr> o<esc>

" Output the current syntax group
nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" Automatic commands
" ------------------------------------------------------------------------------

augroup always-open-signcolumn
  autocmd!
  autocmd BufEnter * sign define dummy
  autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

" Open help in a vertical split
augroup vimrc-help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | setlocal relativenumber | endif
augroup END

augroup file-types
  autocmd!

  " vimscript foldmethod
  autocmd FileType vim setlocal foldmethod=marker
  " Override some syntaxes so things look better
  autocmd BufNewFile,BufRead *.html setlocal syntax=swig
  autocmd BufNewFile,BufRead *.sss setlocal syntax=stylus
  autocmd BufNewFile,BufRead *.ts,*.snap*,*.es6,*.tsx setlocal filetype=javascript.jsx
  autocmd BufNewFile,BufRead *stylelintrc,*eslintrc,*babelrc,*jshintrc setlocal syntax=json
  autocmd BufNewFile,BufRead *.css setlocal syntax=scss
  autocmd BufNewFile,BufRead *.cshtml setlocal filetype=cshtml

  " Wrap text and turn on spell for markdown files
  autocmd BufNewFile,BufRead *.md setlocal wrap linebreak spell filetype=markdown
  autocmd BufNewFile,BufRead *.md setlocal foldmethod=indent
  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
  " NERDTree fixed window
  function! s:ignore_golden_ratio ()
    let b:golden_ratio_resizing_ignored = 1
    let g:golden_ratio_exclude_nonmodifiable = 1
  endfunction
  autocmd FileType nerdtree :call s:ignore_golden_ratio()
augroup END

" Switch between normal and relative line numbers and cursorline
" when switching modes
augroup highlight-when-switching-modes
  autocmd!
  autocmd InsertEnter * setlocal number norelativenumber nocursorline
  autocmd InsertLeave * setlocal relativenumber cursorline
  autocmd WinEnter    * setlocal cursorline
  autocmd WinLeave    * setlocal nocursorline
augroup END

" Periodically check for file changes
augroup checktime
  autocmd!
  autocmd CursorHold * silent! checktime
augroup END

" Resize splits when vim changes size (like with tmux opening/closing)
augroup auto-resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

