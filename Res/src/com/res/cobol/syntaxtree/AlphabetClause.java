//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeToken -> &lt;ALPHABET&gt;
 * alphabetName -> AlphabetName()
 * nodeOptional -> [ &lt;IS&gt; ]
 * nodeChoice -> ( &lt;STANDARD_1&gt; | &lt;STANDARD_2&gt; | &lt;NATIVE&gt; | CobolWord() | ( Literal() [ ( ( &lt;THROUGH&gt; | &lt;THRU&gt; ) Literal() | ( &lt;ALSO&gt; Literal() [ &lt;COMMACHAR&gt; ] )+ ) ] [ &lt;COMMACHAR&gt; ] )+ )
 * </PRE>
 */
public class AlphabetClause extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeToken nodeToken;
   public AlphabetName alphabetName;
   public NodeOptional nodeOptional;
   public NodeChoice nodeChoice;

   public AlphabetClause(NodeToken n0, AlphabetName n1, NodeOptional n2, NodeChoice n3) {
      nodeToken = n0;
      if ( nodeToken != null ) nodeToken.setParent(this);
      alphabetName = n1;
      if ( alphabetName != null ) alphabetName.setParent(this);
      nodeOptional = n2;
      if ( nodeOptional != null ) nodeOptional.setParent(this);
      nodeChoice = n3;
      if ( nodeChoice != null ) nodeChoice.setParent(this);
   }

   public AlphabetClause() {}

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
