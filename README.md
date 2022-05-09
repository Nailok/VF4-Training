# VF4 Training Mode
This is a basic training mode for arcade VF4 via [Flycast](https://github.com/flyinghead/flycast) or [Flycast Dojo](https://github.com/blueminder/flycast-dojo) .

Supported version right now is VF4:FT (Revision. B, vf4tuned, gds-0036f). EVO is coming.

![1](https://user-images.githubusercontent.com/61318430/167488734-939fdfbd-c375-41c8-a506-598cc1542e45.png)

# How to use
1. Extract archive and write path to vf4_training.lua in Settings -> Advanced -> Lua Scripting
2. When in game, add cheats in Flycast for health and infinity time 

# Known problems
- Some moves that can be delayed are showing incorrect startup, because of how game stores this data (E.g. Jeffry's 1K+G, Lau's P+K)
- Using VF1 costume (press and hold P+K+G when picking character before option between 'normal' or 'challenge' mode) can crash the game VS CPU with some characters

# TODO
- [ ] Counter-hit state
- [ ] Switch stance
- [ ] Reset positions
- [ ] Change A and B moves
