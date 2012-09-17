# encoding: utf-8

require 'nokogiri'
require 'open-uri'

module Zap
	class Busca
		attr_accessor :preco_maximo, :url
		def initialize(url, preco_maximo=9999)
			@preco_maximo = preco_maximo
			@url          = url

			doc = Nokogiri::HTML(open(url))

			itens = doc.css('.item')

			itens.each do |html|
				# Valor
				imovel               = Imovel.new(html)
				item                 = Item.find_or_initialize_by_id_zap(imovel.id_zap)
				item.valor           = imovel.valor
				item.data_publicacao = imovel.data_publicacao
				item.link            = imovel.link

				if item.changed?
					item.save
					item.notify if item.valor <= preco_maximo && item.valor != 0
				end

			end
		end
	end

	class Imovel
		attr_accessor :html, :valor, :data_publicacao, :id_zap, :link
		def initialize(html)
			@html = html
		end

		def valor
			@valor ||= html.css('.itemValor a').first.content.split.last.gsub(/\D/, '').to_i
		end

		def data_publicacao
			@data_publicacao ||= html.css('.itemData span').first.content.split.last.to_date
		end

		def id_zap
			@id_zap ||= html.css('.itemValor a').first.attr('href').split('-').last
		end

		def link
			@link ||= html.css('.itemValor a').first.attr('href')
		end
	end
end