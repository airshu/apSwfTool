package com.alonepig.swf.records.actions
{
	import com.alonepig.swf.records.actions.swf3.ActionGetURL;
	import com.alonepig.swf.records.actions.swf3.ActionGotoFrame;
	import com.alonepig.swf.records.actions.swf3.ActionGotoLabel;
	import com.alonepig.swf.records.actions.swf3.ActionNextFrame;
	import com.alonepig.swf.records.actions.swf3.ActionPlay;
	import com.alonepig.swf.records.actions.swf3.ActionPreviousFrame;
	import com.alonepig.swf.records.actions.swf3.ActionSetTarget;
	import com.alonepig.swf.records.actions.swf3.ActionStop;
	import com.alonepig.swf.records.actions.swf3.ActionStopSounds;
	import com.alonepig.swf.records.actions.swf3.ActionToggleQuality;
	import com.alonepig.swf.records.actions.swf3.ActionWaitForFrame;
	import com.alonepig.swf.records.actions.swf4.ActionAdd;
	import com.alonepig.swf.records.actions.swf4.ActionAnd;
	import com.alonepig.swf.records.actions.swf4.ActionAsciiToChar;
	import com.alonepig.swf.records.actions.swf4.ActionCall;
	import com.alonepig.swf.records.actions.swf4.ActionCharToAscii;
	import com.alonepig.swf.records.actions.swf4.ActionCloneSprite;
	import com.alonepig.swf.records.actions.swf4.ActionDivide;
	import com.alonepig.swf.records.actions.swf4.ActionEndDrag;
	import com.alonepig.swf.records.actions.swf4.ActionEquals;
	import com.alonepig.swf.records.actions.swf4.ActionGetProperty;
	import com.alonepig.swf.records.actions.swf4.ActionGetTime;
	import com.alonepig.swf.records.actions.swf4.ActionGetURL2;
	import com.alonepig.swf.records.actions.swf4.ActionGetVariable;
	import com.alonepig.swf.records.actions.swf4.ActionGotoFrame2;
	import com.alonepig.swf.records.actions.swf4.ActionIf;
	import com.alonepig.swf.records.actions.swf4.ActionJump;
	import com.alonepig.swf.records.actions.swf4.ActionLess;
	import com.alonepig.swf.records.actions.swf4.ActionMBAsciiToChar;
	import com.alonepig.swf.records.actions.swf4.ActionMBCharToAscii;
	import com.alonepig.swf.records.actions.swf4.ActionMBStringExtract;
	import com.alonepig.swf.records.actions.swf4.ActionMBStringLength;
	import com.alonepig.swf.records.actions.swf4.ActionMultiply;
	import com.alonepig.swf.records.actions.swf4.ActionNot;
	import com.alonepig.swf.records.actions.swf4.ActionOr;
	import com.alonepig.swf.records.actions.swf4.ActionPop;
	import com.alonepig.swf.records.actions.swf4.ActionPush;
	import com.alonepig.swf.records.actions.swf4.ActionRandomNumber;
	import com.alonepig.swf.records.actions.swf4.ActionRemoveSprite;
	import com.alonepig.swf.records.actions.swf4.ActionSetProperty;
	import com.alonepig.swf.records.actions.swf4.ActionSetTarget2;
	import com.alonepig.swf.records.actions.swf4.ActionSetVariable;
	import com.alonepig.swf.records.actions.swf4.ActionStartDrag;
	import com.alonepig.swf.records.actions.swf4.ActionStringAdd;
	import com.alonepig.swf.records.actions.swf4.ActionStringEquals;
	import com.alonepig.swf.records.actions.swf4.ActionStringExtract;
	import com.alonepig.swf.records.actions.swf4.ActionStringLength;
	import com.alonepig.swf.records.actions.swf4.ActionStringLess;
	import com.alonepig.swf.records.actions.swf4.ActionSubtract;
	import com.alonepig.swf.records.actions.swf4.ActionToInteger;
	import com.alonepig.swf.records.actions.swf4.ActionTrace;
	import com.alonepig.swf.records.actions.swf4.ActionWaitForFrame2;
	import com.alonepig.swf.records.actions.swf5.ActionAdd2;
	import com.alonepig.swf.records.actions.swf5.ActionBitAnd;
	import com.alonepig.swf.records.actions.swf5.ActionBitLShift;
	import com.alonepig.swf.records.actions.swf5.ActionBitOr;
	import com.alonepig.swf.records.actions.swf5.ActionBitRShift;
	import com.alonepig.swf.records.actions.swf5.ActionBitURShift;
	import com.alonepig.swf.records.actions.swf5.ActionBitXor;
	import com.alonepig.swf.records.actions.swf5.ActionCallFunction;
	import com.alonepig.swf.records.actions.swf5.ActionCallMethod;
	import com.alonepig.swf.records.actions.swf5.ActionConstantPool;
	import com.alonepig.swf.records.actions.swf5.ActionDecrement;
	import com.alonepig.swf.records.actions.swf5.ActionDefineFunction;
	import com.alonepig.swf.records.actions.swf5.ActionDefineLocal;
	import com.alonepig.swf.records.actions.swf5.ActionDefineLocal2;
	import com.alonepig.swf.records.actions.swf5.ActionDelete;
	import com.alonepig.swf.records.actions.swf5.ActionDelete2;
	import com.alonepig.swf.records.actions.swf5.ActionEnumerate;
	import com.alonepig.swf.records.actions.swf5.ActionEquals2;
	import com.alonepig.swf.records.actions.swf5.ActionGetMember;
	import com.alonepig.swf.records.actions.swf5.ActionIncrement;
	import com.alonepig.swf.records.actions.swf5.ActionInitArray;
	import com.alonepig.swf.records.actions.swf5.ActionInitObject;
	import com.alonepig.swf.records.actions.swf5.ActionLess2;
	import com.alonepig.swf.records.actions.swf5.ActionModulo;
	import com.alonepig.swf.records.actions.swf5.ActionNewMethod;
	import com.alonepig.swf.records.actions.swf5.ActionNewObject;
	import com.alonepig.swf.records.actions.swf5.ActionPushDuplicate;
	import com.alonepig.swf.records.actions.swf5.ActionReturn;
	import com.alonepig.swf.records.actions.swf5.ActionSetMember;
	import com.alonepig.swf.records.actions.swf5.ActionStackSwap;
	import com.alonepig.swf.records.actions.swf5.ActionStoreRegister;
	import com.alonepig.swf.records.actions.swf5.ActionTargetPath;
	import com.alonepig.swf.records.actions.swf5.ActionToNumber;
	import com.alonepig.swf.records.actions.swf5.ActionToString;
	import com.alonepig.swf.records.actions.swf5.ActionTypeOf;
	import com.alonepig.swf.records.actions.swf5.ActionWith;
	import com.alonepig.swf.records.actions.swf6.ActionEnumerate2;
	import com.alonepig.swf.records.actions.swf6.ActionGreater;
	import com.alonepig.swf.records.actions.swf6.ActionInstanceOf;
	import com.alonepig.swf.records.actions.swf6.ActionStrictEquals;
	import com.alonepig.swf.records.actions.swf6.ActionStringGreater;
	import com.alonepig.swf.records.actions.swf7.ActionCastOp;
	import com.alonepig.swf.records.actions.swf7.ActionDefineFunction2;
	import com.alonepig.swf.records.actions.swf7.ActionExtends;
	import com.alonepig.swf.records.actions.swf7.ActionImplementsOp;
	import com.alonepig.swf.records.actions.swf7.ActionThrow;
	import com.alonepig.swf.records.actions.swf7.ActionTry;

	/**
	 * ActionRecord 工厂类 
	 * 
	 */	
	public class ActionRecordFactory
	{
		public function ActionRecordFactory()
		{
		}
		
		public static function create(code:uint, length:uint):ActionRecord
		{
			var actionRecord:ActionRecord;
			switch(code)
			{
				case ActionNextFrame.CODE:
					actionRecord = new ActionNextFrame();
					actionRecord.length = length;
					return actionRecord;
				case ActionPreviousFrame.CODE:
					actionRecord = new ActionPreviousFrame();
					actionRecord.length = length;
					return actionRecord;
				case ActionPlay.CODE:
					actionRecord = new ActionPlay();
					actionRecord.length = length;
					return actionRecord;
				case ActionStop.CODE:
					actionRecord = new ActionStop();
					actionRecord.length = length;
					return actionRecord;
				case ActionToggleQuality.CODE:
					actionRecord = new ActionToggleQuality();
					actionRecord.length = length;
					return actionRecord;
				case ActionStopSounds.CODE:
					actionRecord = new ActionStopSounds();
					actionRecord.length = length;
					return actionRecord;
				case ActionAdd.CODE:
					actionRecord = new ActionAdd();
					actionRecord.length = length;
					return actionRecord;
				case ActionSubtract.CODE:
					actionRecord = new ActionNextFrame();
					actionRecord.length = length;
					return actionRecord;
				case ActionMultiply.CODE:
					actionRecord = new ActionMultiply();
					actionRecord.length = length;
					return actionRecord;
				case ActionDivide.CODE:
					actionRecord = new ActionDivide();
					actionRecord.length = length;
					return actionRecord;
				case ActionEquals.CODE:
					actionRecord = new ActionEquals();
					actionRecord.length = length;
					return actionRecord;
				case ActionLess.CODE:
					actionRecord = new ActionLess();
					actionRecord.length = length;
					return actionRecord;
				case ActionAnd.CODE:
					actionRecord = new ActionAnd();
					actionRecord.length = length;
					return actionRecord;
				case ActionOr.CODE:
					actionRecord = new ActionOr();
					actionRecord.length = length;
					return actionRecord;
				case ActionNot.CODE:
					actionRecord = new ActionNot();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringEquals.CODE:
					actionRecord = new ActionStringEquals();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringLength.CODE:
					actionRecord = new ActionStringLength();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringExtract.CODE:
					actionRecord = new ActionStringExtract();
					actionRecord.length = length;
					return actionRecord;
				case ActionPop.CODE:
					actionRecord = new ActionPop();
					actionRecord.length = length;
					return actionRecord;
				case ActionToInteger.CODE:
					actionRecord = new ActionToInteger();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetVariable.CODE:
					actionRecord = new ActionGetVariable();
					actionRecord.length = length;
					return actionRecord;
				case ActionSetVariable.CODE:
					actionRecord = new ActionSetVariable();
					actionRecord.length = length;
					return actionRecord;
				case ActionSetTarget2.CODE:
					actionRecord = new ActionSetTarget2();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringAdd.CODE:
					actionRecord = new ActionStringAdd();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetProperty.CODE:
					actionRecord = new ActionGetProperty();
					actionRecord.length = length;
					return actionRecord;
				case ActionSetProperty.CODE:
					actionRecord = new ActionSetProperty();
					actionRecord.length = length;
					return actionRecord;
				case ActionCloneSprite.CODE:
					actionRecord = new ActionCloneSprite();
					actionRecord.length = length;
					return actionRecord;
				case ActionRemoveSprite.CODE:
					actionRecord = new ActionRemoveSprite();
					actionRecord.length = length;
					return actionRecord;
				case ActionTrace.CODE:
					actionRecord = new ActionTrace();
					actionRecord.length = length;
					return actionRecord;
				case ActionStartDrag.CODE:
					actionRecord = new ActionStartDrag();
					actionRecord.length = length;
					return actionRecord;
				case ActionEndDrag.CODE:
					actionRecord = new ActionEndDrag();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringLess.CODE:
					actionRecord = new ActionStringLess();
					actionRecord.length = length;
					return actionRecord;
				case ActionThrow.CODE:
					actionRecord = new ActionThrow();
					actionRecord.length = length;
					return actionRecord;
				case ActionCastOp.CODE:
					actionRecord = new ActionCastOp();
					actionRecord.length = length;
					return actionRecord;
				case ActionImplementsOp.CODE:
					actionRecord = new ActionImplementsOp();
					actionRecord.length = length;
					return actionRecord;
				case ActionRandomNumber.CODE:
					actionRecord = new ActionRandomNumber();
					actionRecord.length = length;
					return actionRecord;
				case ActionMBStringLength.CODE:
					actionRecord = new ActionMBStringLength();
					actionRecord.length = length;
					return actionRecord;
				case ActionCharToAscii.CODE:
					actionRecord = new ActionCharToAscii();
					actionRecord.length = length;
					return actionRecord;
				case ActionAsciiToChar.CODE:
					actionRecord = new ActionAsciiToChar();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetTime.CODE:
					actionRecord = new ActionGetTime();
					actionRecord.length = length;
					return actionRecord;
				case ActionMBStringExtract.CODE:
					actionRecord = new ActionMBStringExtract();
					actionRecord.length = length;
					return actionRecord;
				case ActionMBCharToAscii.CODE:
					actionRecord = new ActionMBCharToAscii();
					actionRecord.length = length;
					return actionRecord;
				case ActionMBAsciiToChar.CODE:
					actionRecord = new ActionMBAsciiToChar();
					actionRecord.length = length;
					return actionRecord;
				case ActionDelete.CODE:
					actionRecord = new ActionDelete();
					actionRecord.length = length;
					return actionRecord;
				case ActionDelete2.CODE:
					actionRecord = new ActionDelete2();
					actionRecord.length = length;
					return actionRecord;
				case ActionDefineLocal.CODE:
					actionRecord = new ActionDefineLocal();
					actionRecord.length = length;
					return actionRecord;
				case ActionCallFunction.CODE:
					actionRecord = new ActionCallFunction();
					actionRecord.length = length;
					return actionRecord;
				case ActionReturn.CODE:
					actionRecord = new ActionReturn();
					actionRecord.length = length;
					return actionRecord;
				case ActionModulo.CODE:
					actionRecord = new ActionModulo();
					actionRecord.length = length;
					return actionRecord;
				case ActionNewObject.CODE:
					actionRecord = new ActionNewObject();
					actionRecord.length = length;
					return actionRecord;
				case ActionDefineLocal2.CODE:
					actionRecord = new ActionDefineLocal2();
					actionRecord.length = length;
					return actionRecord;
				case ActionInitArray.CODE:
					actionRecord = new ActionInitArray();
					actionRecord.length = length;
					return actionRecord;
				case ActionInitObject.CODE:
					actionRecord = new ActionInitObject();
					actionRecord.length = length;
					return actionRecord;
				case ActionTypeOf.CODE:
					actionRecord = new ActionTypeOf();
					actionRecord.length = length;
					return actionRecord;
				case ActionTargetPath.CODE:
					actionRecord = new ActionTargetPath();
					actionRecord.length = length;
					return actionRecord;
				case ActionEnumerate.CODE:
					actionRecord = new ActionEnumerate();
					actionRecord.length = length;
					return actionRecord;
				case ActionAdd2.CODE:
					actionRecord = new ActionAdd2();
					actionRecord.length = length;
					return actionRecord;
				case ActionLess2.CODE:
					actionRecord = new ActionLess2();
					actionRecord.length = length;
					return actionRecord;
				case ActionEquals2.CODE:
					actionRecord = new ActionEquals2();
					actionRecord.length = length;
					return actionRecord;
				case ActionToNumber.CODE:
					actionRecord = new ActionToNumber();
					actionRecord.length = length;
					return actionRecord;
				case ActionToString.CODE:
					actionRecord = new ActionToString();
					actionRecord.length = length;
					return actionRecord;
				case ActionPushDuplicate.CODE:
					actionRecord = new ActionPushDuplicate();
					actionRecord.length = length;
					return actionRecord;
				case ActionStackSwap.CODE:
					actionRecord = new ActionStackSwap();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetMember.CODE:
					actionRecord = new ActionGetMember();
					actionRecord.length = length;
					return actionRecord;
				case ActionSetMember.CODE:
					actionRecord = new ActionSetMember();
					actionRecord.length = length;
					return actionRecord;
				case ActionIncrement.CODE:
					actionRecord = new ActionIncrement();
					actionRecord.length = length;
					return actionRecord;
				case ActionDecrement.CODE:
					actionRecord = new ActionDecrement();
					actionRecord.length = length;
					return actionRecord;
				case ActionCallMethod.CODE:
					actionRecord = new ActionCallMethod();
					actionRecord.length = length;
					return actionRecord;
				case ActionNewMethod.CODE:
					actionRecord = new ActionNewMethod();
					actionRecord.length = length;
					return actionRecord;
				case ActionInstanceOf.CODE:
					actionRecord = new ActionInstanceOf();
					actionRecord.length = length;
					return actionRecord;
				case ActionEnumerate2.CODE:
					actionRecord = new ActionEnumerate2();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitAnd.CODE:
					actionRecord = new ActionBitAnd();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitOr.CODE:
					actionRecord = new ActionBitOr();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitXor.CODE:
					actionRecord = new ActionBitXor();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitLShift.CODE:
					actionRecord = new ActionBitLShift();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitRShift.CODE:
					actionRecord = new ActionBitRShift();
					actionRecord.length = length;
					return actionRecord;
				case ActionBitURShift.CODE:
					actionRecord = new ActionBitURShift();
					actionRecord.length = length;
					return actionRecord;
				case ActionStrictEquals.CODE:
					actionRecord = new ActionStrictEquals();
					actionRecord.length = length;
					return actionRecord;
				case ActionGreater.CODE:
					actionRecord = new ActionGreater();
					actionRecord.length = length;
					return actionRecord;
				case ActionStringGreater.CODE:
					actionRecord = new ActionStringGreater();
					actionRecord.length = length;
					return actionRecord;
				case ActionExtends.CODE:
					actionRecord = new ActionExtends();
					actionRecord.length = length;
					return actionRecord;
				case ActionGotoFrame.CODE:
					actionRecord = new ActionGotoFrame();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetURL.CODE:
					actionRecord = new ActionGetURL();
					actionRecord.length = length;
					return actionRecord;
				case ActionStoreRegister.CODE:
					actionRecord = new ActionStoreRegister();
					actionRecord.length = length;
					return actionRecord;
				case ActionConstantPool.CODE:
					actionRecord = new ActionConstantPool();
					actionRecord.length = length;
					return actionRecord;
				case ActionWaitForFrame.CODE:
					actionRecord = new ActionWaitForFrame();
					actionRecord.length = length;
					return actionRecord;
				case ActionSetTarget.CODE:
					actionRecord = new ActionSetTarget();
					actionRecord.length = length;
					return actionRecord;
				case ActionGotoLabel.CODE:
					actionRecord = new ActionGotoLabel();
					actionRecord.length = length;
					return actionRecord;
				case ActionWaitForFrame2.CODE:
					actionRecord = new ActionWaitForFrame2();
					actionRecord.length = length;
					return actionRecord;
				case ActionDefineFunction2.CODE:
					actionRecord = new ActionDefineFunction2();
					actionRecord.length = length;
					return actionRecord;
				case ActionTry.CODE:
					actionRecord = new ActionTry();
					actionRecord.length = length;
					return actionRecord;
				case ActionWith.CODE:
					actionRecord = new ActionWith();
					actionRecord.length = length;
					return actionRecord;
				case ActionPush.CODE:
					actionRecord = new ActionPush();
					actionRecord.length = length;
					return actionRecord;
				case ActionJump.CODE:
					actionRecord = new ActionJump();
					actionRecord.length = length;
					return actionRecord;
				case ActionGetURL2.CODE:
					actionRecord = new ActionGetURL2();
					actionRecord.length = length;
					return actionRecord;
				case ActionDefineFunction.CODE:
					actionRecord = new ActionDefineFunction();
					actionRecord.length = length;
					return actionRecord;
				case ActionIf.CODE:
					actionRecord = new ActionIf();
					actionRecord.length = length;
					return actionRecord;
				case ActionCall.CODE:
					actionRecord = new ActionCall();
					actionRecord.length = length;
					return actionRecord;
				case ActionGotoFrame2.CODE:
					actionRecord = new ActionGotoFrame2();
					actionRecord.length = length;
					return actionRecord;
				
			}
			return null;
		}
		
		
		
		
		
		/**
		 * 根据actionCode值获取动作名称 
		 * @param code
		 * @return 
		 * 
		 */		
		public static function getActionName(code:int):String
		{
			switch(code)
			{
				case ActionNextFrame.CODE:
					return "ActionNextFrame";
				case ActionPreviousFrame.CODE:
					return "ActionPreviousFrame";
				case ActionPlay.CODE:
					return "ActionPlay";
				case ActionStop.CODE:
					return "ActionStop";
				case ActionToggleQuality.CODE:
					return "ActionToggleQuality";
				case ActionStopSounds.CODE:
					return "ActionStopSounds";
				case ActionAdd.CODE:
					return "ActionAdd";
				case ActionSubtract.CODE:
					return "ActionSubtract";
				case ActionMultiply.CODE:
					return "ActionMultiply";
				case ActionDivide.CODE:
					return "ActionDivide";
				case ActionEquals.CODE:
					return "ActionEquals";
				case ActionLess.CODE:
					return "ActionLess";
				case ActionAnd.CODE:
					return "ActionAnd";
				case ActionOr.CODE:
					return "ActionOr";
				case ActionNot.CODE:
					return "ActionNot";
				case ActionStringEquals.CODE:
					return "ActionStringEquals";
				case ActionStringLength.CODE:
					return "ActionStringLength";
				case ActionStringExtract.CODE:
					return "ActionStringExtract";
				case ActionPop.CODE:
					return "ActionPop";
				case ActionToInteger.CODE:
					return "ActionToInteger";
				case ActionGetVariable.CODE:
					return "ActionGetVariable";
				case ActionSetVariable.CODE:
					return "ActionSetVariable";
				case ActionSetTarget2.CODE:
					return "ActionSetTarget2";
				case ActionStringAdd.CODE:
					return "ActionSetTarget2";
				case ActionGetProperty.CODE:
					return "ActionGetProperty";
				case ActionSetProperty.CODE:
					return "ActionSetProperty";
				case ActionCloneSprite.CODE:
					return "ActionCloneSprite";
				case ActionRemoveSprite.CODE:
					return "ActionRemoveSprite";
				case ActionTrace.CODE:
					return "ActionTrace";
				case ActionStartDrag.CODE:
					return "ActionStartDrag";
				case ActionEndDrag.CODE:
					return "ActionEndDrag";
				case ActionStringLess.CODE:
					return "ActionStringLess";
				case ActionThrow.CODE:
					return "ActionThrow";
				case ActionCastOp.CODE:
					return "ActionCastOp";
				case ActionImplementsOp.CODE:
					return "ActionImplementsOp";
				case ActionRandomNumber.CODE:
					return "ActionImplementsOp";
				case ActionMBStringLength.CODE:
					return "ActionMBStringLength";
				case ActionCharToAscii.CODE:
					return "ActionCharToAscii";
				case ActionAsciiToChar.CODE:
					return "ActionAsciiToChar";
				case ActionGetTime.CODE:
					return "ActionGetTime";
				case ActionMBStringExtract.CODE:
					return "ActionMBStringExtract";
				case ActionMBCharToAscii.CODE:
					return "ActionMBCharToAscii";
				case ActionMBAsciiToChar.CODE:
					return "ActionMBAsciiToChar";
				case ActionDelete.CODE:
					return "ActionDelete";
				case ActionDelete2.CODE:
					return "ActionDelete2";
				case ActionDefineLocal.CODE:
					return "ActionDefineLocal";
				case ActionCallFunction.CODE:
					return "ActionCallFunction";
				case ActionReturn.CODE:
					return "ActionReturn";
				case ActionModulo.CODE:
					return "ActionModulo";
				case ActionNewObject.CODE:
					return "ActionNewObject";
				case ActionDefineLocal2.CODE:
					return "ActionDefineLocal2";
				case ActionInitArray.CODE:
					return "ActionInitArray";
				case ActionInitObject.CODE:
					return "ActionInitObject";
				case ActionTypeOf.CODE:
					return "ActionTypeOf";
				case ActionTargetPath.CODE:
					return "ActionTargetPath";
				case ActionEnumerate.CODE:
					return "ActionEnumerate";
				case ActionAdd2.CODE:
					return "ActionAdd2";
				case ActionLess2.CODE:
					return "ActionLess2";
				case ActionEquals2.CODE:
					return "ActionEquals2";
				case ActionToNumber.CODE:
					return "ActionToNumber";
				case ActionToString.CODE:
					return "ActionToString";
				case ActionPushDuplicate.CODE:
					return "ActionPushDuplicate";
				case ActionStackSwap.CODE:
					return "ActionStackSwap";
				case ActionGetMember.CODE:
					return "ActionGetMember";
				case ActionSetMember.CODE:
					return "ActionSetMember";
				case ActionIncrement.CODE:
					return "ActionIncrement";
				case ActionDecrement.CODE:
					return "ActionDecrement";
				case ActionCallMethod.CODE:
					return "ActionCallMethod";
				case ActionNewMethod.CODE:
					return "ActionNewMethod";
				case ActionInstanceOf.CODE:
					return "ActionInstanceOf";
				case ActionEnumerate2.CODE:
					return "ActionEnumerate2";
				case ActionBitAnd.CODE:
					return "ActionBitAnd";
				case ActionBitOr.CODE:
					return "ActionBitOr";
				case ActionBitXor.CODE:
					return "ActionBitXor";
				case ActionBitLShift.CODE:
					return "ActionBitLShift";
				case ActionBitRShift.CODE:
					return "ActionBitRShift";
				case ActionBitURShift.CODE:
					return "ActionBitURShift";
				case ActionStrictEquals.CODE:
					return "ActionStrictEquals";
				case ActionGreater.CODE:
					return "ActionGreater";
				case ActionStringGreater.CODE:
					return "ActionStringGreater";
				case ActionExtends.CODE:
					return "ActionExtends";
				case ActionGotoFrame.CODE:
					return "ActionGotoFrame";
				case ActionGetURL.CODE:
					return "ActionGetURL";
				case ActionStoreRegister.CODE:
					return "ActionStoreRegister";
				case ActionConstantPool.CODE:
					return "ActionConstantPool";
				case ActionWaitForFrame.CODE:
					return "ActionConstantPool";
				case ActionSetTarget.CODE:
					return "ActionSetTarget";
				case ActionGotoLabel.CODE:
					return "ActionGotoLabel";
				case ActionWaitForFrame2.CODE:
					return "ActionWaitForFrame2";
				case ActionDefineFunction2.CODE:
					return "ActionDefineFunction2";
				case ActionTry.CODE:
					return "ActionTry";
				case ActionWith.CODE:
					return "ActionWith";
				case ActionPush.CODE:
					return "ActionPush";
				case ActionJump.CODE:
					return "ActionJump";
				case ActionGetURL2.CODE:
					return "ActionGetURL2";
				case ActionDefineFunction.CODE:
					return "ActionDefineFunction";
				case ActionIf.CODE:
					return "ActionIf";
				case ActionCall.CODE:
					return "ActionCall";
				case ActionGotoFrame2.CODE:
					return "ActionGotoFrame2";
					
			}
			return null;
		}
	}
}