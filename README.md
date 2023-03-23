# lightline-lsp

Simple plugin to integrate [yegappan/lsp](https://github.com/yegappan/lsp) with [lightline.vim](https://github.com/itchyny/lightline.vim).
Currently it shows only the number of errors and warnings.
Planned support to display progress notifications in lightline (Different language servers send different progress notifications).

Heavily inspired by [halkn/lightline-lsp](https://github.com/halkn/lightline-lsp).

# Usage

Set `component_expand` for `warning`, `error` and `ok` components to the autoload functions and specify their types.
For example,

```
vim9script

g:lightline = {
	"active": {
		"right": [
			["lineinfo"],
			["filetype"],
			["lsp_warnings", "lsp_errors", "lsp_ok"]
		],
	},
	"component_expand": {
		"lsp_warnings": "lightline_lsp#Warnings",
		"lsp_errors": "lightline_lsp#Errors",
		"lsp_ok": "lightline_lsp#OK"
	},
	"component_type": {
		"lsp_warnings": "warning",
		"lsp_errors": "error",
		"lsp_ok": "middle",
	}
}
```
