vim9script

import autoload "lsp/lsp.vim"

var default_counts = {"Warn": 0, "Error": 0}

export def UpdateErrorCounts()
	b:lsp_diag_counts = lsp.ErrorCount()
enddef

export def Warnings(): string
	var warnings = get(b:, "lsp_diag_counts", default_counts).Warn
	return warnings > 0 ? $"W:{warnings}" : ""
enddef

export def Errors(): string
	var errors = get(b:, "lsp_diag_counts", default_counts).Error
	return errors > 0 ? $"E:{errors}" : ""
enddef

export def OK(): string
	var lsp_diag_counts = get(b:, "lsp_diag_counts", default_counts)
	var total = lsp_diag_counts.Warn + lsp_diag_counts.Error
	return total == 0 ? "OK" : ""
enddef
