require "vf4_training.training.training"

TrainingOverlay = {}
TrainingOverlay.is_shown = true

function TrainingOverlay.start()
    TrainingOverlay.main_menu()
end

function TrainingOverlay.main_menu()
    if MEMORY.read16(GAME_ADDRESSES.game_state) == 10 and MEMORY.read8(GAME_ADDRESSES.game_mode) == 2 then --- to game_values.lua (if round_start and real_players == 2)
        TrainingOverlay.create_main_menu_ui()
    end
end

function TrainingOverlay.create_main_menu_ui()
    local ui = flycast.ui
    local frame_data_width = 200
    local frame_data_height = 0
    local frame_data_y = 200
    local frame_data_x = 100
    ui.beginWindow("Training", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
        ui.button('Guard', function() Training.guard_standing() end)
        ui.button('Crouch Guard', function() Training.guard_crouching() end)
        ui.button('Neutral', function() Training.reset_states() end)
        ui.button('Reset rounds', function() Training.reset_round() end)
        ui.button('Reload level', function() Training.reload_level() end)
        ui.button('Show hitboxes with model', function() Training.show_hitboxes_with_models() end)
        ui.button('Show hitboxes without model', function() Training.show_hitboxes_without_models() end)
        ui.button('Hide hitboxes', function() Training.hide_hitboxes() end)
    ui.endWindow()
end