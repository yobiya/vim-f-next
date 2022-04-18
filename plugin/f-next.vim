" 指定した文字の次の文字へ移動する

if exists('g:loaded_f_next')
  finish
endif
let g:loaded_f_next = 1

let s:save_cpo = &cpo
set cpo&vim

map <C-f> :call FNextStart()<CR>

fu! FNextStart()
  let target_char = nr2char(getchar())

  if target_char == "\<ESC>"
    " ESCが入力されたら、処理を終了する
    return
  endif

  " 現在のカーソルの位置から、指定した文字の位置を取得する
  let line_text = getline('.')
  let col = col('.')
  let target_index = stridx(line_text, target_char, col)

  if target_index < 0
    " 指定した文字は見つからなかった
    return;
  endif

  " 指定した文字の次の位置へカーソルを移動させる
  call cursor(line('.'), target_index + 2)
endfu

let &cpo = s:save_cpo
unlet s:save_cpo
