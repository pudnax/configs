let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

autocmd Filetype rust,rs setlocal makeprg=cargo\ check\ --message-format=short
autocmd Filetype rust,rs set efm=%-G\ -->\ ,%f:%l:%c

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
