$( !

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  Theorem Naming Conventions
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Standard theorem, lemma, and definition tags have the format...

  < id >-P< chapter >.< number >, < tag >-L< chapter >.< number >, or
  df-< id >-D< chapter >.< number >,

respectively.

< id > is all lowercase, similar to set.mm tags. The numbering is designed to
correspond with a textbook theorem numbering system. Having both a set.mm
style descriptive tag and a number tag should allow the best of both worlds in
terms of regex searching.

Axioms have the format...

  ax-< id >< number > for numbered axioms, or ax-< id > for named axioms.

Here <id> is some combination of capital letters, i.e. 'L' for a logical
axiom or 'MP' for Modus Ponens.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  Recipe Theorems
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

These are theorems that would, for brevity, be easier stated as meta-theorems
in a textbook.  Though these proofs could easily be generated algorithmically
based on a template, in metamath we must write out each instance to use as
needed.  We call a grouping of such theorems a "proof recipe".  The notation
is as follows...

  rcp-< template-id >< instance >

Here < template-id > is all capitals and indicates a class of very similar
theorems / rules.  < instance > consists of numbers or lowercase letters
descibing a particular instance following the form of < template-id >.

This convention is used to emulate natural deduction rules normally written 
in Gentzen notation.  We manipulate WFFs that follow the format of having an
arbitrary length sequence of assumptions separated by '/\'s to the left of the
main implication sign, '->'.  Following a template we create a different
theorem for each possible sequent length.  For an example, see ~rcp-NDASM1of1
and look at the nearby theorems.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  Augmentation Recipes
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Often a theorem will have several different forms.  In cases where the
conversion from one form to the other is extremely trivial or follows a
simple algorithm, we add a postfix descriping conversion to the tag of an
already existing theorem.  This notation is useful for textbook presentation
as trivial variations of existing theorems do not need thier own text book
mention or number.

Some examples of augmentations are...

Add Context: AC

  <theorem-tag>.AC 

  Add an arbitrary context WFF metaviariable as an antecedent.  We usually use
  a lowercase gamma 'w_ga' as the context metavariable.

Separate Hypothesis: SH

  <theorem-tag>.SH

  Take a theorem of the form '( A -> B )', take the antecedent 'A' and make it
  a hypothesis, then use Modus Ponens to replace the statement '( A -> B )'
  with 'B'.  

  This can be repeated multiple times for theorems of the form
  '( A1 -> ( A2 -> ... ( An -> B ) ... ) )'.  In this case the notation is

  <theorem-tag>.<n>SH

  to repeat 'n' times.

There are special rules when autmentations are combined.  For instance if we
have theorem called 'theorem' of the form...

   ( A -> B )

Then to get 'theorem.AC.SH' we need to distribute the context over the 
implication before separating the antecedent into a hypothesis.  This gives
the deductive form...

  '( w_ga -> A )' => '( w_ga -> B )'.

Other augmentations... 

Remove Context: RC

  Go from deductive to inference form.

Closed Form: CL

  Go from deductive to closed form.

Symmetric Form: SYM

  Change implication to logical equivalency on symmetric theorems.

Generalization: GEN

  Use ax-GEN to get rid of a universal quantifier in the hypothesis.

Generalization with Variable Restriction: GENV

  Use ax-L5 to get rid of a universal quantifier in the hypothesis of a 
  theorem in deductive form by adding a variable restriction.

Generalization with Non-Freeness Hypothesis: GENF

  Similar to GENV, but add a non-freeness hypothesis instead of a variable
  restriction.

Variable Restriction: VR

  Replace a non-freeness hypothesis with a variable restriction.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  Private Lemmas
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

When we break a formal proof up into lemmas, but don't intend to use the 
individual parts of the proof anywhere else, we use the convenction...

<tag>-L<n>,

where <tag> is the theorem we apply the lemma to and 'n' is a number to
distinguish from other private lemmas belonging to the same theorem.  These
lemmas are not listed in the text.  They only exist to break up formal
metamath proofs into smaller parts for easier digestion.

$)
