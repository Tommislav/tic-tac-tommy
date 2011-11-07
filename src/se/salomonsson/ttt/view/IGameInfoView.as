package se.salomonsson.ttt.view 
{
	
	/**
	 * Displays additional info about the game... in textual form
	 * @author Tommislav
	 */
	public interface IGameInfoView 
	{
		function showCurrentPlayer(name:String, playerId:uint):void;
		function showWinner(name:String, playerId:uint):void;
		function reset():void;
	}
	
}