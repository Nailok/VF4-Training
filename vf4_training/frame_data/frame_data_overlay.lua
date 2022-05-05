require "vf4_training.frame_data.frame_data"

FrameDataOverlay = {}

function FrameDataOverlay.start()
    if MEMORY.read16(GAME_ADDRESSES.game_state) == 10 then --- to game_values.lua (if round_start)
        FrameDataOverlay.create_overlay()
    end
end

function FrameDataOverlay.create_overlay()
    local ui = flycast.ui
    local frame_data_width = 250
    local frame_data_height = 0
    local frame_data_y = math.floor((STATE.display.height / 2) + (STATE.display.height / 4))
    local frame_data_x = math.floor((STATE.display.width / 2) - (frame_data_width / 2))

    ui.beginWindow("Frame data", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
        ui.text("Startup: ")
        ui.rightText(FrameData.p1_startup())
        ui.text("Advantage: ")
        ui.rightText(FrameData.p1_adv())
        ui.text("Type: ")
        ui.rightText(FrameData.hit_type())
        ui.text("Damage: ")
        ui.rightText(FrameData.p1_combo_damage())
        FrameDataOverlay.debug_data(ui)
    ui.endWindow()

    FrameData.clear_if_players_are_idle()
    FrameData.clear_if_p1_is_hit()
end

function FrameDataOverlay.debug_data(ui)
    if DEBUG == false then
        return
    end

    local pkg_pressed = false
    if INPUT.getButtons(1) == 0xFFFFFFF8 then
        pkg_pressed = true
    else
        pkg_pressed = false
    end
     
    ui.text("Mem Startup: ")
    ui.rightText(MEMORY.read16(GAME_ADDRESSES.p1_move_startup))
    ui.text("Mem Advantage: ")
    ui.rightText(MEMORY.read16(GAME_ADDRESSES.p1_frame_advantage))
    ui.text("Mem type: ")
    ui.rightText(MEMORY.read8(GAME_ADDRESSES.hit_type))
    ui.text("Input p1: ")
    ui.rightText(INPUT.getButtons(1))
    ui.text("pkg pressed: ")
    ui.rightText(Utils.bool_to_string(pkg_pressed))
end