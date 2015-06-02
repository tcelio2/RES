//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;ACCEPT&gt;
 * identifier -> Identifier()
 * nodeOptional -> [ &lt;FROM&gt; ( MnemonicName() | EnvironmentName() | &lt;DATE&gt; [ &lt;COBOL_WORD&gt; ] | &lt;DAY&gt; [ &lt;COBOL_WORD&gt; ] | &lt;DAY_OF_WEEK&gt; | &lt;TIME&gt; ) | [ &lt;MESSAGE&gt; ] &lt;COUNT&gt; ]
 * </PRE>
 */
public class AcceptStatement extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public Identifier identifier;
   public NodeOptional nodeOptional;

   public AcceptStatement(NodeToken n0, Identifier n1, NodeOptional n2) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      identifier = n1;
      if ( identifier != null ) identifier.setParent(this);
      nodeOptional = n2;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
   }

   public AcceptStatement() {}

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

