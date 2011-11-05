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
		public static const CELL_SELECTED:String = "cellSelected";
		
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