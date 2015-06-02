//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;START&gt;
 * fileName -> FileName()
 * nodeOptional -> [ &lt;KEY&gt; [ &lt;IS&gt; ] ( &lt;EQUAL&gt; [ &lt;TO&gt; ] | &lt;EQUALCHAR&gt; | &lt;GREATER&gt; [ &lt;THAN&gt; ] &lt;OR&gt; &lt;EQUAL&gt; [ &lt;TO&gt; ] | &lt;GREATER&gt; [ &lt;THAN&gt; ] | &lt;MORETHANCHAR&gt; | &lt;NOT&gt; &lt;LESS&gt; [ &lt;THAN&gt; ] | &lt;NOT&gt; &lt;LESSTHANCHAR&gt; | &lt;MORETHANOREQUAL&gt; ) QualifiedDataName() ]
 * nodeOptional1 -> [ &lt;INVALID&gt; [ &lt;KEY&gt; ] StatementList() ]
 * nodeOptional2 -> [ &lt;NOT&gt; &lt;INVALID&gt; [ &lt;KEY&gt; ] StatementList() ]
 * nodeOptional3 -> [ &lt;END_START&gt; ]
 * </PRE>
 */
public class StartStatement extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public FileName fileName;
   public NodeOptional nodeOptional;
   public NodeOptional nodeOptional1;
   public NodeOptional nodeOptional2;
   public NodeOptional nodeOptional3;

   public StartStatement(NodeToken n0, FileName n1, NodeOptional n2, NodeOptional n3, NodeOptional n4, NodeOptional n5) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      fileName = n1;
      if ( fileName != null ) fileName.setParent(this);
      nodeOptional = n2;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeOptional1 = n3;
      if ( nodeOptional1 != null ) nodeOptional1.setParent(this);
      nodeOptional2 = n4;
      if ( nodeOptional2 != null ) nodeOptional2.setParent(this);
      nodeOptional3 = n5;
      if ( nodeOptional3 != null ) nodeOptional3.setParent(this);
   }

   public StartStatement() {}

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

