autocmd Filetype zig setlocal makeprg=zig\ build

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
