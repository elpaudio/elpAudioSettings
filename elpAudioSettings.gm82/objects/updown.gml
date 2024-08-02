#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if y=120 button=0 else button=1
image_index=2*button
tap=0
rel=0
#define Mouse_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2*button+1
enter=1
if rel>0 rel-=1 else {if tap=0 rel=30 else rel=2 tap=1 if button=0 {if settings.visfreq<255 settings.visfreq+=1} else {if settings.visfreq>1 settings.visfreq-=1}}
#define Mouse_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2*button
tap=0
enter=0
rel=0
#define Mouse_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2*button
rel=0
