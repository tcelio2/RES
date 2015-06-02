package coboldataclasses;


/************************************************************************
 **This file automatically generated from Data Level TEMP-ELEMENT in program BUBBLE-SORT
 **Generated at time 13:58:54.75 on Tuesday, 10/06/09
 ************************************************************************/
import com.res.java.lib.*;
import java.math.BigDecimal;

public class TempElement1 extends CobolBean {
	//@CobolSourceFile("SORT-ELEMENT.CPY",1,15) 
	//03 ELEMENT.
 
    private Element element=new Element();
	public Element getElement() {
            return element;
		//return super.getRef().toString(0,39);
	}
	public  void setElement(Element val) {
            element=val;
		//super.getRef().valueOf(0,39,val);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",2,15) 
	//05 ELEMENT1 PIC ************.
	public long getElement1() {
            return element.element1;
		//return super.getRef().getDisplayLong(0,12,false,false,false);
	}
	public  void setElement1(long val) {
            element.element1=val;
		//super.getRef().setDisplayLong(0,12,val,false,false,false);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",3,15) 
	//05 ELEMENT2 PIC 9(12) COMP.
	public long getElement2() {
            return element.element2;
		//return super.getRef().getBinaryLong(12,8);
	}
	public  void setElement2(long val) {
            element.element2=val;
		//super.getRef().setBinaryLong(12,8,val,false);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).
	public String getElement3() {
            return element.element3;
		//return super.getRef().toString(20,19);
	}
	public  void setElement3(String val) {
            element.element3=val;
		super.valueOf(20,19,val);
	}
	public static FieldFormat element3Fmt_ = new FieldFormat("element3","XXXX9999(12)");
	public TempElement1() {
		super(new CobolBytes(39));
	}
	public TempElement1(CobolBytes b) {//For redefines
		super(b);
	}
	public CobolBytes getRef() {
		return this;//.getRef();
	}
	public String toString() {
		return new String(getBytes());
	}
	public void valueOf(String val) {//Bytes Vs. Chars
		valueOf(val.getBytes());
	}
	public byte[] getBytes() {
		CobolBytes bytes_=new CobolBytes(39);
		//bytes_.valueOf(0,39,super.getRef().getBytes(),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		//CobolBytes bytes_=new CobolBytes(super.getBytes(val,39));
		//super.getRef().valueOf(0,39,bytes_.getBytes(),0);
	}
}
