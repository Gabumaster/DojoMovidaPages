After do
  puts raise('fail test, see HTML report...') if $ERR_TEST # If global is true, fail the test.
  #Capybara.current_session.driver.quit
end

# require 'watir'


# After do
#   @browser.close
# end