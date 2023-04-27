require 'glimmer-dsl-libui'
require_relative 'logicFromWindow'
class Window
  include Glimmer
  def create
    window('Tabs', 1500, 700) {
      margined true
      tab {
        tab_item('Tab 1') {
          logicfromwindow
        }
        tab_item('Tab 2') { }
        tab_item('Tab 3') { }
      }
    }
  end
end