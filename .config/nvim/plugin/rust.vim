autocmd Filetype rust,rs setlocal makeprg=cargo\ check\ --message-format=short
autocmd Filetype rust,rs set efm=%-G\ -->\ ,%f:%l:%c

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
