require_relative './menu'

class App
  def initialize
    @menu = Menu.new
  end

  def start_app
    print 'Welcome To School Library App'
    sleep 0.65
    menu
  end
end
