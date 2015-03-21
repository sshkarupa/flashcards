# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.en365.ru/top1000b.htm"))
rows = page.css('td#middle tr')

rows.each do |row|
  cols = row.css('td').map{|td| td.text}
  puts cols.join(', ') # для демонстрации

  if cols[0].to_i !=0
    card = Card.new(original_text: cols[2], translated_text: cols[1])
    card.save
  end
  if cols[3].to_i !=0
    card = Card.new(original_text: cols[5], translated_text: cols[4])
    card.save
  end
end
