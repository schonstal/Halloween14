package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class BurgState extends GenericShopState
{
  override public function create():Void {
    availableItems = ["Candle Box", "Pumpkin Box", "Candle Crate", "Pumpkin Crate", "Bone Shard", "Bone Dagger"];
    flavorText = "We're all out of Moon Dust! If you need it, you'll have to get it from Space yourself; you just need to use the Key.";
    affordText = "You don't have enough blood to buy that.";
    maxText = "Sorry, I'm sold out.";

    title = "The Haunted Burg";

    columns = 2;

    super.create();
  }

  override private function purchaseCallback(itemName:String):Void {
    Reg.addItem(itemName);

    if (itemName == "Pumpkin Box") {
      Reg.addItem("Pumpkin", 100);
    }

    if (itemName == "Candle Box") {
      Reg.addItem("Candle", 100);
    }

    if (itemName == "Library Card") {
      Reg.unlocks.library = true;
    }
    if (itemName == "Harvester") {
      Reg.unlocks.harvester = true;
    }
  }
}
