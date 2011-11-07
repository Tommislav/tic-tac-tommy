package se.salomonsson.ttt.vo 
{
	import se.salomonsson.ttt.enum.CellHighlightType;
	/**
	 * Indicated that we want to highlight one cell. It might want to highlight
	 * that one of the players has won the game, or a list of legal moves (this
	 * is only interesting if we  have 5 in a row, not 3 in a row).
	 * @author Tommislav
	 */
	public class HighlightCellVO 
	{
		public var cellX:int;
		public var cellY:int;
		public var hilightType:CellHighlightType;
	}

}