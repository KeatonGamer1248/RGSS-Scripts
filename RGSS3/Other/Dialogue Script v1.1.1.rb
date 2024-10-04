#==============================================================================
# ** Dialogue Script
# Author: KeatonGamer
# Version: 1.1.1
#------------------------------------------------------------------------------
# Description:
#  This script stores dialogue and keeps track of it. Similar to how OMORI 
#  uses .YAML files, but for VX Ace.
#
# How to use: 
#  1. Simply customize the "Config" section with the paths of your files and
#     the variable number for the language variable.
#  2. To call a message, simply use this script call here:
#                     Dialogue::message(array_number, line_number)
#     (NOTE: Replace array_number with the number that cooresponds with the 
#     array and also replace line_number with the line you want to display's
#     number.)
#  3. If you have more lines to push in, add another script call!
#  4. If you want to close the message and create a new one, use this script
#     call: Dialogue::wait_for_message
#  5. Profit.
#==============================================================================

module Dialogue
  module Config
    
    # Language Variable.
    LANGUAGE_VARIABLE = 85

    # Language Files.
    LANG1             = [
                        "System/file1",
                        "System/file2",
                        "System/file3",
                        ]

    LANG2             = [
                        "System/file1",
                        "System/file2",
                        "System/file3",
                        ]
  end
  
  # Dialogue::message(Dialogue::YourModuleHere::Message_00)
  def self.message(string)
    $game_message.add(string)
  end
  
  # Dialogue::wait_for_message
  def self.wait_for_message
    Fiber.yield while $game_message.busy?
  end
  
  def self.message(integer1, integer2)
    
    array_no  = integer1
    line_no   = integer2
    
    if $game_variables[Dialogue::Config::LANGUAGE_VARIABLE] == 0
      lang_file = File.open(Dialogue::Config::LANG1[array_no])
    elsif $game_variables[Dialogue::Config::LANGUAGE_VARIABLE] == 1
      lang_file = File.open(Dialogue::Config::LANG2[array_no])
    end
    
    while line = lang_file.gets
      if $. == line_no # $. is line number
        $game_message.add("#{line}") # another way
        # break  # break or exit if needed
      end
    end
    
    lang_file.close
    
  end
end