var fname,outname;
fname=string(argument0)
outname=''
var dd;dd=filename_dir(fname)
if string_count('\',dd)>1 repeat(string_count('\',dd)-1) dd=string_replace(dd,'\','')
var dirname;dirname=string_copy(dd,string_pos('\',dd)+1,256)
if !file_exists(fname) return $C10001 //file from argument0 doesn't exist
var outdir;outdir=workdir+dirname+'\'
outname=outdir+'theme.ini'
if !directory_exists(outdir) directory_create(outdir)
if file_exists(outname) file_delete(outname)
var inf;inf=file_text_open_read(fname)
var outf;outf=file_text_open_write(outname)
fprintf(outf,'[Default]')
fprintf(outf,'RequiredVersion=1.6')
playspr=''
stopspr=''
pausespr=''
nextspr=''
prevspr=''
loopspr=''
shufflespr=''
bgspr=''
fgspr=''
addfilespr=''
