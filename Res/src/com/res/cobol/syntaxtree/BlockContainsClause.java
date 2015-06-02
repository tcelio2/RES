//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;BLOCK&gt;
 * nodeOptional -> [ &lt;CONTAINS&gt; ]
 * nodeOptional1 -> [ IntegerConstant() &lt;TO&gt; ]
 * integerConstant -> IntegerConstant()
 * nodeOptional2 -> [ &lt;RECORDS&gt; | &lt;CHARACTERS&gt; ]
 * </PRE>
 */
public class BlockContainsClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public NodeOptional nodeOptional;
   public NodeOptional nodeOptional1;
   public IntegerConstant integerConstant;
   public NodeOptional nodeOptional2;

   public BlockContainsClause(NodeToken n0, NodeOptional n1, NodeOptional n2, IntegerConstant n3, NodeOptional n4) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      nodeOptional = n1;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeOptional1 = n2;
      if ( nodeOptional1 != null ) nodeOptional1.setParent(this);
      integerConstant = n3;
      if ( integerConstant != null ) integerConstant.setParent(this);
      nodeOptional2 = n4;
      if ( nodeOptional2 != null ) nodeOptional2.setParent(this);
   }

   public BlockContainsClause() {}

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

