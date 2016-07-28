load './Data Structures/Stacks and Queues/towers_of_hanoi.rb'

n_disks = 5
s = TowersOfHanoi.new(n_disks)
s.move_disks(n_disks, 0, 2, 1)
s.print
