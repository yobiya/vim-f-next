" 指定した文字の次の文字へ移動する

if exists('g:loaded_f_next')
  finish
endif
let g:loaded_f_next = 1

let s:save_cpo = &cpo
set cpo&vim

nmap <C-f> :call FNext_n_f()<CR>
vmap <C-f> :call FNext_v_f()<CR>
omap <C-f> :call FNext_o_f()<CR>

fu! FNext_n_f()
  let target_index = s:find_target_index()
  if (target_index < 0)
    " 指定した文字が見つからなかった場合は終了する
    return
  endif

  " 指定した文字の次の位置へカーソルを移動させる
  " カーソルの位置は1から始まるので、インデックスには+2する
  call cursor(line('.'), target_index + 2)
endfu

fu! FNext_v_f()
  " 未実装
endfu

fu! FNext_o_f()
  let target_index = s:find_target_index()
  if (target_index < 0)
    " 指定した文字が見つからなかった場合は終了する
    return
  endif

  " 指定した文字の次の位置へカーソルを移動させる
  " オペレータの処理の場合はインデックスには+3する
  call cursor(line('.'), target_index + 3)
endfu

fu! s:find_target_index()
  let target_char = nr2char(getchar())

  if target_char == "\<ESC>"
    " ESCが入力されたら、処理を終了する
    return -1
  endif

  " 現在のカーソルの位置から、指定した文字の位置を取得する
  let line_text = getline('.')
  let col = col('.')
  let target_index = stridx(line_text, target_char, col)

  return target_index
endfu

let &cpo = s:save_cpo
unlet s:save_cpo
