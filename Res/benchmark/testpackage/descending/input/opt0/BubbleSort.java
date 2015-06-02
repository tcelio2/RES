package testpackage.descending.input.opt0;
/************************************************************************
 **This file automatically generated from Cobol program BUBBLE-SORT in source file BUBBLE-SORT2.COB
 **Generated at time 23:13:44.27 on Friday, 01/15/10
 ************************************************************************/
import testpackage.descending.input.opt0.Data1;
import testpackage.descending.input.opt0.TempElement;

import com.res.java.lib.*;
import java.math.BigDecimal;

public class BubbleSort extends Program {

	//*>=======================
	//@CobolSourceFile("Bubble-sort2.cob",6,8) 
	//01  DATA1.
	private Data1 data1 = new Data1();
	public byte[] getData1() {
		return data1.getBytes();
	}
	public void setData1(byte[] val) {
		data1.valueOf(val);
	}
	//@CobolSourceFile("Bubble-sort2.cob",10,8) 
	//77  COUNT1 PIC 9(12) COMP VALUE 1.
	public long getCount1() {
		return super.getBinaryLong(0,12);
	}
	public  void setCount1(long val) {
		super.setBinaryLong(0,12,val,false);
	}
	public static FieldFormat count1Fmt_ = new FieldFormat("count1","9(12)");
	//@CobolSourceFile("Bubble-sort2.cob",11,8) 
	//77  TEMP1 PIC 9(12) COMP VALUE 2.
	public long getTemp1() {
		return super.getBinaryLong(8,12);
	}
	public  void setTemp1(long val) {
		super.setBinaryLong(8,12,val,false);
	}
	//@CobolSourceFile("Bubble-sort2.cob",12,8) 
	//77  TEMP2 PIC 9(12) COMP VALUE 3.
	public long getTemp2() {
		return super.getBinaryLong(16,12);
	}
	public  void setTemp2(long val) {
		super.setBinaryLong(16,12,val,false);
	}
	//@CobolSourceFile("Bubble-sort2.cob",13,8) 
	//77  TEMP3 PIC 9(12) COMP VALUE 4.
	public long getTemp3() {
		return super.getBinaryLong(24,12);
	}
	public  void setTemp3(long val) {
		super.setBinaryLong(24,12,val,false);
	}
	//@CobolSourceFile("Bubble-sort2.cob",14,8) 
	//77  BEGIN PIC 9(12) COMP VALUE 4.
	public long getBegin() {
		return super.getBinaryLong(32,12);
	}
	public  void setBegin(long val) {
		super.setBinaryLong(32,12,val,false);
	}
	//@CobolSourceFile("Bubble-sort2.cob",15,8) 
	//77  FINISH PIC 9(12) COMP VALUE 4.
	public long getFinish() {
		return super.getBinaryLong(40,12);
	}
	public  void setFinish(long val) {
		super.setBinaryLong(40,12,val,false);
	}
	public static FieldFormat finishFmt_ = new FieldFormat("finish","9(12)");
	//@CobolSourceFile("Bubble-sort2.cob",16,8) 
	//01  TEMP-ELEMENT.
	private TempElement tempElement = new TempElement();
	public byte[] getTempElement() {
		return tempElement.getBytes();
	}
	public void setTempElement(byte[] val) {
		tempElement.valueOf(val);
	}
	public static void main(String[] args) {
		BubbleSort instance_ = new BubbleSort();
		instance_.initialize();
		instance_.doCobolGotoStart();
		System.exit(0);
	}
	Paragraph mainline=new Paragraph(this) {
		public CobolMethod run() {
		//@CobolSourceFile("Bubble-sort2.cob",22,13) 
		//Accept BEGIN from Time		
		setBegin(System.currentTimeMillis());
		//@CobolSourceFile("Bubble-sort2.cob",23,13) 
		//DISPLAY "Enter number of elements to Sort(less than 20)"		
		//        WITH NO ADVANCING		
		Console.print("Enter number of elements to Sort(less than 20)");
		//@CobolSourceFile("Bubble-sort2.cob",25,13) 
		//compute count1=10240		
		setCount1(10240);
		//@CobolSourceFile("Bubble-sort2.cob",26,13) 
		//IF count1 <= 0 THEN		
		//   next sentence		
		//else		
		//		... end-if		
		if(getCount1() <= 0) {
		} else {
			//@CobolSourceFile("Bubble-sort2.cob",29,16) 
			//if count1 > 10240 then			
			//else			
			//			... end-if			
			if(getCount1() > 10240) {
				//@CobolSourceFile("Bubble-sort2.cob",30,20) 
				//go to Mainline				
				return mainline;
			} else {
				//@CobolSourceFile("Bubble-sort2.cob",32,20) 
				//Perform Input-Elements				
				doCobolPerform(inputElements,null);
				//@CobolSourceFile("Bubble-sort2.cob",33,20) 
				//Perform Sort-Elements				
				doCobolPerform(sortElements,null);
			}
		}
		//@CobolSourceFile("Bubble-sort2.cob",36,14) 
		//Accept finish from Time		
		setFinish(System.currentTimeMillis());
		//@CobolSourceFile("Bubble-sort2.cob",37,14) 
		//compute finish=finish - BEGIN		
		setFinish(getFinish()-getBegin());
		//@CobolSourceFile("Bubble-sort2.cob",38,14) 
		//Display "Time Taken: "  finish  "ms"		
		Console.println("Time Taken: "+finishFmt_.format(getFinish())+"ms");
		//@CobolSourceFile("Bubble-sort2.cob",39,13) 
		//Stop run		
		System.exit(0);
		return doCobolExit();
		}
	};
	Paragraph inputElements=new Paragraph(this) {
		public CobolMethod run() {
		//@CobolSourceFile("Bubble-sort2.cob",41,12) 
		//COMPUTE TEMP1 = 1		
		setTemp1(1);
		//@CobolSourceFile("Bubble-sort2.cob",42,12) 
		//Perform count1 times		
		//		...END-PERFORM		
		for(int i0=0;i0<getCount1();++i0) {
			//@CobolSourceFile("Bubble-sort2.cob",43,20) 
			//compute ELEMENT1 of data1(temp1)=-temp1			
			data1.setElement1(-getTemp1(),(int)getTemp1());
			//@CobolSourceFile("Bubble-sort2.cob",44,20) 
			//Move zeros to element2 of data1(temp1)			
			data1.setElement2(0,(int)getTemp1());
			//@CobolSourceFile("Bubble-sort2.cob",45,20) 
			//Move spaces to element3 of  data1(temp1)			
			data1.setElement3(Data1.element3Fmt_.format(" "),(int)getTemp1());
			//@CobolSourceFile("Bubble-sort2.cob",46,20) 
			//ADD 1 TO TEMP1			
			setTemp1(1 + getTemp1());
			//@CobolSourceFile("Bubble-sort2.cob",47,20) 
			//DISPLAY " "			
			Console.println(" ");
		}
		//@CobolSourceFile("Bubble-sort2.cob",50,12) 
		//COMPUTE TEMP1=1		
		setTemp1(1);
		//@CobolSourceFile("Bubble-sort2.cob",51,12) 
		//Display "You Entered the following " count1		
		//         "number of elements"		
		Console.println("You Entered the following "+count1Fmt_.format(getCount1())+"number of elements");
		//@CobolSourceFile("Bubble-sort2.cob",53,12) 
		//Display '(' with no advancing		
		Console.print("(");
		//@CobolSourceFile("Bubble-sort2.cob",54,12) 
		//Perform count1 times		
		//		...END-PERFORM		
		for(int i1=0;i1<getCount1();++i1) {
			//@CobolSourceFile("Bubble-sort2.cob",55,20) 
			//Display "("  ELEMENT1 of data1 (temp1)			
			//    with no advancing			
			Console.print("("+Data1.element1Fmt_.format(data1.getElement1((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",57,20) 
			//Display ","  ELEMENT2 of data1 (temp1)			
			//    with no advancing			
			Console.print(","+Data1.element2Fmt_.format(data1.getElement2((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",59,20) 
			//Display ","  ELEMENT3 of data1 (temp1)			
			//    with no advancing			
			Console.print(","+Data1.element3Fmt_.format(data1.getElement3((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",61,20) 
			//if temp1 not = count1			
			if(getTemp1() != getCount1()) {
				//@CobolSourceFile("Bubble-sort2.cob",62,23) 
				//display '),'				
				Console.println("),");
				//@CobolSourceFile("Bubble-sort2.cob",63,20) 
				//ADD 1 TO TEMP1				
				setTemp1(1 + getTemp1());
			}
		}
		//@CobolSourceFile("Bubble-sort2.cob",65,12) 
		//Display ')'		
		Console.println(")");
		return doCobolExit();
		}
	};
	Paragraph sortElements=new Paragraph(this) {
		public CobolMethod run() {
		//@CobolSourceFile("Bubble-sort2.cob",67,12) 
		//Perform varying temp1 from 1 by 1 until temp1 > count1		
		//		...end-perform		
		for(setTemp1(1);getTemp1() <= getCount1();setTemp1(getTemp1()+1)) {
			//@CobolSourceFile("Bubble-sort2.cob",68,16) 
			//COMPUTE temp3=temp1 + 1			
			setTemp3(getTemp1()+1);
			//@CobolSourceFile("Bubble-sort2.cob",69,16) 
			//perform varying temp2 from temp3 by 1			
			//   until temp2>count1			
			//			...end-perform			
			for(setTemp2(getTemp3());getTemp2() <= getCount1();setTemp2(getTemp2()+1)) {
				//@CobolSourceFile("Bubble-sort2.cob",71,24) 
				//if ELEMENT1 of data1 (temp2) less than				
				//    ELEMENT1 of data1 (temp1) then				
				//				...end-if				
				if(data1.getElement1((int)getTemp2()) < data1.getElement1((int)getTemp1())) {
					//@CobolSourceFile("Bubble-sort2.cob",73,28) 
					//MOVE ELEMENT of data1 (temp2) TO ELEMENT					
					//   of temp-element					
					tempElement.setElement(data1.getElement((int)getTemp2()));
					//@CobolSourceFile("Bubble-sort2.cob",75,28) 
					//MOVE ELEMENT of data1 (temp1) TO					
					//   ELEMENT of data1 (temp2)					
					data1.setElement(data1.getElement((int)getTemp1()),(int)getTemp2());
					//@CobolSourceFile("Bubble-sort2.cob",77,28) 
					//MOVE ELEMENT of temp-element TO					
					//   ELEMENT of data1 (temp1)					
					data1.setElement(tempElement.getElement(),(int)getTemp1());
				}
			}
		}
		//@CobolSourceFile("Bubble-sort2.cob",82,12) 
		//COMPUTE TEMP1=1		
		setTemp1(1);
		//@CobolSourceFile("Bubble-sort2.cob",83,12) 
		//Display "The sorted data is " count1		
		//         "number of elements"		
		Console.println("The sorted data is "+count1Fmt_.format(getCount1())+"number of elements");
		//@CobolSourceFile("Bubble-sort2.cob",85,12) 
		//Display '(' with no advancing		
		Console.print("(");
		//@CobolSourceFile("Bubble-sort2.cob",86,12) 
		//Perform count1 times		
		//		...END-PERFORM		
		for(int i2=0;i2<getCount1();++i2) {
			//@CobolSourceFile("Bubble-sort2.cob",87,20) 
			//Display "("  ELEMENT1 of data1 (temp1)			
			//    with no advancing			
			Console.print("("+Data1.element1Fmt_.format(data1.getElement1((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",89,20) 
			//Display ","  ELEMENT2 of data1 (temp1)			
			//    with no advancing			
			Console.print(","+Data1.element2Fmt_.format(data1.getElement2((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",91,20) 
			//Display ","  ELEMENT3 of data1 (temp1)			
			//    with no advancing			
			Console.print(","+Data1.element3Fmt_.format(data1.getElement3((int)getTemp1())));
			//@CobolSourceFile("Bubble-sort2.cob",93,20) 
			//if temp1 not = count1			
			if(getTemp1() != getCount1()) {
				//@CobolSourceFile("Bubble-sort2.cob",94,23) 
				//display '),'				
				Console.println("),");
				//@CobolSourceFile("Bubble-sort2.cob",95,20) 
				//ADD 1 TO TEMP1				
				setTemp1(1 + getTemp1());
			}
		}
		//@CobolSourceFile("Bubble-sort2.cob",97,12) 
		//Display '))'		
		Console.println("))");
		return doCobolExit();
		}
	};
	private BubbleSort() {
		super(new CobolBytes(48));
	}
	private void initialize() {
		data1.initialize();
		setCount1(1);
		setTemp1(2);
		setTemp2(3);
		setTemp3(4);
		setBegin(4);
		setFinish(4);
		tempElement.initialize();
	}
}
