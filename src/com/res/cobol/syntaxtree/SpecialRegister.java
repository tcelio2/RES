//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

/**
 * Grammar production:
 * <PRE>
 * nodeChoice -> ( &lt;ADDRESS&gt; &lt;OF&gt; DataName() | &lt;LENGTH&gt; &lt;OF&gt; Identifier() | &lt;DEBUG_LINE&gt; | &lt;DEBUG_NAME&gt; | &lt;DEBUG_CONTENTS&gt; | &lt;DEBUG_ITEM&gt; | &lt;DEBUG_SUB_1&gt; | &lt;DEBUG_SUB_2&gt; | &lt;DEBUG_SUB_3&gt; | &lt;RETURN_CODE&gt; | &lt;SHIFT_OUT&gt; | &lt;SHIFT_IN&gt; | &lt;SORT_CONTROL&gt; | &lt;SORT_CORE_SIZE&gt; | &lt;SORT_FILE_SIZE&gt; | &lt;SORT_MESSAGE&gt; | &lt;SORT_MODE_SIZE&gt; | &lt;SORT_RETURN&gt; | &lt;TALLY&gt; | &lt;WHEN_COMPILED&gt; )
 * </PRE>
 */
public class SpecialRegister extends com.res.cobol.RESNode implements Node {
   private Node parent;
   public NodeChoice nodeChoice;

   public SpecialRegister(NodeChoice n0) {
      nodeChoice = n0;
      if ( nodeChoice != null ) nodeChoice.setParent(this);
   }

   public SpecialRegister() {}

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

