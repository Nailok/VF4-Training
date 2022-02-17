require "vf4_training.training.training"
require "vf4_training.training.

TrainingOverlay = {}
TrainingOverlay.is_shown = true

function TrainingOverlay.start()
    TrainingOverlay.create_main_menu_ui()
end

-- function TrainingOverlay.main_menu()
--     if is_shown == true then
--         create_main_menu_ui()
--     end
-- end

function TrainingOverlay.create_main_menu_ui()
    local ui = flycast.ui
    local frame_data_width = 200
    local frame_data_height = 0
    local frame_data_y = 200
    local frame_data_x = 100
    -- local guard_button_text = "Guard standing: " .. Utils.bool_to_string(Training.is_guarding)
    ui.beginWindow("Training", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
        Training.process_inputs()
        ui.button('Guard', function() Training.guard_standing() end)
        ui.button('Crouch Guard', function() Training.guard_crouching() end)
        ui.button('Neutral', function() Training.reset_states() end)
        ui.text('guard: ')
        ui.rightText(Utils.bool_to_string(Training.states.guard))
        ui.text('Crouch: ')
        ui.rightText(Utils.bool_to_string(Training.states.crouch))
    ui.endWindow()
end

-- function  TrainingOverlay.guard_options_menu()
--     local is_shown = false
--     ui.beginWindow("Training", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
--         ui.button(guard_button_text, function() Training.guard_standing() end)
--         ui.button()
--     ui.endWindow()

    
-- end