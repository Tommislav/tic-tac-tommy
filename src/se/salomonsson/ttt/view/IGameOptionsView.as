package se.salomonsson.ttt.view 
{
	import flash.display.DisplayObject;
	import org.osflash.signals.ISignal;
	
	/**
	 * This is the in-game options view
	 * @author Tommislav
	 */
	public interface IGameOptionsView 
	{
		function get displayObject():DisplayObject;
		
		function get onResetGameSignal():ISignal;
	}
	
}