.. _syntax:

Syntax
============


Types
-----

Value Types
~~~~~~~~~~~

.. math::
   valtype ::= i32 ~|~ i64 ~|~ f32 ~|~
  f64 ~|~ funcref ~|~ externref


Inter Types
~~~~~~~~~~~

.. math::
   \begin{array}{lcl}
   intertype & ::= & f32 ~|~
   f64 ~|~ s8 ~|~ u8 ~|~ s16 ~|~ u16 ~|~ s32 ~|~ u32 ~|~ s64 ~|~ u64
   ~|~ char ~|~ list ~intertype \\ & & ~|~  stream~intertype ~|~ handle~id
   ~|~ record~ (field~name~ id?~ intertype)*\\ & &
   ~|~ variant~ (case~name~id?~ intertype?)*\\
   \end{array}


Adaptor Types
~~~~~~~~~~~~~

.. math::
   adaptortype ::= valtype ~|~ intertype


Reference Types
~~~~~~~~~~~~~~~

.. math::
   reftype ::= funcref ~|~ externref


Heap Types
~~~~~~~~~~~~~~~

.. math::
   heaptype ::= func ~|~ extern



Modules
-----


Adaptor Modules
~~~~~~~~~~~~~~~

.. math::
   adaptormodule ::= module id modulefield*

Adaptor Module Fields
~~~~~~~~~~~~~~~~~~~~~

.. math::
   \begin{array}{lcl}
   adaptormodulefield &::=& type id [adaptortype*] -> [adaptortype*]\\
   & & table id n m? reftype\\
   & & memory id n m?\\
   & & tag tag id\\
   & & global id mut? valtype instr*\\
   & & import ``name'' ``name'' importdesc\\
   & & export ``name'' exportdesc\\
   & & start id\\
   & & elem id (table id)? (reftype (item (instr*)))\\
   & & data id (memory id)? (offset instr*) string\\
   & & func id id instr*\\
   & & instance id (instantiate id (import name exportdesc))\\
   \end{array}
