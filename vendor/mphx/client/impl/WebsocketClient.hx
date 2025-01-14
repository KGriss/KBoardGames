package vendor.mphx.client.impl ;

import vendor.mphx.serialization.ISerializer;
import vendor.mphx.utils.Log;

//The client class that is used with JS websockets.
class WebsocketClient implements IClient
{

	var websocket : js.html.WebSocket;

	public var events:mphx.utils.event.impl.ClientEventManager;
	public var serializer:ISerializer;

	var port:Int;
	var ip:String;

	var ready = false;
	var messageQueue:Array<Dynamic>;

	public var onConnectionClose :mphx.utils.Error.ClientError->Void; //Server close the connection (with the reason)
	public var onConnectionError :mphx.utils.Error.ClientError->Void;
	public var onConnectionEstablished :Void->Void;

	//WEBSOCKET API FOR HAXE DOES NOT HAVE setFastSend
	public var fastSend(default, set) = false;
	function set_fastSend(newValue){ Log.message(DebugLevel.Warnings,"SetFastSend is not implemented for web sockets."); return false; }

	public function new(_ip:String,_port:Int)
	{
		events = new mphx.utils.event.impl.ClientEventManager();

		serializer = new mphx.serialization.impl.HaxeSerializer();

		ip = _ip;
		port = _port;

		messageQueue = new Array<Dynamic>();

	}

	public function connect() {
		Log.message(DebugLevel.Info,"Attempting to connect on: "+ip+":"+port);
		websocket = new js.html.WebSocket("ws://"+ip+":"+port);

		websocket.onerror = function(e) {
			if (onConnectionError != null) onConnectionError(e);
			Log.message(DebugLevel.Errors,"Connection error: "+e);
		}

		websocket.onopen = function() {
			if (onConnectionEstablished != null) onConnectionEstablished();
			ready = true;

			Log.message(DebugLevel.Info,"Connected on: "+ip+":"+port);

			for (message in messageQueue){
				send(message.t,message.data);
				messageQueue.remove(message);
			}
		}

		websocket.onmessage = function (line)
		{
			var data = line.data; //It's inside the JSON websocket request
			var msg = serializer.deserialize(data); //Is the serialized message.

			//The message will have a propety of T
			//This is the event name/type. It is t to reduce wasted banwidth.
			//call an event called 't' with the msg data.
			events.callEvent(msg.t,msg.data);
		}
	}

	public function send(event:String, ?data:Dynamic)
	{
		if (isConnected() == false){
			Log.message(DebugLevel.Warnings | DebugLevel.Networking,"Cannot sent event "+event+" as client is not connected to a server.");
			return;
		}

		var object = {
			t: event,
			data:data
		};

		if (ready == true)
		{
			var serialiseObject = serializer.serialize(object);

			websocket.send(serialiseObject + "\r\n");
		}else{
			messageQueue.push(object);
		}

	}

	public function update(timeout:Float=0)
	{
		//JS Websockets don't need to be updated.
	}

	public function isConnected():Bool { return websocket != null; }

	public function close (){
		websocket.close();
		if (onConnectionClose != null) onConnectionClose(mphx.utils.Error.ClientError.DroppedConnection);
	}
}
