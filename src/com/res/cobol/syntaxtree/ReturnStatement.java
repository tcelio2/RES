//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;RETURN&gt;
 * fileName -> FileName()
 * nodeOptional -> [ &lt;RECORD&gt; ]
 * nodeOptional1 -> [ &lt;INTO&gt; QualifiedDataName() ]
 * nodeOptional2 -> [ &lt;AT&gt; ]
 * nodeToken1 -> &lt;END&gt;
 * statementList -> StatementList()
 * nodeOptional3 -> [ &lt;NOT&gt; [ &lt;AT&gt; ] &lt;END&gt; StatementList() ]
 * nodeOptional4 -> [ &lt;END_RETURN&gt; ]
 * </PRE>
 */
public class ReturnStatement extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public FileName fileName;
   public NodeOptional nodeOptional;
   public NodeOptional nodeOptional1;
   public NodeOptional nodeOptional2;
   public NodeToken nodeToken1;
   public StatementList statementList;
   public NodeOptional nodeOptional3;
   public NodeOptional nodeOptional4;

   public ReturnStatement(NodeToken n0, FileName n1, NodeOptional n2, NodeOptional n3, NodeOptional n4, NodeToken n5, StatementList n6, NodeOptional n7, NodeOptional n8) {
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
      nodeToken1 = n5;
      if ( nodeToken1 != null ) nodeToken1.setParent(this);
      statementList = n6;
      if ( statementList != null ) statementList.setParent(this);
      nodeOptional3 = n7;
      if ( nodeOptional3 != null ) nodeOptional3.setParent(this);
      nodeOptional4 = n8;
      if ( nodeOptional4 != null ) nodeOptional4.setParent(this);
   }

   public ReturnStatement() {}

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

