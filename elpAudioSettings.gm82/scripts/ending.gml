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
    ini_write_real('Caption','textSpeed',textspd)
    ini_write_real('','EnableOldThemes',old_themes)
    ini_write_real('','OpenMigratedListAfterConverting',load_migrated)
ini_close()

ini_open(workdir+'plugins\active.ini')
    i=0 repeat(plugins-1) {
        ini_write_real('Plugins',plugin_name[i],plugin_enabled[i])
        i+=1
    }
ini_close()

f=file_text_open_write(workdir+'save_list')
    file_text_write_string(f,'TEMP')
file_text_close(f)

sleep(100)
execute_program('taskkill','/f /im elpaudio.exe /t',0)
sleep(100)
execute_program('"'+workdir+'elpaudio.exe"','',0)
sleep(600)
game_end()
