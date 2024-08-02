ini_open(workdir+'settings.ini')
ini_write_real('','visualiserBars',visfreq)
ini_write_real('','enableSwitchFScreen',fswitch)
ini_write_real('','windowSticksToEdges',__stick_to_edges)
ini_write_real('','framerate',myfps)
ini_write_string('Caption','customCaptionIdle',caption_idle)
ini_write_string('Caption','customCaptionPlay',caption_play)
ini_write_string('Caption','customCaptionChange1',caption_chn1)
ini_write_string('Caption','customCaptionChange2',caption_chn2)
ini_write_real('Caption','captionChangeSpeed',caption_chn_spd)
ini_write_real('Caption','changeCaption',caption_chng)
ini_close()


execute_program_async('taskkill elpaudio.exe')
if execute_program_async_result() {
execute_program_silent('"'+workdir+'elpaudio.exe"')
sleep(600)
game_end()
}
