# Item trade script - Developed by Coffeelot#1586 and Wuggie#1683

# How to use
This script creates trades for cw-traders. All you need to do is add the trades in the config.lua.

# Trade objects
**tradeName**: Variable name of the trade. Needs to be unique. \
**tradeLabel**: Label that shows up in game\
**fromItem**: Variable name of the item the player give the trader (found in items.lua in qbcore)\
**fromAmount**: How many items the traders takes\
**toItem**: Variable name of the item the trader give the player (found in items.lua in qbcore)\
**toAmount**: How many items the traders gives\
**toCash = {to, from}**: This is optional! If you add this, it will let the trader give the player cash in the span between *to* and *from* for the item
**toBills** This is optional! If you add this, it will let the trader give the player money rolls (*'rolls'*) in the span between *to* and *from* for the item. You will need to add these in the items.lua for it to work:
```
	["rolls"] 					 = {["name"] = "rolls", 			 	["label"] = "Roll Of Small Notes", 		        ["weight"] = 100, 		["type"] = "item", 		["image"] = "cash_roll.png", 				["unique"] = false, 		["useable"] = false,		["created"] = nil,		["decay"] = nil, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Roll of Small Notes"},

```

# Dependencies
* qb-target - https://github.com/BerkieBb/qb-target
