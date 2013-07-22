require 'capybara'
require 'capybara/dsl'
require_relative '../test_helper'

class TheOnlyTest < ActiveSupport::TestCase
  include Capybara::DSL

  def setup
    Capybara.current_driver = :webkit
  end
  
  def test_hello_world
    visit 'http://google.com'
    
    fill_in 'q', :with => 'monkey'
    click_link_or_button 'Google Search'
    assert has_text? 'A monkey is a primate of the Haplorrhini suborder and simian infraorder, either an Old World monkey or a New World monkey, but excluding apes and humans.'
  end
  
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  
end

# RSpec.configure do |config|
#   config.include Capybara::DSL, :type => :feature
#   config.include Capybara::RSpecMatchers, :type => :feature
#   config.after do
#     if self.class.include?(Capybara::DSL)
#       Capybara.reset_sessions!
#       Capybara.use_default_driver
#     end
#   end
#   config.before do
#     if self.class.include?(Capybara::DSL)
#       Capybara.current_driver = Capybara.javascript_driver if example.metadata[:js]
#       Capybara.current_driver = example.metadata[:driver] if example.metadata[:driver]
#     end
#   end
# end
