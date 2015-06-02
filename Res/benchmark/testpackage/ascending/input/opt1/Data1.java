package testpackage.ascending.input.opt1;
/************************************************************************
 **This file automatically generated from Data Level DATA1 in program BUBBLE-SORT in source file BUBBLE-SORT2.COB
 **Generated at time 23:35:09.35 on Friday, 01/15/10
 ************************************************************************/

import com.res.java.lib.*;
import java.math.BigDecimal;

public class Data1 extends CobolBean {
	//@CobolSourceFile("Bubble-sort2.cob",7,12) 
	//02 DUMMY-ELEMENT PIC X(100).
	private String dummyElement= new String();
	public String getDummyElement() {
		return dummyElement;
	}
	public  void setDummyElement(String val) {
		dummyElement=val;
	}
	//@CobolSourceFile("Bubble-sort2.cob",8,12) 
	//02 FILLER OCCURS 10240 TIMES.
	//@CobolSourceFile("SORT-ELEMENT3.CPY",1,15) 
	//03 ELEMENT.
	public byte[] getElement(int idx1) {
		return super.getBytes(45*--idx1,45);
	}
	public  void setElement(byte[] val,int idx1) {
		super.valueOf(45*--idx1,45,val,0);;
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",2,15) 
	//05 ELEMENT1 PIC S9(12) .
	public long getElement1(int idx1) {
		return super.getDisplayLong(45*--idx1,13,true,false,false);
	}
	public  void setElement1(long val,int idx1) {
		super.setDisplayLong(45*--idx1,13,val,true,false,false);
	}
	public static FieldFormat element1Fmt_ = new FieldFormat("element1","S9(12)");
	//@CobolSourceFile("SORT-ELEMENT3.CPY",3,15) 
	//05 ELEMENT2 PIC S9(12) .
	public long getElement2(int idx1) {
		return super.getDisplayLong(45*--idx1+13,13,true,false,false);
	}
	public  void setElement2(long val,int idx1) {
		super.setDisplayLong(45*--idx1+13,13,val,true,false,false);
	}
	public static FieldFormat element2Fmt_ = new FieldFormat("element2","S9(12)");
	//@CobolSourceFile("SORT-ELEMENT3.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	public String getElement3(int idx1) {
		return super.toString(45*--idx1+26,19);
	}
	public  void setElement3(String val,int idx1) {
		super.valueOf(45*--idx1+26,19,val);
	}
	public static FieldFormat element3Fmt_ = new FieldFormat("element3","XXXX9999(12)");
	public void initialize() {
	}
	public Data1() {
		super(new CobolBytes(460800));
	}
	public Data1(CobolBytes b) {//For redefines
		super(b);
	}
	public String toString() {
		return new String(getBytes());
	}
	public void valueOf(String val) {//Bytes Vs. Chars
		valueOf(val.getBytes());
	}
	public byte[] getBytes() {
		CobolBytes bytes_=new CobolBytes(460900);
		bytes_.valueOf(0,100,getDummyElement());
		bytes_.valueOf(100,460800,super.getBytes(0,460800),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		CobolBytes bytes_=new CobolBytes(val,460900);
		setDummyElement(bytes_.toString(0,100));
		super.valueOf(0,460800,bytes_.getBytes(100,460800),0);;
	}
}
