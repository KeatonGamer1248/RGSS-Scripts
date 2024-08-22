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
class Scene_ItemChecklist < Scene_MenuBase

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
    @item1_viewport = Viewport.new(166,  45, 226, 20)
    @item2_viewport = Viewport.new(166,  67, 226, 20)
    @item3_viewport = Viewport.new(166,  89, 226, 20)
    @item4_viewport = Viewport.new(166, 111, 226, 20)
    @item5_viewport = Viewport.new(166, 133, 226, 20)
    @item6_viewport = Viewport.new(166, 155, 226, 20)
    @item7_viewport = Viewport.new(166, 177, 226, 20)
    
    # Create Viewport 'Z'
    @item1_viewport.z = 450
    @item2_viewport.z = 450
    @item3_viewport.z = 450
    @item4_viewport.z = 450
    @item5_viewport.z = 450
    @item6_viewport.z = 450
    @item7_viewport.z = 450
    
    # Create Checkmark Sprite
    @item1_sprite = Sprite.new()
    @item2_sprite = Sprite.new()
    @item3_sprite = Sprite.new()
    @item4_sprite = Sprite.new()
    @item5_sprite = Sprite.new()
    @item6_sprite = Sprite.new()
    @item7_sprite = Sprite.new()
      
    # Connect Sprite.viewport to Viewport
    @item1_sprite.viewport = @item1_viewport
    @item2_sprite.viewport = @item2_viewport
    @item3_sprite.viewport = @item3_viewport
    @item4_sprite.viewport = @item4_viewport
    @item5_sprite.viewport = @item5_viewport
    @item6_sprite.viewport = @item6_viewport
    @item7_sprite.viewport = @item7_viewport
    
    # Create Checkmark Bitmap
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
      @item1_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item1")
    else
      @item1_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[1]] == true
      @item2_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item2")
    else
      @item2_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[2]] == true
      @item3_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item3")
    else
      @item3_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[3]] == true
      @item4_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item4")
    else
      @item4_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[4]] == true
      @item5_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item5")
    else
      @item5_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[5]] == true
      @item6_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item6")
    else
      @item6_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
    end
    
    if $game_switches[KG::ITEM_SWITCHES[6]] == true
      @item7_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item7")
    else
      @item7_sprite.bitmap = Bitmap.new("Graphics/System/HUD_Checklist_item0")
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
  #---------------------------------------------------------------------------
  # * new method: setting
  #
  # For Luna Engine. Comment out this method if you do not have Luna Engine.
  #---------------------------------------------------------------------------
  def setting
    MenuLuna::Addon::ChecklistMenu::BACKGROUND
  end
end
