[_tb_system_call storage=system/_macro.ks]

[tb_start_tyrano_code]

[macro name=show_skip]
@clearfix name="role_button"
[button name="role_button" role="load" graphic="b-load.png" x=1005 y=850]
[button name="role_button" role="skip" graphic="b-skip.png" x=929 y=850]
[button name="role_button" role="backlog" graphic="b-log.png" x=1073 y=850]
[button name="role_button" role="window" graphic="b-win.png" x=1131 y=850]
[button name="role_button" role="title" graphic="b-title.png" x=1247 y=850]
[endmacro]

[macro name="hide_skip" ]
@clearfix name="role_button"
[button name="role_button" role="save" graphic="b-save.png" x=937 y=850]
[button name="role_button" role="load" graphic="b-load.png" x=1005 y=850]
[button name="role_button" role="backlog" graphic="b-log.png" x=1073 y=850]
[button name="role_button" role="window" graphic="b-win.png" x=1131 y=850]
[button name="role_button" role="title" graphic="b-title.png" x=1247 y=850]
[endmacro]

[macro name=show_effect]
[call  storage="set_show.ks"  target="*show_effect" ]
[endmacro]

[macro name=set_sit]
[call  storage="set_show.ks"  target="*set_sit" ]
[endmacro]

[macro name=show_sit]
[call  storage="set_show.ks"  target="*show_sit" ]
[endmacro]

[macro name=set_nade]
[if exp="f.nade_conti==1" ]
[eval exp="f.nade_conti=2"]
[else]
[call  storage="set_show.ks"  target="*set_nade" ]
[endif]
[endmacro]

[macro name=show_nade]
[if exp="f.nade_conti==2" ]
[eval exp="f.nade_conti=0"]
[else]
[call  storage="set_show.ks"  target="*show_nade" ]
[endif]
[endmacro]

[macro name=set_dinner]
[call  storage="set_show.ks"  target="*set_dinner" ]
[endmacro]

[macro name=show_dinner]
[call  storage="set_show.ks"  target="*show_dinner" ]
[endmacro]

[macro name=set_stand]
[call  storage="set_show.ks"  target="*set_stand" ]
[endmacro]

[macro name=show_stand]
[call  storage="set_show.ks"  target="*show_stand" ]
[endmacro]

[macro name=set_mise]
[call  storage="set_show.ks"  target="*set_mise" ]
[endmacro]

[macro name=show_mise]
[call  storage="set_show.ks"  target="*show_mise" ]
[endmacro]

[macro name=set_work]
[call  storage="set_show.ks"  target="*set_work" ]
[endmacro]

[macro name=show_work]
[call  storage="set_show.ks"  target="*show_work" ]
[endmacro]

[macro name=black]
[freeimage layer=0]
[bg  time="0"  method="crossfade"  storage="bg_black.jpg" ]
[wait time=10]
[endmacro]

[macro name=free]
[freeimage layer=0]
[wait time=10]
[endmacro]

[macro name=lr]
[l][r]
[endmacro]

[macro name=set_time]
[if exp="f.act<3" ]
[chara_mod  name="man"  time="0"  storage="chara/1/am.png" ]
[elsif exp="f.act==3" ]
[chara_mod  name="man"  time="0"  storage="chara/1/noon.png" ]
[elsif exp="f.act>3" ]
[chara_mod  name="man"  time="0"  storage="chara/1/pm.png" ]
[endif]
[endmacro]

[macro name="no_button" ]
@clearfix name="role_button"
[endmacro]

[macro name=name]
[emb exp="f.name" ]
[endmacro]

[macro name=left_b]
[chara_mod  name="e-h2"  time="0"  storage="chara/14/hx-b.png" ]
[eval exp="f.h_left='b'" ]
[endmacro]

[macro name=left_c]
[if exp="f.h_leg=='close'" ]
[chara_mod  name="e-h2"  time="0"  storage="chara/14/hx-c-.png" ]
[else]
[chara_mod  name="e-h2"  time="0"  storage="chara/14/hx-c.png" ]
[endif]
[eval exp="f.h_left='c'" ]
[endmacro]

[macro name=left_non]
[chara_mod  name="e-h2"  time="0"  storage="chara/14/00.png" ]
[eval exp="f.h_left='non'" ]
[endmacro]

[macro name=right_b]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-b.png" ]
[eval exp="f.h_right='b'" ]
[endmacro]

[macro name=right_non]
[chara_mod  name="e-h"  time="0"  storage="chara/13/00.png" ]
[eval exp="f.h_right='non'" ]
[endmacro]

[macro name=right_f]
[if exp="f.h_in>=3" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f0zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f0zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f0z.png" ]
[else]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f0.png" ]
[endif]
[endmacro]

[macro name=f_slow]
[playse  loop="true"  storage="l-wet0.ogg"  clear="true"  ]
[if exp="f.h_in>=3" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f1zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f1zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f1z.png" ]
[else]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f1.png" ]
[endif]
[endmacro]

[macro name=f_fast]
[playse  loop="true"  storage="l-wet2.ogg"  clear="true"  ]
[if exp="f.h_in>=3" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f2zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f2zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f2z.png" ]
[else]
[chara_mod  name="e-h"  time="0"  storage="chara/13/hx-f2.png" ]
[endif]
[endmacro]

[macro name=v_in]
[playse  storage="s-wet1.ogg"  clear="true"  ]
[if exp="f.h_in>=7" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0zzzzz.png" ]
[elsif exp="f.h_in>=5" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0zzzz.png" ]
[elsif exp="f.h_in>=3" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0z.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0z.png" ]
[else]
[chara_mod  name="p"  time="0"  storage="chara/p/p0.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-0.png" ]
[endif]
[endmacro]

[macro name=v_show]
[if exp="f.h_in>=1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p-after.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/00.png" ]
#
[wait time=1000]
[chara_mod  name="p"  time="0"  storage="chara/p/00.png" ]
[else]
[chara_mod  name="p"  time="0"  storage="chara/p/p-before.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/00.png" ]
[wait time=1000]
[chara_mod  name="p"  time="0"  storage="chara/p/00.png" ]
[endif]

[endmacro]

[macro name=v_slow]
[playse  loop="true"  storage="l-wet1.ogg"  clear="true"  ]

[if exp="f.h_in>=5" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p1zzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-1zzzz.png" ]
[elsif exp="f.h_in>=3" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p1zzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-1zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p1zz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-1zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p1z.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-1z.png" ]
[else]
[chara_mod  name="p"  time="0"  storage="chara/p/p1.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-1.png" ]
[endif]
[endmacro]

[macro name=v_fast]
[playse  loop="true"  storage="l-wet2.ogg"  clear="true"  ]

[if exp="f.h_in>=5" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p2zzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-2zzzz.png" ]
[elsif exp="f.h_in>=3" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p2zzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-2zzz.png" ]
[elsif exp="f.h_in==2" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p2zz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-2zz.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p2z.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-2z.png" ]
[else]
[chara_mod  name="p"  time="0"  storage="chara/p/p2.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-2.png" ]
[endif]
[endmacro]

[macro name=cum_in]
[playse  storage="fin1.ogg"  clear="true"  ]

[if exp="f.h_in>=5" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-00zzzzz.png" ]
[chara_mod  name="z-b"  time="0"  storage="chara/26/z5.png" ]
[elsif exp="f.h_in>=4" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-00zzzz.png" ]
[chara_mod  name="z-b"  time="0"  storage="chara/26/z4.png" ]
[elsif exp="f.h_in>=2" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zzz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-00zzz.png" ]
[chara_mod  name="z-b"  time="0"  storage="chara/26/z3.png" ]
[elsif exp="f.h_in==1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0zz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-00zz.png" ]
[chara_mod  name="z-b"  time="0"  storage="chara/26/z2.png" ]
[elsif exp="f.h_in==0" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p0z.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/ex-00z.png" ]
[chara_mod  name="z-b"  time="0"  storage="chara/26/z1.png" ]
[endif]
[endmacro]

[macro name=cum_out]
[playse  storage="fin1.ogg"  clear="true"  ]

[if exp="f.h_in>=1" ]
[chara_mod  name="p"  time="0"  storage="chara/p/p-outz.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/00.png" ]
[else]
[chara_mod  name="p"  time="0"  storage="chara/p/p-out.png" ]
[chara_mod  name="x"  time="0"  storage="chara/x-ray/00.png" ]
[endif]
[eval  exp="h_act='off'" ]
[endmacro]

[macro name=cum_add]
[if exp="f.h_out>=5" ]
[eval  exp="f.h_out=f.h_out+1" ]
[elsif exp="f.h_out==4" ]
[eval  exp="f.h_out=f.h_out+1" ]
[chara_mod  name="z-a"  time="0"  storage="chara/25/z5.png" ]
[elsif exp="f.h_out==3" ]
[eval  exp="f.h_out=f.h_out+1" ]
[chara_mod  name="z-a"  time="0"  storage="chara/25/z4.png" ]
[elsif exp="f.h_out==2" ]
[eval  exp="f.h_out=f.h_out+1" ]
[chara_mod  name="z-a"  time="0"  storage="chara/25/z3.png" ]
[elsif exp="f.h_out==1" ]
[eval  exp="f.h_out=f.h_out+1" ]
[chara_mod  name="z-a"  time="0"  storage="chara/25/z2.png" ]
[elsif exp="f.h_out==0" ]
[eval  exp="f.h_out=f.h_out+1" ]
[chara_mod  name="z-a"  time="0"  storage="chara/25/z1.png" ]
[endif]
[endmacro]

[macro name=squi]
[playse  storage="squi.ogg"  clear="true"  ]
[if  exp="f.wet>=600" ]
[chara_mod  name="bw"  time="0"  storage="chara/28/b3s.png" ]
[elsif  exp="f.wet>=400" ]
[chara_mod  name="bw"  time="0"  storage="chara/28/b2s.png" ]
[elsif  exp="f.wet>=120" ]
[chara_mod  name="bw"  time="0"  storage="chara/28/b1s.png" ]
[endif]
[endmacro]


[macro name=set_lady]
[if  exp="f.lady==1" ]
[chara_mod  name="man"  time="0"  storage="chara/1/w-1.png" ]
[elsif  exp="f.lady==2" ]
[chara_mod  name="man"  time="0"  storage="chara/1/w-2.png" ]
[elsif  exp="f.lady==3" ]
[chara_mod  name="man"  time="0"  storage="chara/1/w-3.png" ]
[endif]
[endmacro]








[macro name=ep_a]
[if exp="f.neck==11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1a.png" ]
[elsif exp="f.neck==12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2a.png" ]
[elsif exp="f.neck==13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3a.png" ]
[elsif exp="f.neck==14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4a.png" ]
[endif]
[endmacro]

[macro name=ep_b]
[if exp="f.neck==11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1b.png" ]
[elsif exp="f.neck==12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2b.png" ]
[elsif exp="f.neck==13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3b.png" ]
[elsif exp="f.neck==14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4b.png" ]
[endif]
[endmacro]

[macro name=ep_c]
[if exp="f.neck==11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1c.png" ]
[elsif exp="f.neck==12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2c.png" ]
[elsif exp="f.neck==13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3c.png" ]
[elsif exp="f.neck==14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4c.png" ]
[endif]
[endmacro]

[macro name=ep_d]
[if exp="f.neck==11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1d.png" ]
[elsif exp="f.neck==12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2d.png" ]
[elsif exp="f.neck==13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3d.png" ]
[elsif exp="f.neck==14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4d.png" ]
[endif]
[endmacro]

[macro name=ep_non]
[if exp="f.neck==11 || f.neck==12 || f.neck==13 || f.neck==14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/00.png" ]
[eval exp="f.neck=0" ]
[endif]
[endmacro]


[macro name=aurel]
[if exp="f.shop_talk==0" ]
#不気味な店員
[else]
#オーレリア
[endif]
[endmacro]

[macro name=neph]
[if exp="f.cafe_talk==0" ]
#奇妙な店員
[else]
#ネフィー
[endif]
[endmacro]


[macro name=kando]
感度（ 口「
[if exp="f.h_m<=10" ]
低
[elsif exp="f.h_m<=50" ]
中
[elsif exp="f.h_m<=100" ]
良
[else]
高
[endif]
」
胸「
[if exp="f.h_b<=20" ]
低
[elsif exp="f.h_b<=70" ]
中
[elsif exp="f.h_b<=150" ]
良
[else]
高
[endif]
」
クリ「
[if exp="f.h_c<=15" ]
低
[elsif exp="f.h_c<=60" ]
中
[elsif exp="f.h_c<=130" ]
良
[else]
高
[endif]
」
膣「
[if exp="f.h_v<=25" ]
低
[elsif exp="f.h_v<=80" ]
中
[elsif exp="f.h_v<=180" ]
良
[else]
高
[endif]
」
[endmacro]








[macro name=ep_b1]
[cm  ]
[if exp="f.dress==11 || f.dress==12 || f.dress==13 || f.dress==14 || f.dress==15" ]
[eval exp="f.neck=11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1b.png" ]
[elsif exp="f.dress==61 || f.dress==62 || f.dress==63 || f.dress==64 || f.dress==65" ]
[eval exp="f.neck=11" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1c.png" ]
[eval exp="f.neck=11" ]
[elsif exp="f.dress==73 || f.dress==74" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1d.png" ]
[eval exp="f.neck=11" ]
[else]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b1a.png" ]
[endif]
[endmacro]

[macro name=ep_b2]
[cm  ]
[if exp="f.dress==11 || f.dress==12 || f.dress==13 || f.dress==14 || f.dress==15" ]
[eval exp="f.neck=12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2b.png" ]
[elsif exp="f.dress==61 || f.dress==62 || f.dress==63 || f.dress==64 || f.dress==65" ]
[eval exp="f.neck=12" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2c.png" ]
[eval exp="f.neck=12" ]
[elsif exp="f.dress==73 || f.dress==74" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2d.png" ]
[eval exp="f.neck=12" ]
[else]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b2a.png" ]
[endif]
[endmacro]

[macro name=ep_b3]
[cm  ]
[if exp="f.dress==11 || f.dress==12 || f.dress==13 || f.dress==14 || f.dress==15" ]
[eval exp="f.neck=13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3b.png" ]
[elsif exp="f.dress==61 || f.dress==62 || f.dress==63 || f.dress==64 || f.dress==65" ]
[eval exp="f.neck=13" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3c.png" ]
[eval exp="f.neck=13" ]
[elsif exp="f.dress==73 || f.dress==74" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3d.png" ]
[eval exp="f.neck=13" ]
[else]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b3a.png" ]
[endif]
[endmacro]

[macro name=ep_b4]
[cm  ]
[if exp="f.dress==11 || f.dress==12 || f.dress==13 || f.dress==14 || f.dress==15" ]
[eval exp="f.neck=14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4b.png" ]
[elsif exp="f.dress==61 || f.dress==62 || f.dress==63 || f.dress==64 || f.dress==65" ]
[eval exp="f.neck=14" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4c.png" ]
[eval exp="f.neck=14" ]
[elsif exp="f.dress==73 || f.dress==74" ]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4d.png" ]
[eval exp="f.neck=14" ]
[else]
[chara_mod  name="neck"  time="0"  storage="chara/neck-s/s-b4a.png" ]
[endif]
[endmacro]









[macro name=bought_count]

[eval exp="f.bought_count=0" ]

[if exp="f.c_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_b4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_b5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_c1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_c2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_c3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_c4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_c5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_d1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_d2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_d3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_e1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_e2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_e3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_e4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_e5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_f1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_f2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_f3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_g1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_g2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_g3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_g4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_g5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_h1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_h2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_h3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_h4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_i1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_i2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_i3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_i4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.c_i5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_a4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_a5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_b4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_b5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_c1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.r_c2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.p_a6==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_a4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_a5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_b4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_b5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_c1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_c2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_c3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_c4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.g_c5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_a4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.s_b6==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ri_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.h_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.h_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a5==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a6==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_a7==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_b1==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_b2==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_b3==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.ne_b4==1" ]
[eval exp="f.bought_count=f.bought_count+1" ]
[endif]
[if exp="f.bought_count<=10" ]
[eval exp="f.bought_count=0" ]
[elsif exp="f.bought_count<=20" ]
[eval exp="f.bought_count=1" ]
[elsif exp="f.bought_count<=30" ]
[eval exp="f.bought_count=2" ]
[elsif exp="f.bought_count<=40" ]
[eval exp="f.bought_count=3" ]
[elsif exp="f.bought_count<=50" ]
[eval exp="f.bought_count=4" ]
[elsif exp="f.bought_count<=60" ]
[eval exp="f.bought_count=5" ]
[elsif exp="f.bought_count<=70" ]
[eval exp="f.bought_count=6" ]
[elsif exp="f.bought_count<=80" ]
[eval exp="f.bought_count=7" ]
[elsif exp="f.bought_count<=90" ]
[eval exp="f.bought_count=8" ]
[elsif exp="f.bought_count<=100" ]
[eval exp="f.bought_count=9" ]
[else]
[eval exp="f.bought_count=10" ]
[endif]

[if exp="f.bought_count>=1 && f.shop_talk==0" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=2 && f.shop_talk==1" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=3 && f.shop_talk==2" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=4 && f.shop_talk==3" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=5 && f.shop_talk==4" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=6 && f.shop_talk==5" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=7 && f.shop_talk==6" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=8 && f.shop_talk==7" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=9 && f.shop_talk==8" ]
[eval exp="f.shop_t=1" ]
[elsif exp="f.bought_count>=10 && f.shop_talk==9" ]
[eval exp="f.shop_t=1" ]
[else]
[eval exp="f.shop_t=0" ]
[endif]
[endmacro]




[macro name=menu_count]
[eval exp="f.menu_count=0" ]
[if exp="f.f_pancake==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]
[if exp="f.f_apple==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]
[if exp="f.f_pding==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]
[if exp="f.f_french==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]
[if exp="f.f_ch_cake==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]
[if exp="f.f_cake==1" ]
[eval exp="f.menu_count=f.menu_count+1" ]
[endif]

[if exp="f.menu_count>=5" ]
[eval exp="f.menu_comp=1" ]
[endif]

[endmacro]


[macro name=cafe_talk_check]
[if exp="f.cafe_c>=1 && f.cafe_talk==0" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=3 && f.cafe_talk==1" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=5 && f.cafe_talk==2" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=6 && f.cafe_talk==3" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=8 && f.cafe_talk==4" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=10 && f.cafe_talk==5" ]
[eval exp="f.cafe_t=1" ]
[elsif exp="f.cafe_c>=12 && f.cafe_talk==6" ]
[eval exp="f.cafe_t=1" ]
;[elsif exp="f.cafe_c>=14 && f.cafe_talk==7" ]
;[eval exp="f.cafe_t=1" ]
;[elsif exp="f.cafe_c>=16 && f.cafe_talk==8" ]
;[eval exp="f.cafe_t=1" ]
;[else]
;[eval exp="f.cafe_t=0" ]
[endif]
[endmacro]


[macro name=miyage]
[emb exp="f.miyage" ]
[endmacro]


[_tb_end_tyrano_code]

[return]

