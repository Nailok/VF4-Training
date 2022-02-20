require "vf4_training.global_variables"
require "vf4_training.memory_addresses.vf4evo"
require "vf4_training.memory_addresses.vf4ft"
require "vf4_training.frame_data.frame_data_overlay"
require "vf4_training.training.training_overlay"
require "vf4_training.players_info"
require "vf4_training.utils.utils"

function Overlay()
  PlayersInfo.initialize_values()
  FrameDataOverlay.start()
  TrainingOverlay.start()
end

function CheckRom()
  local rom_name = flycast.state.gameId

  if rom_name == 'VF4 FINAL TUNED JAPAN' then
    GAME_ADDRESSES = FT_MEMORY_TABLE
  elseif rom_name == 'VF4 EVOLUTION JAPAN' then
    GAME_ADDRESSES = EVO_MEMORY_TABLE
  end
end

GAME_ADDRESSES = FT_MEMORY_TABLE

  flycast_callbacks = {
      start = CheckRom,
      overlay = Overlay
  }