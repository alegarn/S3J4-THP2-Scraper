#require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
#require 'pry'

def scrap #autre page

  page = Nokogiri::HTML(URI("https://coinmarketcap.com/all/views/all/").open())
  puts page.class   # => Nokogiri::HTML::Document
  y = 1
  coin_name = '/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr['+ y.to_s + ']/td[2]/div/a[2]'
  coin_value = '/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[' + y.to_s + ']/td[5]/div/a/span'
  while y < 20
    page.xpath(coin_name).each do |node|
      print node.text
    end
    page.xpath(coin_value).each do |node|
      puts ' ' + node.text
    end
    y = y + 1
    coin_name = '/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr['+ y.to_s + ']/td[2]/div/a[2]'
    coin_value = '/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[' + y.to_s + ']/td[5]/div/a/span'
  end
end

def first_part(page, j, coin_name, coin_value, all_names, all_values)
  while j <= 10
    page.xpath(coin_name).each do |node|
      print j.to_s + ' :'
      print node.text
      all_names << node.text
    end
    page.xpath(coin_value).each do |node|
      puts ' ' + node.text
      all_values << node.text
    end
    j = j + 1
    coin_name = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[3]/div/a/div/div/p'
    coin_value = '  /html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[4]/div/a/span'

  end

  return [all_names, all_values]
end

def rest_part(page, j, coin_name, coin_value, all_names, all_values)
  while j <= 100
    page.xpath(coin_name).each do |node|
      print j.to_s + ' :'
      print node.text
      all_names << node.text
    end
    page.xpath(coin_value).each do |node|
      puts ' ' + node.text
      all_values << node.text
    end
    j = j + 1
    coin_name = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[3]/a/span[2]'
    coin_value = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[4]/span'
  end

  return [all_names, all_values]
end

def scrap0
  puts "░░░░░░░░░░▄▄█▀▀▀▀▀█▄▄░░
░░░░░░░░▄█▀░░▄░▄░░░░▀█▄
░░░░░░░░█░░░▀█▀▀▀▀▄░░░█
░░░░░░░░█░░░░█▄▄▄▄▀░░░█
░░░░░░░░█░░░░█░░░░█░░░█
░░░░░░░░▀█▄░▀▀█▀█▀░░▄█▀
░░░░░░░░░░▀▀█▄▄▄▄▄█▀▀░░"
  puts 'Tiny ScrapBot_blockchain - Ajouter le nombre de pages à scrapper:'
  puts 'Une centaine de crypto par page ;)'
  nbr = gets.to_i

  all_names = []
  all_values = []

  p = 1
  j = 1
  coin_name = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[3]/div/a/div/div/p'
  coin_value = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[4]/div/a/span'
  link = "https://coinmarketcap.com/?page=#{p}"
  page = Nokogiri::HTML(URI(link).open())

  1.upto(nbr) do
    puts 'Page ' + p.to_s

    array = first_part(page, j, coin_name, coin_value, all_names, all_values)
    all_names = all_names + array[0]
    all_values = all_values + array[1]

    coin_name = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[3]/a/span[2]'
    coin_value = '/html/body/div[1]/div/div[1]/div[2]/div/div/div[5]/table/tbody/tr[' + j.to_s + ']/td[4]/span'

    j = 11
    link = "https://coinmarketcap.com/?page=#{p}"
    page = Nokogiri::HTML(URI(link).open())

    array = rest_part(page, j, coin_name, coin_value, all_names, all_values)
    all_names = all_names + array[0]
    all_values = all_values + array[1]

    p = p + 1

  end

  a = Hash[all_names.zip all_values]
  puts a

end

#scrap()
scrap0()
