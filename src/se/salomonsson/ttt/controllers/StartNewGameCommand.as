package se.salomonsson.ttt.controllers 
{
	import org.robotlegs.mvcs.Command;
	import se.salomonsson.ttt.controllers.gamelogic.ThreeInARowLogic;
	import se.salomonsson.ttt.enums.PlayerType;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.model.GameModel;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	
	/**
	 * ...
	 * @author Tommislav
	 */
	public class StartNewGameCommand extends Command 
	{
		// Should not be set here... do it just to get it working... =)
		[Inject]
		public var gameModel:GameModel;
		
		[Inject]
		public var gridModel:GridModel;
		
		// Do not populate players in the starup command. Let the user update it through a GUI in a separate view!
		[Inject]
		public var players:PlayersModel;
		
		override public function execute():void 
		{
			// Set the logic that decides the rules
			gameModel.gameLogic = new ThreeInARowLogic();
			
			gridModel.setGridSize( 3, 3 );
			gridModel.clearGrid();
			
			players.clearPlayers();
			players.addPlayer("Player 1", PlayerType.HUMAN );
			players.addPlayer("Player 2", PlayerType.HUMAN );
			players.setCurrentPlayerIndex(0);
			
			dispatch( new GameEvent(GameEvent.REQUEST_GRID_RE_RENDER) );
		}
	}

}