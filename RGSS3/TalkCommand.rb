=begin
#//////////////////////////////////////////////////////////////////////////////#
#                     TALK COMMAND SCRIPT BY KEATONGAMER                       #
#//////////////////////////////////////////////////////////////////////////////#
# Feel free to use for your projects, I don't mind!                            #
# Credit would be nice though, hehe~ Maybe even a free copy of your game?      #
#//////////////////////////////////////////////////////////////////////////////#
=end

#-----------------------------------------------------------------------------------------------------------------
# GITHUB REPOSITORY NOTE: (Unless you are testing and want to improve this) This script is very, very unfinished. 
#-----------------------------------------------------------------------------------------------------------------

$imported = {} unless $imported
$imported[:KeatonGamer_TalkCommand] = true

# Start Class
class Scene_TalkCommand < Scene_MenuBase
  
  attr_accessor :command_talk
  
  def start
    super
    create_background
    @actor = $game_party.menu_actor
  end
  
  def create_background
    @background_viewport = Viewport.new(146, 45, 130, 130)
    @background_viewport.z = 150
    
    @background_sprite = Sprite.new()
    @background_sprite.viewport = @background_viewport
    
    file = "Graphics/System/HUD_Talk"
    @background_sprite.bitmap = Bitmap.new(file)
    
    create_status_window
    command_personal
  end
  
  def on_actor_cancel
    SceneManager.goto(Scene_Map)
  end
  
  def dispose_background
    @background_sprite.dispose
  end
  
  def terminate
    super
    dispose_background
  end
  
  def create_status_window
    @status_window = Window_MenuStatus.new(Graphics.width, 0)
  end
  
  def command_personal
    @status_window.select_last
    @status_window.activate
    @status_window.set_handler(:ok,     method(:on_actor_ok))
    @status_window.set_handler(:cancel, method(:on_actor_cancel))
  end
end

instance = Scene_TalkCommand.new
instance
