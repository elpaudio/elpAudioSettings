var di;
di=argument0+'settings.ini'
curtheme='themes\default\theme.ini'
textspd=25
mytheme='elpAudio default'
visfreq=128
fswitch=1
caption_idle='elpAudio %v'
caption_play='(%t2 / %ta2) elpAudio %v [%pn/%ps]'
caption_chn1='(%t2 / %ta2) elpAudio %v [%pn/%ps]'
caption_chn2='(%sn) elpAudio %v [%pn/%ps]'
caption_chn_spd=3
caption_chng=1
myfps=60
__stick_to_edges=1
skipframes=0
millisecs=1
vsync=0

old_themes=0
load_migrated=1

if file_exists(di) {
ini_open(di)
curtheme=ini_read_string('','themePath','themes\default\theme.ini')
textspd=ini_read_real('','textSpeed',25)
visfreq=ini_read_real('','visualiserBars',32)
fswitch=ini_read_real('','enableSwitchFScreen',1)

caption_idle=ini_read_string('Caption','customCaptionIdle','elpAudio %v')
caption_play=ini_read_string('Caption','customCaptionPlay','(%t2 / %ta2) elpAudio %v [%pn/%ps]')
caption_chn1=ini_read_string('Caption','customCaptionChange1','(%t2 / %ta2) elpAudio %v [%pn/%ps]')
caption_chn2=ini_read_string('Caption','customCaptionChange2','(%sn) elpAudio %v [%pn/%ps]')
caption_chn_spd=ini_read_real('Caption','captionChangeSpeed',3)
caption_chng=ini_read_real('Caption','changeCaption',1)

__stick_to_edges=ini_read_real('','windowSticksToEdges',1)

old_themes=ini_read_real('','EnableOldThemes',0)
load_migrated=ini_read_real('','OpenMigratedListAfterConverting',1)

myfps=ini_read_real('','framerate',60)

skipframes=ini_read_real('','SkipFrames',0)
millisecs=ini_read_real('','FramesForSkip',1)
vsync=ini_read_real('','VerticalSync',0)

ini_close()
}
var mm;mm=argument0+string_copy(curtheme,string_pos('themes\',curtheme),300)
if file_exists(mm) {
ini_open(mm)
mytheme=ini_read_string('Default','themeName','default')
version=ini_read_real('Default','RequiredVersion',1.6)
ini_close()
}

//for plugins
get_plugins(argument0);
