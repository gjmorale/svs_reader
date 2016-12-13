#!/usr/bin/ruby
require_relative 'preciosSVS'

puts "Please enter username"
name = STDIN.gets
ja ="jahonorato"
gm ="gmorales"

INPUT_SVS = OUTPUT_SVS = nil

if name == gm
	INPUT_SVS ="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	OUTPUT_SVS ="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	echo "Welcome Guillermo"
end

if name == ja
	INPUT_SVS ="/Users/joseantoniohonorato/Desktop/Import/SVS"
	OUTPUT_SVS ="/Users/joseantoniohonorato/Desktop/Import/SVS"
	echo "Welcome José Antonio"
end

p = Reader.new(INPUT_SVS, OUTPUT_SVS)
p.run