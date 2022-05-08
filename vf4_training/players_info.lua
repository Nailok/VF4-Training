-- TODO: Rewrite all this
PlayersInfo = {}
PlayersInfo.stored = {}

function PlayersInfo.initialize_values()
    PlayersInfo.hit_type = MEMORY.read8(GAME_ADDRESSES.hit_type)

    PlayersInfo.p1_state = MEMORY.read8(GAME_ADDRESSES.p1_state)
    PlayersInfo.p1_health = MEMORY.read16(GAME_ADDRESSES.p1_health)
    PlayersInfo.p1_idle_time = MEMORY.read16(GAME_ADDRESSES.p1_idle_time)
    PlayersInfo.p1_move_startup = MEMORY.read16(GAME_ADDRESSES.p1_move_startup)
    PlayersInfo.p1_move_damage = MEMORY.read16(GAME_ADDRESSES.p1_move_damage)
    PlayersInfo.p1_combo_damage = MEMORY.read16(GAME_ADDRESSES.p1_combo_damage)
    PlayersInfo.p1_frame_advantage = MEMORY.read16(GAME_ADDRESSES.p1_frame_advantage)
    PlayersInfo.p1_recovery_time_after_hit = MEMORY.read8(GAME_ADDRESSES.p1_recovery_time_after_hit) 
    PlayersInfo.p1_combo_counter = MEMORY.read8(GAME_ADDRESSES.p1_combo_counter) 
    PlayersInfo.p1_hit_counter = MEMORY.read16(GAME_ADDRESSES.p1_hit_counter)
    PlayersInfo.p1_hit_check = MEMORY.read8(GAME_ADDRESSES.p1_hit_check)

    PlayersInfo.p2_state = MEMORY.read8(GAME_ADDRESSES.p2_state)
    PlayersInfo.p2_health = MEMORY.read16(GAME_ADDRESSES.p2_health)
    PlayersInfo.p2_idle_time = MEMORY.read16(GAME_ADDRESSES.p2_idle_time)
    PlayersInfo.p2_recovery_time_after_hit = MEMORY.read8(GAME_ADDRESSES.p2_recovery_time_after_hit)
    PlayersInfo.p2_block_counter = MEMORY.read8(GAME_ADDRESSES.p2_block_counter)
    PlayersInfo.p2_hit_check = MEMORY.read8(GAME_ADDRESSES.p2_hit_check)
end

function PlayersInfo.player_attack(player)
    local player_state = PlayersInfo.get_player_state(player)
    if (player_state == 0) then
        return true
    end

    return false
end

function PlayersInfo.got_hit(player)
    local player_state = PlayersInfo.get_player_state(player)
    if (player_state == 13 or player_state == 7 or player_state == 10 or player_state == 8) then
        return true
    end

    return false
end

function PlayersInfo.got_hit_without_juggling(player)
    local player_state = PlayersInfo.get_player_state(player)
    if (player_state == 13 or player_state == 7 or player_state == 10) then
        return true
    end

    return false
end

function PlayersInfo.player_thrown(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 6 then
        return true
    end

    return false
end

function PlayersInfo.player_throws(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 5 then
        return true
    end

    return false
end


function PlayersInfo.player_juggled(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 8 then
        return true
    end

    return false
end

function PlayersInfo.player_getting_up(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 9 then
        return true
    end

    return false
end

function PlayersInfo.player_staggered(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 13 then
        return true
    end

    return false
end

function PlayersInfo.player_recieveng_damage(player)
    if PlayersInfo.player_thrown(player) or PlayersInfo.got_hit(player) then
        return true
    end

    return false
end

function PlayersInfo.player_blocks_a_hit(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 10 then
        return true
    end

    return false
    
end

function PlayersInfo.player_in_blocking_state(player) --- blocks a hit or guard in neutral
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 10 or player_state == 4 then
        return true
    end

    return false
    
end

function PlayersInfo.player_neutral(player)
    local player_state = PlayersInfo.get_player_state(player)
    
    if player_state == 1 then
        return true
    end

    return false
end

function PlayersInfo.player_hit_check(player)
    hit_check_table_string = 'p' .. player ..'_hit_check'

    if PlayersInfo[hit_check_table_string] ~= 0 then
        return true
    end

    return false
end

function PlayersInfo.get_player_state(player)
    if player == 1 then
        return PlayersInfo.p1_state
    elseif player == 2 then
        return PlayersInfo.p2_state
    end
end