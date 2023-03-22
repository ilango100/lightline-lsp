vim9script

import autoload "../autoload/lightline_lsp.vim"

augroup lightline_lsp
	autocmd!
	autocmd User LspDiagsUpdated {
		lightline_lsp.UpdateErrorCounts()
		lightline#update()
	}
augroup END
