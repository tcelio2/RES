//
// Generated by JTB 1.3.2
//

package com.res.cobol.syntaxtree;

import java.util.*;

/**
 * Represents a sequence of nodes nested within a choice, list,
 * optional list, or optional, e.g. ( A B )+ or [ C D E ]
 */
public class NodeSequence extends com.res.cobol.RESNode implements NodeListInterface {
   public NodeSequence(int n) {
      nodes = new Vector<Node>(n);
   }

   public NodeSequence(Node firstNode) {
      nodes = new Vector<Node>();
      addNode(firstNode);
   }

   public void addNode(Node n) {
      nodes.addElement(n);
      n.setParent(this);
   }

   public Node elementAt(int i)  { return nodes.elementAt(i); }
   public Enumeration<Node> elements() { return nodes.elements(); }
   public int size()             { return nodes.size(); }
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

   private Node parent;
   public Vector<Node> nodes;
}

