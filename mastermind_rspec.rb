require_relative 'starting.rb'
require_relative 'demola_mastermind_project'
RSpec.describe "Menu" do
  it "can call welcome_message.rb to triger the game" do
  expect(Menu.new.options).to eq (WelcomeMessage.new.introduction_message)
end
  describe "WelcomeMessage" do
    it "should contain all the methods for intoductory messages" do
      expect(WelcomeMessage.new.introduction_message).to eq ()
      expect(WelcomeMessage.start_message).to eq ()
    end
  end
    describe "Computer" do
      it should "should generate 4 random code for beginner" do
        expect(Computer.code_beginner).to eq ()
      end
      it sould "should generate 5 random code for Intermediate" do
        expect(Computer.code_intermediate).to eq ()
      end
      it should "should generate 6 random code for advance"
        expect(Computer.code_advance).to eq ()
      end
end
describe "GameEngine" do
  it should "process the whole game" do
    expect(GameEngine.new.play_calc_exact_partial).to eq ()
  end
end
