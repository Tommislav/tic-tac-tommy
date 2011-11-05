package se.salomonsson.ttt.model 
{
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Model that holds the 2d grid
	 * @author Tommislav
	 */
	public class GridModel extends Actor 
	{
		private var _grid:Array;
		private var _cellsX:uint;
		private var _cellsY:uint;
		
		public function get numberOfCellsHorizontal():uint 	{ return _cellsX; }
		public function get numberOfCellsVertical():uint	{ return _cellsY; }
		
		public function GridModel(numberOfCellsHorizontal:uint=3, numberOfCellsVertical:uint=3) 
		{
			_cellsX = numberOfCellsHorizontal;
			_cellsY = numberOfCellsVertical;
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
		
		public function setValue(x:int, y:int, value:int):void
		{
			_grid[ y * _cellsX + x ] = value;
		}
		
		public function getValue(x:int, y:int):int
		{
			return _grid[y * _cellsX + x];
		}
		
		public function get grid():Array
		{
			return _grid.slice(); // return a copy of the array
		}
	}

}