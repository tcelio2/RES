//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;DATA&gt;
 * nodeChoice -> ( &lt;RECORD&gt; [ &lt;IS&gt; ] | &lt;RECORDS&gt; [ &lt;ARE&gt; ] )
 * nodeList -> ( DataName() [ &lt;COMMACHAR&gt; ] )+
 * </PRE>
 */
public class DataRecordClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public NodeChoice nodeChoice;
   public NodeList nodeList;

   public DataRecordClause(NodeToken n0, NodeChoice n1, NodeList n2) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      nodeChoice = n1;
      if ( nodeChoice != null ) nodeChoice.setParent(this);
      nodeList = n2;
      if ( nodeList != null ) nodeList.setParent(this);
   }

   public DataRecordClause() {}

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
