package se.salomonsson.ttt.controllers 
{
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.model.GridModel;
	
	/**
	 * Will reset the game
	 * @author Tommislav
	 */
	public class ResetGameCommand extends Command 
	{
		[Inject]
		public var gridModel:GridModel;
		
		override public function execute():void 
		{
			gridModel.clearGrid();
			dispatch( new GameEvent(GameEvent.REQUEST_GRID_RE_RENDER) );
		}
	}

}