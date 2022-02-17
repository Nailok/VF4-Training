TrainingOverlay = {}

function TrainingOverlay.start()
    local ui = flycast.ui
    local frame_data_width = 200
    local frame_data_height = 0
    local frame_data_y = 100
    local frame_data_x = 100
    local guard_button_text = "Guard standing: " .. Utils.bool_to_string(Training.is_guarding)
    ui.beginWindow("Training", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
        ui.button(guard_button_text, function() Training.guard_standing()
        end)
    ui.endWindow()
end

function  TrainingOverlay.guard_options()
    
end

function  TrainingOverlay.neutral_options()
    
end
