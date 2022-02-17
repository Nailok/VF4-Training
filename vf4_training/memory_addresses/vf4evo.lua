EVO_MEMORY_TABLE = {
    ['player1_health'] = 0x0C3188D0,            -- 4 bytes 
    ['player2_health'] = 0x0C319128,            -- 4 bytes
    ['game_timer'] = 0x0C24CAF4,                -- float, read as 4 bytes right now
    ['rounds_counter'] = 0x0C24CB58,            -- 2 bytes
    ['players_wins_counter'] = 0x0C24CB50,      -- 2 bytes

    ['player1_frame_advantage'] = 0x0C31928A,    -- 2 bytes
    ['player1_move_startup'] = 0x0C318B94,      -- 2 bytes
    ['player1_move_damage'] = 0x0C318B6A,       -- 2 bytes
    ['player1_combo_damage'] = 0x0C31936C,      -- 4 bytes
    ['player1_idle_time'] = 0x0318BC8,          -- 4 bytes
    
    -- ['player2_frame_advantage'] = ,    -- 2 bytes
    -- ['player2_move_startup'] = ,      -- 2 bytes
    -- ['player2_move_damage'] = ,       -- 2 bytes
    -- ['player2_combo_damage'] = ,      -- 4 bytes
    ['player2_idle_time'] = 0x0C319420,         -- 4 bytes
}

EVO_MEMORY_TABLE.is_evo = true
EVO_MEMORY_TABLE.is_ft = false