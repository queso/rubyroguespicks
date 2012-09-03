require 'open-uri'

class Pick < ActiveRecord::Base

  attr_protected nil

  def self.random
    count = Pick.count
    Pick.find(rand(count))
  end

  def self.fetch_links
    doc = Nokogiri::HTML(open('http://rubyrogues.com/picks/'))
    results = doc.css('.format_text a')
    results.each do |pick|
      Pick.create(title: pick.content.strip, link: pick.attributes["href"].value.strip)
    end
  end
end
