package unittest.se.salomonsson.ttt.controllers.gamelogic 
{
	import se.salomonsson.ttt.controllers.gamelogic.IGameLogic;
	import se.salomonsson.ttt.vo.GridVO;
	import se.salomonsson.ttt.vo.HighlightCellVO;
	/**
	 * Base class for testing game logic
	 * @author Tommislav
	 */
	public class BaseGameLogicTest 
	{
		
		
		
		/**
		 * Accepts a visual representation of the game board as a string
		 * and parses it to a data-array that corresponds to the data
		 * structure that is used in the game.
		 * 
		 * Example (where player "1" has won the game)
		 * "0,0,1\n"
		 * "2,1,2\n"
		 * "1,2,0\n"
		 */
		public function parseDebugStringToDataStructure(str:String):GridVO
		{
			var grid:Array = new Array();
			
			var rows:Array = str.split("\n");
			for (var y:int = 0; y < rows.length; y++ )
			{
				var slots:Array = rows[y].split(",");
				for (var x:int = 0; x < slots.length; x++ )
				{
					grid.push( parseInt(slots[x]) );
				}
			}
			
			var gridVO:GridVO = new GridVO();
			gridVO.numberOfCellsHorizontal = slots.length;
			gridVO.numberOfCellsVertical = rows.length;
			gridVO.grid = grid;
			return gridVO;
		}
		
		public function testForWin(str:String, logic:IGameLogic):Boolean
		{
			var grid:GridVO = parseDebugStringToDataStructure(str);
			return logic.checkWin(grid);
		}
		
		public function getWinningCells(str:String, logic:IGameLogic):Vector.<HighlightCellVO>
		{
			var grid:GridVO = parseDebugStringToDataStructure(str);
			return logic.getWinningCells(grid);
		}
	}

}