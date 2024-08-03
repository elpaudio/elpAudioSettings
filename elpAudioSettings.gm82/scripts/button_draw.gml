///(x,y,w,h,spr,frame,[text])
var xx,yy,w,h,spr,frame;xx=argument0;yy=argument1;w=argument2;h=argument3;spr=argument4;frame=argument5;
var col;col=c_ltgray
var ret;ret=0;
var hold;hold=0

if point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+w,yy+h) {
if mouse_check_button(mb_any) {col=c_gray hold=1}
if mouse_check_button_released(mb_any) ret=1;
}

if spr<0 {draw_set_color(c_black)
draw_rectangle(xx+2,yy+2,xx+w+2,yy+h+2,0)}
draw_set_color(col)
draw_rectangle(xx+hold*2*(spr<0),yy+hold*2*(spr<0),xx+w+hold*2*(spr<0),yy+h+hold*2*(spr<0),0)

/*
draw_set_color(c_black)
draw_line(xx+1,yy+h,xx+w,yy+h)
draw_line(xx+w,yy,xx+w,yy+h)/*/

draw_set_color(c_white)
if spr!=-1 draw_sprite_stretched(spr,frame,xx,yy,w,h)

if argument_count>6 {draw_set_color(c_black) draw_text(xx+1+hold*2*(spr<0),yy+1+hold*2*(spr<0),argument[6])}

draw_reset()
return ret;
