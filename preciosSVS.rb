require 'rubygems'
require 'watir'
require 'nokogiri'
Dir[File.dirname(__FILE__) + '/dev/*.rb'].each {|file| require file }

#archivo con precios fondos svs
doc = File.open("data/SVS_precios.csv",'w')

#inicio
date_i = DateCue.new(11, 9, 2016)

#fin
date_f = DateCue.new(14, 9, 2016)

#paginas a visitar
instruments = []
name = code_type = url = nil
File.open("data/instrumentos.txt",'r') do |file|
	while (line = file.gets)
		url ||= line.strip! if code_type
		code_type ||= line.strip! if name
		name ||= line.strip!
		if url and name
			instruments << Instrument.new(name, code_type, url)
			name = code_type  = url = nil
		end
	end

end

def progress i,j
	n = ((i+1)*100)/j
	r = ""
	r << " " if n < 100
	r << " " if n < 10
	r << "#{n.to_s}%" 
	r
end

b = Watir::Browser.new :phantomjs

doc.write("Date;Type;Code;Serie;Value\n")
instruments.each.with_index do |instrument, j|
	print "[#{progress j, instruments.size}]."
	b.goto instrument.url
	# ingresar fecha inicio
	print "..."
	b.select_list(:name, "dia1").select_value(date_i.day)
	b.select_list(:name, "mes1").select_value(date_i.month)
	b.select_list(:name, "anio1").select_value(date_i.year)
	# ingresar fecha fin
	b.select_list(:name, "dia2").select_value(date_f.day)
	b.select_list(:name, "mes2").select_value(date_f.month)
	b.select_list(:name, "anio2").select_value(date_f.year)
	#Apretar boton envio
	print ".."
	b.button(:name => 'sub_consulta_fi').click

	#sleep 1
	print ".."
	Watir::Wait.until { b.dl(id: "datos_ent").present? }
	print "....."

	#sacamos los datos de la tabla
	i_date = i_serie = i_value = -1
	b.table.ths.each.with_index do |th, i|
		case th.text
		when "Fecha"
			i_date = i
		when "Serie"
			i_serie = i
		when "Valor Económico"
			i_value = i
		end
			
	end
	print ".."
	#puts ("#{b.table.ths[i_date].text}, #{b.table.ths[i_serie].text}, #{b.table.ths[i_value].text} ")
	rows = b.table.rows
	rows.each.with_index do |row, i|
		#puts "SIZE: #{row.tds.size}"
		unless row.tds.size == 0
			serie = instrument.get_serie(row.tds[i_serie].text)
			serie.positions << Position.new(row.tds[i_date].text, row.tds[i_value].text)
			print "." if (i-1) % ((rows.size-1)/4) == 0 if rows.size >= 4
		end
	end
	if rows.size < 4
		print "...."
	end
	#print "." unless b.table.rows.size % 2 == 0
	print ".."
	instrument.print doc
	puts "..[100%] #{instrument}"
end

