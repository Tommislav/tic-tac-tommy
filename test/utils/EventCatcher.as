package utils 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	/**
	 * If you want to track a set of events (order, what events are dispatched and so on) you can
	 * let this EventCatcher record the order and types of events for you.
	 * @author Tommislav
	 */
	public class EventCatcher 
	{
		private var _events:Array;
		
		private var _boundDispatchers:Vector.<Holder>;
		
		public static function getBoundEventCatcher( dispatcher:IEventDispatcher, type:String ):EventCatcher
		{
			return new EventCatcher().bindToDispatcher(dispatcher, type);
		}
		
		public static function getSingleEventCatcher( dispatcher:IEventDispatcher, type:String ):EventCatcher
		{
			return new EventCatcher().bindToDispatcherSingleEvent(dispatcher, type);
		}
		
		
		
		public function EventCatcher() 
		{
			clear();
			_boundDispatchers = new Vector.<Holder>();
		}
		
		public function bindToDispatcher( dispatcher:IEventDispatcher, type:String ):EventCatcher
		{
			bind(dispatcher, type, false);
			return this;
		}
		
		// Will unregister after one event is dispatched
		public function bindToDispatcherSingleEvent( dispatcher:IEventDispatcher, type:String ):EventCatcher
		{
			bind(dispatcher, type, true);
			return this;
		}
		
		private function bind( dispatcher:IEventDispatcher, type:String, autoRelease:Boolean ):void
		{
			dispatcher.addEventListener( "destroy", onDestroyFromDispatcher );
			dispatcher.addEventListener( type, onEvent );
			_boundDispatchers.push( new Holder(dispatcher, type, autoRelease) );
		}
		
		/**
		 * Add this as reciever for events
		 * source.addEventListener( "type", eventCatcher.onEvent );
		 */
		public function onEvent(e:Event):void
		{
			_events.push(e);
			
			for each( var h:Holder in _boundDispatchers )
			{
				if ( e.type == h.type && e.target == h.dispatcher && h.autoRelease )
				{
					h.dispatcher.removeEventListener( h.type, onEvent );
					h.dispatcher.removeEventListener( "destroy", onDestroyFromDispatcher );
					var index:int = _boundDispatchers.indexOf( h );
					_boundDispatchers.splice( index, 1 );
				}
			}
			
			
		}
		
		
		private function onDestroyFromDispatcher(e:Event):void 
		{
			destroy();
		}
		
		
		
		
		public function clear():void
		{
			_events = new Array();
		}
		
		public function destroy():void
		{
			for each( var h:Holder in _boundDispatchers )
			{
				h.dispatcher.removeEventListener( "destroy", onDestroyFromDispatcher );
				h.dispatcher.removeEventListener( h.type, onEvent );
			}
			_boundDispatchers = new Vector.<Holder>();
		}
		
		/**
		 * Return an array containing the event types (in the same order we recieved them)
		 */
		public function get types():Array
		{
			var a:Array = new Array();
			for each(var e:Event in _events)
				a.push( e.type );
			
			return a;
		}
		
		public function get events():Array
		{
			return _events;
		}
		
		public function get lengeh():int
		{
			return _events.length;
		}
	}

}
import flash.events.IEventDispatcher;

internal class Holder
{
	public var dispatcher:IEventDispatcher;
	public var type:String;
	public var autoRelease:Boolean;
	
	public function Holder( dispatcher:IEventDispatcher, type:String, autoRelease:Boolean = false )
	{
		this.dispatcher = dispatcher;
		this.type = type;
		this.autoRelease = autoRelease;
	}
	
}