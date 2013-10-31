package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionPush extends ActionRecord
	{
		public static const CODE:uint = 0x96;
		
		
		public var values:Vector.<ActionValue>;
		
		public function ActionPush(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			values = new Vector.<ActionValue>();
			var endPosition:uint = bt.position + length;
			while(bt.position != endPosition)
			{
				values.push( new ActionValue(bt) );
			}
		}
	}
}


import com.alonepig.swf.SWFData;
import com.alonepig.swf.records.BaseData;

class ActionValue extends BaseData
{
	public static const STRING:uint = 0;
	public static const FLOAT:uint = 1;
	public static const NULL:uint = 2;
	public static const UNDEFINED:uint = 3;
	public static const REGISTER:uint = 4;
	public static const BOOLEAN:uint = 5;
	public static const DOUBLE:uint = 6;
	public static const INTEGER:uint = 7;
	public static const CONSTANT_8:uint = 8;
	public static const CONSTANT_16:uint = 9;
	
	public var type:uint;
	public var string:String;
	public var number:Number;
	public var register:uint;
	public var boolean:Boolean;
	public var integer:uint;
	public var constant:uint;
	
	public function ActionValue(bt:SWFData=null)
	{
		super(bt);
	}
	
	override public function read(bt:SWFData):void
	{
		type = bt.readUI8();
		switch(type)
		{
			case STRING: string = bt.readString(); break;
			case FLOAT: number = bt.readFLOAT(); break;
			case NULL: break;
			case UNDEFINED: break;
			case REGISTER: register = bt.readUI8(); break;
			case BOOLEAN: boolean = (bt.readUI8() != 0); break;
			case DOUBLE: number = bt.readDOUBLE(); break;
			case INTEGER: integer = bt.readUI32(); break;
			case CONSTANT_8: constant = bt.readUI8(); break;
			case CONSTANT_16: constant = bt.readUI16(); break;
			default:
				throw(new Error("Unknown ActionValueType: " + type));
				
		}
	}
}