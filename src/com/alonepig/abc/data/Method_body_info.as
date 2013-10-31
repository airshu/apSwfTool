package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	import com.alonepig.abc.instructions.BaseInstruction;
	import com.alonepig.abc.instructions.O_getlocal_n;
	import com.alonepig.abc.instructions.O_setlocal_n;
	import com.alonepig.utils.InstructionTypes;
	
	import flash.utils.Endian;

	/**
	 * 方法体 获取方法指令 
	 * 
	 */	
	public class Method_body_info extends BaseABCData
	{
		public var method:int;
		/**
		 * 操作数栈是空的，最多可容纳元素 
		 */		
		public var max_stack:int;
		/**
		 * 寄存器个数 
		 */		
		public var local_count:int;
		public var init_scope_depth:int;
		/**
		 * 域栈是空的，最多可容纳元素个数 
		 */		
		public var max_scope_depth:int;
		public var code_length:int;
		/**
		 * 包含了指令 
		 */		
		public var code:ABCData; 
//		public var codes:Vector.<int>;
		public var exception_count:int;
		public var exceptions:Vector.<Exception_info>;
		public var trait_count:int;
		public var traits:Vector.<Traits_info>;
		
		public function Method_body_info(bt:ABCData=null)
		{
			exceptions = new Vector.<Exception_info>();
			traits = new Vector.<Traits_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			method = bt.readU32();
			max_stack = bt.readU32();
			local_count = bt.readU32();
			init_scope_depth = bt.readU32();
			max_scope_depth = bt.readU32();
			
			code_length = bt.readU32();
			
			code = new ABCData();
			code.endian = Endian.LITTLE_ENDIAN;
			bt.readBytes( code, 0, code_length );
			code.position = 0;
			
			exception_count = bt.readU32();
			
			var i:int = 0;
			
			for(i = 0; i < exception_count; i++)
			{
				exceptions.push( new Exception_info(bt) );
			}
			trait_count = bt.readU32();
			for(i = 0; i < trait_count; i++)
			{
				traits.push( new Traits_info(bt) );
			}
		
			getMethodInstruction();
		}
		
		/**
		 * 获取指令 
		 * 
		 */		
		public function getMethodInstruction():Array
		{
			var arrCode:Array = [];
			code.position = 0;
			while(code.bytesAvailable>0)
			{
				try
				{
					var opcode:int = code.readUnsignedByte();
					var instructionClass:Class = InstructionTypes.getInstructionClass(opcode);
					var instruction:BaseInstruction;
					if(instructionClass == O_getlocal_n || instructionClass == O_setlocal_n)
					{
						instruction = new instructionClass(opcode, code);
					}
					else
					{
						instruction = new instructionClass(code);
					}
					instruction.opcode = opcode;
					arrCode.push(instruction);
//					trace(instruction.opcode, instruction.opcodeName);
				}
				catch(err:*)
				{
					trace(opcode, "error");	
				}
				
			}
			
			return arrCode;
		}
		
		
	}
}