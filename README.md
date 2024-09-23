# cw-trading 🤝

Package of two scripts to allow NPCs that trade items to other items or cash.

Ever felt like your QB server really needs someone who trades burritos for meth? or burgers for fried chicken? We gotcha! Easy setup. You only need to modify and add to the config files.

# Links
### ⭐ Check out our [Tebex store](https://cw-scripts.tebex.io/category/2523396) for some cheap scripts ⭐


### [More free scripts](https://github.com/stars/Coffeelot/lists/cw-scripts)  👈

### Support, updates and script previews:

<a href="https://discord.gg/FJY4mtjaKr"> <img src="https://media.discordapp.net/attachments/1202695794537537568/1285652389080334337/discord.png?ex=66eb0c97&is=66e9bb17&hm=b1b2c17715f169f57cf646bb9785b0bf833b2e4037ef47609100ec8e902371df&=&format=webp" width="200"></a>


# Preview
[Video](https://youtu.be/qMh37574pvo)
# How to use cw-traders 🛒
This script creates physical traders that uses the cw-trade script to. All you need to do is add the traders in the config.lua. Uses qb-target.

# Using with [cw-tokens](https://github.com/Coffeelot/cw-tokens) 🔑
At the top of the Config you will find `Config.UseTokens = false`. Change `false` to `true` if you want to use [cw-tokens](https://github.com/Coffeelot/cw-tokens).

## Trader objects
**name**: Variable name of the trader. Needs to be unique. \
**model**: the model of the character (see link below)\
**tradeLabel**: What shows up in game\
**tradeName**: needs to match the unique variable name of the trade in cw-trades config that you want to use\
**coords**: location of the trader\
**animation**: How many items the traders gives (see link below)\
**available = {from, to}**: This is optional! If you add this, the trader will only do the trade in the given timespan

[ped models](https://docs.fivem.net/docs/game-references/ped-models/#scenario-male)\
[animation pastebin](https://pastebin.com/6mrYTdQv)

# How to use cw-trade 💰
This script creates trades for cw-traders. All you need to do is add the trades in the config.lua.
The script is separated so that you can use the same events for other 

> If you want to use rep and repType you need [mz-skills](https://github.com/MrZainRP/mz-skills). Otherwise REMOVE THESE PROPERTIES from your trades.

## Trade objects 
**tradeName**: Variable name of the trade. Needs to be unique. \
**fromItem**: Variable name of the item the player give the trader (found in items.lua in qbcore)\
**fromAmount**: How many items the traders takes\
**toItem**: Variable name of the item the trader give the player (found in items.lua in qbcore)\
**toAmount**: How many items the traders gives\
**toCash = {to, from}**: This is optional! If you add this, it will let the trader give the player cash in the span between *to* and *from* for the item
**toBills** This is optional! If you add this, it will let the trader give the player money rolls (*'rolls'*) in the span between *to* and *from* for the item. You will need to add these in the items.lua for it to work:
```
	["rolls"] 					 = {["name"] = "rolls", 			 	["label"] = "Roll Of Small Notes", 		        ["weight"] = 100, 		["type"] = "item", 		["image"] = "cash_roll.png", 				["unique"] = false, 		["useable"] = false,		["created"] = nil,		["decay"] = nil, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Roll of Small Notes"},

```
