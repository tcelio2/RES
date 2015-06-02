//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;OCCURS&gt;
 * nodeOptional -> [ ( IntegerConstant() | DataName() ) &lt;TO&gt; ]
 * nodeChoice -> ( IntegerConstant() | DataName() )
 * nodeOptional1 -> [ &lt;TIMES&gt; ]
 * nodeOptional2 -> [ &lt;DEPENDING&gt; [ &lt;ON&gt; ] QualifiedDataName() ]
 * nodeListOptional -> ( ( &lt;ASCENDING&gt; | &lt;DESCENDING&gt; ) [ &lt;KEY&gt; ] [ &lt;IS&gt; ] ( QualifiedDataName() )+ )*
 * nodeOptional3 -> [ &lt;INDEXED&gt; [ &lt;BY&gt; ] ( IndexName() [ &lt;COMMACHAR&gt; ] )+ ]
 * </PRE>
 */
public class DataOccursClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public NodeOptional nodeOptional;
   public NodeChoice nodeChoice;
   public NodeOptional nodeOptional1;
   public NodeOptional nodeOptional2;
   public NodeListOptional nodeListOptional;
   public NodeOptional nodeOptional3;

   public DataOccursClause(NodeToken n0, NodeOptional n1, NodeChoice n2, NodeOptional n3, NodeOptional n4, NodeListOptional n5, NodeOptional n6) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      nodeOptional = n1;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeChoice = n2;
      if ( nodeChoice != null ) nodeChoice.setParent(this);
      nodeOptional1 = n3;
      if ( nodeOptional1 != null ) nodeOptional1.setParent(this);
      nodeOptional2 = n4;
      if ( nodeOptional2 != null ) nodeOptional2.setParent(this);
      nodeListOptional = n5;
      if ( nodeListOptional != null ) nodeListOptional.setParent(this);
      nodeOptional3 = n6;
      if ( nodeOptional3 != null ) nodeOptional3.setParent(this);
   }

   public DataOccursClause() {}

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
