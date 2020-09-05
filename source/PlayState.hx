package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var player:Player;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;

	function placeEntities(entity:EntityData)
	{
		if (entity.name == 'player')
		{
			player.setPosition(entity.x, entity.y);
		}
	}

	override public function create()
	{
		map = new FlxOgmo3Loader(AssetPaths.map__ogmo, AssetPaths.room1__json);
		walls = map.loadTilemap(AssetPaths.tiles__png, "walls");
		walls.follow();
		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.ANY);
		add(walls);
		player = new Player();
		map.loadEntities(placeEntities, "entities");

		add(player);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
	}
}
