//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;INSPECT&gt;
 * identifier -> Identifier()
 * nodeChoice -> ( TallyingPhrase() | ConvertingPhrase() | ReplacingPhrase() )
 * </PRE>
 */
public class InspectStatement extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public Identifier identifier;
   public NodeChoice nodeChoice;

   public InspectStatement(NodeToken n0, Identifier n1, NodeChoice n2) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      identifier = n1;
      if ( identifier != null ) identifier.setParent(this);
      nodeChoice = n2;
      if ( nodeChoice != null ) nodeChoice.setParent(this);
   }

   public InspectStatement() {}

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
