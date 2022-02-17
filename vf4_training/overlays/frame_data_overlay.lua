FrameDataOverlay = {}

function FrameDataOverlay.start()
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
        ui.text("Unscaled move dmg: ")
        ui.rightText(FrameData.p1_move_damage())
        ui.text("Combo Damage: ")
        ui.rightText(FrameData.p1_combo_damage())
    ui.endWindow()
end