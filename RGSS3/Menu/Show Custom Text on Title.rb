#==============================================================================
# ** Show Custom Text on Title
# Author: KeatonGamer
# Version: 1.0.3
#------------------------------------------------------------------------------
# Description:
#  This script shows custom text on the Title Screen.
#
# How to use: 
#  Simply place below Materials and above Main Process.
#  Configure to your liking.
#
# Terms of Service:
#  Please do not use this in any NSFW games!
#  Free for non-commerical, or commerical games. Credit is required!
#==============================================================================
module KG
  module CustomTitleText
    CONFIG ={
      :window   => {
        :x        => 0,             # X Coordinates for the window.
        :y        => 0,             # Y Coordinates for the window.
        :z        => 300,           # Layer Number for the window.
        :width    => 640,           # Width number for the window's size.
        :height   => 480,           # Height number for the window's size.
        :windowskin => {
          :enable     => false,     # Enable this if you want to use a custom
                                    # windowskin.
          :filename   => "Window",  # Place in "Graphics/System"
        },
      },
      :contents => {
        :text     => "v1.0.0-beta", # Custom text to display on the 
                                    # Title Screen.
        :font     => {
          :filename => "VL Gothic", # Font name.
          :size     => 20,          # Font size.
          :color    => {
            :r      => 0,           # Amount of red for the font color.
            :g      => 0,           # Amount of green for the font color.
            :b      => 0,           # Amount of blue for the font color.
          },
          :outline  => {
            :r      => 0,           # Amount of red for the font outline.
            :g      => 0,           # Amount of green for the font outline.
            :b      => 0,           # Amount of blue for the font outline.
            :a      => 255,         # Amount of opacity for the font outline.
          },
        },
        :x        => 0,             # X Coordinates for the text.
        :y        => 0,             # Y Coordinates for the text.
        :width    => 640,           # Width number for the text size.
        :height   => 24,            # Height number for the text size.
        :align    => 0,             # Alignment Number. 
                                    # 0 = left, 1 = center, 2 = right.
      },
    } # CONFIG
  end # CustomTitleText
end # KG
#==============================================================================
# ** Window_Version
#------------------------------------------------------------------------------
#  This window is used for displaying the game version on the Title Screen.
#==============================================================================
class Window_CustomTitleText < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(KG::CustomTitleText::CONFIG[:window][:x], KG::CustomTitleText::CONFIG[:window][:y], KG::CustomTitleText::CONFIG[:window][:width], KG::CustomTitleText::CONFIG[:window][:height])
    if KG::CustomTitleText::CONFIG[:window][:windowskin][:enable]
      self.windowskin = Cache.system(KG::CustomTitleText::CONFIG[:window][:windowskin][:filename]) 
    else
      self.windowskin = Cache.system("")
    end
    refresh
  end
  #--------------------------------------------------------------------------
  # * Create Version Text
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.size = KG::CustomTitleText::CONFIG[:contents][:font][:size]
    self.contents.font.name = KG::CustomTitleText::CONFIG[:contents][:font][:filename]
    self.contents.font.color.set(KG::CustomTitleText::CONFIG[:contents][:font][:color][:r], KG::CustomTitleText::CONFIG[:contents][:font][:color][:g], KG::CustomTitleText::CONFIG[:contents][:font][:color][:b])
    self.contents.font.outline = Color.new(KG::CustomTitleText::CONFIG[:contents][:font][:outline][:r], KG::CustomTitleText::CONFIG[:contents][:font][:outline][:g], KG::CustomTitleText::CONFIG[:contents][:font][:outline][:b], KG::CustomTitleText::CONFIG[:contents][:font][:outline][:a])
    self.contents.draw_text(KG::CustomTitleText::CONFIG[:contents][:x], KG::CustomTitleText::CONFIG[:contents][:y], KG::CustomTitleText::CONFIG[:contents][:width], KG::CustomTitleText::CONFIG[:contents][:height], KG::CustomTitleText::CONFIG[:contents][:text], KG::CustomTitleText::CONFIG[:contents][:align])
  end
  #--------------------------------------------------------------------------
  # * Draw Text
  #--------------------------------------------------------------------------
  def draw_text(x, y, text_width, text_height, text, alignment = 0)
    contents.draw_text(x, y, text_width, text_height, text, alignment)
  end
end

#==============================================================================
# ** Scene_Title
#------------------------------------------------------------------------------
#  This class performs the title screen processing.
#==============================================================================
class Scene_Title
  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  alias kg_customtitletext_scene_title_start                              start
  def start
    kg_customtitletext_scene_title_start
    @ctt_window = Window_CustomTitleText.new
  end
end
