package testpackage.ascending.input.opt2;
/************************************************************************
 **This file automatically generated from Data Level TEMP-ELEMENT in program BUBBLE-SORT in source file BUBBLE-SORT2.COB
 **Generated at time 23:40:59.95 on Friday, 01/15/10
 ************************************************************************/

import com.res.java.lib.*;
import java.math.BigDecimal;

public class TempElement extends CobolBean {
	//@CobolSourceFile("SORT-ELEMENT3.CPY",1,15) 
	//03 ELEMENT.
	public byte[] getElement() {
		CobolBytes bytes_=new CobolBytes(45);
		bytes_.setDisplayLong(0,13,getElement1(),true,false,false);
		bytes_.setDisplayLong(13,13,getElement2(),true,false,false);
		bytes_.valueOf(26,19,getElement3());
		return bytes_.getBytes();
	}
	public void setElement(byte[] val) {
		CobolBytes bytes_=new CobolBytes(val,45);
		setElement1(bytes_.getDisplayLong(0,13,true,false,false));
		setElement2(bytes_.getDisplayLong(13,13,true,false,false));
		setElement3(bytes_.toString(26,19));
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",2,15) 
	//05 ELEMENT1 PIC S9(12) .
	private long element1;
	public long getElement1() {
		return element1;
	}
	public  void setElement1(long val) {
		element1=super.normalizeBinary(val,12,true);
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",3,15) 
	//05 ELEMENT2 PIC S9(12) .
	private long element2;
	public long getElement2() {
		return element2;
	}
	public  void setElement2(long val) {
		element2=super.normalizeBinary(val,12,true);
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	private String element3= new String();
	public String getElement3() {
		return element3;
	}
	public  void setElement3(String val) {
		element3=val;
	}
	public void initialize() {
	}
	public TempElement() {
		super();
	}
	public String toString() {
		return new String(getBytes());
	}
	public void valueOf(String val) {//Bytes Vs. Chars
		valueOf(val.getBytes());
	}
	public byte[] getBytes() {
		CobolBytes bytes_=new CobolBytes(45);
		bytes_.valueOf(0,45,getElement(),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		CobolBytes bytes_=new CobolBytes(val,45);
		setElement(bytes_.getBytes(0,45));
	}
}
