Training = {}
Training.states = {}
Training.states.guard = false
Training.states.crouch = false

function Training.reset_states()
    for state, _ in pairs(Training.states) do
        Training.states[state] = false
    end
end

function Training.guard_standing()
    Training.reset_states()
    Training.states.guard = true
end

function Training.guard_crouching()
    Training.reset_states()
    Training.states.guard = true
    Training.states.crouch = true
end

-- function Training.guard_all()

-- end

function Training.process_inputs()
    if Training.states.guard == true then
        INPUT.pressButtons(2, 1)
    else
        INPUT.releaseButtons(2, 1)
    end

    if Training.states.crouch == true then
        INPUT.pressButtons(2, 32)
    else
        INPUT.releaseButtons(2, 32)
    end
end

-- if Training.states.crouch