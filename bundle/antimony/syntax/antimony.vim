if exists("b:current_syntax")
    finish
endif

syntax keyword antimonyKeyword species const model function at end in compartment is
syntax keyword antimonyFunction string

syntax match antimonyBrackets "\v[\(\)\[\]\}\{}]"

syntax match antimonyOperator "\v\*"
syntax match antimonyOperator "\v\^"
syntax match antimonyOperator "\v/"
syntax match antimonyOperator "\v\+"
syntax match antimonyOperator "\v-"
syntax match antimonyOperator "\v\?"
syntax match antimonyOperator "\v\="
syntax match antimonyOperator "\v\*\="
syntax match antimonyOperator "\v/\="
syntax match antimonyOperator "\v\+\="
syntax match antimonyOperator "\v-\="
syntax match antimonyOperator "\v\=\>"
syntax match antimonyOperator "\v-\>"

syntax match antimonyComment "\v//.*$"

syntax match antimonyOperator "\v-\="

" integer
syn match antimonyInteger "\<\d\+L"
syn match antimonyInteger "\<0x\([0-9]\|[a-f]\|[A-F]\)\+L"
syn match antimonyInteger "\<\d\+[Ee]+\=\d\+L"

" number with no fractional part or exponent
syn match antimonyNumber "\<\d\+\>"
" hexadecimal number
syn match antimonyNumber "\<0x\([0-9]\|[a-f]\|[A-F]\)\+"

" floating point number with integer and fractional parts and optional exponent
syn match antimonyFloat "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\="
" floating point number with no integer part and optional exponent
syn match antimonyFloat "\<\.\d\+\([Ee][-+]\=\d\+\)\="
" floating point number with no fractional part and optional exponent
syn match antimonyFloat "\<\d\+[Ee][-+]\=\d\+"

" complex number
syn match antimonyComplex "\<\d\+i"
syn match antimonyComplex "\<\d\++\d\+i"
syn match antimonyComplex "\<0x\([0-9]\|[a-f]\|[A-F]\)\+i"
syn match antimonyComplex "\<\d\+\.\d*\([Ee][-+]\=\d\+\)\=i"
syn match antimonyComplex "\<\.\d\+\([Ee][-+]\=\d\+\)\=i"
syn match antimonyComplex "\<\d\+[Ee][-+]\=\d\+i"

syn match antimonyDelimiter "[,;:]"
syn match antimonyReaction "^[ \t]*[a-zA-Z0-9]\+:"
syn region antimonyString start=/\v"/ skip=/\v\\./ end=/\v"/

highlight link antimonyBrackets PreCondit
highlight link antimonyComment Comment
highlight link antimonyDelimiter Delimiter
highlight link antimonyFunction Function
highlight link antimonyKeyword Keyword
highlight link antimonyOperator Operator
highlight link antimonyNumber Number
highlight link antimonyReaction Function
highlight link antimonyString String

let b:current_syntax = "antimony"
