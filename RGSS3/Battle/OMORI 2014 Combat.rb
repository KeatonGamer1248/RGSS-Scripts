#==============================================================================
# OMORI 2014 Combat
# Author: KeatonGamer
# Version: v1.0.1
#------------------------------------------------------------------------------
# This script adds a OMORI 2014 like combat system featuring emotions.
#
# How it works:
#  When the player misses a hit, the player becomes SAD...
#  When the player makes a critical hit, the player becomes HAPPY!
#  When the player gets critically hit by an enemy, the player becomes ANGRY.
#
# Overwritten methods:
#  Game_Battler < Game_BattlerBase
#   add_state(state_id)
#   make_damage_value(user, item)
#   item_apply(user, item)
#
# Terms of Service:
#  No credit needed.
#==============================================================================

$imported = {} if $imported.nil?
$imported["KG_Omori2014Combat"] = true

#==============================================================================
# ** Configuration
#==============================================================================
module KG
  module Omori2014Combat
    #----------------------------------------------------------------------
    # States
    #----------------------------------------------------------------------
    HAPPY     = 2
    SAD       = 3 
    ANGRY     = 4
    #----------------------------------------------------------------------
    # Excluded Skills
    #----------------------------------------------------------------------
    O_DO_NOTHING = 2
    A_DO_NOTHING = 3
    K_DO_NOTHING = 4
    H_DO_NOTHING = 5
  end
end
class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Add State
  #--------------------------------------------------------------------------
  def add_state(state_id)
    case state_id
      when KG::Omori2014Combat::HAPPY then remove_state(KG::Omori2014Combat::SAD) && remove_state(KG::Omori2014Combat::ANGRY) #<-- Edit
      when KG::Omori2014Combat::SAD then remove_state(KG::Omori2014Combat::HAPPY) && remove_state(KG::Omori2014Combat::ANGRY) #<-- Edit
      when KG::Omori2014Combat::ANGRY then remove_state(KG::Omori2014Combat::HAPPY) && remove_state(KG::Omori2014Combat::SAD) #<-- Edit
    end
    if state_addable?(state_id)
      puts("Adding state #{state_id}") #<-- Edit
      add_new_state(state_id) unless state?(state_id)
      reset_state_counts(state_id)
      @result.added_states.push(state_id).uniq!
    end
  end
  #--------------------------------------------------------------------------
  # * Calculate Damage
  #--------------------------------------------------------------------------
  def make_damage_value(user, item)
    value = item.damage.eval(user, self, $game_variables)
    value *= item_element_rate(user, item)
    value *= pdr if item.physical?
    value *= mdr if item.magical?
    value *= rec if item.damage.recover?
    user.add_state(KG::Omori2014Combat::HAPPY) if @result.critical #<-- Edit
    add_state(KG::Omori2014Combat::ANGRY) if @result.critical #<-- Edit
    value = apply_critical(value) if @result.critical
    value = apply_variance(value, item.damage.variance)
    value = apply_guard(value)
    @result.make_damage(value.to_i, item)
  end
  #--------------------------------------------------------------------------
  # * Apply Effect of Skill/Item
  #--------------------------------------------------------------------------
  def item_apply(user, item)
    @result.clear
    @result.used = item_test(user, item)
    @result.missed = (@result.used && rand >= item_hit(user, item))
    @result.evaded = (!@result.missed && rand < item_eva(user, item))
    if @result.hit?
      unless item.damage.none?
        @result.critical = (rand < item_cri(user, item))
        make_damage_value(user, item)
        execute_damage(user)
      end
    else
      user.add_state(KG::Omori2014Combat::SAD) unless [KG::Omori2014Combat::O_DO_NOTHING, KG::Omori2014Combat::A_DO_NOTHING, KG::Omori2014Combat::K_DO_NOTHING, KG::Omori2014Combat::H_DO_NOTHING].any? {|id| item.id == id} #<-- Edit
    end
    item.effects.each {|effect| item_effect_apply(user, item, effect) }
    item_user_effect(user, item)
  end
end
