require_relative 'welcome_message'
class Menu
    def options
        WelcomeMessage.new.introduction_message
    end
end
Menu.new.options
