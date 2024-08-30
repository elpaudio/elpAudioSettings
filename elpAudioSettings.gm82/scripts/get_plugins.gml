///(work_dir with '\') - loads plugins from `plugins\` folder
var ff;ff=argument0+'plugins\active.ini'
plugins=0
plg_scrolled=0

if !file_exists(ff) {

var fff;fff=file_text_open_write(ff)
file_text_write_string(fff,'[Plugins]')
file_text_close(fff)

ini_open(ff)
var f;f=file_find_first('plugins\*.plg',fa_hidden)
if f!='' do {
ini_write_real('Plugins',f,1)
f=file_find_next()
} until f=''

file_find_close()
ini_close()
}

if !file_exists(ff) {exit}
ini_open(ff)
var f;f=file_find_first(argument0+'plugins\*.plg',fa_hidden)

if f!='' {
i=0
plugins=1
    do {
        plugin_name     [i]=f;
        plugin_enabled  [i]=ini_read_real('Plugins',f,1);
        plugins+=1;
        i+=1
        f=file_find_next();
    } until f=''
}

file_find_close()
ini_close()
