require 'nokogiri'
require 'open-uri'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

# fetch all of the HTML `<li>` elements that represent individual repositories
repo_list_items = page.css(".repo-list li")


repo_list_items.each do |repo|
  title = repo.css("h3").text.strip
  description = repo.css("p").text.strip
  if repo.css("span")[1].text.strip == "Built by"
    language = "N/A"
  else
    language = repo.css("span")[1].text.strip
  end

  contributors = repo.css("span")[-2].css(".d-inline-block").map do |e|
    e.children[-1]["alt"].gsub('@', '')
  end

  repo = Repo.create(title: title, description: description, language: language)

  contributors.each do |c|
    contributor = Contributor.create(name: c)
    Contribution.create(contributor_id: contributor.id, repo_id: repo.id)
  end

end
