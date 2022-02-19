FT_MEMORY_TABLE = {
    ['level_id'] = 0x0C2926DC,
    ['game_state'] = 0x0C243148,
    ['game_timer'] = 0x0C292574,                -- float, read as 4 bytes
    ['rounds_counter'] = 0x0C2925D8,            -- 2 bytes
    ['players_wins_counter'] = 0x0C2925D0,      -- 2 bytes

    ['p1_health'] = 0x0C37BA40,            -- 2 bytes 
    ['p1_frame_advantage'] = 0x0C37C406,    -- 2 bytes
    ['p1_move_startup'] = 0x0C37BD16,      -- 2 bytes
    ['p1_move_damage'] = 0x0C37BCD0,       -- 2 bytes
    ['p1_combo_damage'] = 0x0C37C4D0,      -- 2 bytes
    ['p1_idle_time'] = 0x0C37BD4C,          -- 2 bytes
    ['p1_state'] = 0x0C4205D0,
    
    ['p2_health'] = 0x0C37C2AC,            -- 2 bytes
    ['p2_idle_time'] = 0x0C37C5B8,         -- 2 bytes
    ['p2_state'] = 0x0C4205E0,             -- byte
}

FT_MEMORY_TABLE.is_evo = false
FT_MEMORY_TABLE.is_ft = true


--- game_state: 
                -- 1  - reload level
                -- 5  - p2 cutscene before round 
                -- 6  - same as 6
                -- 7  - new round 
                -- 8  - same as 8?
                -- 9  - round start delay before gameplay
                -- 10 - actual gameplay
                -- 11 - restart game
                -- 12 - draw
                -- 13 - replay
                -- 15 - to the next round
                -- 16 - no clip, no collision logic etc
                -- 18 - credits map