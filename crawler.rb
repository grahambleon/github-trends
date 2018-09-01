require 'nokogiri'
require 'open-uri'
require 'json'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

# fetch all of the HTML `<li>` elements that represent individual repositories
repo_list_items = page.css(".repo-list li")
js_count = 0
na_count = 0

repo_list_items.each do |repo|
  title = repo.css("h3").text.strip
  description = repo.css("p").text.strip
  if repo.css("span")[1].text.strip == "Built by"
    language = "N/A"
  else
    language = repo.css("span")[1].text.strip
  end

  if language == "N/A"
    na_count += 1
  elsif language == "JavaScript"
    js_count += 1
  end

  contributors = repo.css("span")[-2].css(".d-inline-block").map do |e|
    e.children[-1]["alt"].gsub('@', '')
  end

  puts "\n**************************************\n\n"
  puts "Repository: #{title}\n\nDescription: #{description}\n\nPrimary Language: #{language}\n\n Contributors: "
  contributors.each do |c|
    puts "#{c} "
  end
end

puts "\n#{js_count} repositories primarily use JavaScript."
puts "#{na_count} repositories have no language listed."
