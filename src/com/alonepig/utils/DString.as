package com.alonepig.utils
{
	import flash.utils.ByteArray;
	/**
	 * 解析字符串
	 * @author pw282
	 * 
	 */
	public class DString
	{
		public function DString()
		{
		}
		/**
		 *String UI8[zero or more] Non-null string character data
		 *StringEnd UI8 Marks end of string; always zero
		 */		
		public static function read(bt:ByteArray):String{
			var str:String = "";
			var position:int = bt.position;
			var btLen:int = bt.length;
			var strLen:int = 0;
			while(btLen > position + strLen){
				if(bt[position + strLen] == 0){
					break;
				}
				strLen ++;
			}
			if(strLen > 0){
				str = bt.readUTFBytes(strLen);
			}
			bt.position ++;
			return str;
		}
		public static function write(bt:ByteArray, v:String):void{
			bt.writeUTFBytes(v);
			bt.writeByte(0);
		}
	}
}