require 'byebug'

class TowersOfHanoi
  attr_accessor :towers

  def initialize(n_disks)
    @towers = [(1..n_disks).to_a.reverse, [], []]
  end

  def move_disks(n_disks, origin, destination, buffer)
    return nil if n_disks == 0
    if n_disks == 1
      move_top(origin, destination)
    else
      move_disks(n_disks-1, origin, buffer, destination)
      move_top(origin, destination)
      move_disks(n_disks-1, buffer, destination, origin)
    end
  end

  def move_top(origin, destination)
    @towers[destination] << @towers[origin].pop
  end

  def print
    towers.each do |tower|
      p tower
    end
  end

end
