FT_MEMORY_TABLE = {
    ['player1_health'] = 0x0C37BA40,            -- 2 bytes 
    ['player2_health'] = 0x0C37C2AC,            -- 2 bytes
    ['game_timer'] = 0x0C292574,                -- float, read as 4 bytes
    -- ['rounds_counter'] = 0x0C24CB58,            -- 2 bytes
    -- ['players_wins_counter'] = 0x0C24CB50,      -- 2 bytes

    ['player1_frame_advantage'] = 0x0C37C406,    -- 2 bytes
    ['player1_move_startup'] = 0x0C37BD16,      -- 2 bytes
    ['player1_move_damage'] = 0x0C37BCD0,       -- 2 bytes
    ['player1_combo_damage'] = 0x0C37C4D0,      -- 2 bytes
    -- ['player1_idle_time'] = 0x0318BC8,          -- 2 bytes
    
    -- ['player2_idle_time'] = 0x0C319420,         -- 2 bytes
}

-- commented values are from evo, not ft

EVO_MEMORY_TABLE.is_evo = false
EVO_MEMORY_TABLE.is_ft = true