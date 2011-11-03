package se.salomonsson.ttt.model 
{
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class GridModel extends Actor 
	{
		private var _grid:Array;
		private var _cellsX:uint;
		private var _cellsY:uint;
		
		public function get cellsW():Number { return _cellsX; }
		public function get cellsH():Number { return _cellsY; }
		
		public function GridModel(cellsX:uint=3, cellsY:uint=3) 
		{
			_cellsX = cellsX;
			_cellsY = cellsY;
			clearGrid();
		}
		
		public function clearGrid():void 
		{
			_grid = new Array();
			
			var len:uint = _cellsX * _cellsY;
			for (var index:int = 0; index < len; index++ )
			{
				_grid[index] = 0;
			}
		}
		
		public function get grid():Array
		{
			return _grid.slice(); // return a copy of the array
		}
	}

}