let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 ~/Dropbox/Docs/index.md
badd +6 ~/Dropbox/Docs/c.md
badd +10 ~/Dropbox/Docs/diary/2018-07-24.md
badd +535 dots/vimrc
badd +88 dots/vimrc.bundles
argglobal
silent! argdel *
edit dots/vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 123 + 123) / 247)
exe 'vert 2resize ' . ((&columns * 123 + 123) / 247)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
519
normal! zo
524
normal! zo
641
normal! zo
let s:l = 536 - ((5 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
536
normal! 026|
lcd ~/dotfiles
wincmd w
argglobal
if bufexists('~/.config/nvim/plugged/vim-obsession/doc/obsession.txt') | buffer ~/.config/nvim/plugged/vim-obsession/doc/obsession.txt | else | edit ~/.config/nvim/plugged/vim-obsession/doc/obsession.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/dotfiles
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 123 + 123) / 247)
exe 'vert 2resize ' . ((&columns * 123 + 123) / 247)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=aoOtIWcFs
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
