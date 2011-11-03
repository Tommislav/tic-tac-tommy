package se.salomonsson.ttt 
{
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.mvcs.Context;
	import se.salomonsson.ttt.events.ApplicationEvent;
	import se.salomonsson.ttt.mediator.GridViewMediator;
	import se.salomonsson.ttt.model.GridModel;
	import se.salomonsson.ttt.view.GridView;
	
	/**
	 * ...
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
			trace("start up");
			mediatorMap.mapView( GridView, GridViewMediator );
			injector.mapSingleton( GridModel );
			
			
			
			contextView.addChild( new GridView() );
			dispatchEvent( new ApplicationEvent(ApplicationEvent.START_UP) );
		}
	}

}