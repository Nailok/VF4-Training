Training = {}
Training['is_guarding'] = false

function Training.guard_standing()
    if Training.is_guarding == false then
        Training.is_guarding = true
        INPUT.pressButtons(2, 1)
    else
        Training.is_guarding = false
        INPUT.releaseButtons(2, 1)
    end
end

function Training.guard_crouching()

end

function Training.guard_all()

end