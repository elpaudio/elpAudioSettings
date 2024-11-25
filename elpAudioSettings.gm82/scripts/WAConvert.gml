/**

    WinAmp2 skin to elpAudio theme converter
    by elpoep
    02.11.2024 0.1

**/

var zipzip,ff,inf,outf,errstr;
errstr='WSZ2EAT converter experienced an error:#'
zipzip='C:\Program Files\7-Zip\7z.exe'
inf=argument0
ff=filename_remove_ext(filename_name(inf))
if !file_exists(zipzip) zipzip='C:\Program Files (x86)\7-Zip\7z.exe'
if !file_exists(zipzip) {show_message(errstr+'No 7-zip found!') exit}
outf=workdir+'themes\'+ff
if !directory_exists(workdir+'themes\winamp_default') {show_message(errstr+'No winamp_default theme found!') exit}
if !file_exists(inf) {show_message(errstr+'No WA2 skin found! File does not exists.') exit}
// now convert
var tempf;tempf=directory_previous(temp_directory)+'\'+ff

execute_program_silent(zipzip+' e "'+inf+'" -o"'+tempf+'"')
if !directory_exists(tempf) {show_message(errstr+'Cannot make directory!') exit}
if !file_exists(tempf+'\cbuttons.bmp') and !file_exists(tempf+'\Cbuttons.bmp') and !file_exists(tempf+'\CBUTTONS.BMP') tempf+='\'+ff
execute_program_silent('robocopy "'+workdir+'themes\winamp_default" "'+outf+'" /E /R:0 /W:0 ')
outf+='\'
tempf+='\'
var ks;
ks='cbuttons.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file cbutttons.bmp!') exit}
var fs,s;s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
var myspr; // creating sprites
myspr=sprite_create_from_surface(fs,0,0,23,18,0,0,0,0)
sprite_add_from_surface(myspr,fs,0,18,23,18,0,0)
sprite_save_strip(myspr,outf+'butprev.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,23,0,23,18,0,0,0,0)
sprite_add_from_surface(myspr,fs,23,18,23,18,0,0)
sprite_save_strip(myspr,outf+'butplay.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,46,0,23,18,0,0,0,0)
sprite_add_from_surface(myspr,fs,46,18,23,18,0,0)
sprite_save_strip(myspr,outf+'butpause.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,69,0,23,18,0,0,0,0)
sprite_add_from_surface(myspr,fs,69,18,23,18,0,0)
sprite_save_strip(myspr,outf+'butstop.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,92,0,22,18,0,0,0,0)
sprite_add_from_surface(myspr,fs,92,18,22,18,0,0)
sprite_save_strip(myspr,outf+'butnext.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,114,0,22,16,0,0,0,0)
sprite_add_from_surface(myspr,fs,114,16,22,16,0,0)
sprite_save_strip(myspr,outf+'butaddmus.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='volume.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file volume.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
myspr=sprite_create_from_surface(fs,0,0,sprite_get_width(s),14,0,0,0,0)
sprite_add_from_surface(myspr,fs,0,0,sprite_get_width(s),14,0,0)
sprite_save_strip(myspr,outf+'volumeslide.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,15,422,14,11,0,0,0,0)
sprite_save_strip(myspr,outf+'volslide.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='posbar.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file posbar.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
myspr=sprite_create_from_surface(fs,0,0,248,sprite_get_height(s),0,0,0,0)
sprite_add_from_surface(myspr,fs,0,0,248,sprite_get_height(s),0,0)
sprite_save_strip(myspr,outf+'positionslide.png')
sprite_delete(myspr)
myspr=sprite_create_from_surface(fs,248,0,29,sprite_get_height(s),0,0,0,0)
sprite_save_strip(myspr,outf+'slider.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='monoster.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file monoster.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
myspr=sprite_create_from_surface(fs,29,12,29,12,0,0,0,0)
sprite_add_from_surface(myspr,fs,0,0,29,12,0,0)
sprite_add_from_surface(myspr,fs,29,0,29,12,0,0)
sprite_add_from_surface(myspr,fs,0,12,29,12,0,0)
sprite_save_strip(myspr,outf+'monoster.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='main.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file main.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
myspr=sprite_create_from_surface(fs,0,0,275,116,0,0,0,0)
sprite_save_strip(myspr,outf+'back.png')
sprite_delete(myspr)

myspr=sprite_create_from_surface(fs,241,82,27,27,0,0,0,0)
sprite_add_from_surface(myspr,fs,241,82,27,27,0,0)
sprite_save_strip(myspr,outf+'butstng.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='titlebar.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file titlebar.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()
myspr=sprite_create_from_surface(fs,27+18,0,276-18,15,0,0,0,0)
sprite_save_strip(myspr,outf+'front.png')
sprite_delete(myspr)

myspr=sprite_create_from_surface(fs,27,0,18,14,0,0,0,0)
sprite_add_from_surface(myspr,fs,27,15,18,14,0,0)
sprite_save_strip(myspr,outf+'butalont.png')
sprite_delete(myspr)

myspr=sprite_create_from_surface(fs,0,18,9,9,0,0,0,0)
sprite_add_from_surface(myspr,fs,0,18,9,9,0,0)
sprite_add_from_surface(myspr,fs,9,18,9,9,0,0)

sprite_add_from_surface(myspr,fs,9,0,9,9,0,0)
sprite_add_from_surface(myspr,fs,9,0,9,9,0,0)
sprite_add_from_surface(myspr,fs,9,9,9,9,0,0)

sprite_add_from_surface(myspr,fs,18,0,9,9,0,0)
sprite_add_from_surface(myspr,fs,18,0,9,9,0,0)
sprite_add_from_surface(myspr,fs,18,9,9,9,0,0)

sprite_save_strip(myspr,outf+'minigui.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1

ks='shufrep.bmp'
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1))+string_copy(ks,2,1024)
if !file_exists(tempf+ks) ks=string_upper(string_copy(ks,1,1024))
if !file_exists(tempf+ks) {show_message(errorstr+'Cannot find file shufrep.bmp!') exit}
s=sprite_add(tempf+ks,0,0,0,0,0)
fs=surface_create(sprite_get_width(s),sprite_get_height(s))
surface_set_target(fs)
draw_sprite(s,0,0,0)
surface_reset_target()

myspr=sprite_create_from_surface(fs,0,0,28,15,0,0,0,0)
sprite_add_from_surface(myspr,fs,0,30,28,15,0,0)
sprite_add_from_surface(myspr,fs,0,15,28,15,0,0)
sprite_save_strip(myspr,outf+'butloop.png')
sprite_delete(myspr)

myspr=sprite_create_from_surface(fs,28,0,47,15,0,0,0,0)
sprite_add_from_surface(myspr,fs,28,30,47,15,0,0)
sprite_add_from_surface(myspr,fs,28,15,47,15,0,0)
sprite_save_strip(myspr,outf+'butsort.png')
sprite_delete(myspr)
surface_free(fs)
sprite_delete(s)
s=-1
fs=-1
