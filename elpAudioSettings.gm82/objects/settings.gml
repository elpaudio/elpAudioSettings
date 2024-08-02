#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(font1)
x=0
y=0
name[0]='Theme'
name[1]='Visuals'
name[2]='Advanced'
name[3]='Caption'
name[4]='Save & Exit'
sett=5

ptext[0]='General'
ptext[1]='Switching 1'
ptext[2]='Switching 2'
chosen[0]=0
chosen[1]=0
chosen[2]=0

level=0

setname[0,0]='Set theme...'
setname[0,1]='Set theme colors...'
setname[0,2]='testtesttesttesttestetseteasseestsetsetsetsetsetsetslbalahbalhblahblahlbhalbhalbhlahblahbla'
setnames[0]=3

select=0
curwindow=0

pd=program_directory
if debug_mode pd=working_directory

workdir=pd+'\'
if !file_exists(workdir+'elpAudio.exe') workdir=directory_previous(pd)+'\'//registry_read_string_ext('elpAudio','work_dir')+'\'
if !file_exists(workdir+'elpAudio.exe') workdir=registry_read_string_ext('elpAudio','work_dir')+'\'
if !file_exists(workdir+'elpAudio.exe') {
show_message("Can't find elpAudio executable. Are you opening this file in unzipped archive?")
game_end()
exit
}


load_settings(workdir)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(c_white)
draw_rectangle(-1,-1,641,481,0)

if mouse_x<120 select=clamp(floor(mouse_y/30),0,sett-1)

if mouse_x<120 and mouse_y>room_height-60 {
window_set_cursor(cr_handpoint)
if mouse_check_button_released(mb_any) execute_shell('https://elpoeprod.github.io/elpAudio-player','')
} else window_set_cursor(cr_default)

i=0
repeat(sett)
{
if select=i
{
if mouse_check_button(mb_left) and mouse_x<120 draw_set_color(c_dkgray) else {draw_set_color(c_gray) if mouse_check_button_released(mb_left) and mouse_x<120 {curwindow=select checkbox()}}
draw_rectangle(-1,select*30,119,select*30+30,0)
draw_rectangle_color(60,select*30,120,select*30+30,draw_get_color(),c_white,c_white,draw_get_color(),0)

}
draw_set_color(c_black)
draw_text(5,5+i*30,name[i])
i+=1
}

draw_set_color(c_white)
draw_sprite(elpAudio,0,0,room_height-60)

draw_set_color(c_dkgray)
draw_rectangle(-1,select*30+30,120,481,1)
draw_rectangle(-1,-1,120,select*30,1)


draw_set_color(c_black)

if curwindow==0 {
draw_text(160,10,"CHANGE THEME")
draw_text_ext(140,30,'Current theme:#'+mytheme+"#"+curtheme,14,room_width-120)

draw_set_color(c_ltgray)
if mouse_x>130 and mouse_y>75 and mouse_x<300 and mouse_y<102 {
draw_set_color(c_gray)
if mouse_check_button(mb_left) draw_set_color(c_dkgray)
if mouse_check_button_released(mb_left) {file=get_open_filename('Theme files|*.ini','theme.ini') if file='' n=1 else {ini_open(workdir+'settings.ini') ini_write_string('','themePath',file) load_settings(workdir) ini_close()}}
}

draw_rectangle(130,75,300,102,0)
draw_set_color(c_black)
draw_text(140,80,'Change theme...')
}

if curwindow==1 {
draw_text(160,10,'PLAYER SETTINGS')
draw_text_ext(140,30,'You can change floating text speed and etc.',14,370)
draw_text(140,50,'Current speed: '+string(textspd))

draw_set_color(c_ltgray)
if mouse_x>130 and mouse_y>75 and mouse_x<300 and mouse_y<102 {
draw_set_color(c_gray)
if mouse_check_button(mb_left) draw_set_color(c_dkgray)
if mouse_check_button_released(mb_left) {spd=get_integer('Set text speed (more than 0)',25) if spd=0 n=1 else {ini_open(workdir+'settings.ini') ini_write_real('','textSpeed',spd) ini_close() load_settings(workdir)}}
}

draw_rectangle(130,75,300,102,0)
draw_set_color(c_black)
draw_text(140,80,'Change text speed')

draw_set_color(c_ltgray)
draw_rectangle(160,120,200,152,0)
draw_set_color(c_black)
draw_text(162,124,string(visfreq))

myx=260
myw=200
did=myw/visfreq
hh=0
repeat(visfreq) {
draw_rectangle(myx+hh*did,130-abs(lengthdir_x(20,current_time*0.1+hh*4)),myx+hh*did+did,130,0)
hh+=1
}
}
if curwindow==2 {
draw_text(160,10,'ADVANCED SETTINGS')
draw_text(160,40,'Enable fullscreen switch#by pressing F4: '+get_enabled(fswitch))
if button_draw(400,40,20,20,checkspr,fswitch)==1 fswitch=!fswitch
if button_draw(160,100,120,20,-1,0,'CHANGE MAX FPS')==1 myfps=min(max(get_integer('Set FPS for elpAudio. #(default is 60)',myfps),1),240) //fucking disguisting
draw_set_color(c_black)
draw_text(160,80,"elpAudio's max FPS: "+string(myfps))
draw_set_color(c_black)
ms='Should elpAudio stick to#screen edges? (only one display): '+get_enabled(__stick_to_edges)
draw_text(160,124,ms)
if button_draw(160+string_width(ms),124+string_height('A'),20,20,checkspr,__stick_to_edges)==1 __stick_to_edges=!__stick_to_edges
draw_set_color(c_black)
}

if curwindow==3 {
draw_text(160,10,'CAPTION SETTINGS')
draw_line(120,50,room_width+1,50)
i=0 repeat(3) {
if level!=i chosen[i]=0
if button_draw(160+80*i,30,80,20,spr_folder,chosen[i],ptext[i]) or level=i {level=i chosen[i]=1}
i+=1
}
if level=0 {
draw_set_color(c_black)
draw_text(160,60,'Your current IDLE caption is:#'+caption_idle+'#Converted: '+convert_cap(caption_idle))
if button_draw(160,125,200,24,-1,0,'CHANGE IDLE CAPTION') {
caption_idle=get_string(
'Change idle string.##Additional things:#%v - elpAudio version',
caption_idle
)
}
draw_set_color(c_black)

draw_text(160,152,'Your current PLAY caption is:#'+caption_play+'#Converted: '+convert_cap(caption_play))
if button_draw(160,212,200,24,-1,0,'CHANGE PLAY CAPTION') {
caption_play=get_string(
'Change PLAY string.##Additional things:#%v - elpAudio version#%pn - playing now number#%pa - playlist size#%t1, %t2 - song playing time with/without hours#%ta1, %ta2 - song length with/without hours#%sn - track name#\# - new line',
caption_play
)
}
}
if level=1 {
draw_set_color(c_black)
draw_text(160,55,'Change captions: '+get_enabled(caption_chng))
if button_draw(160+string_width('Change captions: FFFFFF'),55,11,11,checkspr,caption_chng) caption_chng=!caption_chng

//draw_text(172+string_width('Change captions (PLAY caption will be disabled): FFFFFF'),55,'Change captions (PLAY caption will be disabled): '+get_enabled(caption_chng))
if button_draw(160,70,256,16,-1,0,'Change caption change speed: (cur. '+string(caption_chn_spd)+'s)') caption_chn_spd=get_integer('Change caption change speed in seconds',caption_chn_spd)
draw_set_color(c_black)
if caption_chng {
draw_text(160,90,'Current CHNG1 caption is:#'+caption_chn1+'#Converted: '+convert_cap(caption_chn1))
if button_draw(160,160,200,20,-1,-1,'CHANGE CHNG1 CAPTION') {
caption_chn1=get_string(
'Change CHNG1 string.##Additional things:#%v - elpAudio version#%pn - playing now number#%pa - playlist size#%t1, %t2 - song playing time with/without hours#%ta1, %ta2 - song length with/without hours#%sn - track name#\# - new line',
caption_chn1
)
}
}
}
if level=2 {
draw_set_color(c_black)
if caption_chng {
draw_text(160,60,'Current CHNG2 caption is:#'+caption_chn2+'#Converted: '+convert_cap(caption_chn2))
if button_draw(160,135,200,20,-1,-1,'CHANGE CHNG2 CAPTION') {
caption_chn2=get_string(
'Change CHNG1 string.##Additional things:#%v - elpAudio version#%pn - playing now number#%pa - playlist size#%t1, %t2 - song playing time with/without hours#%ta1, %ta2 - song length with/without hours#%sn - track name#\# - new line',
caption_chn2
)
}
} else draw_text(160,60,'Enable caption change at first!')
}
}


if curwindow==4 {
draw_text(160,10,"SAVE & EXIT")
draw_text_ext(140,30,'The settings and elpAudio will close for applying the changes.#PLEASE SAVE YOUR PLAYLIST!',14,340)

draw_set_color(c_ltgray)
if mouse_x>130 and mouse_y>75 and mouse_x<300 and mouse_y<102 {
draw_set_color(c_gray)
if mouse_check_button(mb_left) draw_set_color(c_dkgray)
if mouse_check_button_released(mb_left) {
ending()
}
}

draw_rectangle(130,75,300,102,0)
draw_set_color(c_black)
draw_text(140,80,'Save and Exit')
}


draw_reset()
