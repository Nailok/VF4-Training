FrameData = {}

function FrameData.p1_startup()
    local mem_move_startup = MEMORY.read16(GAME_ADDRESSES.player1_move_startup)
    if mem_move_startup == 1 then mem_move_startup = 0 end

    return mem_move_startup
end

function FrameData.p1_adv()
    local mem_character_advantage = MEMORY.read16(GAME_ADDRESSES.player1_frame_advantage)
    local character_advantage = Utils.convert_to_signed16(mem_character_advantage)

    return character_advantage
end

function FrameData.p1_move_damage()
    local mem_move_damage_value = MEMORY.read16(GAME_ADDRESSES.player1_move_damage)

    return mem_move_damage_value
end

function FrameData.p1_combo_damage()
    local combo_damage_value = MEMORY.read16(GAME_ADDRESSES.player1_combo_damage)

    return combo_damage_value
end

function FrameData.p1_health()
    local health = MEMORY.read16(GAME_ADDRESSES.player1_health)

    return health
end

function FrameData.p2_health()
    local health = MEMORY.read16(GAME_ADDRESSES.player2_health)
    
    return health
end
