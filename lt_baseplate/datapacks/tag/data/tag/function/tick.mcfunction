gamemode adventure @a[gamemode = survival]
recipe take @a *


# variables before functions
execute store result score playercount server if entity @a
execute store result score taggers server if entity @a[tag = tagger, gamemode = adventure, tag =!safezone]
execute store result score non-taggers server if entity @a[tag =!tagger, gamemode =!creative, tag =!safezone]
execute store result score specials server if entity @a[tag = special, gamemode =!creative, tag =!safezone]
execute store result score active-players server if entity @a[gamemode =!creative, tag =!safezone]
execute store result score adventure-mode server if entity @a[gamemode = adventure]
scoreboard players add generic server 1
execute if score generic server matches 20.. run scoreboard players set generic server 0


# join and leave routine
execute as @a unless score @s joined matches 0 at @s run function tag:misc/join_routine
execute as @a unless score @s joined matches 0 at @s run scoreboard players set @s joined 0

execute if score playercount_old server > playercount server run function tag:misc/update_player_list


# restart the game if everyone was caught
execute if score restart server matches 60.. run scoreboard players add restart server 1
execute if score active-players server matches 2.. if score taggers server matches 1.. if score taggers server = active-players server run scoreboard players add restart server 1
execute if score active-players server matches 2.. if score specials server matches 1.. if score specials server = non-taggers server run scoreboard players add restart server 1
execute if score active-players server matches 2.. if score restart server matches 1.. run scoreboard players operation restart.s server = restart server
execute if score active-players server matches 2.. if score restart server matches 1.. run scoreboard players operation restart.s server /= 20 consts
execute if score active-players server matches 2.. if score restart server matches 1.. run scoreboard players set restart.s_reversed server 3
execute if score active-players server matches 2.. if score restart server matches 1.. run scoreboard players operation restart.s_reversed server -= restart.s server

execute if score restart server matches 1 run tellraw @a [{"text": "Everyone was caught! Restarting the game in ", "color": "gold"}, {"score": {"name": "restart.s_reversed", "objective": "server"}, "color": "gold"}, {"text": " seconds..."}]
execute if score restart server matches 60 as @a run function tag:misc/spawn
execute if score adventure-mode server matches 2.. if score restart server matches 140.. as @a run function tag:tag_randomize
execute if score adventure-mode server matches 2.. if score restart server matches 140.. as @a run scoreboard players reset restart server

# effects that negate minecraft stuff
effect give @a saturation 15 10 true
effect give @a instant_health 15 10 true

# ui stuff
bossbar set minecraft:version players @a
execute if score adventure-mode server matches 2.. if score taggers server matches 1.. unless score game server matches 0.. run scoreboard players set game server 0
execute if score adventure-mode server matches 2.. unless score taggers server matches 1.. unless score game server matches 0.. run scoreboard players set game server -1
execute unless score adventure-mode server matches 2.. if score playercount server matches 1.. run scoreboard players set game server -2


execute if score game server matches -2 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"              ",{"text":"building mode","color":"gray","bold":false},{"text":"               ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches -1 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"              ",{"text":"social space","color":"gray","bold":false},{"text":"               ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 0 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"        ",{"text":"no gamemode selected","color":"gray","bold":false},{"text":"         ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 1 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"               ",{"text":"classic tag","color":"#FFBB00","bold":false},{"text":"                ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 2 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"              ",{"text":"infection tag","color":"dark_green","bold":false},{"text":"               ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 3 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"               ",{"text":"murder tag","color":"red","bold":false},{"text":"               ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 4 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"                ",{"text":"crown tag","color":"yellow","bold":false},{"text":"                ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 5 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"               ",{"text":"freeze tag","color":"aqua","bold":false},{"text":"               ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]
execute if score game server matches 6 run bossbar set minecraft:version name [{"text":"lostya's tag","color":"#FF8800"},"            ",{"text":"killer freeze tag","color":"light_purple","bold":false},{"text":"            ","color":"#999900","bold":false},{"text":"v. α ","color":"dark_gray","bold":false},{"score":{"name":"buildnum","objective":"server"},"color":"dark_gray","bold":true}]




# other functions
scoreboard players add glowing server 1
execute if score glowing server matches 4.. run scoreboard players set glowing server 0

execute if score game server matches 1.. if score glowing server matches 0..1 run team modify 013player_glow color aqua
execute if score game server matches 1.. if score glowing server matches 2..3 run team modify 013player_glow color white

execute if score game server matches 1.. run team modify 003player color aqua
execute if score game server matches 1.. run team modify 103player_safezone prefix {"text": "⭐", "color": "aqua"}
execute if score game server matches 1.. run team modify 203player_creative prefix {"text": "⭐", "color": "aqua"}
execute if score game server matches 1.. run team modify 303player_spectator prefix {"text": "☆", "color": "aqua"}
execute if score game server matches 1.. run team modify 002special color blue
execute if score game server matches 1.. run team modify 102special_safezone prefix {"text": "⭐", "color": "blue"}
execute if score game server matches 1.. run team modify 202special_creative prefix {"text": "⭐", "color": "blue"}
execute if score game server matches 1.. run team modify 302special_spectator prefix {"text": "☆", "color": "blue"}


execute unless score game server matches 1.. run team modify 013player_glow color gray
execute unless score game server matches 1.. run team modify 003player color gray
execute unless score game server matches 1.. run team modify 103player_safezone prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 203player_creative prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 303player_spectator prefix {"text": "☆", "color": "gray"}
execute unless score game server matches 1.. run team modify 002special color gray
execute unless score game server matches 1.. run team modify 102special_safezone prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 202special_creative prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 302special_spectator prefix {"text": "☆", "color": "gray"}
execute unless score game server matches 1.. run team modify 001tagger color gray
execute unless score game server matches 1.. run team modify 011tagger color gray
execute unless score game server matches 1.. run team modify 021tagger color gray
execute unless score game server matches 1.. run team modify 101tagger_safezone prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 201tagger_creative prefix {"text": "⭐", "color": "gray"}
execute unless score game server matches 1.. run team modify 301tagger_spectator prefix {"text": "☆", "color": "gray"}

execute if score game server matches 1 run team modify 001tagger color gold
execute if score game server matches 1 run team modify 011tagger color yellow
execute if score game server matches 1 run team modify 021tagger color white
execute if score game server matches 1 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 1 run team modify 201tagger_creative prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 1 run team modify 301tagger_spectator prefix {"text": "☆", "color": "gold"}

execute if score game server matches 2 run team modify 001tagger color dark_green
execute if score game server matches 2 run team modify 011tagger color green
execute if score game server matches 2 run team modify 021tagger color white
execute if score game server matches 2 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "dark_green"}
execute if score game server matches 2 run team modify 201tagger_creative prefix {"text": "⭐", "color": "dark_green"}
execute if score game server matches 2 run team modify 301tagger_spectator prefix {"text": "☆", "color": "dark_green"}

execute if score game server matches 3 run team modify 001tagger color red
execute if score game server matches 3 run team modify 011tagger color light_purple
execute if score game server matches 3 run team modify 021tagger color white
execute if score game server matches 3 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "red"}
execute if score game server matches 3 run team modify 201tagger_creative prefix {"text": "⭐", "color": "red"}
execute if score game server matches 3 run team modify 301tagger_spectator prefix {"text": "☆", "color": "red"}

execute if score game server matches 4 run team modify 001tagger color yellow
execute if score game server matches 4 run team modify 011tagger color yellow
execute if score game server matches 4 run team modify 021tagger color white
execute if score game server matches 4 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "yellow"}
execute if score game server matches 4 run team modify 201tagger_creative prefix {"text": "⭐", "color": "yellow"}
execute if score game server matches 4 run team modify 301tagger_spectator prefix {"text": "☆", "color": "yellow"}

execute if score game server matches 5 run team modify 001tagger color gold
execute if score game server matches 5 run team modify 011tagger color yellow
execute if score game server matches 5 run team modify 021tagger color white
execute if score game server matches 5 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 5 run team modify 201tagger_creative prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 5 run team modify 301tagger_spectator prefix {"text": "☆", "color": "gold"}

execute if score game server matches 6 run team modify 001tagger color gold
execute if score game server matches 5 run team modify 011tagger color yellow
execute if score game server matches 5 run team modify 021tagger color white
execute if score game server matches 6 run team modify 101tagger_safezone prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 6 run team modify 201tagger_creative prefix {"text": "⭐", "color": "gold"}
execute if score game server matches 6 run team modify 301tagger_spectator prefix {"text": "☆", "color": "gold"}

execute as @a at @s run function tag:tagging/decoration

execute as @a[tag =!safezone, gamemode =!spectator] at @s if block ~ ~ ~ cave_air run function tag:tagging/go_in_safezone
execute as @a[tag =!safezone, gamemode =!spectator] at @s if block ~ ~1 ~ cave_air run function tag:tagging/go_in_safezone

execute as @a[tag = safezone] at @s if block ~ ~ ~ cave_air run function tag:tagging/in_safezone
execute as @a[tag = safezone] at @s if block ~ ~1 ~ cave_air run function tag:tagging/in_safezone

execute as @a[tag = safezone] at @s unless block ~ ~ ~ cave_air unless block ~ ~1 ~ cave_air run function tag:tagging/out_of_safezone
execute as @a[tag = safezone, gamemode = spectator] at @s run function tag:tagging/out_of_safezone


execute as @a[gamemode = !spectator] at @s unless score @s effect.strong_levitation matches 10.. if block ~ ~-1 ~ beacon run function tag:misc/beacons


execute as @a[scores = {effect.glowing = 0..}, gamemode = adventure] at @s run function tag:effects/glowing
execute as @a[scores = {effect.strong_levitation = 0..}, gamemode = adventure] at @s run function tag:effects/strong_levitation
execute as @a[scores = {effect.freeze = 0..}, gamemode = adventure] at @s run function tag:effects/freeze
execute as @a[scores = {effect.invisibility = 0..}, gamemode = adventure] at @s run function tag:effects/invisibility
execute as @a[scores = {effect.downed = -1..}, gamemode = adventure] at @s run function tag:effects/downed

execute as @a[tag = dead, gamemode =!creative, tag =!safezone] at @s run function tag:misc/death
execute as @a[tag = dead, tag = safezone] at @s run tag @s remove dead
execute as @a[tag = dead, gamemode = creative] at @s run tag @s remove dead

execute as @a[scores = {anim.death = ..-2}] at @s run function tag:misc/spawn

execute as @a[scores = {hit_detect.taker = 1..}] unless entity @a[scores = {hit_detect.giver = 1..}] run tellraw @a[scores = {logging = 1..2}] ["! warn: ", {"selector": "@s"}, " got hit by environment or an unknown player"]
execute as @a[scores = {hit_detect.taker = 1..}] unless entity @a[scores = {hit_detect.giver = 1..}] run scoreboard players set @s hit_detect.taker 0
execute as @a[scores = {hit_detect.giver = 1..}] at @s run function tag:tagging/hit_detected

execute as @a at @s run function tag:misc/stats
execute as @a at @s run function tag:misc/bhop
execute as @a at @s run function tag:misc/stopmusic


function tag:map_specific/lt_playground
execute as @a run function tag:misc/screens
# execute as @a at @s run function tag:misc/anticheat

item replace entity @a[gamemode = adventure] player.cursor with air
execute as @a run attribute @s attack_speed base set 1000000
effect give @a haste infinite 0 true

scoreboard players set @a is_sneaking 0
execute as @a at @s if block ~ ~ ~ cauldron unless score @s effect.invisibility matches 1.. run scoreboard players set @s effect.invisibility 1


# items
execute as @a[gamemode =!adventure] at @s run clear @s *[custom_data={game: 1}]
execute as @a[gamemode =!adventure] at @s run clear @s *[custom_data={game: 2}]
execute as @a[gamemode =!adventure] at @s run clear @s *[custom_data={game: 3}]
execute as @a[gamemode = adventure] at @s run function tag:items/ender_pearl
execute as @a[gamemode = adventure] at @s run function tag:items/ability


# variables after functions
execute store result score playercount_old server if entity @a
execute store result score taggers_old server if entity @a[tag=tagger]





# temp
# execute as @a[scores = {fall = 1..}] at @s run scoreboard players set @s anim.death -11
# execute as @a[scores = {fall = 1..}] at @s run scoreboard players reset @s fall
# execute as @a at @s if block ~ ~-.1 ~ sandstone unless score @s anim.death matches -200.. run tag @s[gamemode=adventure] add dead

# item replace entity @a[gamemode = adventure] container.2 with minecraft:ender_pearl[minecraft:use_cooldown={seconds:15, cooldown_group: "ender_pearl"}, minecraft:use_remainder={id: "heart_of_the_sea"}]