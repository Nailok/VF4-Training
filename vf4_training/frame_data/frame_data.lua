FrameData = {}
FrameData.stored = {}
FrameData.stored.p1_adv = 0
FrameData.stored.p1_startup = 0
FrameData.stored.p1_move_dmg = 0

function FrameData.p1_startup()
    local mem_move_startup = MEMORY.read16(GAME_ADDRESSES.p1_move_startup)

    if FrameData.is_p2_hit() and mem_move_startup ~= 0 then
        FrameData.stored.p1_startup = mem_move_startup
    end

    return FrameData.stored.p1_startup
end

function FrameData.p1_adv()
    local mem_adv = MEMORY.read16(GAME_ADDRESSES.p1_frame_advantage)
    local converted_adv = Utils.convert_to_signed16(mem_adv)

    local recovery_time = FrameData.recovery_time_after_hit()

    if recovery_time > 10 and recovery_time < 30 then                   --- TODO: find a better way to save frame advantage
        FrameData.stored.p1_adv = converted_adv
    end

    if FrameData.is_p2_juggled() or FrameData.p2_state() == 13 then
        FrameData.stored.p1_adv = 0
    end

    return FrameData.stored.p1_adv
end

function FrameData.p1_move_damage()
    local mem_move_dmg_value = MEMORY.read16(GAME_ADDRESSES.p1_move_damage)
    if FrameData.is_p2_hit() == 0 then
        FrameData.stored.p1_move_dmg = mem_move_dmg_value
    end

   return FrameData.stored.p1_move_dmg 
end

function FrameData.p1_combo_damage()
    return MEMORY.read16(GAME_ADDRESSES.p1_combo_damage)
end

function FrameData.p1_health()
    return MEMORY.read16(GAME_ADDRESSES.p1_health)
end

function FrameData.p2_health()
    return MEMORY.read16(GAME_ADDRESSES.p2_health)
end

function FrameData.p1_idle_time()
    return MEMORY.read16(GAME_ADDRESSES.p1_idle_time)
end

function FrameData.p2_idle_time()
    return MEMORY.read8(GAME_ADDRESSES.p2_idle_time)
end

function FrameData.p2_state()
    return MEMORY.read8(GAME_ADDRESSES.p2_state)
end

function FrameData.is_p2_hit()
    local p2_state = FrameData.p2_state()
    if (p2_state == 13 or p2_state == 7 or p2_state == 10) then
        return true
    end

    return false
end

function FrameData.is_p2_juggled()
    local p2_state = FrameData.p2_state()

    if p2_state == 8 then
        return true
    end

    return false
end

function FrameData.recovery_time_after_hit() --- not sure if its a recovery time, so dirty hack with frame adv
    return MEMORY.read16(0x0C29F9EC)
end


function FrameData.clear_framedata_if_players_are_idle()
    local p1_idle_time = FrameData.p1_idle_time()
    local p2_idle_time = FrameData.p2_idle_time()

    if (p1_idle_time > 3) or (p2_idle_time > 3) then
        for key, _ in pairs(FrameData.stored) do
            FrameData.stored[key] = 0
        end
    end
end