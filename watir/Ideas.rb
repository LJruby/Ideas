require 'selenium-webdriver'
require 'faker'


$browser=Selenium::WebDriver.for :ff

def LogIn
  $browser.get('localhost:3000')
  sleep(1)
  $browser.find_element(name: 'user[email]').send_keys('1@wp.pl')
  $browser.find_element(name: 'user[password]').send_keys('changeme')
  $browser.find_element(name: 'commit').click
end

def VisitShowLinks
  links=[]
  $browser.find_elements(link_text: 'Show').each do |b|
    links << b.attribute('href')
  end
  links.each do |l|
    $browser.get(l)
    sleep(1)
    $browser.navigate.back
  end
end

def EditDescription
  links=[]
  $browser.find_elements(link_text: 'Edit').each do |b|
    links << b.attribute('href')
  end
  links.each do |l|
    $browser.get(l)
    sleep(1)
    $browser.find_element(id: 'idea_description').send_keys(Faker::Lorem.paragraph)
    $browser.find_element(name: 'commit').click
    $browser.navigate.back
  end
end

LogIn()
VisitShowLinks()
EditDescription()
