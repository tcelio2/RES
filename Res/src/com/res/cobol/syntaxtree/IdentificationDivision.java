//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;IDENTIFICATION&gt;
 * nodeToken1 -> &lt;DIVISION&gt;
 * nodeToken2 -> &lt;DOT&gt;
 * programIdParagraph -> ProgramIdParagraph()
 * nodeListOptional -> ( IdentificationDivisionParagraph() )*
 * </PRE>
 */
public class IdentificationDivision extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public NodeToken nodeToken1;
   public NodeToken nodeToken2;
   public ProgramIdParagraph programIdParagraph;
   public NodeListOptional nodeListOptional;

   public IdentificationDivision(NodeToken n0, NodeToken n1, NodeToken n2, ProgramIdParagraph n3, NodeListOptional n4) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      nodeToken1 = n1;
      if ( nodeToken1 != null ) nodeToken1.setParent(this);
      nodeToken2 = n2;
      if ( nodeToken2 != null ) nodeToken2.setParent(this);
      programIdParagraph = n3;
      if ( programIdParagraph != null ) programIdParagraph.setParent(this);
      nodeListOptional = n4;
      if ( nodeListOptional != null ) nodeListOptional.setParent(this);
   }

   public IdentificationDivision() {}

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

