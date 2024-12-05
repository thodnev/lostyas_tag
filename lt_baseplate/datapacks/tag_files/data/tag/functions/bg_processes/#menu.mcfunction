scoreboard players enable @a menu
scoreboard players enable Lostya map

execute as @a[scores={menu=0..}, team = !menu, team = !menu_tagger] run scoreboard players set @s menu_where 1
execute as @a[scores={menu=0..}, team = !menu, team = !menu_tagger] at @s run stopsound @s
execute as @a[scores={menu=0..}, team = !menu, team = !menu_tagger] at @s run playsound menu music @s ~ ~ ~ .5
execute as @a[scores={menu=0..}, team = !menu, team = !menu_tagger] at @s run title @s actionbar {"text":"♪ nico's nextbots ost - menu (in-game version)","color":"dark_purple"}
execute as @a[scores={menu=0..}, team = !menu, team = !menu_tagger] run scoreboard players set @s menu -1

execute as @a[scores={menu=1..}, team = menu] at @s run playsound ui.button.click master @s
execute as @a[scores={menu=0}, team = menu] at @s run playsound ui.loom.take_result master @s ~ ~ ~ 9999999 1
execute as @a[scores={menu=0..}, team = menu] at @s run scoreboard players operation @s menu_where = @s menu
execute as @a[scores={menu=0..}, team = menu] at @s run scoreboard players set @s menu -1
execute as @a[scores={menu=0}, team = menu_tagger] at @s run playsound ui.button.click master @s ~ ~ ~ 9999999 1
execute as @a[scores={menu=1..}, team = menu_tagger] at @s run playsound ui.button.click master @s ~ ~ ~ 9999999 1
execute as @a[scores={menu=0}, team = menu_tagger] at @s run playsound ui.loom.take_result master @s ~ ~ ~ 9999999 1
execute as @a[scores={menu=0..}, team = menu_tagger] at @s run scoreboard players operation @s menu_where = @s menu
execute as @a[scores={menu=0..}, team = menu_tagger] at @s run scoreboard players set @s menu -1

execute as @a[tag=!joined.sound] at @s run playsound minecraft:block.bell.use master @a ~ ~ ~ 99999 2
execute as @a[tag=!joined.sound] at @s run playsound minecraft:block.bell.use master @a ~ ~ ~ 99999 1.5
execute as @a[tag=!joined.sound] at @s run effect give @s invisibility 1 0 true
execute as @a[tag=!joined.sound, team=!menu, team=!menu_tagger] at @s run scoreboard players set @s menu 0
execute as @a[tag=!joined.sound] at @s run stopsound @s
execute as @a[tag=!joined.sound] at @s run playsound menu music @s ~ ~ ~ .5
execute as @a[tag=!joined.sound] at @s run gamemode adventure @s
#execute as @a[tag=!joined.sound] at @s run tp @s @e[type=armor_stand,tag=spawn,sort=nearest,limit=1]
execute as @a[tag=!joined.sound] at @s run tp @s 3 47 -80
execute as @a[tag=!joined.sound] at @s run tag @s add joined.sound

execute as @a[scores={left=1..}] at @s run tag @s remove joined.sound
execute as @a[scores={left=1..}] at @s run scoreboard players reset @s left


execute as @a at @s if score @s menu_where matches 1.. run tp @s 3 47 -80 0 90
execute as @a at @s if score @s menu_where matches 1.. run tp @s @s
execute as @a at @s if score @s menu_where matches 1.. run team join menu @s[team=player]
execute as @a at @s if score @s menu_where matches 1.. run team join menu @s[team=z_safezoned]
execute as @a at @s if score @s menu_where matches 1.. run team join menu @s[team=z_zothergm]
execute as @a at @s if score @s menu_where matches 1.. run team join menu_tagger @s[team=tagger]
execute as @a at @s if score @s menu_where matches 1.. run team join menu_tagger @s[team=z_safezoned_tagger]
execute as @a at @s if score @s menu_where matches 1.. run team join menu_tagger @s[team=z_zothergm_tagger]
execute as @a at @s if score @s menu_where matches 1.. run gamemode spectator @s
execute as @a at @s if score @s menu_where matches 1.. run function tag:bg_processes/stopmusic
execute as @a at @s if score @s menu_where matches 1.. run tag @s remove afk
execute as @a at @s if score @s menu_where matches 1.. run tag @s remove safezoned
execute as @a at @s if score @s menu_where matches 1.. run tag @s remove safezoned2
execute as @a at @s if score @s menu_where matches 1.. run stopsound @s music safezone
execute as @a at @s if score @s menu_where matches 1.. run effect clear @s

execute as @a at @s if score @s menu_where matches 0 run effect give @s blindness 1 0 true
execute as @a at @s if score @s menu_where matches 0 run gamemode adventure @s
execute as @a at @s if score @s menu_where matches 0 if score Lostya map matches 1 run tp @s @e[type=armor_stand,tag=spawn_main,sort=random,limit=1]
execute as @a at @s if score @s menu_where matches 0 if score Lostya map matches 2 run tp @s @e[type=armor_stand,tag=spawn_153,sort=random,limit=1]
execute as @a at @s if score @s menu_where matches 0 unless score Lostya map matches 1..2 run tp @s @e[type=armor_stand,tag=spawn,sort=random,limit=1]
execute as @a at @s if score @s menu_where matches 0 run team join player @s[team=menu]
execute as @a at @s if score @s menu_where matches 0 run team join tagger @s[team=menu_tagger]
execute as @a at @s if score @s menu_where matches 0 run particle minecraft:end_rod ~ ~1 ~ .2 .5 .2 .05 50
execute as @a at @s if score @s menu_where matches 0 run tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"]
execute as @a at @s if score @s menu_where matches 0 run scoreboard players reset @s menu_where

execute as @a at @s if score @s menu_where matches 1 run tellraw @s[team=menu] [       "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n       ",{"text": "l","color":"#FF8800","bold": true},{"text": "ostya's tag", "bold": true}, "\n ", {"translate":"menu.online","color":"dark_gray"}, {"selector":"@a"},        "\n\n\n\n", {"text":"  ","color":"gold"}          , {"translate": "menu.play", "clickEvent":{"action":"run_command","value":"/trigger menu set 0"},"hoverEvent":{"action":"show_text","contents":[{"translate":"menu.play.hover"}]}}                                                           , "  " , {"text":"✖","color":"aqua", "clickEvent":{"action":"run_command","value":"/team join menu_tagger"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.change_role.become_tagger.hover"}}} , "\n  ", {"translate": "menu.how_to_play", "clickEvent":{"action":"run_command","value":"/trigger menu set 2"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.how_to_play.hover"}}}, "\n\n  ", {"translate": "menu.settings", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.settings.hover"}}}, "\n\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.random_tagger", "color":"white", "clickEvent":{"action":"run_command","value":"/tag @r[tag=!afk] add tag.recieve"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.random_tagger.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.clear_taggers", "color":"white", "clickEvent":{"action":"run_command","value":"/tag @a add tag.give_out"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.clear_taggers.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.reset_points", "color":"gray", "clickEvent":{"action":"run_command","value":"/scoreboard players set @a playtime 0"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.reset_points.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.reload", "color":"red", "clickEvent":{"action":"run_command","value":"/execute run reload"},"hoverEvent":{"action":"show_text","contents":[{"translate":"menu.testing.reload.hover"},{"text":" build #","color":"dark_gray"},{"score":{"name":"buildnum","objective": "buildnum"},"color": "dark_gray"}]}},[{"text":" #","color":"dark_gray"},{"score":{"name":"buildnum","objective": "buildnum"},"color": "dark_gray"}], "\n\n  ", {"text": "разрабы", "clickEvent":{"action":"run_command","value":"/trigger menu set 3"},"hoverEvent":{"action":"show_text","contents":{"translate":"посмотри, кто делал игру"}}}, "\n  ", {"text": "список изменений", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":{"translate":"что же поменялось? [пока не работает, иди плакай]"}}}]
execute as @a at @s if score @s menu_where matches 1 run tellraw @s[team=menu_tagger] ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n       ",{"text": "l","color":"#FF8800","bold": true},{"text": "ostya's tag", "bold": true}, "\n ", {"translate":"menu.online","color":"dark_gray"}, {"selector":"@a"},        "\n\n\n\n", {"text":"|  ","color":"gold"}         , {"translate": "menu.play", "clickEvent":{"action":"run_command","value":"/trigger menu set 0"},"hoverEvent":{"action":"show_text","contents":[{"translate":"menu.play.hover"},"\n",{"translate":"menu.play.hover.tagged","color":"gold"}]}}, " " , {"text":"❤","color":"gold", "clickEvent":{"action":"run_command","value":"/team join menu"       },"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.change_role.become_runner.hover"}}} , "\n  ", {"translate": "menu.how_to_play", "clickEvent":{"action":"run_command","value":"/trigger menu set 2"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.how_to_play.hover"}}}, "\n\n  ", {"translate": "menu.settings", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.settings.hover"}}}, "\n\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.random_tagger", "color":"white", "clickEvent":{"action":"run_command","value":"/tag @r[tag=!afk] add tag.recieve"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.random_tagger.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.clear_taggers", "color":"white", "clickEvent":{"action":"run_command","value":"/tag @a add tag.give_out"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.clear_taggers.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.reset_points", "color":"gray", "clickEvent":{"action":"run_command","value":"/scoreboard players set @a playtime 0"},"hoverEvent":{"action":"show_text","contents":{"translate":"menu.testing.reset_points.hover"}}}, "\n", {"text":"⭐","color":"green","hoverEvent": {"action": "show_text","contents": {"translate":"menu.testing_only","color":"green"}}}, {"translate": "menu.testing.reload", "color":"red", "clickEvent":{"action":"run_command","value":"/execute run reload"},"hoverEvent":{"action":"show_text","contents":[{"translate":"menu.testing.reload.hover"},{"text":" build #","color":"dark_gray"},{"score":{"name":"buildnum","objective": "buildnum"},"color": "dark_gray"}]}},[{"text":" #","color":"dark_gray"},{"score":{"name":"buildnum","objective": "buildnum"},"color": "dark_gray"}] , "\n\n  ", {"text": "разрабы", "clickEvent":{"action":"run_command","value":"/trigger menu set 3"},"hoverEvent":{"action":"show_text","contents":{"translate":"посмотри, кто делал игру"}}}, "\n  ", {"text": "список изменений", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":{"translate":"что же поменялось? [пока не работает, иди плакай]"}}}]

execute as @a at @s if score @s menu_where matches 2 run tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n     ",{"text": "l","color":"#FF8800","bold": true},{"text": "ostya's tag","color": "#FFFFFF", "bold": true},        "\n "          , {"text": "←", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":"назад"},"color":"gray"},        "  "          , {"text": "поясняем за игру", "color": "white"}, "\n\n\n\n\n\n\n\n  " , {"text":"убегай от воды или лови других - ведь это догонялки!"},{"text":"\n\n  ⌚ поинты - начисляются за время или за действия (за бхоп, например)\n  когда ты вода сносится по 2⌚ в секунду","color":"green"},{"text":"\n\n  в твоём распоряжении есть способности и пёрл. советую не падать с больших высот!","color":"dark_aqua"}]

execute as @a at @s if score @s menu_where matches 3 run tellraw @s ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n     ",{"text": "l","color":"#FF8800","bold": true},{"text": "ostya's tag","color": "#FFFFFF", "bold": true},        "\n "          , {"text": "←", "clickEvent":{"action":"run_command","value":"/trigger menu set 1"},"hoverEvent":{"action":"show_text","contents":"назад"},"color":"gray"},        "  "          , {"text": "разрабы", "color": "white"}, "\n\n\n\n\n\n\n\n\n\n\n\n\n  " , {"text":"вся игра - Lostya\n  использована музыка из роблокс режима "},{"text":"nico's nextbots","bold":true,"underlined": true,"color":"green","hoverEvent":{"action":"show_text","contents":{"translate":"поиграй в него, классный режим!"}}, "clickEvent":{"action":"open_url","value":"https://www.roblox.com/games/10118559731/nicos-nextbots-ARCADE"}},"\n  украинский перевод - ArtZabAZ\n  куча идей для поинтов - fenikoto"]