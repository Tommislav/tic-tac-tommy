package se.salomonsson.ttt
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;

	import se.salomonsson.ttt.controllers.RenderGridCommand;
	import se.salomonsson.ttt.controllers.ResetGameCommand;
	import se.salomonsson.ttt.controllers.StartNewGameCommand;
	import se.salomonsson.ttt.controllers.UpdateGridStateCommand;
	import se.salomonsson.ttt.events.ApplicationEvent;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.mediator.GameInfoViewMediator;
	import se.salomonsson.ttt.mediator.GameOptionsMediator;
	import se.salomonsson.ttt.mediator.GridViewMediator;
	import se.salomonsson.ttt.model.GameModel;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.model.PlayersModel;
	import se.salomonsson.ttt.view.GameInfoView;
	import se.salomonsson.ttt.view.GameOptionsView;
	import se.salomonsson.ttt.view.GridView;
	import se.salomonsson.ttt.view.IGameInfoView;

	 /**
	 * Map all dependencies in the application.
	 * @author Tommislav
	 */
	public class TicTacTommyContext extends Context
	{

		public function TicTacTommyContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup():void
		{
			// Map views
			mediatorMap.mapView(GridView, GridViewMediator);
			mediatorMap.mapView(GameOptionsView, GameOptionsMediator);
			mediatorMap.mapView(GameInfoView, GameInfoViewMediator, IGameInfoView);

			// Map commands
			commandMap.mapEvent(ApplicationEvent.START_UP, StartNewGameCommand);
			commandMap.mapEvent(GameEvent.REQUEST_GRID_RE_RENDER, RenderGridCommand);
			commandMap.mapEvent(GameEvent.CELL_SELECTED, UpdateGridStateCommand);
			commandMap.mapEvent(GameEvent.RESET_GAME, ResetGameCommand);

			// Injections
			injector.mapSingleton(GridModel);
			injector.mapSingleton(PlayersModel);
			injector.mapSingleton(GameModel);


			addViewToDisplayList(new GameInfoView(), 125, 5);
			addViewToDisplayList(new GridView(), 125, 20);
			addViewToDisplayList(new GameOptionsView(), 5, 5);

			dispatchEvent(new ApplicationEvent(ApplicationEvent.START_UP));
		}

		private function addViewToDisplayList(view:DisplayObject, x:int, y:int):void
		{
			view.x = x;
			view.y = y;
			contextView.addChild(view);
		}
	}

}