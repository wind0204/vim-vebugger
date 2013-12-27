

command! -nargs=1 VBGrawWrite call vebugger#writeLine(<q-args>)

command! -nargs=0 VBGstepIn call vebugger#setWriteActionAndPerform('std','flow','stepin')
command! -nargs=0 VBGstepOver call vebugger#setWriteActionAndPerform('std','flow','stepover')
command! -nargs=0 VBGstepOut call vebugger#setWriteActionAndPerform('std','flow','stepout')
command! -nargs=0 VBGcontinue call vebugger#setWriteActionAndPerform('std','flow','continue')

command! -nargs=0 VBGtoggleLogBuffer call vebugger#toggleLogBuffer()

if exists('g:vebugger_leader')
	if !empty(g:vebugger_leader)
		for s:mapping in items({
					\'i':'VBGstepIn',
					\'o':'VBGstepOver',
					\'O':'VBGstepOut',
					\'c':'VBGcontinue'})
			exe 'nnoremap '.g:vebugger_leader.s:mapping[0].' :'.s:mapping[1].'<Cr>'
		endfor
	endif
endif
