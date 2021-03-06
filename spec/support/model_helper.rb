require "rails_helper"

module ModelHelper

  def test_stat_range(player_character, stat_to_test, mod_array = [])
    return mod_array if player_character.send(stat_to_test) == 0
    mod_array << player_character.send(stat_to_test[0..2] + "_mod")
    stat = player_character.send(stat_to_test)
    player_character.send(stat_to_test + "=", stat - 1)
    test_stat_range(player_character, stat_to_test, mod_array)
  end

end
