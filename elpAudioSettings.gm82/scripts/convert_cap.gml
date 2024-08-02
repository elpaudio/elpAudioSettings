///(arg)
var ag;ag=argument0;
ag=string_replace_all(ag,'%v',elpaudio_get_version())
ag=string_replace_all(ag,'%t1','00:00:00')
ag=string_replace_all(ag,'%ta1','00:00:00')
ag=string_replace_all(ag,'%t2','0:0:0')
ag=string_replace_all(ag,'%ta2','0:0:0')
ag=string_replace_all(ag,'%pn','5')
ag=string_replace_all(ag,'%ps','15')
ag=string_replace_all(ag,'%sn','Auto Pilot - Seventeen')
ag=string_replace_all(ag,'#','\n')
return ag;
