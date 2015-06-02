//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nestedIdentificationDivision -> NestedIdentificationDivision()
 * nodeOptional -> [ EnvironmentDivision() ]
 * nodeOptional1 -> [ DataDivision() ]
 * nodeOptional2 -> [ ProcedureDivision() ]
 * nodeListOptional -> ( NestedProgramUnit() )*
 * endProgramStatement -> EndProgramStatement()
 * </PRE>
 */
public class NestedProgramUnit extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NestedIdentificationDivision nestedIdentificationDivision;
   public NodeOptional nodeOptional;
   public NodeOptional nodeOptional1;
   public NodeOptional nodeOptional2;
   public NodeListOptional nodeListOptional;
   public EndProgramStatement endProgramStatement;

   public NestedProgramUnit(NestedIdentificationDivision n0, NodeOptional n1, NodeOptional n2, NodeOptional n3, NodeListOptional n4, EndProgramStatement n5) {
      nestedIdentificationDivision = n0;
      if ( nestedIdentificationDivision != null ) nestedIdentificationDivision.setParent(this);
      nodeOptional = n1;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeOptional1 = n2;
      if ( nodeOptional1 != null ) nodeOptional1.setParent(this);
      nodeOptional2 = n3;
      if ( nodeOptional2 != null ) nodeOptional2.setParent(this);
      nodeListOptional = n4;
      if ( nodeListOptional != null ) nodeListOptional.setParent(this);
      endProgramStatement = n5;
      if ( endProgramStatement != null ) endProgramStatement.setParent(this);
   }

   public NestedProgramUnit() {}

   public void accept(com.res.cobol.visitor.Visitor v) {
      v.visit(this);
   }
   public <R,A> R accept(com.res.cobol.visitor.GJVisitor<R,A> v, A argu) {
      return v.visit(this,argu);
   }
   public <R> R accept(com.res.cobol.visitor.GJNoArguVisitor<R> v) {
      return v.visit(this);
   }
   public <A> void accept(com.res.cobol.visitor.GJVoidVisitor<A> v, A argu) {
      v.visit(this,argu);
   }
   public void setParent(Node n) { parent = n; }
   public Node getParent()       { return parent; }
}
