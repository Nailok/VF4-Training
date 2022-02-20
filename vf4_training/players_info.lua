PlayersInfo = {}

function PlayersInfo.initialize_values()
    if GAME_ADDRESSES ~= nil then 
        PlayersInfo.p2_state = MEMORY.read8(GAME_ADDRESSES.p2_state)
        -- PlayersInfo.p2_health = MEMORY.read16(GAME_ADDRESSES.p2_health)
        PlayersInfo.p2_idle_time = MEMORY.read16(GAME_ADDRESSES.p2_idle_time)

        PlayersInfo.p1_state = MEMORY.read8(GAME_ADDRESSES.p1_state)
        PlayersInfo.p1_health = MEMORY.read16(GAME_ADDRESSES.p1_health)
        PlayersInfo.p1_idle_time = MEMORY.read16(GAME_ADDRESSES.p1_idle_time)
        PlayersInfo.p1_move_startup = MEMORY.read16(GAME_ADDRESSES.p1_move_startup)
        PlayersInfo.p1_move_damage = MEMORY.read16(GAME_ADDRESSES.p1_move_damage)
        PlayersInfo.p1_combo_damage = MEMORY.read16(GAME_ADDRESSES.p1_combo_damage)
        PlayersInfo.p1_frame_advantage = MEMORY.read16(GAME_ADDRESSES.p1_frame_advantage)
        PlayersInfo.p1_recovery_time_after_hit = MEMORY.read16(0x0C29F9EC)    --- not sure if its a recovery time, so dirty hack for holding frame adv, TODO: find another address
    end
end

function PlayersInfo.is_p1_hitted()
    local p1_state = PlayersInfo.p1_state
    if (p1_state == 13 or p1_state == 7 or p1_state == 10 or p1_state == 8) then
        return true
    end

    return false
end

function PlayersInfo.is_p1_thrown()
    if PlayersInfo.p1_state == 6 then
        return true
    end

    return false
end

function PlayersInfo.is_p1_juggled()
    if PlayersInfo.p1_state == 8 then
        return true
    end

    return false
end

function PlayersInfo.is_p1_staggered()
    if PlayersInfo.p1_state == 13 then
        return true
    end
    
    return false
end

function PlayersInfo.is_p2_juggled()
    if PlayersInfo.p2_state == 8 then
        return true
    end

    return false
end

function PlayersInfo.is_p2_hit()
    local p2_state = PlayersInfo.p2_state

    if (p2_state == 13 or p2_state == 7 or p2_state == 10) then
        return true
    end

    return false
end

function PlayersInfo.is_p2_thrown()
    if PlayersInfo.p2_state == 6 then
        return true
    end

    return false
end

function PlayersInfo.is_p2_staggered()
    if PlayersInfo.p2_state == 13 then
        return true
    end
    
    return false
end