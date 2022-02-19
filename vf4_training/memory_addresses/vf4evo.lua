EVO_MEMORY_TABLE = {
    ['game_timer'] = 0x0C24CAF4,                -- float, read as 4 bytes right now
    ['rounds_counter'] = 0x0C24CB58,            -- 2 bytes
    ['players_wins_counter'] = 0x0C24CB50,      -- 2 bytes

    ['p1_health'] = 0x0C3188D0,            -- 2 bytes 
    ['p1_frame_advantage'] = 0x0C31928A,    -- 2 bytes
    ['p1_move_startup'] = 0x0C318B94,      -- 2 bytes
    ['p1_move_damage'] = 0x0C318B6A,       -- 2 bytes
    ['p1_combo_damage'] = 0x0C31936C,      -- 4 bytes
    ['p1_idle_time'] = 0x0318BC8,          -- 4 bytes
    
    ['p2_health'] = 0x0C319128,            -- 2 bytes
    ['p2_idle_time'] = 0x0C319420,         -- 4 bytes
}

EVO_MEMORY_TABLE.is_evo = true
EVO_MEMORY_TABLE.is_ft = false