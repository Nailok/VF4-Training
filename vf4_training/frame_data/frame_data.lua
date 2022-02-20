FrameData = {}

FrameData.values = {}
FrameData.values.p1_adv = 0
FrameData.values.p1_startup = 0
FrameData.values.p1_move_damage = 0
FrameData.values.p1_combo_damage = 0

function FrameData.p1_startup()
    local move_startup = PlayersInfo.p1_move_startup

    if (PlayersInfo.is_p2_thrown() or PlayersInfo.is_p2_hit() or PlayersInfo.is_p2_staggered) and move_startup ~= 1 then
        FrameData.values.p1_startup = move_startup
    end

    return FrameData.values.p1_startup
end

function FrameData.p1_adv()
    local adv = PlayersInfo.p1_frame_advantage
    local converted_adv = Utils.convert_to_signed16(adv)
    local recovery_time = PlayersInfo.p1_recovery_time_after_hit

    if recovery_time > 10 and recovery_time < 50 then                   --- TODO: find a better way to track frame advantage
        FrameData.values.p1_adv = converted_adv
    end

    if PlayersInfo.is_p2_juggled() or PlayersInfo.is_p2_staggered() == 13 or PlayersInfo.is_p2_thrown() then
        FrameData.values.p1_adv = ''
    end

    return FrameData.values.p1_adv
end

function FrameData.p1_move_damage()
    local move_damage_value = PlayersInfo.p1_move_damage
    if move_damage_value ~= 0 and PlayersInfo.is_p2_hit() then
        FrameData.values.p1_move_damage = move_damage_value
    end

   return FrameData.values.p1_move_damage 
end

function FrameData.p1_combo_damage()
    local combo_damage = PlayersInfo.p1_combo_damage
    if combo_damage ~= 0 then
        FrameData.values.p1_combo_damage = combo_damage
    end

    return FrameData.values.p1_combo_damage
end

function FrameData.clear()
    for key, _ in pairs(FrameData.values) do
        FrameData.values[key] = 0
    end
end

function FrameData.clear_if_players_are_idle()
    if (PlayersInfo.p1_idle_time > 2) or (PlayersInfo.p2_idle_time > 3) then
        FrameData.clear()
    end
end

function FrameData.clear_if_p1_is_hitted()
    if PlayersInfo.is_p1_hitted() or PlayersInfo.is_p1_thrown() or PlayersInfo.is_p1_juggled() then
        FrameData.clear()
    end
end
