/*myfile[0]=file_find_first(argument0+'themes\*.*',fa_sysfile+fa_directory+fa_volumeid)
var i;i=1
if myfile[0]!='' {
repeat(1024) {
myfile[i]=file_find_next()
if myfile[i]='' or (filename_ext(myfile[i])!='' and myfile[i]!='..') {myfile[i]='' break}
i+=1
}
}
file_find_close()
var ii,mystr;ii=0;mystr=''
repeat(i) {
myfile[ii]=myfile[ii+1]
ii+=1
}
ii=0
repeat(i) {
myfile[ii]='themes\'+myfile[ii+1]+'\theme.ini'
mystr+=string(myfile[ii])+"#"
ii+=1
}
//show_message(mystr)
i=0
repeat(ii-2)
{
ini_open(myfile[i])
theme[i]=ini_read_string('Default','themeName','default')
ini_close()
i+=1
}*/

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

myfps=ini_read_real('','framerate',60)

ini_close()
}
var mm;mm=argument0+string_copy(curtheme,string_pos('themes\',curtheme),300)
if file_exists(mm) {
ini_open(mm)
mytheme=ini_read_string('Default','themeName','default')
ini_close()
}
