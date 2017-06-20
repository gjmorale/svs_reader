require 'rubygems'
require 'watir'
require 'nokogiri'
Dir[File.dirname(__FILE__) + '/dev/*.rb'].each {|file| require file }

class Reader

	attr_accessor :f_log
	attr_accessor :f_output
	attr_accessor :f_input

	def progress i,j
		n = ((i+1)*100)/j
		r = ""
		r << " " if n < 100
		r << " " if n < 10
		r << "#{n.to_s}%" 
		r
	end

	def initialize input=nil, output= nil
		@f_input = @f_output = @f_log = nil
		#archivo con precios fondos svs
		if output.nil?
			@f_output = File.open("data/SVS_precios.csv",'w')
			@f_log = File.open("data/log.txt",'w')
		else
			@f_output = File.open("#{output}/SVS_precios.csv",'w')
			@f_log = File.open("#{output}/log.txt",'w')
		end
		#archivo con resultados fondos svs
		if input.nil?
			@f_input = File.open("data/Instrumentos.csv",'r')
		else
			@f_input = File.open("#{input}/Instrumentos.csv",'r')
		end
		puts "----- From: #{@f_input.path} - To: #{@f_output.path} -----"
	end

	def run
		#inicio y fin
		date_i = date_f = nil

		#paginas a visitar
		instruments = []
		name = code_type = url = nil
		@f_input.gets
		while (line = @f_input.gets)
			vars = line.split(';')
			code_type = vars[0]
			name = vars[1]
			serie = vars[2]
			url = vars[3]
			date_i = DateCue.new(vars[4]) if date_i.nil?
			date_f = DateCue.new(vars[5]) if date_f.nil?
			if instrument = instruments.select{|i| i.code == name}[0]
				instrument.add_serie(serie)
			else
				instruments << Instrument.new(name, code_type, url, serie)
			end
		end

		b = Watir::Browser.new :phantomjs

		f_output.write("tipo;codigo;fecha;valor;p_cierre;serie\n")
		instruments.each.with_index do |instrument, j|
			puts instrument
			print "[#{progress j, instruments.size}]."
			b.goto instrument.url
			# ingresar fecha inicio
			print "..."
			begin
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
				rows = b.table.rows
				rows.each.with_index do |row, i|
					unless row.tds.size == 0
						serie = instrument.get_serie(row.tds[i_serie].text)
						if serie
							serie.positions << Position.new(row.tds[i_date].text, row.tds[i_value].text) 
						else
							@f_log.write("Skipped serie #{row.tds[i_serie].text} for #{instrument.code} beacuse it didn't match #{instrument.series.first.name}\n")
						end
						print "." if (i-1) % ((rows.size-1)/4) == 0 if rows.size >= 4
					end
				end
				if rows.size < 4
					print "...."
				end
				print ".."
				instrument.print @f_output, @f_log
				puts "..[Done] #{instrument}"
			rescue StandardError => e
				print "... FONDO MUTUO"
			end
		end
	end
end
