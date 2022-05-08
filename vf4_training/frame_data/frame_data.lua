FrameData = {}
FrameData.values = {}
FrameData.stored = {}

FrameData.stored.idle_timer = 0
FrameData.values.hit_type = ''

FrameData.values.p1_startup = ''
FrameData.values.p1_adv = ''
FrameData.values.p1_move_damage = ''
FrameData.values.p1_combo_damage = ''

function FrameData.p1_startup()
    local move_startup = PlayersInfo.p1_move_startup

    if PlayersInfo.player_hit_check(1) then
        FrameData.values.p1_startup = move_startup
    end

    if PlayersInfo.player_thrown(2) then
        FrameData.values.p1_startup = ''
    end

    return FrameData.values.p1_startup
end

function FrameData.p1_adv()
    local adv = PlayersInfo.p1_frame_advantage
    local converted_adv = Utils.convert_to_signed16(adv)
    local recovery_time = PlayersInfo.p2_recovery_time_after_hit

    -- track all advantage, not only when player hit but when change stance, etc
    if converted_adv ~= 0 then
        FrameData.values.p1_adv = converted_adv
    end

    if converted_adv == 0 and recovery_time > 15 then
        FrameData.values.p1_adv = 0
    end

    if FrameData.in_combo_state() or PlayersInfo.player_getting_up(2) then
        FrameData.values.p1_adv = ''
    end

    return FrameData.values.p1_adv
end

function FrameData.p1_move_damage()
    local move_damage_value = PlayersInfo.p1_move_damage

    FrameData.values.p1_move_damage = move_damage_value

   return FrameData.values.p1_move_damage 
end

function FrameData.p1_combo_damage()
    local combo_damage = PlayersInfo.p1_combo_damage

    -- FIXME: 6p on crouching opponent shows zero for some reason
    if combo_damage ~= 0 and (PlayersInfo.player_hit_check(1) or PlayersInfo.player_thrown(2)) then
        FrameData.values.p1_combo_damage = combo_damage
    end

    if PlayersInfo.got_hit(1) or PlayersInfo.player_thrown(1) or PlayersInfo.player_blocks_a_hit(2) then
        FrameData.values.p1_combo_damage = ''
    end

    return FrameData.values.p1_combo_damage
end

function FrameData.hit_type()
    if PlayersInfo.player_thrown(1) or PlayersInfo.player_thrown(2) then
        FrameData.values.hit_type = 'Throw'
    end

    if (PlayersInfo.player_hit_check(1) or PlayersInfo.player_hit_check(2)) then
        local hit_type = PlayersInfo.hit_type

        if hit_type == 1 then
            FrameData.values.hit_type = 'High'
        elseif hit_type == 2 or hit_type == 4 then
            FrameData.values.hit_type = 'Mid'
        elseif hit_type == 3 or hit_type == 5 then
            FrameData.values.hit_type = 'Low'
        elseif hit_type == 6 then
            FrameData.values.hit_type = 'EX Low'
        elseif hit_type == 7 then
            FrameData.values.hit_type = 'EX High'
        elseif hit_type == 12 then
            FrameData.values.hit_type = 'Ground'
        else
            FrameData.values.hit_type = ''
        end
    end

    return FrameData.values.hit_type
end

function FrameData.clear_except(arr_values)
    for key, _ in pairs(FrameData.values) do
        if not Utils.present_in_array(key, arr_values) then
            FrameData.values[key] = ''
        end
    end
end

function FrameData.clear()
    for key, _ in pairs(FrameData.values) do
        FrameData.values[key] = ''
    end

    if PlayersInfo.hit_type ~= 0 and not PlayersInfo.player_attack(1) then
        MEMORY.write16(GAME_ADDRESSES.hit_type, 0)
    end
end

function FrameData.clear_if_players_are_idle()
    if FrameData.idle_timer_flag() then
        FrameData.clear()
    end
end

function FrameData.clear_if_p1_is_hit()
    local fields = {'p1_adv', 'hit_type'}

    if PlayersInfo.got_hit(1) or PlayersInfo.player_thrown(1) or PlayersInfo.player_juggled(1) then
        FrameData.clear_except(fields)
    end
end

function FrameData.in_combo_state()
    if PlayersInfo.player_juggled(2) or PlayersInfo.player_staggered(2) or PlayersInfo.player_thrown(2) then
        return true
    end

    return false
end

function FrameData.idle_timer_flag()
    round_time_frames = MEMORY.read16(GAME_ADDRESSES.round_time_frames)
    if round_time_frames == 0 then
        FrameData.stored.idle_timer = 0
    end

    if PlayersInfo.player_hit_check(1) or PlayersInfo.player_hit_check(2) or PlayersInfo.player_throws(1) then
        FrameData.stored.idle_timer = round_time_frames
    end

    if (round_time_frames - FrameData.stored.idle_timer) > 300 then
        return true
    end

    return false
end

function FrameData.clear()
    for key, _ in pairs(FrameData.values) do
        FrameData.values[key] = ''
    end

    if PlayersInfo.hit_type ~= 0 and not PlayersInfo.player_attack(1) then
        MEMORY.write16(GAME_ADDRESSES.hit_type, 0)
    end
end