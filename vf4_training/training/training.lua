Training = {}
Training.states = {}
Training.states.guard = false
Training.states.crouch = false
Training.states.tech_roll = false
Training.courch_button_pressed = false
Training.guard_button_pressed = false

function Training.reset_states()
    for state, _ in pairs(Training.states) do
        Training.states[state] = false
    end
end

function Training.guard_standing()
    Training.reset_states()
    Training.states.guard = true
    Training.guard_button_pressed = true
end

function Training.guard_crouching()
    Training.reset_states()
    Training.states.guard = true
    Training.states.crouch = true
    Training.crouch_button_pressed = true
end

function Training.tech_roll()
    Training.reset_states()
    Training.states.tech_roll = true
end

function Training.process_inputs()
    if Training.states.guard == true then
        INPUT.pressButtons(2, 1)
    elseif Training.states.guard == false and Training.guard_button_pressed then
        INPUT.releaseButtons(2, 1)
        Training.guard_button_pressed = false
    end

    if Training.states.crouch == true then
        INPUT.pressButtons(2, 32)
    elseif Training.states.crouch == false and Training.crouch_button_pressed then
        INPUT.releaseButtons(2, 32)
        Training.crouch_button_pressed = false
    end
end

function Training.reset_round()
    Training.reset_states()
    MEMORY.write16(GAME_ADDRESSES.game_state, 7) 
    MEMORY.write16(GAME_ADDRESSES.rounds_counter, 0) 
    MEMORY.write16(GAME_ADDRESSES.players_wins_counter, 0) 
end

function Training.reload_level()
    Training.reset_states()
    MEMORY.write16(GAME_ADDRESSES.game_state, 1) 
end

function Training.show_hitboxes_with_models()
    MEMORY.write8(GAME_ADDRESSES.hitboxes, 1) 
end

function Training.show_hitboxes_without_models()
    MEMORY.write8(GAME_ADDRESSES.hitboxes, 2) 
end

function Training.hide_hitboxes()
    MEMORY.write8(GAME_ADDRESSES.hitboxes, 0) 
end
