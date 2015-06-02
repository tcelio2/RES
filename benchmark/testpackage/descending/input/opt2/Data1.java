package testpackage.descending.input.opt2;
/************************************************************************
 **This file automatically generated from Data Level DATA1 in program BUBBLE-SORT in source file BUBBLE-SORT2.COB
 **Generated at time 23:40:59.90 on Friday, 01/15/10
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
		CobolBytes bytes_=new CobolBytes(45);
		bytes_.setDisplayLong(0,13,getElement1(idx1),true,false,false);
		bytes_.setDisplayLong(13,13,getElement2(idx1),true,false,false);
		bytes_.valueOf(26,19,getElement3(idx1));
		return bytes_.getBytes();
	}
	public void setElement(byte[] val,int idx1) {
		CobolBytes bytes_=new CobolBytes(val,45);
		setElement1(bytes_.getDisplayLong(0,13,true,false,false),idx1);
		setElement2(bytes_.getDisplayLong(13,13,true,false,false),idx1);
		setElement3(bytes_.toString(26,19),idx1);
	}
	//@CobolSourceFile("SORT-ELEMENT3.CPY",2,15) 
	//05 ELEMENT1 PIC S9(12) .
	private long[] element1= new long[10240];;
	public long getElement1(int idx1) {
		return element1[--idx1];
	}
	public  void setElement1(long val,int idx1) {
		element1[--idx1]=super.normalizeBinary(val,12,true);
	}
	public static FieldFormat element1Fmt_ = new FieldFormat("element1","S9(12)");
	//@CobolSourceFile("SORT-ELEMENT3.CPY",3,15) 
	//05 ELEMENT2 PIC S9(12) .
	private long[] element2= new long[10240];;
	public long getElement2(int idx1) {
		return element2[--idx1];
	}
	public  void setElement2(long val,int idx1) {
		element2[--idx1]=super.normalizeBinary(val,12,true);
	}
	public static FieldFormat element2Fmt_ = new FieldFormat("element2","S9(12)");
	//@CobolSourceFile("SORT-ELEMENT3.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	private String[] element3= new String[10240];
	public String getElement3(int idx1) {
		return element3[--idx1];
	}
	public  void setElement3(String val,int idx1) {
		element3[--idx1]=val;
	}
	public static FieldFormat element3Fmt_ = new FieldFormat("element3","XXXX9999(12)");
	public void initialize() {
	}
	public Data1() {
		super();
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
		for(int idx1=1;idx1<=10240;++idx1) {
			bytes_.valueOf(100+45*--idx1,45,getElement(++idx1),0);;
		}
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		CobolBytes bytes_=new CobolBytes(val,460900);
		setDummyElement(bytes_.toString(0,100));
		for(int idx1=1;idx1<=10240;++idx1) {
			setElement(bytes_.getBytes(100+45*--idx1,45),++idx1);
		}
	}
}
