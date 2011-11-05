package se.salomonsson.ttt 
{
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	import se.salomonsson.ttt.controllers.RenderGridCommand;
	import se.salomonsson.ttt.controllers.UpdateGridStateCommand;
	import se.salomonsson.ttt.events.ApplicationEvent;
	import se.salomonsson.ttt.events.GameEvent;
	import se.salomonsson.ttt.mediator.GridViewMediator;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.view.GridView;
	
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
			mediatorMap.mapView( GridView, GridViewMediator );
			
			// Map commands
			commandMap.mapEvent( ApplicationEvent.START_UP, RenderGridCommand ); // update grid at startup
			commandMap.mapEvent( GameEvent.REQUEST_GRID_RE_RENDER, RenderGridCommand );
			commandMap.mapEvent( GameEvent.CELL_SELECTED, UpdateGridStateCommand );
			
			// Injections
			injector.mapSingleton( GridModel );
			
			
			
			contextView.addChild( new GridView() );
			dispatchEvent( new ApplicationEvent(ApplicationEvent.START_UP) );
		}
	}

}