#==============================================================================
# ** GameJolt API Expansion Pack
# Author: KeatonGamer
# Version: v0.1.2-beta
#------------------------------------------------------------------------------
# This applies an expansion pack for Florian Van Strien's GameJolt API script.
# Which can be downloaded here on GameJolt: 
# gamejolt.com/games/gamejolt-achievement-api-for-rpg-maker-vx-ace/40546
#
# How to use:
#  Simply place below Florian's GameJolt API Script and above Main Proccess.
#  
# Terms of Service:
#  Please do not use this in any NSFW games!
#  Free for non-commerical, or commerical games. Credit is required!
#==============================================================================

$imported = {} if $imported.nil?
$imported["KG_GameJoltAPI-ExpansionPack"] = true

module GameJolt
  def self.session(value)

    user_name = CustomData.get("gj_username")
    user_token = CustomData.get("gj_usertoken")
    
    case value
    when "open"
      urlHash = ZOMD5.calc_md5("http://gamejolt.com/api/game/v1/" + "sessions/open/" + "?game_id=" + GameId + "&username=" + user_name + "&user_token=" + user_token + "&format=json" + PrivateKey)
      urlHash = urlHash[0]
      result = EFE.request("gamejolt.com", "api/game/v1/" + "sessions/open/" + "?game_id=" + GameId + "&username=" + user_name + "&user_token=" + user_token + "&format=json&signature=" + urlHash)
      result = JSON.decode(result)
      print(result)
    when "close"
      urlHash = ZOMD5.calc_md5("http://gamejolt.com/api/game/v1/" + "sessions/close/" + "?game_id=" + GameId + "&username=" + user_name + "&user_token=" + user_token + "&format=json" + PrivateKey)
      urlHash = urlHash[0]
      result = EFE.request("gamejolt.com", "api/game/v1/" + "sessions/close/" + "?game_id=" + GameId + "&username=" + user_name + "&user_token=" + user_token + "&format=json&signature=" + urlHash)
      result = JSON.decode(result)
    end
    if result != nil
      return result["response"]
    else
      return {"success" => "false"}
    end
  end
end
