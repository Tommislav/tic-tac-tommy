package se.salomonsson.ttt.controllers 
{
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	
	/**
	 * Will reset the game
	 * @author Tommislav
	 */
	public class ResetGameCommand extends Command 
	{
		[Inject]
		public var gridModel:GridModel;
		
		[Inject]
		public var playerModel:PlayersModel;
		
		override public function execute():void 
		{
			gridModel.clearGrid();
			dispatch( new GameEvent(GameEvent.REQUEST_GRID_RE_RENDER) );
			
			playerModel.setCurrentPlayerIndex(0);
			dispatch( new GameEvent(GameEvent.PLAYER_TURN_CHANGED ) );
		}
	}

}