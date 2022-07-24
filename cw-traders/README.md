# Item trade script - Developed by Coffeelot#1586 and Wuggie#1683

# How to use
This script creates physical traders that uses the cw-trade script to. All you need to do is add the traders in the config.lua. Uses qb-target.

# Trade objects
**name**: Variable name of the trader. Needs to be unique. \
**model**: the model of the character\
**tradeLabel**: What shows up in game\
**tradeName**: needs to match the unique variable name of the trade in cw-trades config that you want to use\
**coords**: location of the trader\
**toAmount**: How many items the traders gives\
**toCash = {to, from}**: This is optional! If you add this, it will let the trader give the player cash in the span between *to* and *from* for the item
**toBills** This is optional! If you add this, it will let the trader give the player money rolls (*'rolls'*) in the span between *to* and *from* for the item. You will need to add these in the items.lua for it to work:

[ped models](https://docs.fivem.net/docs/game-references/ped-models/#scenario-male)\
[animation pastebin](https://pastebin.com/6mrYTdQv)


# Dependencies
* cw-trade
* qb-target - https://github.com/BerkieBb/qb-target

