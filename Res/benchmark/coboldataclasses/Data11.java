package coboldataclasses;


/************************************************************************
 **This file automatically generated from Data Level DATA1 in program BUBBLE-SORT
 **Generated at time 13:58:54.73 on Tuesday, 10/06/09
 ************************************************************************/
import com.res.java.lib.*;
import java.math.BigInteger;

public class Data11 extends CobolBean {
	//@CobolSourceFile("Bubble-sort.cob",7,12) 
	//02 FILLER OCCURS 10240 TIMES.
	//@CobolSourceFile("SORT-ELEMENT.CPY",1,15) 
	//03 ELEMENT.
	public Element getElement(int idx1) {
                        return element[--idx1];

		//return super.getRef().toString(39*--idx1,39);
	}
	public  void setElement(Element val,int idx1) {
            element[--idx1]=val;
		//super.getRef().valueOf(39*--idx1,39,val);
	}
	//@CobolSourceFile("SORT-ELEMENT.CPY",2,15) 
	//05 ELEMENT1 PIC ************.
	public long getElement1(int idx1) {
            return element[--idx1].element1;
		//return super.getRef().getDisplayLong(39*--idx1,12,false,false,false);
	}
	public  void setElement1(long val,int idx1) {
            val=Math.abs(val);
            val=BigInteger.valueOf(val).remainder(BigInteger.TEN.pow(12)).longValue();
            element[--idx1].element1=val;
		//super.getRef().setDisplayLong(39*--idx1,12,val,false,false,false);
	}
	public static FieldFormat element1Fmt_ = new FieldFormat("element1","************");
	//@CobolSourceFile("SORT-ELEMENT.CPY",3,15) 
	//05 ELEMENT2 PIC 9(12) COMP.
	public long getElement2(int idx1) {
            return element[--idx1].element2;
		//return super.getRef().getBinaryLong(39*--idx1+12,8);
	}
	public  void setElement2(long val,int idx1) {
            element[--idx1].element2=val;
		//super.getRef().setBinaryLong(39*--idx1+12,8,val,false);
	}
	public static FieldFormat element2Fmt_ = new FieldFormat("element2","9(12)");
	//@CobolSourceFile("SORT-ELEMENT.CPY",4,15) 
	//05 ELEMENT3 PICTURE IS XXXX9999(12).

    private Element element[]=new Element[102400];
	public String getElement3(int idx1) {
            return element[--idx1].element3;
		//return super.getRef().toString(39*--idx1+20,19);
	}
	public  void setElement3(String val,int idx1) {
            element[--idx1].element3=val;
		//super.getRef().valueOf(39*--idx1+20,19,val);
	}
	public static FieldFormat element3Fmt_ = new FieldFormat("element3","XXXX9999(12)");
	public Data11() {
		for(int i=0;i<element.length;++i) {
                    element[i]=new Element();
                }
	}
	public Data11(CobolBytes b) {//For redefines
		//super(b);
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
		CobolBytes bytes_=new CobolBytes(399360);
		//bytes_.valueOf(0,399360,super.getRef().getBytes(),0);;
		return bytes_.getBytes();
	}
	public void valueOf(byte[] val) {
		//CobolBytes bytes_=new CobolBytes(super.getBytes(val,399360));
		//super.getRef().valueOf(0,399360,bytes_.getBytes(),0);
	}
}
