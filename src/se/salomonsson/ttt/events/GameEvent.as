package se.salomonsson.ttt.events 
{
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * Game-related events.
	 * @author Tommislav
	 */
	public class GameEvent extends Event 
	{
		public static const CELL_SELECTED				:String = "cellSelected";
		public static const REQUEST_GRID_RE_RENDER		:String = "requestGridReRender";
		public static const RESET_GAME					:String = "resetGame";
		public static const PLAYER_TURN_CHANGED			:String = "playerTurnChanged";
		public static const GAME_STATE_CHANGED			:String = "gameStateChanged";
		
		private var _cell:Point;
		public function get cell():Point { return _cell; }
		
		public function GameEvent(type:String, cell:Point=null) 
		{ 
			super(type, false, false);
			_cell = cell;
		} 
		
		public override function clone():Event 
		{ 
			return new GameEvent(type, _cell);
		} 
	}
	
}