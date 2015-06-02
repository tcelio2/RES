//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;K_IS&gt;
 * nodeOptional -> [ &lt;K_NOT&gt; ]
 * nodeToken1 -> &lt;K_NULL&gt;
 * </PRE>
 */
public class IsNullClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public NodeOptional nodeOptional;
   public NodeToken nodeToken1;

   public IsNullClause(NodeToken n0, NodeOptional n1, NodeToken n2) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      nodeOptional = n1;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeToken1 = n2;
      if ( nodeToken1 != null ) nodeToken1.setParent(this);
   }

   public IsNullClause() {}

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
