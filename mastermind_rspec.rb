require_relative 'starting.rb'
RSpec.describe "Menu" do
  it "can call welcome_message.rb to triger the game" do
  expect(Menu.new.options).to eq WelcomeMessage.new.introduction_message
end


end
