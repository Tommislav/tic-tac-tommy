package se.salomonsson.ttt.controllers.gamelogic 
{
	import se.salomonsson.ttt.vo.GridVO;
	import se.salomonsson.ttt.vo.HighlightCellVO;
	
	/**
	 * Interface for checking specific logic stuff on the game board.
	 * If we want to be able to play both 3-in-a-row and 5-in-a-row then
	 * we need to be able to swap gamelogic-implementations!
	 * @author Tommislav
	 */
	public interface IGameLogic 
	{
		function checkWin(grid:GridVO):Boolean;
		function getWinningCells(grid:GridVO):Vector.<HighlightCellVO>;
		
		// function getLegalMoves(grid:Array, playerIndex:int):Vector.<HighlightCellVO>; // only valid if we play 5-in-a-row
	}
	
}