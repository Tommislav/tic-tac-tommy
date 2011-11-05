package se.salomonsson.ttt.events 
{
	import flash.events.Event;
	import se.salomonsson.ttt.vo.GridVO;
	import se.salomonsson.ttt.vo.HighlightCellVO;
	
	/**
	 * Event that signals that the applictaion want to grid to be re-rendered.
	 * @author Tommislav
	 */
	public class RenderGridEvent extends Event 
	{
		/** redraw the game grid */
		public static const RENDER:String = "render";
		
		/** we want one or more cells to be highlighted */
		public static const HIGHLIGHT_CELL:String = "highlightCell";
		
		
		
		
		private var _gridVO:GridVO;
		private var _highlightedCells:Vector.<HighlightCellVO>;
		
		public function RenderGridEvent(type:String, gridVO:GridVO, highlightCells:Vector.<HighlightCellVO> = null) 
		{ 
			super(type, false, false);
			_gridVO = gridVO;
			_highlightedCells = highlightCells;
		} 
		
		/** Data representation of the tic-tac-toe grid, a 2d-array of ints */
		public function get gridVO():GridVO { return _gridVO; }
		
		/** A list of cells to be highlighted, might be null */
		public function get highlightedCells():Vector.<HighlightCellVO> { return _highlightedCells; }
		
		
		
		
		public override function clone():Event { return new RenderGridEvent(type, _gridVO, _highlightedCells); }
	}
	
}