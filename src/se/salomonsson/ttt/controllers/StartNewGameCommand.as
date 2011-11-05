package se.salomonsson.ttt.controllers 
{
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.enum.PlayerType;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class StartNewGameCommand extends Command 
	{
		[Inject]
		public var gridModel:GridModel;
		
		
		// Do not populate players in the starup command. Let the user update it through a GUI in a separate view!
		[Inject]
		public var players:PlayersModel;
		
		override public function execute():void 
		{
			gridModel.setGridSize( 8, 8 );
			gridModel.clearGrid();
			
			players.clearPlayers();
			players.addPlayer("Player 1", PlayerType.HUMAN );
			players.addPlayer("Player 2", PlayerType.HUMAN );
			
			dispatch( new GameEvent(GameEvent.REQUEST_GRID_RE_RENDER) );
		}
	}

}