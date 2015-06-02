package testpackage.ascending.input.opt1;
/************************************************************************
 **This file automatically generated from Data Level TEMP-ELEMENT in program BUBBLE-SORT in source file BUBBLE-SORT2.COB
 **Generated at time 23:35:09.38 on Friday, 01/15/10
 ************************************************************************/

import com.res.java.lib.*;
import java.math.BigDecimal;

public class TempElement extends CobolBean {
	//@CobolSourceFile("SORT-ELEMENT3.CPY",1,15) 
	//03 ELEMENT.
	public byte[] getElement() {
		return super.getBytes(0,45);
	}
	public  void setElement(byte[] val) {
		super.valueOf(0,45,val,0);;
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",2,15) 
	//05 ELEMENT1 PIC S9(12) .
	public long getElement1() {
		return super.getDisplayLong(0,13,true,false,false);
	}
	public  void setElement1(long val) {
		super.setDisplayLong(0,13,val,true,false,false);
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",3,15) 
	//05 ELEMENT2 PIC S9(12) .
	public long getElement2() {
		return super.getDisplayLong(13,13,true,false,false);
	}
	public  void setElement2(long val) {
		super.setDisplayLong(13,13,val,true,false,false);
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	public String getElement3() {
		return super.toString(26,19);
	}
	public  void setElement3(String val) {
		super.valueOf(26,19,val);
	}
	public void initialize() {
	}
	public TempElement() {
		super(new CobolBytes(45));
	}
	public TempElement(CobolBytes b) {//For redefines
		super(b);
	}
	public String toString() {
		return new String(getBytes());
	}
	public void valueOf(String val) {//Bytes Vs. Chars
		valueOf(val.getBytes());
	}
	public byte[] getBytes() {
		CobolBytes bytes_=new CobolBytes(45);
		bytes_.valueOf(0,45,super.getBytes(0,45),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		CobolBytes bytes_=new CobolBytes(val,45);
		super.valueOf(0,45,bytes_.getBytes(0,45),0);;
	}
}
