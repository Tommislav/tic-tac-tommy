package se.salomonsson.ttt.controllers.gamelogic 
{
	import se.salomonsson.ttt.vo.GridVO;
	import se.salomonsson.ttt.vo.HighlightCellVO;
	/**
	 * ...
	 * @author Tommislav
	 */
	public class ThreeInARowLogic implements IGameLogic 
	{
		private var _savedCells:Vector.<HighlightCellVO>;
		
		public function ThreeInARowLogic() 
		{
			_savedCells = new Vector.<HighlightCellVO>();
		}
		
		/* INTERFACE se.salomonsson.ttt.controllers.gamelogic.IGameLogic */
		
		public function checkWin(grid:GridVO):Boolean 
		{
			var winningCellCoordinates:Array = [
				[0, 0, 1, 0, 2, 0], // top row
				[0, 1, 1, 1, 2, 1], // mid row
				[0, 2, 1, 2, 2, 2], // bottom row
				[0, 0, 0, 1, 0, 2], // left column
				[1, 0, 1, 1, 1, 2], // mid column
				[2, 0, 2, 1, 2, 2], // right column
				[0, 0, 1, 1, 2, 2], // diagonal "\"
				[2, 0, 1, 1, 0, 2]  // diagonal "/"
			];
			
			for each (var coords:Array in winningCellCoordinates)
			{
				if (checkSameButNotZero(grid, coords))
					return true;
			}
			return false;
		}
		
		public function getWinningCells(grid:GridVO):Vector.<HighlightCellVO> 
		{
			return new Vector.<HighlightCellVO>();
		}
		
		
		
		private function checkSameButNotZero(grid:GridVO, checkSlots:Array):Boolean
		{
			var array:Array = grid.grid;
			var width:int = grid.numberOfCellsHorizontal;
			
			var lastValue:int = -1;
			for (var i:int = 0; i < checkSlots.length; i += 2 )
			{
				var gridX:int = checkSlots[i];
				var gridY:int = checkSlots[i + 1];
				var value:int = array[gridY * width + gridX];
				
				if (value == 0 || (lastValue > -1 && value != lastValue))
					return false; // no need to continue, this is no winner!
				
				lastValue = value;
			}
			
			return true;
		}
	}

}