#!/usr/bin/ruby
require_relative 'preciosSVS'

puts "Please enter username"
name = STDIN.gets.strip
ja ="jahonorato"
gm ="gmorales"
cc ="chico"

input = output = nil

if name == gm
	input ="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	output ="/home/finantecdeveloper/Dropbox (Finantec)/Quaam - Operaciones/Macros/SVS/data"
	puts "Welcome Guillermo"
end

if name == ja
	input ="/Users/joseantoniohonorato/Desktop/Import/SVS"
	output ="/Users/joseantoniohonorato/Desktop/Import/SVS"
	puts "Welcome José Antonio"
end

if name == cc
	input ="/Users/windows7/Dropbox (Finantec)/JH-CC/varios"
	output ="/Users/windows7/Dropbox (Finantec)/JH-CC/varios"
	puts "Welcome Christian Corrales"
end

p = Reader.new(input, output)
p.run

