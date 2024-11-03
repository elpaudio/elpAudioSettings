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
name[4]="Plugins"
name[5]='Save & Exit'
sett=6

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

CAPTION_HELP='Caption string help:
                %v - elpAudio version
                %pn - playing now number
                %ps - playlist size
                %t1, %t2 - song playing time with/without hours
                %ta1, %ta2 - song length with/without hours
                %sn - "compiled" track name
                %tra - track artist 
                %trt - track title
                %trf - track from... (album)
                %trg - track genre
                %try - track year
                %trn - track number
                \# - new line'

workdir=pd+'\'
if !file_exists(workdir+'elpAudio.exe') workdir=directory_previous(pd)+'\'
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
//draw_rectangle(-1,-1,641,481,0)
draw_sprite_ext(bg,0,480,240,(480/640),(240/480),0,c_white,1)
draw_set_blend_mode(bm_add)
draw_rectangle_color(120,-1,240,241,c_white,c_black,c_black,c_white,0)
draw_rectangle_color(120,-1,480,120,c_white,c_white,c_black,c_black,0)
draw_set_blend_mode(bm_normal)

if mouse_x<120 {
    if mouse_y>room_height-60 {
        window_set_cursor(cr_handpoint)
        if mouse_check_button_released(mb_any) execute_shell('https://elpoeprod.github.io/elpAudio','')
    } else if mouse_y>0 and mouse_x>0 {
        window_set_cursor(cr_default)
        select=clamp(floor(mouse_y/30),0,sett-1)
    }
} else
    window_set_cursor(cr_default)

i=0
draw_rectangle(-1,-1,120,240,0)
repeat(sett)
{
    if select=i
    {
        if mouse_check_button(mb_left) and mouse_x<120 and mouse_x>0 then
            draw_set_color(c_dkgray)
        else {
            draw_set_color(c_gray)
            if mouse_check_button_released(mb_left) and mouse_x<120 and mouse_x>0 {
                curwindow=select
                checkbox()
            }
        }
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
    draw_text(160,10,"THEME OPTIONS")
    draw_text_ext(140,30,'Current theme:#'+mytheme+"#"+curtheme,14,room_width-120)

    if button_draw(130,100,128,24,-1,0,'Change theme...') {
        file=get_open_filename('Theme files|*.ini|Winamp2 skin file|*.wsz;*.zip','theme.ini')

        if file!='' then {
                if filename_ext(file)=='.ini' curtheme=file;
                else {WAConvert(file) curtheme='themes\'+filename_remove_ext(filename_name(file))+'\theme.ini'}
            }
    }

    if button_draw(130,148,240,24,-1,0,'Enable old themes support: '+get_enabled(old_themes))
        old_themes=!old_themes

    if button_draw(130,176,270,24,-1,0,'Load migrated playlist after conversion: '+get_enabled(load_migrated))
        load_migrated=!load_migrated

}

if curwindow==1 {
    draw_text(160,10,'PLAYER SETTINGS')
    draw_text_ext(140,30,'You can change floating text speed and etc.',14,370)
    draw_text(140,50,'Current speed: '+string(textspd))

    if button_draw(130,75,128,24,-1,0,'Change text speed') {
        textspd=get_integer('Set text speed (more than 0)',25)
        if textspd=0 textspd=25
    }

    draw_set_color(c_ltgray)
    draw_rectangle(160,120,200,152,0)
    draw_set_color(c_black)
    draw_text(162,124,string(visfreq))

    myx=260
    myw=200
    did=myw/visfreq
    hh=0
    if visfreq<512 repeat(visfreq) {
        draw_rectangle(myx+hh*did,130-abs(lengthdir_x(20,current_time*0.1+hh*4)),myx+hh*did+did,130,0)
        hh+=1
    } else draw_text(myx,130,'Laggy 0_0')
    if button_draw(130,155,128,38,-1,-1,'Change audio buf. size #(cur. is '+string(__buffer_size)+')') __buffer_size=clamp(get_integer('Type in new audio buffer size.#256 is default, you can change it up to 16383.#Note that it will lag!',__buffer_size),1,16383)
}

if curwindow==2 {
    draw_text(160,10,'ADVANCED SETTINGS')

    if button_draw(160,40,270,20,-1,-1,'Enable fullscreen switch by pressing F4: '+get_enabled(fswitch)) then
        fswitch=!fswitch

    if button_draw(310,64,120,20,-1,0,'CHANGE FPS') then
        myfps=min(max(get_integer('Set FPS for elpAudio. #(default is 60)',myfps),1),240) //fucking disguisting

    if button_draw(160,112,180,20,-1,0,'Enable skip frames: '+get_enabled(skipframes)) then
        skipframes=!skipframes

    if skipframes if button_draw(160,136,270,20,-1,0,'Change amount of frames for skip (cur. is '+string(millisecs)+')') then
        millisecs=min(max(get_integer('Set frames for skip (milliseconds)#Minimum is 1, maximum is 2000 (why so much?)',millisecs),1),2000)

    draw_set_color(c_black)
    draw_text(160,64,"elpAudio's FPS: "+string(myfps))
    draw_set_color(c_black)

    if button_draw(160,88,270,20,-1,-1,'Stick to window edges (Only 1 display): '+get_enabled(__stick_to_edges)) then
        __stick_to_edges=!__stick_to_edges

    if button_draw(160,160,270,20,-1,-1,'Vertical sync is turned '+get_enabled(vsync,1)) vsync=!vsync

    if button_draw(160,184,270,20,-1,-1,'Recursive folders in Add File button are '+get_enabled(__recursive,1)) __recursive=!__recursive

    draw_set_color(c_black)
}

if curwindow==3 {
    draw_text(160,10,'CAPTION SETTINGS')
    draw_line(120,50,room_width+1,50)

    i=0 repeat(3) {
        if level!=i then
            chosen[i]=0
        if button_draw(160+80*i,30,80,20,spr_folder,chosen[i],ptext[i]) or level=i then {
            level=i
            chosen[i]=1
        }
        i+=1
    }

    if level=0 {
        draw_set_color(c_black)
        draw_text(160,60,'Your current IDLE caption is:#'+caption_idle+'#Converted: '+convert_cap(caption_idle))

        if button_draw(160,108,200,20,-1,0,'CHANGE IDLE CAPTION') {
            caption_idle=get_string(
            'Change idle string.##Additional things:#%v - elpAudio version',
            caption_idle
            )
        }
        draw_set_color(c_black)

        draw_text(160,132,'Your current PLAY caption is:#'+caption_play+'#Converted: '+convert_cap(caption_play))
        if button_draw(160,180,200,20,-1,0,'CHANGE PLAY CAPTION') then
            caption_play=get_string(CAPTION_HELP,caption_play)
    }
    if level=1 {
        draw_set_color(c_black)
        draw_text(160,55,'Change captions: '+get_enabled(caption_chng))
        if button_draw(160+string_width('Change captions: FFFFFF'),55,11,11,checkspr,caption_chng) then
            caption_chng=!caption_chng

        if button_draw(160,70,256,16,-1,0,'Change caption change speed: (cur. '+string(caption_chn_spd)+'s)') then
            caption_chn_spd=get_integer('Change caption change speed in seconds#(default is 3 seconds)',caption_chn_spd)

        draw_set_color(c_black)
        if caption_chng {
            draw_text(160,90,'Current CHNG1 caption is:#'+caption_chn1+'#Converted: '+convert_cap(caption_chn1))
            if button_draw(160,160,200,20,-1,-1,'CHANGE CHNG1 CAPTION') then
                caption_chn1=get_string(CAPTION_HELP,caption_chn1)
        }
    }
    if level=2 {
        draw_set_color(c_black)
        if caption_chng {
            draw_text(160,60,'Current CHNG2 caption is:#'+caption_chn2+'#Converted: '+convert_cap(caption_chn2))
            if button_draw(160,135,200,20,-1,-1,'CHANGE CHNG2 CAPTION') then
                caption_chn2=get_string(CAPTION_HELP,caption_chn2)
        } else draw_text(160,60,'Enable caption change at first!')
    }
}

if curwindow==4 {
    draw_text(160,10,"PLUGINS")
    draw_text_ext(140,30,'Press on a plugin name to turn it off or on.',14,340)
    var max_scrools;max_scrools=8;
    i=0 repeat(clamp(plugins-1,0,max_scrools)) {
    if button_draw(140,60+i*22,256,20,-1,0,plugin_name[i+plg_scrolled]+': '+get_enabled(plugin_enabled[i+plg_scrolled])) then
        plugin_enabled[i+plg_scrolled]=!plugin_enabled[i+plg_scrolled]
    i+=1
    }
    if mouse_wheel_down() plg_scrolled+=1
    if mouse_wheel_up() plg_scrolled-=1
    plg_scrolled=clamp(plg_scrolled,0,clamp(plugins-max_scrools-1,0,99999))
}

if curwindow==5 {
    draw_text(160,10,"SAVE & EXIT")
    draw_text_ext(140,30,'The settings and elpAudio will close for applying the changes.',14,340)

    if button_draw(130,75,128,24,-1,0,'Save and exit') ending()
}

draw_reset()
#define KeyPress_112
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
show_message("elpAUDIO v"+elpaudio_get_version()+"##by elpoep 2018-2024#BSD-3 License")
show_message("Thanks to:#♦corakit♦#♦catpawz♦#♦DoneD♦#♦Fukumeru♦#♦ruby53♦#♦Olav '8bitbubsy' Sörensen♦#♦WinAMP♦#♦AmigaAMP♦#♦renex and floogle♦#♦GM82 community♦#♦Every other elpAUDIO testers♦#♦Moving Shadow label♦#♦♦...and YOU!♦♦")
