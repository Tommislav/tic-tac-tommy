package se.salomonsson.ttt.view 
{
	import flash.display.DisplayObject;
	
	/**
	 * Interface for the view showing the grid, and exposing the api
	 * @author Tommislav
	 */
	public interface IGridView 
	{
		function get displayObject():DisplayObject;
		
		function drawGrid(cellsW:uint, cellsH:uint, cells:Array):void;
	}
	
}