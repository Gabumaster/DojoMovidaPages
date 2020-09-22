require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'faker'
require 'cpf_faker'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec'
require 'httparty'

# $wait = Selenium::WebDriver::Wait.new :timeout => 30


#Configurando o driver Capybara
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  
  #Setando a configuração do driver como padrão
  Capybara.default_driver = :selenium
  
  #Time padrão na execução
  Capybara.default_max_wait_time = 30
  
  #Maximizar a tela ao iniciar os testes
  Capybara.page.driver.browser.manage.window.maximize
    


