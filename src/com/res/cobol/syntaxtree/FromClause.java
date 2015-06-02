//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;K_FROM&gt;
 * fromItem -> FromItem()
 * nodeListOptional -> ( &lt;COMMACHAR&gt; FromItem() )*
 * </PRE>
 */
public class FromClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public FromItem fromItem;
   public NodeListOptional nodeListOptional;

   public FromClause(NodeToken n0, FromItem n1, NodeListOptional n2) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      fromItem = n1;
      if ( fromItem != null ) fromItem.setParent(this);
      nodeListOptional = n2;
      if ( nodeListOptional != null ) nodeListOptional.setParent(this);
   }

   public FromClause() {}

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
