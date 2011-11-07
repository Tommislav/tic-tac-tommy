package se.salomonsson.ttt.mediator 
{
	import org.robotlegs.mvcs.Mediator;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.view.IGameOptionsView;
	
	/**
	 * Mediator for the in-game options menu
	 * @author Tommislav
	 */
	public class GameOptionsMediator extends Mediator 
	{
		private var _gameOptionsView:IGameOptionsView;
		
		override public function onRegister():void 
		{
			_gameOptionsView = viewComponent as IGameOptionsView;
			_gameOptionsView.onResetGameSignal.add( onReset );
		}
		
		override public function onRemove():void 
		{
			_gameOptionsView.onResetGameSignal.remove(onReset);
		}
		
		private function onReset():void 
		{
			dispatch( new GameEvent( GameEvent.RESET_GAME ) );
		}
	}

}