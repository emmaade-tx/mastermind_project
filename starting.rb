require_relative 'welcome_message'
class Menu
    def options()
        system ("cls")
        WelcomeMessage.new.introduction
    end

    end
Menu.new.options
