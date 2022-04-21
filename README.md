# vim-f-next

## 概要

このプラグインは `f` モーションで移動する機能の、さらに次の文字へ移動するための機能を提供します

デフォルトのキーマップは定義されていないので、各モードで必要なキーマップを設定する必要があります

```
nmap <C-f> :call FNext_n_f()<CR>
vmap <C-f> :call FNext_v_f()<CR>
omap <C-f> :call FNext_o_f()<CR>
```

