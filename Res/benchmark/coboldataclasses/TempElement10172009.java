package coboldataclasses;
/************************************************************************
 **This file automatically generated from Data Level TEMP-ELEMENT in program BUBBLE-SORT
 **Generated at time 08:14:33.90 on Tuesday, 10/13/09
 ************************************************************************/
import coboldataclasses.cacherig.*;

import com.res.java.lib.*;
import java.math.BigDecimal;

public class TempElement10172009 extends CobolBeanWired {
	//@CobolSourceFile("SORT-ELEMENT.CPY",1,15) 
	//03 ELEMENT.
	public byte[] getElement() {
		return super.getRef().getBytes(0,39);
	}
	public  void setElement(byte[] val) {
		super.getRef().valueOf(0,39,val,0);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",2,15) 
	//05 ELEMENT1 PIC ************.
	public long getElement1() {
		return super.getRef().getDisplayLong(0,12,false,false,false);
	}
	public  void setElement1(long val) {
		super.getRef().setDisplayLong(0,12,val,false,false,false);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",3,15) 
	//05 ELEMENT2 PIC 9(12) COMP.
	public long getElement2() {
		return super.getRef().getBinaryLong(12,8);
	}
	public  void setElement2(long val) {
		super.getRef().setBinaryLong(12,8,val,false);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	public String getElement3() {
		return super.getRef().toString(20,19);
	}
	public  void setElement3(String val) {
		super.getRef().valueOf(20,19,val);
	}
	public static FieldFormat element3Fmt_ = new FieldFormat("element3","XXXX9999(12)");
	public TempElement10172009() {
		super(new CobolBytesWired(39));
	}
	public TempElement10172009(CobolBytesWired b) {//For redefines
		super(b);
	}
	public CobolBytesWired getRef() {
		return super.getRef();
	}
	public String toString() {
		return new String(getBytes());
	}
	public void valueOf(String val) {//Bytes Vs. Chars
		valueOf(val.getBytes());
	}
	public byte[] getBytes() {
		CobolBytes bytes_=new CobolBytes(39);
		bytes_.valueOf(0,39,super.getRef().getBytes(),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		CobolBytesWired bytes_=new CobolBytesWired(super.getBytes(val,39));
		super.getRef().valueOf(0,39,bytes_.getBytes(),0);
	}
}
