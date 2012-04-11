# Manages thelist of players, creating them, and authenticating
class PlayerManager

  # id = id
  # player_list = list of players {name => id}
  attr_accessor :id, :player_list

  # Constructor method
  def initialize(id, player_list)

    # Type checks
    raise unless id.is_a?(Fixnum)
    raise unless player_list.is_a?(Hash)

    @id, @player_list = id, player_list
  end

  # Restricted name check
  # TODO: When command infrastructure is done, make sure this collects all commands
  def self.restricted_name?(name)
    return ["new"].include?(name)
  end

  # Adds a created player to the player list
  def add_player(player)

    # Check a player is being added
    raise unless player.is_a?(Player)

    @player_list[player.name] = player.id
  end

  # Gets an id for a player name
  # nil if not found
  def get_id(name)
    return nil if !self.exists?(name)
    return @player_list[name]
  end

  #Checks a name exists
  def exists?(name)
    return @player_list.keys.include?(name)
  end

end
