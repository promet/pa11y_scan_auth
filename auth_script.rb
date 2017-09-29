require 'nokogiri'
require 'mechanize'
require 'fileutils'

agent = Mechanize.new

puts "getting the login form"
login = agent.get('https://drupal.org/user/login').form
puts "Preparing form"
puts "username: nathanjo"
login.field.value = "YOUR_USERNAME"
puts "password: ****"
login.pass = "YOUR_PASSWORD"
puts "submitting form"
page = agent.submit(login, login.buttons.first)

page.links.each do |link|
  # assume relative path for drupal
  if link.href[0] == "/" && !(link.href.include? "logout") && link.href.size > 1
    puts "clicking the link >>> #{link.href}"
    px = agent.page.link_with(:href => link.href).click
    html_doc = Nokogiri::HTML(px.body)
    filename = link.text.gsub!(/[^0-9A-Za-z]/, '')
    fileHtml = File.new("site/#{filename}.html", "w+")
    fileHtml.puts html_doc
    fileHtml.close()
    puts "pa11y 'file:///#{Dir.pwd}/#{filename}.html'"
    system "pa11y 'file:///#{Dir.pwd}/site/#{filename}.html' -r html > site/#{filename}_result.html"
  end
end