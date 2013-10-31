package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	/**
	 *  
	 * Instance iinit 关联到Method_info  关联到 MethodBody_info 
	 */	
	public class Method_info extends BaseABCData
	{
		public var param_count:uint;
		/**
		 * multiname对应 表示方法的返回类型 
		 */		
		public var return_type:uint;
		/**
		 * 每一个值对应multiname中的位置 
		 */		
		public var param_type:Vector.<int>;
		/**
		 * string 常量池下标 
		 */		
		public var name:uint;
		public var flags:uint;
		public var options:Option_info;
		public var param_names:Vector.<Param_info>;
		
		
		public var needsArguments:Boolean;
		public var needsActivation:Boolean;
		public var needsRest:Boolean;
		public var hasOptionalParameters:Boolean;
		public var setsDXNS:Boolean;
		public var hasParameterNames:Boolean;
		
		public static const NEED_ARGUMENTS:int = 0x01;
		public static const NEED_ACTIVATION:int = 0x02;
		public static const NEED_REST:int = 0x04;
		public static const HAS_OPTIONAL:int = 0x08;
		public static const SET_DXNS:int = 0x40;
		public static const HAS_PARAM_NAMES:int = 0x80;
		
		
		/**
		 * name 对应的值 
		 */		
		public var nameStr:String;
		/**
		 * 返回类型的值 
		 */		
		public var return_typeStr:String;
		
		
		public function Method_info(bt:ABCData=null)
		{
			param_type = new Vector.<int>();
			param_names = new Vector.<Param_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			param_count = bt.readU30();
			return_type = bt.readU30();
			for (var i:int = 0; i < param_count; i++) 
			{
				//类型对应常量池中multinames
				//和param_names对应
				param_type.push( bt.readU30() );
			}
			name = bt.readU30();
			flags = bt.readUnsignedByte();
			
			needsArguments =        Boolean(flags & NEED_ARGUMENTS);
			needsActivation =       Boolean(flags & NEED_ACTIVATION);
			needsRest =             Boolean(flags & NEED_REST);
			hasOptionalParameters = Boolean(flags & HAS_OPTIONAL);
			setsDXNS =              Boolean(flags & SET_DXNS);
			hasParameterNames =     Boolean(flags & HAS_PARAM_NAMES);
			
			if(hasOptionalParameters)
			{
				options = new Option_info();
				options.read(bt);
			}
			if(hasParameterNames)
			{
				for (var j:int = 0; j < param_count; j++) 
				{
					param_names.push( new Param_info(bt) );
				}
			}
			
		}
		
		
		
	}
}