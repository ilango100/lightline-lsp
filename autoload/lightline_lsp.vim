vim9script

import autoload "lsp/lsp.vim"

var lsp_diag_counts = {"Warn": 0, "Error": 0}

export def UpdateErrorCounts()
	lsp_diag_counts = lsp.ErrorCount()
enddef

export def Warns(): string
	var warns = lsp_diag_counts.Warn
	return warns > 0 ? $"W:{warns}" : ""
enddef

export def Errors(): string
	var errors = lsp_diag_counts.Error
	return errors > 0 ? $"E:{errors}" : ""
enddef

export def OK(): string
	var total = lsp_diag_counts.Warn + lsp_diag_counts.Error
	return total == 0 ? "OK" : ""
enddef
