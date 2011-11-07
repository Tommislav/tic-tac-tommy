package se.salomonsson.ttt.view 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import org.osflash.signals.ISignal;
	
	/**
	 * Interface for the view showing the grid, and exposing the api
	 * @author Tommislav
	 */
	public interface IGridView 
	{
		// Refers to itself so we can attach it to the displaylist even though its typed as an interface
		function get displayObject():DisplayObject;
		
		function drawGrid(cellsW:uint, cellsH:uint, cells:Array):void;
		
		function get onCellClickedSignal():ISignal;
		function get lastClickedCell():Point;
	}
	
}