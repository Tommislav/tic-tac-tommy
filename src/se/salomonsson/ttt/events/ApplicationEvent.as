package se.salomonsson.ttt.events 
{
	import flash.events.Event;
	
	/**
	 * Events signaling a change of state in the application
	 * @author Tommislav
	 */
	public class ApplicationEvent extends Event 
	{
		public static const START_UP:String = "startup";
		
		
		
		public function ApplicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ApplicationEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ApplicationEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}