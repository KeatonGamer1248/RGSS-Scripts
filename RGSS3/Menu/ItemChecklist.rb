#//////////////////////////////////////////////////////////////////////////////#
#                   CHECKLIST ITEM SCRIPT BY KEATONGAMER                       #
#//////////////////////////////////////////////////////////////////////////////#
# Feel free to use for your projects, I don't mind!                            #
# Credit would be nice though, hehe~ Maybe even a free copy of your game?      #
#//////////////////////////////////////////////////////////////////////////////#

$imported = {} if $imported.nil?
$imported[:KG_ChecklistItem] = true

#=============================================================================
# ▼ Options
#=============================================================================
module KG
  
  ITEM_SWITCHES = [23, 24, 25, 26, 27, 28, 29]

end
#=============================================================================
# ■ Scene_ItemChecklist
#=============================================================================
class Scene_ItemChecklist < Scene_Menu

  attr_accessor :item_checklist
  #---------------------------------------------------------------------------
  # * method: start
  #---------------------------------------------------------------------------
  def start
    super
    
    create_background
  end
  #---------------------------------------------------------------------------
  # * new method: line_height
  #---------------------------------------------------------------------------
  def line_height
    return 12
  end
  #---------------------------------------------------------------------------
  # * new method: create_background
  #---------------------------------------------------------------------------
  def create_background
    # Create Background Viewport
    @background_viewport = Viewport.new(135, 21, 312, 232)
    @background_viewport.z = 350

    # Create Backgound Sprite
    @background_sprite = Sprite.new()
    @background_sprite.viewport = @background_viewport
    
    # Create Background
    file = "Graphics/System/HUD_Checklist"
    @background_sprite.bitmap = Bitmap.new(file)
    
    create_checkmark
  end
  #---------------------------------------------------------------------------
  # * new method: create_checkmark
  #---------------------------------------------------------------------------
  def create_checkmark
    # Create Checkmark Viewport
    @mark1_viewport = Viewport.new(166,  45, 20, 20)
    @mark2_viewport = Viewport.new(166,  67, 20, 20)
    @mark3_viewport = Viewport.new(166,  89, 20, 20)
    @mark4_viewport = Viewport.new(166, 111, 20, 20)
    @mark5_viewport = Viewport.new(166, 133, 20, 20)
    @mark6_viewport = Viewport.new(166, 155, 20, 20)
    @mark7_viewport = Viewport.new(166, 177, 20, 20)
    
    # Create Checkmark Sprite
    @mark1_sprite = Sprite.new()
    @mark2_sprite = Sprite.new()
    @mark3_sprite = Sprite.new()
    @mark4_sprite = Sprite.new()
    @mark5_sprite = Sprite.new()
    @mark6_sprite = Sprite.new()
    @mark7_sprite = Sprite.new()
      
    # Connect Sprite.viewport to Viewport
    @mark1_sprite.viewport = @mark1_viewport
    @mark2_sprite.viewport = @mark2_viewport
    @mark3_sprite.viewport = @mark3_viewport
    @mark4_sprite.viewport = @mark4_viewport
    @mark5_sprite.viewport = @mark5_viewport
    @mark6_sprite.viewport = @mark6_viewport
    @mark7_sprite.viewport = @mark7_viewport
    
    # Create Checkmark Bitmap
    @mark1_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark2_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark3_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark4_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark5_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark6_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")
    @mark7_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_mark")

    create_item_names
  end
  #---------------------------------------------------------------------------
  # * new method: create_item_names
  #---------------------------------------------------------------------------
  def create_item_names
    # Now, how are we going to create the item names... Maybe like this?
    @item0 = "?????????????"
    @item1 = "A BOX OF OLD PHOTOS"
    @item2 = "A STUFFED BUNNY"
    @item3 = "A PILE OF DAISIES"
    @item4 = "A SPECIAL SONG"
    @item5 = "A FAMILIAR SCENT"
    @item6 = "A HUG FROM BEHIND"
    @item7 = "A SECOND PILLOW"
    create_items
  end
  #---------------------------------------------------------------------------
  # * new method: create_items
  #---------------------------------------------------------------------------
  def create_items
    if $game_switches[KG::ITEM_SWITCHES[0]] == true
      @background_sprite.bitmap.new
    else
      @background_sprite.bitmap.draw_text(35, 12, 183, 51, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[1]] == true
      @background_sprite.bitmap.draw_text(35, 27, 182, 76, @item2)
    else
      @background_sprite.bitmap.draw_text(35, 27, 186, 76, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[2]] == true
      @background_sprite.bitmap.draw_text(35, 38, 156, 99, @item3)
    else
      @background_sprite.bitmap.draw_text(35, 38, 156, 99, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[3]] == true
      @background_sprite.bitmap.draw_text(35, 49, 156, 122, @item4)
    else
      @background_sprite.bitmap.draw_text(35, 49, 156, 122, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[4]] == true
      @background_sprite.bitmap.draw_text(35, 58, 156, 147, @item5)
    else
      @background_sprite.bitmap.draw_text(35, 58, 156, 147, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[5]] == true
      @background_sprite.bitmap.draw_text(35, 69, 156, 172, @item6)
    else
      @background_sprite.bitmap.draw_text(35, 69, 156, 172, @item0)
    end
    
    if $game_switches[KG::ITEM_SWITCHES[6]] == true
      @background_sprite.bitmap.draw_text(35, 81, 143, 194, @item7)
    else
      @background_sprite.bitmap.draw_text(35, 81, 156, 194, @item0)
    end
    # Items are not selectable and are shown after a switch is enabled.
    @background_sprite.bitmap.font.color = Color.new(0, 0, 0, 255)
  end
  #---------------------------------------------------------------------------
  # * new method: on_actor_cancel
  #---------------------------------------------------------------------------
  def on_actor_cancel
    SceneManager.goto(Scene_Item)
  end
  #---------------------------------------------------------------------------
  # * new method: dispose_background
  #---------------------------------------------------------------------------
  def dispose_background
    @background_sprite.dispose
  end
  #---------------------------------------------------------------------------
  # * method: terminate
  #--------------------------------------------------------------------------- 
  def terminate
    super
    dispose_background
  end
end
