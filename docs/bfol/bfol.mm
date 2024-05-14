$( !
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   First Order Logic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
$)

$( Begin $[ bfol-header.mm $] $)
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
$( End $[ bfol-header.mm $] $)
$( Begin $[ bfol-ch0.mm $] $)

$( 
##############################################################################
  Chapter 0: Primitives 
##############################################################################
$)

$( ************************************************************************* $)
$( Constant Symbols $)

$( ========================================================================= $)
$( Type Codes $)

$( ------------------------------------------------------------------------- $)

    $( Is an Object Variable. $)
    $c objvar $.

$( ------------------------------------------------------------------------- $)

    $( Is a Term. $)
    $c term $.

$( ------------------------------------------------------------------------- $)

    $( Is a Class. $)
    $c class $.

$( ------------------------------------------------------------------------- $)

    $( Is a Well Formed Formula. $)
    $c wff $.

$( ------------------------------------------------------------------------- $)

    $( Is A Proveable Statment. $)
    $c |- $.


$( ========================================================================= $)
$( Primitive Syntax $)

    $( Parenthesis. $)
    $c ( ) $.

$( ------------------------------------------------------------------------- $)

    $( Implies. $)
    $c -> $.

$( ------------------------------------------------------------------------- $)

    $( Not. $)
    $c -. $.

$( ------------------------------------------------------------------------- $)

    $( For All. $)
    $c A. $.

$( ------------------------------------------------------------------------- $)

    $( Primitive Equals. $)
    $c = $.

$( ------------------------------------------------------------------------- $)

    $( Primitive Membership. $)
    $c e. $.

$( ------------------------------------------------------------------------- $)

    $( Primitive Zero Constant. $)
    $c 0 $.
    

$( ------------------------------------------------------------------------- $)

    $( Primitive Successor Function. $)
    $c s` $.

$( ------------------------------------------------------------------------- $)

    $( Primitive Addition. $)
    $c + $.

$( ------------------------------------------------------------------------- $)

    $( Primitive Multiplication. $)
    $c x. $.

$( ========================================================================= $)
$( Defined Syntax: Chapter 2 $)

    $( If and Only If. $)
    $c <-> $.

    $( And. $)
    $c /\ $.

    $( Or. $)
    $c \/ $.

    $( True. $)
    $c T. $.

    $( False. $)
    $c F. $.

$( ========================================================================= $)
$( Defined Syntax: Chapter 5 $)

    $( There Exists. $)
    $c E. $.

$( ========================================================================= $)
$( Defined Syntax: Chapter 6 $)

    $( Is (effectively) Not Free. $)
    $c F/ $.

    $( Brackets. $)
    $c [ ] $.

    $( Forward Slash. $)
    $c / $.

$( ========================================================================= $)
$( Typsetting Constants $)

$( 
   These constants are only used for display purposes.
$)

    $( Ampersand $)
    $c & $.
$( ------------------------------------------------------------------------- $)

    $( Big Right Arrow $)
    $c => $.

$( ------------------------------------------------------------------------- $)

    $( Big Left-Right Arrow $)
    $c <=> $.

$( ------------------------------------------------------------------------- $)

    $( Alias $)
    $c := $.

$( ------------------------------------------------------------------------- $)

    $( Daggar $)
    $c t. $.

$( ************************************************************************* $)
$( Variable Symbols $)


$( ========================================================================= $)
$( WFF Variables $)

    $v w_ph w_ph1 w_ph2 w_ph3 w_ph4 w_ph5 $. $( Greek varphi $)
    wff-ph $f wff w_ph $.
    wff-ph1 $f wff w_ph1 $.
    wff-ph2 $f wff w_ph2 $.
    wff-ph3 $f wff w_ph3 $.
    wff-ph4 $f wff w_ph4 $.
    wff-ph5 $f wff w_ph5 $.

    $v w_ps w_ps1 $. $( Greek lowercase psi $)
    wff-ps $f wff w_ps $.
    wff-ps1 $f wff w_ps1 $.

    $v w_ch w_ch1 $. $( Greek lowercase chi $)
    wff-ch $f wff w_ch $.
    wff-ch1 $f wff w_ch1 $.

    $v w_th $. $( Greek vartheta $)
    wff-th $f wff w_th $.

    $v w_ta $. $( Greek letter tau $)
    wff-ta $f wff w_ta $.

    $v w_ga w_ga1 w_ga2 w_ga3 w_ga4 w_ga5 $. $( Greek lowercase gamma $)
    wff-ga $f wff w_ga $. 
    wff-ga1 $f wff w_ga1 $.
    wff-ga2 $f wff w_ga2 $.
    wff-ga3 $f wff w_ga3 $.
    wff-ga4 $f wff w_ga4 $.
    wff-ga5 $f wff w_ga5 $.

$( ========================================================================= $)
$( Term Variables $)

    $v t_s $.
    term-s $f term t_s $.

    $v t_t t_t1 t_t2 $.
    term-t $f term t_t $.
    term-t1 $f term t_t1 $.
    term-t2 $f term t_t2 $.

    $v t_u t_u1 t_u2 $.
    term-u $f term t_u $.
    term-u1 $f term t_u1 $.
    term-u2 $f term t_u2 $.

    $v t_v t_v1 t_v2 $.
    term-v $f term t_v $.
    term-v1 $f term t_v1 $.
    term-v2 $f term t_v2 $.

    $v t_w $.
    term-w $f term t_w $.

$( ========================================================================= $)
$( Object Variables $)

    $v x x1 $.
    objvar-x $f objvar x $.
    objvar-x1 $f objvar x1 $.

    $v y y1 $.
    objvar-y $f objvar y $.
    objvar-y1 $f objvar y1 $.

    $v z z1 $.
    objvar-z $f objvar z $.
    objvar-z1 $f objvar z1 $.

    $v a a1 $.
    objvar-a $f objvar a $.
    objvar-a1 $f objvar a1 $.

    $v b b1 $.
    objvar-b $f objvar b $.
    objvar-b1 $f objvar b1 $.

    $v c c1 $.
    objvar-c $f objvar c $.
    objvar-c1 $f objvar c1 $.

    $v d $.
    objvar-d $f objvar d $.

$( 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Definition of Term
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

${
    $( If '`x`' is an object variable, then '`x`' is a term. $)
    term-obj $a term x $.
$}

${
   $( The constant '`0`' is a term. $)
   term_zero $a term 0 $.
$}

${
   $( If '`t_t`' is a term, then 's&lsquo;`t_t`' is a term. $)
   term_succ $a term s` t_t $.
$} 

${
    $( If '`t_t`' and '`t_u`' are terms, then '`t_t + t_u`' is a term. $)
    term-add $a term ( t_t + t_u ) $.
$}

${
    $( If '`t_t`' and '`t_u`' are terms, then '`t_t x. t_u`' is a term. $)
    term-mult $a term ( t_t x. t_u ) $.
$}

$( 
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Definition of WFF
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

${
    $( If '`t_t`' and '`t_u`' are terms, then '`t_t = t_u`' is a well formed
       formula. $)
    wff-equals $a wff t_t = t_u $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( If '`t_t`' and '`t_u`' are terms, then '`t_t e. t_u`' is a well formed
       formula. $)
    wff-elemof $a wff t_t e. t_u $.
$}    

$( ------------------------------------------------------------------------- $)

${
    $( If '`x`' is a object variable and '`w_ph`' is a well formed formula,
       then '`A. x w_ph`' is a well formed formula. $)
    wff-forall $a wff A. x w_ph $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( If '`w_ph`' is well formed formula, then '`-. w_ph`' is a well formed
      formula. $)
    wff-neg $a wff -. w_ph $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( If '`w_ph`' and '`w_ps`' are well formed formulas, then
       '`( w_ph -> w_ps )`' is a well formed formula. $)
    wff-imp $a wff ( w_ph -> w_ps ) $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  First Order Logic Axioms
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Axioms of Propositional Calculus
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Axiom of Simplification. $)
    ax-L1 $a |- ( w_ph -> ( w_ps -> w_ph ) ) $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Axiom of Frege. $)
    ax-L2 $a 
        |- ( 
          ( w_ph -> ( w_ps -> w_ch ) ) ->
          ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) 
        ) 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Axiom of Transposition. $)
    ax-L3 $a |- ( ( -. w_ph -> -. w_ps ) -> ( w_ps -> w_ph ) ) $.
$}

$( ------------------------------------------------------------------------- $)

${
    ax-MP.1 $e |- w_ph $.
    ax-MP.2 $e |- ( w_ph -> w_ps ) $.
  
    $( Rule of Modus Ponens. $)
    ax-MP $a |- w_ps $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Axioms of Predicate Calculus
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    ax-GEN.1 $e |- w_ph $. 
  
    $( Rule of Generalization. $)
    ax-GEN $a |- A. x w_ph $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Axiom of Quantified Implication. $)
    ax-L4 $a |- ( A. x ( w_ph -> w_ps ) -> ( A. x w_ph -> A. x w_ps ) ) $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x w_ph $.

    $( Axiom of Distinctness.  

       Note: '`x`' cannot occur in '`w_ph`'. $)
    ax-L5 $a |- ( w_ph -> A. x w_ph ) $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Equality Axioms
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t x $.

    $( Axiom of Existence. 

       Note: '`x`' cannot occur in '`t_t`' $)
    ax-L6 $a |- -. A. x -. x = t_t $.
$}

$( ------------------------------------------------------------------------- $)

${  
    $( Axiom of Equality. $)
    ax-L7 $a |- ( t_t = t_u -> ( t_t = t_w -> t_u = t_w ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Axioms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Primitive Predicate Substitution Axioms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Left '`e.`' substitution. $)
    ax-L8-inl $a |- ( t_t = t_u -> ( t_t e. t_w -> t_u e. t_w ) ) $.
$}

${
    $( Right '`e.`' substitution. $)
    ax-L8-inr $a |- ( t_t = t_u -> ( t_w e. t_t -> t_w e. t_u ) ) $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Primitive Function Substitution Axioms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${  
    $( Successor substitution. $)
    ax-L9-succ $a |- ( t_t = t_u -> s` t_t = s` t_u ) $.
$}

${  
    $( Left '`+`' substitution. $)
    ax-L9-addl $a |- ( t_t = t_u -> ( t_t + t_w ) = ( t_u + t_w ) ) $.
$}

${  
    $( Right '`+`' substitution. $)
    ax-L9-addr $a |- ( t_t = t_u -> ( t_w + t_t ) = ( t_w + t_u ) ) $.
$}

${
    $( Left '`x.`' substitution. $)
    ax-L9-multl $a |- ( t_t = t_u -> ( t_t x. t_w ) = ( t_u x. t_w ) ) $.
$}

${  
    $( Right '`x.`' substitution. $)
    ax-L9-multr $a |- ( t_t = t_u -> ( t_w x. t_t ) = ( t_w x. t_u ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Scheme Completion Axioms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Non-freeness of Negated Bound Variable. $)
    ax-L10 $a |- ( -. A. x w_ph -> A. x -. A. x w_ph ) $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    $( Quantifier Commutation. $)
    ax-L11 $a |- ( A. x A. y w_ph -> A. y A. x w_ph ) $.
$}

$( ------------------------------------------------------------------------- $)

${

    $d t_t x $. 

    $( Variable Substitution.

       Note: '`x`' cannot occur in '`t_t`'. $)
    ax-L12 $a |- ( x = t_t -> ( w_ph -> A. x ( x = t_t -> w_ph ) ) ) $.
$}
$( End $[ bfol-ch0.mm $] $)
$( Begin $[ bfol-ch1.mm $] $)

$(
##############################################################################
  Chapter 1: Propositional Calculus (Primitive Connectives)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Implication
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Some Simple Proofs.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    axL1.SH.1 $e |- w_ph $.
  
    $( Inference from ~ax-L1 . $)
    axL1.SH $p |- ( w_ps -> w_ph ) $= 
        ( wff-imp ax-L1 ax-MP ) ABADCABEF 
    $.
$}

${
    axL2.SH.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference from ~ax-L2 . $)
    axL2.SH $p |- ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) $= 
        ( wff-imp ax-L2 ax-MP ) ABCEEABEACEEDABCFG 
    $.
$}

${
    axL3.SH.1 $e |- ( -. w_ph -> -. w_ps ) $.
    
    $( Inference from ~ax-L3 . $)
    axL3.SH $p |- ( w_ps -> w_ph ) $= 
        ( wff-neg wff-imp ax-L3 ax-MP ) ADBDEBAECABFG 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Some Derived Inferences.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    mae-P1.1.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.
    mae-P1.1.2 $e |- w_ps $.
    
    $( Middle Antecedent Elimination Inference. $)
    mae-P1.1 $p |- ( w_ph -> w_ch ) $= 
        ( wff-imp axL1.SH axL2.SH ax-MP ) ABFACFBAEGABCDHI 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    syl-P1.2.1 $e |- ( w_ph -> w_ps ) $.
    syl-P1.2.2 $e |- ( w_ps -> w_ch ) $.
    
    $( Syllogism Inference. $)
    syl-P1.2 $p |- ( w_ph -> w_ch ) $= 
        ( wff-imp axL1.SH axL2.SH ax-MP ) ABFACFDABCBCFAEGHI 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dsyl-P1.3.1 $e |- ( w_ph -> w_ps ) $.
    dsyl-P1.3.2 $e |- ( w_ps -> w_ch ) $.
    dsyl-P1.3.3 $e |- ( w_ch -> w_th ) $.

    $( Double Syllogism Inference. $)
    dsyl-P1.3 $p |- ( w_ph -> w_th ) $= 
        ( syl-P1.2 ) ACDABCEFHGH 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  First Closed Form Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Implication Identity. $)
    id-P1.4 $p |- ( w_ph -> w_ph ) $= 
        ( wff-imp ax-L1 axL2.SH ax-MP ) AAABZBFAACAFAAFCDE 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Redundant Antecedent Elimination. $)
    rae-P1.5 $p |- ( ( w_ph -> ( w_ph -> w_ps ) ) -> ( w_ph -> w_ps ) ) $= 
        ( wff-imp ax-L2 id-P1.4 mae-P1.1 ) AABCZCAACGAABDAEF 
    $.
$}

${
    rae-P1.5.SH.1 $e |- ( w_ph -> ( w_ph -> w_ps ) ) $.
    $( Inference from ~rae-P1.5 . $)
    rae-P1.5.SH $p |- ( w_ph -> w_ps ) $= 
        ( wff-imp rae-P1.5 ax-MP ) AABDZDGCABEF 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Proof Recipes.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Frege Axiom with One Antecedent. $)
    rcp-FR1 $p 
        |- ( 
          ( w_ga1 -> ( w_ph -> w_ps ) ) ->
          ( ( w_ga1 -> w_ph ) -> ( w_ga1 -> w_ps ) )
        ) 
    $=
        ( ax-L2 ) CABD
    $. 
$}

${
    rcp-FR1.SH.1 $e |- ( w_ga1 -> ( w_ph -> w_ps ) ) $.
     
    $( Inference from ~rcp-FR1 . $)
    rcp-FR1.SH $p |- ( ( w_ga1 -> w_ph ) -> ( w_ga1 -> w_ps ) ) $=
        ( wff-imp rcp-FR1 ax-MP ) CABEECAECBEEDABCFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Frege Axiom with Two Antecedents. $)
    rcp-FR2 $p 
        |- (
          ( w_ga2 -> ( w_ga1 -> ( w_ph -> w_ps ) ) ) ->
          ( ( w_ga2 -> ( w_ga1 -> w_ph ) ) -> ( w_ga2 -> ( w_ga1 -> w_ps ) ) )
        )
    $= 
        ( wff-imp rcp-FR1 axL1.SH axL2.SH ax-L2 syl-P1.2 )
        DCABEEZEDCAEZCBEZEZEDLEDMEEDKNKNEDABCFGHDLMIJ
    $.
$}

${
    rcp-FR2.SH.1 $e |- ( w_ga2 -> ( w_ga1 -> ( w_ph -> w_ps ) ) ) $.

    $( Inference from ~rcp-FR2 . $)
    rcp-FR2.SH $p 
        |- ( 
          ( w_ga2 -> ( w_ga1 -> w_ph ) ) -> ( w_ga2 -> ( w_ga1 -> w_ps ) )
        ) 
    $= 
        ( wff-imp rcp-FR2 ax-MP ) DCABFFFDCAFFDCBFFFEABCDGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Frege Axiom with 3 Antecedents. $)
    rcp-FR3 $p 
        |- ( 
          ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> ( w_ph -> w_ps ) ) ) ) -> 
          ( 
            ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> w_ph ) ) ) -> 
            ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> w_ps ) ) ) 
          ) 
        ) 
    $= 
        ( wff-imp rcp-FR2 axL1.SH axL2.SH ax-L2 syl-P1.2 ) 
        EDCABFFFZFEDCAFFZDCBFFZFZFEMFENFFELOLOFEABCDGHIEMNJK
    $.
$}

${
    rcp-FR3.SH.1 $e
        |- ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> ( w_ph -> w_ps ) ) ) )
    $.
    
    $( Inference from ~rcp-FR3 . $)
    rcp-FR3.SH $p 
        |- ( 
          ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> w_ph ) ) ) -> 
          ( w_ga3 -> ( w_ga2 -> ( w_ga1 -> w_ps ) ) ) 
        ) 
    $= 
        ( wff-imp rcp-FR3 ax-MP ) EDCABGGGGEDCAGGGEDCBGGGGFABCDEHI 
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Application of Proof Recipes.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    axL1.AC.SH.1 $e |- ( w_ga -> w_ph ) $.

    $( Deductive Form of ~ax-L1 . $)
    axL1.AC.SH $p |- ( w_ga -> ( w_ps -> w_ph ) ) $= 
        ( wff-imp ax-L1 axL1.SH rcp-FR1.SH ax-MP ) CAECBAEZEDAJCAJECABFGHI 
    $.
$}

${
    axL2.AC.SH.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.
    
    $( Deductive Form of ~ax-L2 . $)
    axL2.AC.SH $p |- ( w_ga -> ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) ) $=
        ( wff-imp ax-L2 axL1.SH rcp-FR1.SH ax-MP )
        DABCFFZFDABFACFFZFEKLDKLFDABCGHIJ
    $.
$}

${
    axL3.AC.SH.1 $e |- ( w_ga -> ( -. w_ph -> -. w_ps ) ) $.
    $( Deductive Form of ~ax-L3 . $)
    axL3.AC.SH $p |- ( w_ga -> ( w_ps -> w_ph ) ) $= 
        ( wff-neg wff-imp ax-L3 axL1.SH rcp-FR1.SH ax-MP )
        CAEBEFZFCBAFZFDKLCKLFCABGHIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Implication Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Commutation of Antecedents. $)
    imcomm-P1.6 $p 
        |- ( ( w_ph -> ( w_ps -> w_ch ) ) -> ( w_ps -> ( w_ph -> w_ch ) ) )
    $= 
        ( wff-imp ax-L2 axL1.AC.SH axL2.AC.SH ax-L1 mae-P1.1 )
        ABCDDZBABDZDBACDZDBKLJKLDBJABCEFGBAHI
    $.
$}

${
    imcomm-P1.6.SH.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.
    
    $( Inference from ~imcomm-P1.6 . $)
    imcomm-P1.6.SH $p |- ( w_ps -> ( w_ph -> w_ch ) ) $= 
        ( wff-imp imcomm-P1.6 ax-MP ) ABCEEBACEEDABCFG 
    $.
$}

${
    imcomm-P1.6.AC.SH.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.
    
    $( Deductive Form of ~imcomm-P1.6 $)
    imcomm-P1.6.AC.SH $p |- ( w_ga -> ( w_ps -> ( w_ph -> w_ch ) ) ) $= 
        ( wff-imp imcomm-P1.6 axL1.SH rcp-FR1.SH ax-MP )
        DABCFFZFDBACFFZFEKLDKLFDABCGHIJ 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Implication Substitution (right). 

       The other related rule is ~imsubl-P1.7b . 
    $)
    imsubr-P1.7a $p 
        |- ( ( w_ph -> w_ps ) -> ( ( w_ch -> w_ph ) -> ( w_ch -> w_ps ) ) ) 
    $=
        ( wff-imp ax-L1 axL2.AC.SH ) CABABDZGCEF 
    $.
$}

${
    imsubr-P1.7a.SH.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference from ~imsubr-P1.7a . $)
    imsubr-P1.7a.SH $p |- ( ( w_ch -> w_ph ) -> ( w_ch -> w_ps ) ) $= 
        ( wff-imp imsubr-P1.7a ax-MP ) ABECAECBEEDABCFG 
    $.
$}

${
    imsubr-P1.7a.AC.SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    
    $( Deductive Form of ~imsubr-P1.7a . $)
    imsubr-P1.7a.AC.SH $p
        |- ( w_ga -> ( ( w_ch -> w_ph ) -> ( w_ch -> w_ps ) ) )
    $=
        ( wff-imp imsubr-P1.7a axL1.SH rcp-FR1.SH ax-MP )
        DABFZFDCAFCBFFZFEKLDKLFDABCGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Implication Substitution (left). 

       The other related rule is ~imsubr-P1.7a . 
    $)
    imsubl-P1.7b $p 
        |- ( ( w_ph -> w_ps ) -> ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) )
    $=
        ( wff-imp imsubr-P1.7a imcomm-P1.6.SH ) BCDABDACDBCAEF
    $.

$}

${
    imsubl-P1.7b.SH.1 $e |- ( w_ph -> w_ps ) $.
    
    $( Inference from ~imsubl-P1.7b . $)
    imsubl-P1.7b.SH $p |- ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) $=
        ( wff-imp imsubl-P1.7b ax-MP ) ABEBCEACEEDABCFG 
    $.
$}

${
    imsubl-P1.7b.AC.SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    
    $( Deductive Form of ~imsubl-P1.7b . $)
    imsubl-P1.7b.AC.SH $p
        |- ( w_ga -> ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) )
    $=
        ( wff-imp imsubl-P1.7b axL1.SH rcp-FR1.SH ax-MP )
        DABFZFDBCFACFFZFEKLDKLFDABCGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of Modus Ponens. $)
    mpt-P1.8 $p |- ( w_ph -> ( ( w_ph -> w_ps ) -> w_ps ) ) $= 
        ( wff-imp id-P1.4 imcomm-P1.6.SH ) ABCZABFDE 
    $.
$}

${
    mpt-P1.8.AC.2SH.1 $e |- ( w_ga -> w_ph ) $.
    mpt-P1.8.AC.2SH.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Deductive Form of ~mpt-P1.8 . $)
    mpt-P1.8.AC.2SH $p |- ( w_ga -> w_ps ) $= 
        ( wff-imp mpt-P1.8 axL1.SH rcp-FR1.SH ax-MP ) 
        CABFZFCBFEKBCCAFCKBFZFDALCALFCABGHIJIJ
    $.
$}

${
    mpt-P1.8.2AC.2SH.1 $e |- ( w_ga1 -> ( w_ga2 -> w_ph ) ) $.
    mpt-P1.8.2AC.2SH.2 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> w_ps ) ) ) $.
    
    $( Another Deductive Form of ~mpt-P1.8 . $) 
    mpt-P1.8.2AC.2SH $p |- ( w_ga1 -> ( w_ga2 -> w_ps ) ) $= 
        ( wff-imp mpt-P1.8 axL1.SH rcp-FR2.SH ax-MP ) 
        CDABGZGGCDBGGFLBDCCDAGGCDLBGZGGEAMDCDAMGZGCNDABHIIJKJK 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of Syllogism. $)
    sylt-P1.9 $p 
        |- ( ( w_ph -> w_ps ) -> ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) )
    $=
        ( imsubl-P1.7b ) ABCD 
    $.
$}

${
    sylt-P1.9.AC.2SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    sylt-P1.9.AC.2SH.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.

    $( Deductive Form of ~sylt-P1.9 . $)
    sylt-P1.9.AC.2SH $p |- ( w_ga -> ( w_ph -> w_ch ) ) $=
        ( wff-imp sylt-P1.9 axL1.SH rcp-FR1.SH ax-MP )
        DBCGZGDACGZGFLMDDABGZGDLMGZGENODNOGDABCHIJKJK
    $.
$}

${
    sylt-P1.9.2AC.2SH.1 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> w_ps ) ) ) $.
    sylt-P1.9.2AC.2SH.2 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ps -> w_ch ) ) ) $.

    $( Another Deductive Form of ~sylt-P1.9 . $)
    sylt-P1.9.2AC.2SH $p |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> w_ch ) ) ) $=
        ( wff-imp sylt-P1.9 axL1.SH rcp-FR2.SH ax-MP )
        DEBCHZHHDEACHZHHGMNEDDEABHZHHDEMNHZHHFOPEDEOPHZHDQEABCIJJKLKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of Middle Antecedent Elimination. $)
    maet-P1.10 $p 
        |- ( ( w_ph -> ( w_ps -> w_ch ) ) -> ( w_ps -> ( w_ph -> w_ch ) ) ) 
    $=
        ( imcomm-P1.6 ) ABCD 
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Negation
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Basic Negation Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Principle of Explosion A.

       A contradiction implies anything. The other form is ~poe-P1.11b . 
    $)
    poe-P1.11a $p |- ( -. w_ph -> ( w_ph -> w_ps ) ) $= 
        ( wff-neg wff-imp ax-L1 ax-L3 syl-P1.2 ) ACZBCZHDABDHIEBAFG 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Principle of Explosion B.

       A contradiction implies anything. The other form is ~poe-P1.11a . 
    $)
    poe-P1.11b $p |- ( w_ph -> ( -. w_ph -> w_ps ) ) $= 
        ( wff-neg poe-P1.11a imcomm-P1.6.SH ) ACABABDE 
    $.
$}

${
    poe-P1.11b.AC.2SH.1 $e |- ( w_ga -> w_ph ) $.
    poe-P1.11b.AC.2SH.2 $e |- ( w_ga -> -. w_ph ) $.

    $( Deductive Form of ~poe-P1.11b . $)
    poe-P1.11b.AC.2SH $p |- ( w_ga -> w_ps ) $=
        ( wff-neg wff-imp poe-P1.11b axL1.SH rcp-FR1.SH ax-MP )
        CAFZGCBGELBCCAGCLBGZGDAMCAMGCABHIJKJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Clavious's Law. 

       The other form is ~nclav-P1.14 . 
    $)
    clav-P1.12 $p |- ( ( -. w_ph -> w_ph ) -> w_ph ) $= 
        ( wff-neg wff-imp poe-P1.11a axL2.SH axL3.AC.SH rae-P1.5.SH ) 
        ABZACZAAIIHAIBZAJDEFG
    $.
$}

${
    clav-P1.12.AC.SH.1 $e |- ( w_ga -> ( -. w_ph -> w_ph ) ) $.

    $( Deductive Form of ~clav-P1.12 . $)
    clav-P1.12.AC.SH $p |- ( w_ga -> w_ph ) $= 
        ( wff-neg wff-imp clav-P1.12 axL1.SH rcp-FR1.SH ax-MP )
        BADAEZEBAECJABJAEBAFGHI
    $.
$}

${
    clav-P1.12.2AC.SH.1 $e |- ( w_ga1 -> ( w_ga2 -> ( -. w_ph -> w_ph ) ) ) $.

    $( Another Deductive Form of ~clav-P1.12 . $)
    clav-P1.12.2AC.SH $p |- ( w_ga1 -> ( w_ga2 -> w_ph ) ) $= 
        ( wff-neg wff-imp clav-P1.12 axL1.SH rcp-FR2.SH ax-MP ) 
        BCAEAFZFFBCAFFDKACBCKAFZFBLCAGHHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Double Negation Law A (excluded middle). 

       This law is equivalent to the excluded middle and cannot be proven in
       the intuitionist system. The other related law is ~dneg-P1.13b . $)
    dneg-P1.13a $p |- ( -. -. w_ph -> w_ph ) $= 
        ( wff-neg wff-imp poe-P1.11a clav-P1.12 syl-P1.2 ) ABZBGACAGADAEF 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Double Negation Law B. 

       This law is not related to the excluded middle and can be proven in the
       intuitionist system. The other related law is ~dneg-P1.13a . 
    $)
    dneg-P1.13b $p |- ( w_ph -> -. -. w_ph ) $= 
        ( wff-neg dneg-P1.13a axL3.SH ) ABZBAECD 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Negated Clavius's Law. 
       
       This is the negated form of ~clav-P1.12 . 
    $)
    nclav-P1.14 $p |- ( ( w_ph -> -. w_ph ) -> -. w_ph ) $= 
        ( wff-neg wff-imp dneg-P1.13a imsubl-P1.7b.SH clav-P1.12 syl-P1.2 ) 
        AABZCHBZHCHIAHADEHFG 
    $.
$}

${
    nclav-P1.14.AC.SH.1 $e |- ( w_ga -> ( w_ph -> -. w_ph ) ) $.

    $( Deductive Form of ~nclav-P1.14 . $)
    clav-P1.14.AC.SH $p |- ( w_ga -> -. w_ph ) $= 
        ( wff-neg wff-imp nclav-P1.14 axL1.SH rcp-FR1.SH ax-MP )
        BAADZEZEBJECKJBKJEBAFGHI
    $.
$}

${
    nclav-P1.14.2AC.SH.1 $e
        |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> -. w_ph ) ) )
    $.
    
    $( Another Deductive Form of ~nclav-P1.14 . $)
    nclav-P1.14.2AC.SH $p |- ( w_ga1 -> ( w_ga2 -> -. w_ph ) ) $=
        ( wff-neg wff-imp nclav-P1.14 axL1.SH rcp-FR2.SH ax-MP )
        BCAAEZFZFFBCKFFDLKCBCLKFZFBMCAGHHIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Transposition Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Transposition Variant A. $)
    trnsp-P1.15a $p |- ( ( w_ph -> -. w_ps ) -> ( w_ps -> -. w_ph ) ) $= 
        ( wff-neg wff-imp dneg-P1.13a imsubl-P1.7b.SH ax-L3 syl-P1.2 ) 
        ABCZDACZCZIDBJDKAIAEFJBGH 
    $.
$}

${
    trnsp-P1.15a.SH.1 $e |- ( w_ph -> -. w_ps ) $.

    $( Inference from ~trnsp-P1.15a . $)
    trnsp-P1.15a.SH $p |- ( w_ps -> -. w_ph ) $=
        ( wff-neg wff-imp trnsp-P1.15a ax-MP ) ABDEBADECABFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Transposition Variant B. $)
    trnsp-P1.15b $p |- ( ( -. w_ph -> w_ps ) -> ( -. w_ps -> w_ph ) ) $= 
        ( wff-neg wff-imp dneg-P1.13b imsubr-P1.7a.SH ax-L3 syl-P1.2 ) 
        ACZBDIBCZCZDJADBKIBEFAJGH
    $.
$}

${
    trnsp-P1.15b.AC.SH.1 $e |- ( w_ga -> ( -. w_ph -> w_ps ) ) $.
    
    $( Deductive Form of ~trnsp-P1.15b . $)
    trnsp-P1.15b.AC.SH $p |- ( w_ga -> ( -. w_ps -> w_ph ) ) $= 
        ( wff-neg wff-imp trnsp-P1.15b axL1.SH rcp-FR1.SH ax-MP ) 
        CAEBFZFCBEAFZFDKLCKLFCABGHIJ
    $.
$}



$( ------------------------------------------------------------------------- $)

${
    $( Transposition Variant C. $)
    trnsp-P1.15c $p |- ( ( w_ph -> w_ps ) -> ( -. w_ps -> -. w_ph ) ) $= 
        ( wff-imp wff-neg dneg-P1.13b imsubr-P1.7a.SH trnsp-P1.15a syl-P1.2 ) 
        ABCABDZDZCIADCBJABEFAIGH 
    $.
$}

${
    trnsp-P1.15c.SH.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference from ~trnsp-P1.15c . $)
    trnsp-P1.15c.SH $p |- ( -. w_ps -> -. w_ph ) $=
        ( wff-imp wff-neg trnsp-P1.15c ax-MP ) ABDBEAEDCABFG
    $.
$}

${
    trnsp-P1.15c.AC.SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Deductive Form of ~trnsp-P1.15c $)
    trnsp-P1.15c.AC.SH $p |- ( w_ga -> ( -. w_ps -> -. w_ph ) ) $= 
        ( wff-imp wff-neg trnsp-P1.15c axL1.SH rcp-FR1.SH ax-MP ) 
        CABEZECBFAFEZEDKLCKLECABGHIJ 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Transposition Variant D. $)
    trnsp-P1.15d $p |- ( ( -. w_ph -> -. w_ps ) -> ( w_ps -> w_ph ) ) $= 
        ( ax-L3 ) ABC 
    $.
$}

${
    trnsp-P1.15d.AC.SH.1 $e |- ( w_ga -> ( -. w_ph -> -. w_ps ) ) $.

    $( Deductive Form of ~trnsp-P1.15d . $)
    trnsp-P1.15d.AC.SH $p |- ( w_ga -> ( w_ps -> w_ph ) ) $= 
        ( wff-neg wff-imp trnsp-P1.15d axL1.SH rcp-FR1.SH ax-MP ) 
        CAEBEFZFCBAFZFDKLCKLFCABGHIJ 
    $.
$}

${
     trnsp-P1.15d.2AC.SH.1 $e
         |- ( w_ga1 -> ( w_ga2 -> ( -. w_ph -> -. w_ps ) ) )
     $.

     $( Another Deductive Form of ~trnsp-P1.15d . $)
     trnsp-P1.15d.2AC.SH $p |- ( w_ga1 -> ( w_ga2 -> ( w_ps -> w_ph ) ) ) $=
          ( wff-neg wff-imp trnsp-P1.15d axL1.SH rcp-FR2.SH ax-MP )
          CDAFBFGZGGCDBAGZGGELMDCDLMGZGCNDABHIIJK
     $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Classical Arguments.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Proof by Contradiction. $)
    pfbycont-P1.16 $p 
        |- ( ( w_ph -> w_ps ) -> ( ( w_ph -> -. w_ps ) -> -. w_ph ) ) 
    $= 
        ( wff-imp wff-neg ax-L1 trnsp-P1.15a axL1.SH sylt-P1.9.2AC.2SH 
          nclav-P1.14.2AC.SH ) 
        AABCZABDCZABADZJKJKEKBLCCJABFGHI
    $.
$}

${
    pfbycont-P1.16.AC.2SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    pfbycont-P1.16.AC.2SH.2 $e |- ( w_ga -> ( w_ph -> -. w_ps ) ) $.

    $( Deductive Form of ~pfbycont-P1.16 . $)
    pfbycont-P1.16.AC.2SH $p |- ( w_ga -> -. w_ph ) $=
        ( wff-neg wff-imp pfbycont-P1.16 axL1.SH rcp-FR1.SH ax-MP )
        CABFGZGCAFZGELMCCABGZGCLMGZGDNOCNOGCABHIJKJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Proof by Cases. $)
    pfbycase-P1.17 $p 
        |- ( ( w_ph -> w_ps ) -> ( ( -. w_ph -> w_ps ) -> w_ps ) ) 
    $=
        ( wff-imp wff-neg trnsp-P1.15b axL1.SH ax-L1 sylt-P1.9.2AC.2SH 
          clav-P1.12.2AC.SH )
        BABCZADBCZBDZABJKKLACCJABEFJKGHI
    $.
$}

${
    pfbycase-P1.17.2SH.1 $e |- ( w_ph -> w_ps ) $.
    pfbycase-P1.17.2SH.2 $e |- ( -. w_ph -> w_ps ) $.

    $( Inference from ~pfbycase-P1.17 $)
    pfbycase-P1.17.2SH $p |- w_ps $=
        ( wff-neg wff-imp pfbycase-P1.17 ax-MP ) AEBFZBDABFIBFCABGHH
    $.
$}

${
    pfbycase-P1.17.AC.2SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    pfbycase-P1.17.AC.2SH.2 $e |- ( w_ga -> ( -. w_ph -> w_ps ) ) $.

    $( Deductive Form of ~pfbycase-P1.17 . $)
    pfbycase-P1.17.AC.2SH $p |- ( w_ga -> w_ps ) $=
        ( wff-neg wff-imp pfbycase-P1.17 axL1.SH rcp-FR1.SH ax-MP )
        CAFBGZGCBGELBCCABGZGCLBGZGDMNCMNGCABHIJKJK
    $.
$}
$( End $[ bfol-ch1.mm $] $)
$( Begin $[ bfol-ch2.mm $] $)

$(
##############################################################################
  Chapter 2: Propositional Calculus (Defined Connectives)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Development.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

  To more easily understand the theorems below, let 'conj( `w_ph`, `w_ps` )'
  be an abbreviation for '`-. ( w_ph -> -. w_ps )`'. This is the conjunction
  of the WFFs '`w_ph`' and '`w_ps`'.  This will later be defined using the
  '`/\`' (and) symbol.
$)

${
    $( Importation Lemma.  $)
    import-L2.1a $p 
        |- (
          ( w_ph -> ( w_ps -> w_ch ) ) -> ( -. ( w_ph -> -. w_ps ) -> w_ch )
        ) 
    $= 
        ( wff-neg wff-imp trnsp-P1.15c axL1.SH axL2.SH imcomm-P1.6.AC.SH
          trnsp-P1.15b.AC.SH )
        CABDZEABCEZEZACDZKMALNKEZLOEABCFGHIJ 
    $.
$}

${
    import-L2.1a.SH.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference from ~import-L2.1a . $)
    import-L2.1a.SH $p |- ( -. ( w_ph -> -. w_ps ) -> w_ch ) $=
        ( wff-imp wff-neg import-L2.1a ax-MP ) ABCEEABFEFCEDABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Exportation Lemma. $)
    export-L2.1b $p |- 
        ( ( -. ( w_ph -> -. w_ps ) -> w_ch ) -> ( w_ph -> ( w_ps -> w_ch ) ) )
    $= 
        ( wff-neg wff-imp trnsp-P1.15b imcomm-P1.6.AC.SH trnsp-P1.15d.2AC.SH )
        CBABDZEZDCEZACDAIKJCFGH
    $.
$}

${
    export-L2.1b.SH.1 $e |- ( -. ( w_ph -> -. w_ps ) -> w_ch ) $.
    
    $( Inference from ~export-L2.1b . $)
    export-L2.1b.SH $p |- ( w_ph -> ( w_ps -> w_ch ) ) $= 
        ( wff-neg wff-imp export-L2.1b ax-MP ) ABEFECFABCFFDABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Left Simplification Lemma. $)
    simpl-L2.2a $p |- ( -. ( w_ph -> -. w_ps ) -> w_ph ) $= 
        ( ax-L1 import-L2.1a.SH ) ABAABCD 
    $.
$}

${
    simpl-L2.2a.SH.1 $e |- -. ( w_ph -> -. w_ps ) $.

    $( Inference from ~simpl-L2.2a . $)
    simpl-L2.2a.SH $p |- w_ph $= 
        ( wff-neg wff-imp simpl-L2.2a ax-MP ) ABDEDACABFG 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Right Simplification Lemma. $)
    simpr-L2.2b $p |- ( -. ( w_ph -> -. w_ps ) -> w_ps ) $= 
        ( wff-imp id-P1.4 axL1.SH import-L2.1a.SH ) ABBBBCABDEF 
    $.
$}

${
    simpr-L2.2b.SH.1 $e |- -. ( w_ph -> -. w_ps ) $.

    $( Inference from ~simpr-L2.2b . $)
    simpr-L2.2b.SH $p |- w_ps $= 
        ( wff-neg wff-imp simpr-L2.2b ax-MP ) ABDEDBCABFG 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Combining Lemma. $)
    cmb-L2.3 $p |- ( w_ph -> ( w_ps -> -. ( w_ph -> -. w_ps ) ) ) $=
        ( wff-neg wff-imp id-P1.4 export-L2.1b.SH ) ABABCDCZGEF 
    $.
$}

${
    cmb-L2.3.2SH.1 $e |- w_ph $.
    cmb-L2.3.2SH.2 $e |- w_ps $.

    $( Inference from ~cmb-L2.3 . $)
    cmb-L2.3.2SH $p |- -. ( w_ph -> -. w_ps ) $= 
        ( wff-neg wff-imp cmb-L2.3 ax-MP ) BABEFEZDABIFCABGHH 
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Equivalence
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Motivation Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  If we use 'equiv( `w_ph`, `w_ps`)' as an abbreviation for 
  '`-. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) )`', then it follows from
  lemmas ~mbifwd-P2.1a , ~mbirev-P2.1b , and ~mbicmb-P2.1c that...

  `|-` equiv( `w_ph`, `w_ps`) `<=>` `|- ( w_ph -> w_ps )` `&` `|-
  ( w_ps -> w_ph )`.

  This proves that the formula 'equiv( `w_ph`, `w_ps` ) `:=` 
  `-. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) )`' precisely represents the
  property of logical equivalence between '`w_ph`' and '`w_ps`'. We can use
  this to our advantage in order to define '`( w_ph <-> w_ps )`'.
$)

$( ------------------------------------------------------------------------- $)

${
    mbifwd-P2.1a.1 $e |- -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) $.

    $( Motivation for `<->` Definition, Part A. $)
    mbifwd-P2.1a $p |- ( w_ph -> w_ps ) $= 
        ( wff-imp simpl-L2.2a.SH ) ABDBADCE 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    mbirev-P2.1b.1 $e |- -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) $.
    
    $( Motivation for `<->` Definition, Part B. $)
    mbirev-P2.1b $p |- ( w_ps -> w_ph ) $= 
        ( wff-imp simpr-L2.2b.SH ) ABDBADCE 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    mbicmb-P2.1c.1 $e |- ( w_ph -> w_ps ) $.
    mbicmb-P2.1c.2 $e |- ( w_ps -> w_ph ) $.
    
    $( Motivation for `<->` Definition, Part C. $)
    mbicmb-P2.1c $p |- -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) $= 
        ( wff-imp cmb-L2.3.2SH ) ABEBAECDF 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Defining Logical Equivalence.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  While it would be tempting to write '`|- ( ( w_ph <-> w_ps )` `<->` 
  equiv( `w_ph`, `w_ps`))' as the definition of '`<->`' , nested occurances of
  the root symbol being introduced should not appear in a definition.  We
  instead use...

  `|-` equiv( `( w_ph <-> w_ps )`, equiv( `w_ph`, `w_ps`)).

  Without the help of the abbreviation, this definitional expression is
  complex and difficult to read.  However, it is simply a nested application
  of the formula denoted by 'equiv', which we have already shown is synonymous
  with logical equivalence.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the biconditional symbol '`<->`'. $)
    wff-bi $a wff ( w_ph <-> w_ps ) $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Justification Theorem.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  We will later use the theorem ~bijust-P2.2 as an aid the semantic proof that
  this definition conservatively extends the system using the original 9 FOL
  axioms.  The theorem is just the definition...
 
  `|-` equiv( `( w_ph <-> w_ps )`, equiv( `w_ph`, `w_ps` ) ),
  
  with 'equiv( `w_ph`, `w_ps` )' substituted for '`( w_ph <-> w_ps )`'. That
  is...

  `|-` equiv( equiv( `w_ph`, `w_ps` ), equiv( `w_ph`, `w_ps` ) ).

  This is just a special case of the statement...

  `|-` equiv( `w_ga`, `w_ga` ),

  which is proven as ~bijust-P2.2-L1 .
$)

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~bijust-P2.2 . $)
    bijust-P2.2-L1 $p |- -. ( ( w_ga -> w_ga ) -> -. ( w_ga -> w_ga ) ) $=
        ( wff-imp id-P1.4 cmb-L2.3.2SH ) AABZEACZFD 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Justification Theorem for ~df-bi-D2.1 . $)
    bijust-P2.2 $p 
        |- -. ( 
          ( 
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) -> 
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) 
          ) -> 
          -. ( 
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) -> 
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) 
          ) 
        ) 
    $= 
        ( wff-imp wff-neg bijust-P2.2-L1 ) ABCBACDCDE 
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of Biconditional, '`<->`'.  Read as "if and only if". $)
    df-bi-D2.1 $a 
        |- -. ( 
          ( 
            ( w_ph <-> w_ps ) 
            ->
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) )
          ) -> -. ( 
            -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) 
            ->
            ( w_ph <-> w_ps )
          )  
        )
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Standard Form.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  We now derive the "if" ( ~dfbiif-P2.3a ) and "only if" ( ~dfbionlyif-P2.3b )
  parts of the statement that '`( w_ph <-> w_ps )`' is equivalent to
  'eq( `w_ph`, `w_ps` )'.

  Taken together with the various substitution properties of '`<->`' which we
  will prove later, the theorems ~dfbiif-P2.3a , and ~dfbionlyif-P2.3b can be
  used to show that the `<->` symbol is always eliminable.

  Finally, we combine the previous statement into one in the form of
  ~dfbialt-P2.4 .  This can be thought of as the standard form of the
  definition which follows the typical idiom... 

  definiendum '`<->`' definiens.
$)

$( ------------------------------------------------------------------------- $)

${
    $(  "If" Part of ~df-bi-D2.1 . $)
    dfbiif-P2.3a $p 
        |- (
          -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) ) -> ( w_ph <-> w_ps )
        ) 
    $= 
        ( wff-bi wff-imp wff-neg df-bi-D2.1 simpr-L2.2b.SH )
        ABCZABDBADEDEZDIHDABFG 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $(  "Only If" Part of ~df-bi-D2.1 . $)
    dfbionlyif-P2.3b $p 
        |- (
          ( w_ph <-> w_ps ) -> -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) )
        ) 
    $= 
        ( wff-bi wff-imp wff-neg df-bi-D2.1 simpl-L2.2a.SH )
        ABCZABDBADEDEZDIHDABFG 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Alternate Form of ~df-bi-D2.1 . $)
    dfbialt-P2.4 $p
        |- (
          ( w_ph <-> w_ps ) <-> -. ( ( w_ph -> w_ps ) -> -. ( w_ps -> w_ph ) )
        )
    $= 
        ( wff-bi wff-imp wff-neg df-bi-D2.1 dfbiif-P2.3a ax-MP ) 
        ABCZABDBADEDEZDJIDEDEIJCABFIJGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  Taken together, the properties ~bifwd-P2.5a , ~birev-P2.5b , and
  ~bicmb-P2.5c completely define logical equivalence.
$)

$( ------------------------------------------------------------------------- $)

${
    $( '`<->`' Forward Implication. $)
    bifwd-P2.5a $p |- ( ( w_ph <-> w_ps ) -> ( w_ph -> w_ps ) ) $= 
        ( wff-bi wff-imp wff-neg dfbionlyif-P2.3b simpl-L2.2a syl-P1.2 ) 
        ABCABDZBADZEDEIABFIJGH
    $.
$}

${
    bifwd-P2.5a.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~bifwd-P2.5a . $)
    bifwd-P2.5a.SH $p |- ( w_ph -> w_ps ) $= 
        ( wff-bi wff-imp bifwd-P2.5a ax-MP ) ABDABECABFG 
    $.
$}

${
    bifwd-P2.5a.AC.SH.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Deductive Form of ~bifwd-P2.5a $)
    bifwd-P2.5a.AC.SH $p |- ( w_ga -> ( w_ph -> w_ps ) ) $= 
        ( wff-bi wff-imp bifwd-P2.5a axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCABFZFDKLCKLFCABGHIJ
    $.
$}

${
    bifwd-P2.5a.2AC.SH.1 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ph <-> w_ps ) ) ) $.
    
    $( Another Deductive form of ~bifwd-P2.5a . $)
    bifwd-P2.5a.2AC.SH $p |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> w_ps ) ) ) $= 
        ( wff-bi wff-imp bifwd-P2.5a axL1.SH rcp-FR2.SH ax-MP ) 
        CDABFZGGCDABGZGGELMDCDLMGZGCNDABHIIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`<->`' Reverse Implication. $)
    birev-P2.5b $p |- ( ( w_ph <-> w_ps ) -> ( w_ps -> w_ph ) ) $= 
        ( wff-bi wff-imp wff-neg dfbionlyif-P2.3b simpr-L2.2b syl-P1.2 ) 
        ABCABDZBADZEDEJABFIJGH 
    $.
$}

${
    birev-P2.5b.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~birev-P2.5b . $)
    birev-P2.5b.SH $p |- ( w_ps -> w_ph ) $= 
        ( wff-bi wff-imp birev-P2.5b ax-MP ) ABDBAECABFG
    $.
$}

${
    birev-P2.5b.AC.SH.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Deductive Form of ~birev-P2.5b $)
        birev-P2.5b.AC.SH $p |- ( w_ga -> ( w_ps -> w_ph ) ) $= 
        ( wff-bi wff-imp birev-P2.5b axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCBAFZFDKLCKLFCABGHIJ
    $.
$}

${
    birev-P2.5b.2AC.SH.1 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ph <-> w_ps ) ) ) $.

    $( Another Deductive Form of ~birev-P2.5b $)
    birev-P2.5b.2AC.SH $p |- ( w_ga1 -> ( w_ga2 -> ( w_ps -> w_ph ) ) ) $=
        ( wff-bi wff-imp birev-P2.5b axL1.SH rcp-FR2.SH ax-MP )
        CDABFZGGCDBAGZGGELMDCDLMGZGCNDABHIIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`<->`' Combine Implications. $)
    bicmb-P2.5c $p 
        |- ( ( w_ph -> w_ps ) -> ( ( w_ps -> w_ph ) -> ( w_ph <-> w_ps ) ) )
    $= 
        ( wff-imp wff-neg wff-bi cmb-L2.3 dfbiif-P2.3a axL1.SH
          mpt-P1.8.2AC.2SH )
        ABCZBACZDCDZABEZJKJKFKLMCZCJNKABGHHI 
    $.
$}

${
    bicmb-P2.5c.2SH.1 $e |- ( w_ph -> w_ps ) $.
    bicmb-P2.5c.2SH.2 $e |- ( w_ps -> w_ph ) $.
    
    $( Inference from ~bicmb-P2.5c . $)
    bicmb-P2.5c.2SH $p |- ( w_ph <-> w_ps ) $= 
        ( wff-imp wff-bi bicmb-P2.5c ax-MP ) BAEZABFZDABEIJECABGHH
    $.
$}

${
    bicmb-P2.5c.AC.2SH.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    bicmb-P2.5c.AC.2SH.2 $e |- ( w_ga -> ( w_ps -> w_ph ) ) $.
    
    $( Deductive Form of ~bicmb-P2.5c . $)
    bicmb-P2.5c.AC.2SH $p |- ( w_ga -> ( w_ph <-> w_ps ) ) $= 
        ( wff-imp wff-bi bicmb-P2.5c axL1.SH rcp-FR1.SH ax-MP ) 
        CBAFZFCABGZFELMCCABFZFCLMFZFDNOCNOFCABHIJKJK 
    $.
$}

${
    bicmb-P2.5c.2AC.2SH.1 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ph -> w_ps ) ) ) $.
    bicmb-P2.5c.2AC.2SH.2 $e |- ( w_ga1 -> ( w_ga2 -> ( w_ps -> w_ph ) ) ) $.
    
    $( Another Deductive Form of ~bicmb-P2.5c . $)
    bicmb-P2.5c.2AC.2SH $p |- ( w_ga1 -> ( w_ga2 -> ( w_ph <-> w_ps ) ) ) $=
        ( wff-imp wff-bi bicmb-P2.5c axL1.SH rcp-FR2.SH ax-MP )
        CDBAGZGGCDABHZGGFMNDCCDABGZGGCDMNGZGGEOPDCDOPGZGCQDABIJJKLKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Equivalence Relation Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  Show that '`<->`' is an equivalence relation.
$)

$( ------------------------------------------------------------------------- $)

${
    $( Equivalence Property: '`<->`' Reflexivity. $)
    biref-P2.6a $p |- ( w_ph <-> w_ph ) $= 
        ( id-P1.4 bicmb-P2.5c.2SH ) AAABZDC 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Equivalence Property: '`<->`' Symmetry. $)
    bisym-P2.6b $p |- ( ( w_ph <-> w_ps ) -> ( w_ps <-> w_ph ) ) $= 
        ( wff-bi birev-P2.5b bifwd-P2.5a bicmb-P2.5c.AC.2SH ) BAABCABDABEF 
    $.
$}

${
    bisym-P2.6b.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~bisym-P2.6b . $)
    bisym-P2.6b.SH $p |- ( w_ps <-> w_ph ) $= 
        ( wff-bi bisym-P2.6b ax-MP ) ABDBADCABEF 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Equivalence Property: '`<->`' Transitivity. $)
    bitrns-P2.6c $p 
        |- ( ( w_ph <-> w_ps ) -> ( ( w_ps <-> w_ch ) -> ( w_ph <-> w_ch ) ) )
    $=
        ( wff-bi ax-L1 bifwd-P2.5a.2AC.SH wff-imp id-P1.4 axL1.SH
          sylt-P1.9.2AC.2SH birev-P2.5b.2AC.SH bicmb-P2.5c.2AC.2SH )
        ACABDZBCDZABCMNABMNMNEZFBCMNNNGMNHIZFJCBAMNBCMNPKABMNOKJL
    $.
$}

${
    bitrns-P2.6c.2SH.1 $e |- ( w_ph <-> w_ps ) $.
    bitrns-P2.6c.2SH.2 $e |- ( w_ps <-> w_ch ) $.

    $( Inference from ~bitrns-P2.6c . $)
    bitrns-P2.6c.2SH $p |- ( w_ph <-> w_ch ) $=
        ( wff-bi wff-imp bitrns-P2.6c ax-MP ) BCFZACFZEABFJKGDABCHII
    $.
$}

${
    bitrns-P2.6c.AC.2SH.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    bitrns-P2.6c.AC.2SH.2 $e |- ( w_ga -> ( w_ps <-> w_ch ) ) $.

    $( Deductive Form of ~bitrns-P2.6c . $)
    bitrns-P2.6c.AC.2SH $p |- ( w_ga -> ( w_ph <-> w_ch ) ) $=
        ( wff-bi wff-imp bitrns-P2.6c axL1.SH rcp-FR1.SH ax-MP )
        DBCGZHDACGZHFMNDDABGZHDMNHZHEOPDOPHDABCIJKLKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These theorems can be chained together to produce a countably infinite set
  of rules of the form...

  `( ( w_ph <-> w_ps ) -> ( w_th <-> w_th ( w_ps `/` w_ph ) )`,

  where '`w_th`' involves some combination of connectives '`-.`' and '`->`', 
  and contains the sub-formula '`w_ph`'.  The notation
  '`w_th ( w_ps `/` w_ph )`' indicates the formula '`w_th`' with one or more
  instances of the sub-formula '`w_ph`' replaced with '`w_ps`'.

  This idea will be expanded to formulas with quantifiers after developing the
  rules of predicate calculus.
$)

$( ------------------------------------------------------------------------- $)

${
    $( Substitution Theorem for '`-.`'. $)
    subneg-P2.7 $p |- ( ( w_ph <-> w_ps ) -> ( -. w_ph <-> -. w_ps ) ) $= 
        ( wff-neg wff-bi birev-P2.5b trnsp-P1.15c.AC.SH bifwd-P2.5a
          bicmb-P2.5c.AC.2SH )
        ACBCABDZBAIABEFABIABGFH 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Left Substitution Theorem for '`->`'. $)
    subiml-P2.8a $p 
        |- ( ( w_ph <-> w_ps ) -> ( ( w_ph -> w_ch ) <-> ( w_ps -> w_ch ) ) )
    $= 
        ( wff-imp wff-bi birev-P2.5b imsubl-P1.7b.AC.SH bifwd-P2.5a
         bicmb-P2.5c.AC.2SH ) 
        ACDBCDABEZBACJABFGABCJABHGI 
    $.
$}

${
    subiml-P2.8a.SH.1 $e |- ( w_ph <-> w_ps ) $.
    
    $( Inference from ~subiml-P2.8a . $)
    subiml-P2.8a.SH $p |- ( ( w_ph -> w_ch ) <-> ( w_ps -> w_ch ) ) $= 
        ( wff-bi wff-imp subiml-P2.8a ax-MP ) ABEACFBCFEDABCGH 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Right Substitution Theorem for '`->`'. $)
    subimr-P2.8b $p 
        |- ( ( w_ph <-> w_ps ) -> ( ( w_ch -> w_ph ) <-> ( w_ch -> w_ps ) ) )
    $= 
        ( wff-imp wff-bi bifwd-P2.5a imsubr-P1.7a.AC.SH birev-P2.5b 
          bicmb-P2.5c.AC.2SH ) 
        CADCBDABEZABCJABFGBACJABHGI 
    $.
$}

${
    subimr-P2.8b.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~subimr-P2.8b . $)
    subimr-P2.8b.SH $p |- ( ( w_ch -> w_ph ) <-> ( w_ch -> w_ps ) ) $= 
        ( wff-bi wff-imp subimr-P2.8b ax-MP ) ABECAFCBFEDABCGH 
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Conjunction
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Defining Logical Conjunction.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the "and" symbol '`/\`'. $)
    wff-and $a wff ( w_ph /\ w_ps ) $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of Conjunction, '`/\`'. Read as "and". $)
    df-and-D2.2 $a |- ( ( w_ph /\ w_ps ) <-> -. ( w_ph -> -. w_ps ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  
  Taken together, the properties ~simpl-P2.11a , ~simpr-P2.11b , and
  ~cmb-P2.11c completely define logical conjunction.
$)

${
    $( '`/\`' Left Simplification. $)
    simpl-P2.11a $p |- ( ( w_ph /\ w_ps ) -> w_ph ) $= 
        ( wff-and wff-neg wff-imp df-and-D2.2 bifwd-P2.5a.SH simpl-L2.2a
          syl-P1.2 ) 
        ABCZABDEDZAJKABFGABHI 
    $.
$}

${
    simpl-P2.11a.AC.SH.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.
    
    $( Deductive Form of ~simpl-P2.11a . $)
    simpl-P2.11a.AC.SH $p |- ( w_ga -> w_ph ) $= 
        ( wff-and wff-imp simpl-P2.11a axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCAFDKACKAFCABGHIJ 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Right Simplification. $)
    simpr-P2.11b $p |- ( ( w_ph /\ w_ps ) -> w_ps ) $= 
        ( wff-and wff-neg wff-imp df-and-D2.2 bifwd-P2.5a.SH simpr-L2.2b
          syl-P1.2 ) 
        ABCZABDEDZBJKABFGABHI 
    $.
$}

${
    simpr-P2.11b.AC.SH.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.
    
    $( Deductive Form of ~simpr-P2.11b . $)
    simpr-P2.11b.AC.SH $p |- ( w_ga -> w_ps ) $= 
        ( wff-and wff-imp simpr-P2.11b axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCBFDKBCKBFCABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Introduction by Combination. $)
    cmb-P2.11c $p |- ( w_ph -> ( w_ps -> ( w_ph /\ w_ps ) ) ) $= 
        ( wff-neg wff-imp wff-and cmb-L2.3 df-and-D2.2 subimr-P2.8b.SH
          birev-P2.5b.SH ax-MP )
        ABABCDCZDZDZABABEZDZDZABFPMOLANKBABGHHIJ 
    $.
$}

${
    cmb-P2.11c.AC.2SH.1 $e |- ( w_ga -> w_ph ) $.
    cmb-P2.11c.AC.2SH.2 $e |- ( w_ga -> w_ps ) $.

    $( Deductive Form of ~cmb-P2.11c . $)
    cmb-P2.11c.AC.2SH $p |- ( w_ga -> ( w_ph /\ w_ps ) ) $= 
        ( wff-imp wff-and cmb-P2.11c axL1.SH rcp-FR1.SH ax-MP ) 
        CBFCABGZFEBLCCAFCBLFZFDAMCAMFCABHIJKJK 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Importation and Exportation Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`/\`' Importation Theorem. $)
    import-P2.10a $p 
        |- ( ( w_ph -> ( w_ps -> w_ch ) ) -> ( ( w_ph /\ w_ps ) -> w_ch ) )
    $= 
        ( wff-imp wff-neg wff-and import-L2.1a df-and-D2.2 subiml-P2.8a.SH
          birev-P2.5b.SH syl-P1.2 ) 
        ABCDDABEDEZCDZABFZCDZABCGOMNLCABHIJK 
    $.
$}

${
    import-P2.10a.SH.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference from ~import-P2.10a . $)
    import-P2.10a.SH $p |- ( ( w_ph /\ w_ps ) -> w_ch ) $= 
        ( wff-imp wff-and import-P2.10a ax-MP ) ABCEEABFCEDABCGH 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Exportation Theorem. $)
    export-P2.10b $p 
        |- ( ( ( w_ph /\ w_ps ) -> w_ch ) -> ( w_ph -> ( w_ps -> w_ch ) ) ) 
    $= 
        ( wff-and wff-imp wff-neg df-and-D2.2 subiml-P2.8a.SH bifwd-P2.5a.SH
          export-L2.1b syl-P1.2 ) 
        ABDZCEZABFEFZCEZABCEEMOLNCABGHIABCJK 
    $.
$}

${
    export-P2.10b.SH.1 $e |- ( ( w_ph /\ w_ps ) -> w_ch ) $.

    $( Inference from ~export-P2.10b . $)
    export-P2.10b.SH $p |- ( w_ph -> ( w_ps -> w_ch ) ) $= 
        ( wff-and wff-imp export-P2.10b ax-MP ) ABECFABCFFDABCGH 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Commutative and Associative Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Lemma for ~andcomm-P2.12 . $)
    andcomm-P2.12-L1 $p |- ( ( w_ph /\ w_ps ) -> ( w_ps /\ w_ph ) ) $= 
        ( wff-and simpr-P2.11b simpl-P2.11a cmb-P2.11c.AC.2SH ) BAABCABDABEF
    $.
$}

${
    $( '`/\`' Commutativity. $)
    andcomm-P2.12 $p |- ( ( w_ph /\ w_ps ) <-> ( w_ps /\ w_ph ) ) $=
        ( wff-and andcomm-P2.12-L1 bicmb-P2.5c.2SH ) ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~andassoc-P2.13 . $)
    andassoc-P2.13-L1 $p 
        |- ( ( ( w_ph /\ w_ps ) /\ w_ch ) -> ( w_ph /\ ( w_ps /\ w_ch ) ) )
    $= 
        ( wff-and simpl-P2.11a simpl-P2.11a.AC.SH simpr-P2.11b.AC.SH
          simpr-P2.11b cmb-P2.11c.AC.2SH ) 
        ABCDABDZCDZABKJCEZFBCKABKLGJCHII 
    $.
$}

${
    $( Lemma for ~andassoc-P2.13 . $)
    andassoc-P2.13-L2 $p
        |- ( ( w_ph /\ ( w_ps /\ w_ch ) ) -> ( ( w_ph /\ w_ps ) /\ w_ch ) )
    $= 
        ( wff-and simpl-P2.11a simpr-P2.11b simpl-P2.11a.AC.SH
          cmb-P2.11c.AC.2SH simpr-P2.11b.AC.SH ) 
        ABDCABCDZDZABKAJEBCKAJFZGHBCKLIH 
    $.
$}

${
    $( '`/\`' Associativity. $)
    andassoc-P2.13 $p 
        |- ( ( ( w_ph /\ w_ps ) /\ w_ch ) <-> ( w_ph /\ ( w_ps /\ w_ch ) ) )
    $= 
        ( wff-and andassoc-P2.13-L1 andassoc-P2.13-L2 bicmb-P2.5c.2SH )
        ABDCDABCDDABCEABCFG 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Left Substitution Theorem for '`/\`'. $)
    subandl-P2.14a $p
        |- ( ( w_ph <-> w_ps ) -> ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_ch ) ) )
    $=
        ( wff-and wff-neg wff-imp wff-bi df-and-D2.2 axL1.SH subiml-P2.8a
         subneg-P2.7 syl-P1.2 bitrns-P2.6c.AC.2SH bisym-P2.6b.SH )
        ACDZBCEZFZEZBCDZABGZOAPFZEZRTOUBGTACHITUAQGUBRGABPJUAQKLMRSGTSRBCHNIM
    $.
$}

${
    subandl-P2.14a.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~subandl-P2.14a . $)
    subandl-P2.14a.SH $p |- ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_ch ) ) $=
        ( wff-bi wff-and subandl-P2.14a ax-MP ) ABEACFBCFEDABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Right Substitution Theorem for '`/\`'. $)
    subandr-P2.14b $p
        |- ( ( w_ph <-> w_ps ) -> ( ( w_ch /\ w_ph ) <-> ( w_ch /\ w_ps ) ) )
    $=
        ( wff-and wff-bi andcomm-P2.12 axL1.SH subandl-P2.14a
          bitrns-P2.6c.AC.2SH )
        CADZBCDZCBDZABEZJACDZKMJNEMCAFGABCHIKLEMBCFGI
    $.
$}

${
    subandr-P2.14b.SH.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference from ~subandr-P2.14b . $)
    subandr-P2.14b.SH $p |- ( ( w_ch /\ w_ph ) <-> ( w_ch /\ w_ps ) ) $=
        ( wff-bi wff-and subandr-P2.14b ax-MP ) ABECAFCBFEDABCGH 
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Disjunction
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Defining Logical Disjunction.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the "or" symbol '`\/`'. $)
    wff-or $a wff ( w_ph \/ w_ps ) $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of Disjunction, '`\/`'. Read as "or". $)
    df-or-D2.3 $a |- ( ( w_ph \/ w_ps ) <-> ( -. w_ph -> w_ps ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  
  Taken together, the properties ~orintl-P2.15a , ~orintr-P2.15b , and
  ~orelim-P2.15c completely define logical disjunction.
$)

$( ------------------------------------------------------------------------- $)

${
    $( Left Introduction Rule for '`\/`'. $)
    orintl-P2.15a $p |- ( w_ph -> ( w_ps \/ w_ph ) ) $=
        ( wff-neg wff-imp wff-or poe-P1.11b trnsp-P1.15b df-or-D2.3
          birev-P2.5b.SH dsyl-P1.3 )
        AACBDBCADZBAEZABFABGLKBAHIJ
    $.
$}

${
    orintl-P2.15a.AC.SH.1 $e |- ( w_ga -> w_ph ) $.

    $( Deductive Form of ~orintl-P2.15a . $)
    orintl-P2.15a.AC.SH $p |- ( w_ga -> ( w_ps \/ w_ph ) ) $=
        ( wff-imp wff-or orintl-P2.15a axL1.SH rcp-FR1.SH ax-MP )
        CAECBAFZEDAKCAKECABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Right Introduction Rule for '`\/`'. $)
    orintr-P2.15b $p |- ( w_ph -> ( w_ph \/ w_ps ) ) $=
        ( wff-neg wff-imp wff-or poe-P1.11b df-or-D2.3 birev-P2.5b.SH
         syl-P1.2 )
        AACBDZABEZABFKJABGHI
    $.
$}

${
    orintr-P2.15b.AC.SH.1 $e |- ( w_ga -> w_ph ) $.

    $( Deductive Form of ~orintr-P2.15b . $)
    orintr-P2.15b.AC.SH $p |- ( w_ga -> ( w_ph \/ w_ps ) ) $=
        ( wff-imp wff-or orintr-P2.15b axL1.SH rcp-FR1.SH ax-MP )
        CAECABFZEDAKCAKECABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Elimination Rule.

       This is also known as the "Proof by Cases" rule. $)
    orelim-P2.15c $p
        |- ( 
          ( w_ph -> w_ch ) ->
          ( ( w_ps -> w_ch ) ->
          ( ( w_ph \/ w_ps ) -> w_ch ) )
        ) 
    $=
        ( wff-imp wff-or wff-and simpl-P2.11a axL1.AC.SH import-P2.10a.SH
          wff-neg simpr-P2.11b df-or-D2.3 bifwd-P2.5a.SH syl-P1.2
          sylt-P1.9.AC.2SH pfbycase-P1.17.AC.2SH export-P2.10b.SH )
        ACDZBCDZABEZCDRSFZTCACUATFZUATRRTUARSGHIAJZBCUBUBTUCBDZUATKTUDABLMNUAT
        SSTUARSKHIOPQQ
    $.
$}

${
    orelim-P2.15c.AC.3SH.1 $e |- ( w_ga -> ( w_ph -> w_ch ) ) $.
    orelim-P2.15c.AC.3SH.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.
    orelim-P2.15c.AC.3SH.3 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.

    $( Deductive Form of ~orelim-P2.15c . $)
    orelim-P2.15c.AC.3SH $p |- ( w_ga -> w_ch ) $=
        ( wff-or wff-imp orelim-P2.15c axL1.SH rcp-FR1.SH ax-MP axL2.SH )
        DABHZIDCIGDOCDBCIZIDOCIZIFPQDDACIZIDPQIZIERSDRSIDABCJKLMLMNM
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  The Law of Excluded Middle.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Law of Excluded Middle. $)
    exclmid-P2.16 $p |- ( w_ph \/ -. w_ph ) $=
        ( wff-neg wff-or orintr-P2.15b orintl-P2.15a pfbycase-P1.17.2SH )
        AAABZCAGDGAEF
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  True and False Constants.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Defining True.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the "true" constant '`T.`'. $)
    wff-true $a wff T. $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Justification Theorem.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Justification Theorem for ~df-true-D2.4 . $)
    truejust-P2.17 $p
        |- ( ( A. x x = x -> A. x x = x ) <-> ( A. y y = y -> A. y y = y ) )
    $=
        ( term-obj wff-equals wff-forall wff-imp id-P1.4 axL1.SH
          bicmb-P2.5c.2SH )
        ACZJDAEZKFZBCZMDBEZNFZOLNGHLOKGHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of True, '`T.`'. $)
    df-true-D2.4 $a |- ( T. <-> ( A. x x = x -> A. x x = x ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Property of "True" Constant.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`T.`' is a theorem. $)
    true-P2.18 $p |- T. $=
        ( objvar-x term-obj wff-equals wff-forall wff-imp wff-true id-P1.4
          df-true-D2.4 birev-P2.5b.SH ax-MP )
        ABZKCADZLEZFZLGNMAHIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Defining False.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the "false" constant '`F.`'. $)
    wff-false $a wff F. $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of False, '`F.`'. $)
    df-false-D2.5 $a |- ( F. <-> -. T. ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Property of "False" Constant.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`F.`' is refutable. $)
    false-P2.19 $p |- -. F. $=
        ( wff-true wff-false wff-neg true-P2.18 df-false-D2.5 bifwd-P2.5a.SH
          trnsp-P1.15a.SH ax-MP )
        AZBZCDJIJICEFGH
    $.
$}
$( End $[ bfol-ch2.mm $] $)
$( Begin $[ bfol-ch3.mm $] $)

$(
##############################################################################
  Chapter 3: Propositional Calculus (Natural Deduction)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Define Conjunction Tuples.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

${
    $( Extend WFF definition to include '`/\`' 3-Tuple. $)
    wff-rcp-AND3 $a wff ( w_ph1 /\ w_ph2 /\ w_ph3 ) $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' 3-Tuple. $)
    df-rcp-AND3 $a
        |- ( 
          ( w_ph1 /\ w_ph2 /\ w_ph3 ) <-> 
          ( ( w_ph1 /\ w_ph2 ) /\ w_ph3 )
        )
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Extend WFF definition to include '`/\`' 4-Tuple. $)
    wff-rcp-AND4 $a wff ( w_ph1 /\ w_ph2 /\ w_ph3 /\ w_ph4 ) $.
$}

${
    $( '`/\`' 4-Tuple. $)
    df-rcp-AND4 $a
        |- ( 
          ( w_ph1 /\ w_ph2 /\ w_ph3 /\ w_ph4 ) <-> 
          ( ( w_ph1 /\ w_ph2 /\ w_ph3 ) /\ w_ph4 )
        )
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Extend WFF definition to include '`/\`' 5-Tuple. $)
    wff-rcp-AND5 $a wff ( w_ph1 /\ w_ph2 /\ w_ph3 /\ w_ph4 /\ w_ph5 ) $.
$}

${
    $( '`/\`' 5-Tuple. $)
    df-rcp-AND5 $a
        |- ( 
          ( w_ph1 /\ w_ph2 /\ w_ph3 /\ w_ph4 /\ w_ph5 ) <-> 
          ( ( w_ph1 /\ w_ph2 /\ w_ph3 /\ w_ph4 ) /\ w_ph5 )
        )
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Natural Deduction for Propositional Calculus.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

  These rules introduce a new axiomatic system designed to emulate natural
  deduction using Gentzen sequent notation.  Lines are writen as...
  
  `( w_ga -> w_ph )`,

  to emulate the sequent notation...

  `w_ga` `|-` `w_ph`.

  '`w_ga`' can be understood as a list of assumptions.  Here we write
  
  `( ( w_ga1 /\ w_ga2 /\ ` ... `w_ga`_n ` ) -> w_ph )`,

  to emulate...

   `w_ga1`, `w_ga2`, ... , `w_ga`_n `|- w_ph`.

  Rule 1 is used to emulate the statement (or re-statement) of an assumption
  (i.e. a formula on the left hand side), and rule 2 is used to import an
  earlier result into a new context with additional assumptions (i.e.
  additional formulas on the left hand side).  Either of these two rules can
  be used to emulate the introduction of a new assumptions.  Rules 3, 5, and
  12 are used emulate the discharging of assumptions.

  The one limitation of our notation is the inability to express the case
  where the left side of the sequent is empty.  To facilitate this we must 
  introduce the symbol '`T.`' along with two additional rules (17 and 18) for
  its introduction and elimination.  We can then replace '`w_ga`' with '`T.`'
  and use any of the rules 1 - 15 as normal. Rules 19 and 20 introduce and
  eliminate the the corresponding '`F.`' symbol. This symbol isn't strictly
  necessary, but serves for more convenient and standard notation when doing
  natural deduction proofs by contradiction. Rule 3 would usually be used to
  introduce '`F.`', but the redundant rule 19 is included as the corresponding
  dual form of the '`T.`' rule.
  
  In our syntax...

  `( w_ga1 /\ w_ga2 /\ w_ga3 /\ ` ... `w_ga`_n `)` 

  is shorthand for...

  `(` ... `( ( w_ga1 /\ w_ga2 ) /\ w_ga3 ) ` ... `w_ga`_n `)`.

  This syntax allows one to write sequents of length longer than three without
  the need for nested parentheses.  The recipes 'rcp-NDSEP' and 'rcp-NDJOIN'
  facilitate the use of this syntax.  Addational versions can be added as
  needed for longer sequents.
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Natural Deduction: State Assumption. 

       This rule is simply stating an assumption. $)
    ndasm-P3.1 $p |- ( ( w_ga /\ w_ph ) -> w_ph ) $=
        ( simpr-P2.11b ) BAC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndimp-P3.2.1 $e |- ( w_ga -> w_ph ) $.

    $( Natural Deduction: Import Previous Consequent.

       Any previous consequent can be re-stated with an additional
       assumption added. $)
    ndimp-P3.2 $p |- ( ( w_ga /\ w_ps ) -> w_ph ) $=
        ( axL1.AC.SH import-P2.10a.SH ) CBAABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnegi-P3.3.1 $e |- ( ( w_ga /\ w_ph ) -> w_ps ) $.
    ndnegi-P3.3.2 $e |- ( ( w_ga /\ w_ph ) -> -. w_ps ) $.

    $( Natural Deduction: '`-.`' Introduction Rule. 

       If an assumption leads to a contradiction, then we can discharge it
       and conclude its negation. $)
    ndnegi-P3.3 $p |- ( w_ga -> -. w_ph ) $=
        ( export-P2.10b.SH wff-neg pfbycont-P1.16.AC.2SH ) ABCCABDFCABGEFH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnege-P3.4.1 $e |- ( w_ga -> w_ph ) $.
    ndnege-P3.4.2 $e |- ( w_ga -> -. w_ph ) $.

    $( Natural Deduction: '`-.`' Elimination Rule.

       If we can deduce a contradiction within some context, then we can 
       deduce any arbitrary WFF from that same context. $)
    ndnege-P3.4 $p |- ( w_ga -> w_ps ) $=
        ( poe-P1.11b.AC.2SH ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndimi-P3.5.1 $e |- ( ( w_ga /\ w_ph ) -> w_ps ) $.

    $( Natural Deduction: '`->`' Introduction Rule. 

       If we can deduce '`w_ps`' after assuming '`w_ph`', then we can
       conclude '`w_ph -> w_ps`' with '`w_ph`' discharged. $)
    ndimi-P3.5 $p |- ( w_ga -> ( w_ph -> w_ps ) ) $=
        ( export-P2.10b.SH ) CABDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndime-P3.6.1 $e |- ( w_ga -> w_ph ) $.
    ndime-P3.6.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Natural Deduction: '`->`' Elimination Rule. 

       This rule is just Modus Ponens with an added context. $)
    ndime-P3.6 $p |- ( w_ga -> w_ps ) $=
        ( mpt-P1.8.AC.2SH ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndandi-P3.7.1 $e |- ( w_ga -> w_ph ) $.
    ndandi-P3.7.2 $e |- ( w_ga -> w_ps ) $.

    $( Natural Deduction: '`/\`' Introduction Rule.

       Deduce the conjunction of two previously deduced WFFs. $)
    ndandi-P3.7 $p |- ( w_ga -> ( w_ph /\ w_ps ) ) $=
        ( cmb-P2.11c.AC.2SH ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndandel-P3.8.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.

    $( Natural Deduction: Left '`/\`' Elimination Rule. 

       Deduce the left conjunct of a previously deduced conjunction. $)
    ndandel-P3.8 $p |- ( w_ga -> w_ps ) $=
        ( simpr-P2.11b.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndander-P3.9.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.

    $( Natural Deduction: Right '`/\`' Elimination Rule. 

       Deduce the right conjunct of a previously deduced conjunction. $)
    ndander-P3.9 $p |- ( w_ga -> w_ph ) $=
        ( simpl-P2.11a.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndoril-P3.10.1 $e |- ( w_ga -> w_ph ) $.

    $( Natural Deduction: Left '`\/`' Introduction Rule. 

       Deduce a new disjunction containing an arbitrary WFF to the left of a
       previously deduced WFF. $)
    ndoril-P3.10 $p |- ( w_ga -> ( w_ps \/ w_ph ) ) $=
        ( orintl-P2.15a.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndorir-P3.11.1 $e |- ( w_ga -> w_ph ) $.

    $( Natural Deduction: Right '`\/`' Introduction Rule. 

       Deduce a new disjunction containing an arbitrary WFF to the right of a
       previously deduced WFF. $)
    ndorir-P3.11 $p |- ( w_ga -> ( w_ph \/ w_ps ) ) $=
        ( orintr-P2.15b.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndore-P3.12.1 $e |- ( ( w_ga /\ w_ph ) -> w_ch ) $.
    ndore-P3.12.2 $e |- ( ( w_ga /\ w_ps ) -> w_ch ) $.
    ndore-P3.12.3 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.

    $( Natural Deduction: '`\/`' Elimination Rule. 

       If...

       1.) after assuming '`w_ph`' we deduce '`w_ch`',
       
       2.) after assuming '`w_ps`' we also deduce '`w_ch`', and

       3.) we know that either '`w_ph`' or '`w_ps`' holds,

       then we can deduce '`w_ch`' with the case assumptions, '`w_ph`' and
       '`w_ps`', discharged.  $)
    ndore-P3.12 $p |- ( w_ga -> w_ch ) $=
        ( export-P2.10b.SH orelim-P2.15c.AC.3SH ) ABCDDACEHDBCFHGI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndbii-P3.13.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    ndbii-P3.13.2 $e |- ( w_ga -> ( w_ps -> w_ph ) ) $.

    $( Natural Deduction: '`<->`' Introduction Rule.

       If we have previously deduced both directions of a biconditional, then
       we can deduce the full biconditional. $)
    ndbii-P3.13 $p |- ( w_ga -> ( w_ph <-> w_ps ) ) $=
        ( bicmb-P2.5c.AC.2SH ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndbief-P3.14.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Natural Deduction: '`<->`' Forward Implication Rule. 

       After deducing a biconditional statement, we can deduce the assocated
       forward implication. $)
    ndbief-P3.14 $p |- ( w_ga -> ( w_ph -> w_ps ) ) $=
        ( bifwd-P2.5a.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndbier-P3.15.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Natural Deduction: '`<->`' Reverse Implication Rule.

       After deducing a biconditional statement, we can deduce the associated
       reverse implication. $)
    ndbier-P3.15 $p |- ( w_ga -> ( w_ps -> w_ph ) ) $=
        ( birev-P2.5b.AC.SH ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Law of Excluded Middle (restated). 

       Every WFF '`w_ph`' is either true or false.  This law is rejected
       within intuitionist logic. $)
    ndexclmid-P3.16 $p |- ( w_ph \/ -. w_ph ) $=
        ( exclmid-P2.16 ) AB
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Rules for "True" and "False" Constants.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    ndtruei-P3.17.1 $e |- w_ph $.

    $( Natural Deduction: '`T.`' Introduction Rule. 

       This can be used to turn an ordinary theorem into a sequent.  In this
       case '`T.`' represents '`w_ga`' and any of the rules 1 - 15 can be
       applied. $)
    ndtruei-P3.17 $p |- ( T. -> w_ph ) $=
        ( wff-true axL1.SH ) ACBD 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndtruee-P3.18.1 $e |- ( T. -> w_ph ) $.

    $( Natural Deduction: '`T.`' Elimination Rule. 

       Rules 17 and 18 allow us to write '`( T. -> w_ph )`' as a synonym for
       stating "'`w_ph`' is true" (or, more precisely, deducable). $)
    ndtruee-P3.18 $p |- w_ph $=
        ( wff-true true-P2.18 ax-MP ) CADBE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndfalsei-P3.19.1 $e |- -. w_ph $.

    $( Natural Deduction: '`F.`' Introduction Rule.

       This statement can be proved from ~ndasm-P3.1 , ~ndimp-P3.2 ,
       ~ndimi-P3.5 , ~ndnege-P3.4 , ~ndtruei-P3.17 , and ~ndtruee-P3.18 . It's
       included to keep the pattern of having an introduction rule to go along
       with every elimination rule.  ~ndtruei-P3.17 would normally be
       redundant as well, but it is needed to facilitate the contextless cases
       not covered by rules 1 - 15. $)
    ndfalsei-P3.19 $p |- ( w_ph -> F. ) $=
        ( wff-false wff-imp wff-true wff-and ndasm-P3.1 wff-neg ndtruei-P3.17
          ndimp-P3.2 ndnege-P3.4 ndimi-P3.5 ndtruee-P3.18 )
        ACZDANEZANOAFAOGAHZAOPBIJKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndfalsee-P3.20.1 $e |- ( w_ph -> F. ) $.

    $( Natural Deduction: '`F.`' Elimination Rule. 

       Rules 19 and 20 allow us to write '`( w_ph -> F. )`' as a synonym for
       "'`w_ph`' is false" (or, more precisely, refutable).
$)
    ndfalsee-P3.20 $p |- -. w_ph $=
        ( wff-false wff-neg false-P2.19 trnsp-P1.15c.SH ax-MP ) CZDADEAHBFG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Separate Front Supposition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This recipe is used in conjunction with ~ndnegi-P3.3 , ~ndimi-P3.5 , and
  ~ndore-P3.12 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-NDSEP3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $.

    $( ( 1 `/\` 2 `/\` 3 ) `=>` ( ( 1 `/\` 2 ) `/\` 3 ). $)
    rcp-NDSEP3 $p |- ( ( ( w_ga1 /\ w_ga2 ) /\ w_ga3 ) -> w_ph ) $=
        ( wff-rcp-AND3 wff-imp wff-and df-rcp-AND3 subiml-P2.8a.SH
          bifwd-P2.5a.SH ax-MP )
        BCDFZAGZBCHDHZAGZENPMOABCDIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDSEP4.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph )
    $.

    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `=>` ( ( 1 `/\` 2 `/\` 3 ) `/\` 4 ). $)
    rcp-NDSEP4 $p
        |- ( ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) /\ w_ga4 ) -> w_ph )
    $=
        ( wff-rcp-AND4 wff-imp wff-rcp-AND3 wff-and df-rcp-AND4
          subiml-P2.8a.SH bifwd-P2.5a.SH ax-MP )
        BCDEGZAHZBCDIEJZAHZFPROQABCDEKLMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDSEP5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $.

    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `=>`
       ( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `/\` 5 ). $)
    rcp-NDSEP5 $p
        |- ( ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) /\ w_ga5 ) -> w_ph )
    $=
        ( wff-rcp-AND5 wff-imp wff-rcp-AND4 wff-and df-rcp-AND5
          subiml-P2.8a.SH bifwd-P2.5a.SH ax-MP )
        BCDEFHZAIZBCDEJFKZAIZGQSPRABCDEFLMNO
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Join Front Supposition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This recipe is used in conjunction with ~ndasm-P3.1 and ~ndimp-P3.2 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-NDJOIN3.1 $e |- ( ( ( w_ga1 /\ w_ga2 ) /\ w_ga3 ) -> w_ph ) $.

    $( ( ( 1 `/\` 2 ) `/\` 3 ) `=>` ( 1 `/\` 2 `/\` 3 ). $)
    rcp-NDJOIN3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $=
        ( wff-and wff-imp wff-rcp-AND3 df-rcp-AND3 bisym-P2.6b.SH
          subiml-P2.8a.SH bifwd-P2.5a.SH ax-MP )
        BCFDFZAGZBCDHZAGZEOQNPAPNBCDIJKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDJOIN4.1 $e
        |- ( ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) /\ w_ga4 ) -> w_ph )
    $.

    $( ( ( 1 `/\` 2 `/\` 3 ) `/\` 4 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 ). $)
    rcp-NDJOIN4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $=
        ( wff-rcp-AND3 wff-and wff-imp wff-rcp-AND4 df-rcp-AND4 bisym-P2.6b.SH
          subiml-P2.8a.SH bifwd-P2.5a.SH ax-MP )
        BCDGEHZAIZBCDEJZAIZFQSPRARPBCDEKLMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDJOIN5.1 $e
        |- ( ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) /\ w_ga5 ) -> w_ph )
    $.

    $( ( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `/\` 5 ) `=>`
       ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ). $)
    rcp-NDJOIN5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $=
        ( wff-rcp-AND4 wff-and wff-imp wff-rcp-AND5 df-rcp-AND5 bisym-P2.6b.SH
          subiml-P2.8a.SH bifwd-P2.5a.SH ax-MP )
        BCDEHFIZAJZBCDEFKZAJZGRTQSASQBCDEFLMNOP
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Utility Recipes.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  For the rest of the chapter we will treat P3.1 - P3.20 along with recipes
  NDSEP and NDJOIN as a new set of axioms.  From here on out, we will not rely
  on any results from chapters 1 or 2 (except indirectly through the new set
  of axioms).  

  This will allow us to track the use of ~ndexclmid-P3.16 .  By avoiding the
  Law of Excluded Middle, it is possible to develop an intuitionist logical
  framework alongside the standard classical case.

  From here on, all theorems derived without reference to the Law of Excluded
  Middle ( ~ndexclmid-P3.16 ) will have a `t.` in the comment. 
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Theorems for Stating / Re-Stating Assumptions.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These theorems may be used in place of ~ndasm-P3.1 .
$)

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 ) `->` 1. `t.` $)
    rcp-NDASM1of1 $p |- ( w_ga1 -> w_ga1 ) $=
        ( wff-imp wff-true ndasm-P3.1 ndimi-P3.5 ndtruee-P3.18 )
        AABAACZAGDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 ) `->` 1. `t.` $)

    rcp-NDASM1of2 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ga1 ) $=
        ( rcp-NDASM1of1 ndimp-P3.2 ) ABAACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 ) `->` 2. `t.` $)
    rcp-NDASM2of2 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ga2 ) $=
        ( ndasm-P3.1 ) BAC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 ) `->` 1. `t.` $)
    rcp-NDASM1of3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ga1 ) $=
        ( wff-and rcp-NDASM1of2 ndimp-P3.2 rcp-NDJOIN3 ) AABCACABDABEFG
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 ) `->` 2. `t.` $)
    rcp-NDASM2of3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ga2 ) $=
        ( wff-and rcp-NDASM2of2 ndimp-P3.2 rcp-NDJOIN3 ) BABCBCABDABEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 ) `->` 3. `t.` $)
    rcp-NDASM3of3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ga3 ) $=
        ( wff-and ndasm-P3.1 rcp-NDJOIN3 ) CABCCABDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `->` 1. `t.` $)
    rcp-NDASM1of4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga1 ) $=
        ( wff-rcp-AND3 rcp-NDASM1of3 ndimp-P3.2 rcp-NDJOIN4 )
        AABCDADABCEABCFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `->` 2. `t.` $)
    rcp-NDASM2of4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga2 ) $=
        ( wff-rcp-AND3 rcp-NDASM2of3 ndimp-P3.2 rcp-NDJOIN4 )
        BABCDBDABCEABCFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `->` 3. `t.` $)
    rcp-NDASM3of4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga3 ) $=
        ( wff-rcp-AND3 rcp-NDASM3of3 ndimp-P3.2 rcp-NDJOIN4 )
        CABCDCDABCEABCFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `->` 4. `t.` $)
    rcp-NDASM4of4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga4 ) $=
        ( wff-rcp-AND3 ndasm-P3.1 rcp-NDJOIN4 ) DABCDDABCEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `->` 1. `t.` $)
    rcp-NDASM1of5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ga1 )
    $=
        ( wff-rcp-AND4 rcp-NDASM1of4 ndimp-P3.2 rcp-NDJOIN5 )
        AABCDEAEABCDFABCDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `->` 2. `t.` $)
    rcp-NDASM2of5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ga2 )
    $=
        ( wff-rcp-AND4 rcp-NDASM2of4 ndimp-P3.2 rcp-NDJOIN5 )
        BABCDEBEABCDFABCDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `->` 3. `t.` $)
    rcp-NDASM3of5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ga3 )
    $=
        ( wff-rcp-AND4 rcp-NDASM3of4 ndimp-P3.2 rcp-NDJOIN5 )
        CABCDECEABCDFABCDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `->` 4. `t.` $)
    rcp-NDASM4of5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ga4 )
    $=
        ( wff-rcp-AND4 rcp-NDASM4of4 ndimp-P3.2 rcp-NDJOIN5 )
        DABCDEDEABCDFABCDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ) `->` 5. `t.` $)
    rcp-NDASM5of5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ga5 )
    $=
        ( wff-rcp-AND4 ndasm-P3.1 rcp-NDJOIN5 ) EABCDEEABCDFGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rules for Importing Previous Results.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~ndimp-P3.2 .
$)


$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP0addall.1 $e |- w_ph $.

    $( ( ) `=>` ( 1 `/\` ... `/\` n ). `t.` $)
    rcp-NDIMP0addall $p |- ( w_ga -> w_ph ) $=
        ( wff-imp wff-true ndtruei-P3.17 ndimp-P3.2 ndimi-P3.5
          ndtruee-P3.18 )
        BADBAEZABJACFGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP1add1.1 $e |- ( w_ga1 -> w_ph ) $.

    $( ( 1 ) `=>` ( 1 `/\` 2 ). `t.` $)
    rcp-NDIMP1add1 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $=
        ( ndimp-P3.2 ) ACBDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP2add1.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $.

    $( ( 1 `/\` 2 ) `=>` ( 1 `/\` 2 `/\` 3 ). `t.` $)
    rcp-NDIMP2add1 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $=
        ( wff-and ndimp-P3.2 rcp-NDJOIN3 ) ABCDADBCFEGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP3add1.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $.

    $( ( 1 `/\` 2 `/\` 3 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 ). `t.` $)
    rcp-NDIMP3add1 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $=
        ( wff-rcp-AND3 ndimp-P3.2 rcp-NDJOIN4 ) ABCDEAEBCDGFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP4add1.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph )
    $.

    $( ( 1 `/\` 2 `/\` 3 `/\` 4 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ). `t.` $)
    rcp-NDIMP4add1 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $=
        ( wff-rcp-AND4 ndimp-P3.2 rcp-NDJOIN5 ) ABCDEFAFBCDEHGIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP1add2.1 $e |- ( w_ga1 -> w_ph ) $.

    $( ( 1 ) `=>` ( 1 `/\` 2 `/\` 3 ). `t.` $)
    rcp-NDIMP1add2 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $=
        ( rcp-NDIMP1add1 rcp-NDIMP2add1 ) ABCDABCEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP2add2.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $.

    $( ( 1 `/\` 2 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 ). `t.` $)
    rcp-NDIMP2add2 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $=
        ( rcp-NDIMP2add1 rcp-NDIMP3add1 ) ABCDEABCDFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP3add2.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $.

    $( ( 1 `/\` 2 `/\` 3 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ). `t.` $)
    rcp-NDIMP3add2 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $=
        ( rcp-NDIMP3add1 rcp-NDIMP4add1 ) ABCDEFABCDEGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP1add3.1 $e |- ( w_ga1 -> w_ph ) $.

    $( ( 1 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 ). `t.` $)
    rcp-NDIMP1add3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $=
        ( rcp-NDIMP1add2 rcp-NDIMP3add1 ) ABCDEABCDFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP2add3.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $.

    $( ( 1 `/\` 2 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ). `t.` $)
    rcp-NDIMP2add3 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $=
        ( rcp-NDIMP2add2 rcp-NDIMP4add1 ) ABCDEFABCDEGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMP1add4.1 $e |- ( w_ga1 -> w_ph ) $.

    $( ( 1 ) `=>` ( 1 `/\` 2 `/\` 3 `/\` 4 `/\` 5 ). `t.` $)
    rcp-NDIMP1add4 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph ) $=
        ( rcp-NDIMP1add3 rcp-NDIMP4add1 ) ABCDEFABCDEGHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rules for Negation Introduction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~ndnegi-P3.3 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-NDNEGI1.1 $e |- ( w_ga1 -> w_ph ) $.
    rcp-NDNEGI1.2 $e |- ( w_ga1 -> -. w_ph ) $.

    $( `-.` Introduction Recipe. `t.` $)
    rcp-NDNEGI1 $p |- -. w_ga1 $=
        ( wff-neg wff-true wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP0addall
          ndime-P3.6 ndnegi-P3.3 ndtruee-P3.18 )
        BEBAFZBANBGZNBHZBAIOCJKBAEZOPBQIODJKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDNEGI2.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $.
    rcp-NDNEGI2.2 $e |- ( ( w_ga1 /\ w_ga2 ) -> -. w_ph ) $.

    $( `-.` Introduction Recipe. `t.` $)
    rcp-NDNEGI2 $p |- ( w_ga1 -> -. w_ga2 ) $=
        ( ndnegi-P3.3 ) CABDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDNEGI3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $.
    rcp-NDNEGI3.2 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> -. w_ph ) $.

    $( `-.` Introduction Recipe. `t.` $)
    rcp-NDNEGI3 $p |- ( ( w_ga1 /\ w_ga2 ) -> -. w_ga3 ) $=
        ( wff-and rcp-NDSEP3 wff-neg ndnegi-P3.3 ) DABCGABCDEHAIBCDFHJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDNEGI4.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $.
    rcp-NDNEGI4.2 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> -. w_ph ) $.

    $( `-.` Introduction Recipe. `t.` $)
    rcp-NDNEGI4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> -. w_ga4 ) $=
        ( wff-rcp-AND3 rcp-NDSEP4 wff-neg ndnegi-P3.3 )
        EABCDHABCDEFIAJBCDEGIK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDNEGI5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $.

    rcp-NDNEGI5.2 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> -. w_ph )
    $.

    $( `-.` Introduction Recipe. `t.` $)
    rcp-NDNEGI5 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> -. w_ga5 ) $=
        ( wff-rcp-AND4 rcp-NDSEP5 wff-neg ndnegi-P3.3 )
        FABCDEIABCDEFGJAKBCDEFHJL
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Negation Elimination.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndnege-P3.4 when '`w_ga`' is empty.
$)

${
    rcp-NDNEGE0.1 $e |- w_ph $.
    rcp-NDNEGE0.2 $e |- -. w_ph $.

    $( This is equivalent to the Principle of Explosion. `t.` $)
    rcp-NDNEGE0 $p |- w_ps $=
        ( wff-true ndtruei-P3.17 wff-neg ndnege-P3.4 ndtruee-P3.18 )
        BABEACFAGDFHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rules for Implication Introduction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~ndimi-P3.5 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMI2.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> w_ph ) $.

    $( `->` Introduction Recipe. `t.` $)
    rcp-NDIMI2 $p |- ( w_ga1 -> ( w_ga2 -> w_ph ) ) $=
        ( ndimi-P3.5 ) CABDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMI3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ph ) $.

    $( `->` Introduction Recipe. `t.` $)
    rcp-NDIMI3 $p |- ( ( w_ga1 /\ w_ga2 ) -> ( w_ga3 -> w_ph ) ) $=
        ( wff-and rcp-NDSEP3 ndimi-P3.5 ) DABCFABCDEGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMI4.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ph ) $.

    $( `->` Introduction Recipe. `t.` $)
    rcp-NDIMI4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> ( w_ga4 -> w_ph ) ) $=
        ( wff-rcp-AND3 rcp-NDSEP4 ndimi-P3.5 ) EABCDGABCDEFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDIMI5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> w_ph )
    $.

    $( `->` Introduction Recipe. `t.` $)
    rcp-NDIMI5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> ( w_ga5 -> w_ph ) )
    $=
        ( wff-rcp-AND4 rcp-NDSEP5 ndimi-P3.5 ) FABCDEHABCDEFGIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Implication Elimination.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule replaces ~ndime-P3.6 when '`w_ga`' is empty.
$)

${
    rcp-NDIME0.1 $e |- w_ph $.
    rcp-NDIME0.2 $e |- ( w_ph -> w_ps ) $.

    $( This is the same is ~ax-MP . `t.` $)
    rcp-NDIME0 $p |- w_ps $=
        ( wff-true ndtruei-P3.17 wff-imp ndime-P3.6 ndtruee-P3.18 )
        BABEACFABGDFHI
    $.
$}



$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Conjunction Introduction. 
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndandi-P3.7 when '`w_ga`' is empty.
$)

${
    rcp-NDANDI0.1 $e |- w_ph $.
    rcp-NDANDI0.2 $e |- w_ps $.

    $( '`/\`' Introduction. `t.` $)
    rcp-NDANDI0 $p |- ( w_ph /\ w_ps ) $=
        ( wff-and wff-true ndtruei-P3.17 ndandi-P3.7 ndtruee-P3.18 )
        ABEABFACGBDGHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Left Conjunction Elimination. 
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndandel-P3.8 when '`w_ga`' is empty.
$)

${
    rcp-NDANDEL0.1 $e |- ( w_ph /\ w_ps ) $.

    $( Left '`/\`' Elimination. `t.` $)
    rcp-NDANDEL0 $p |- w_ps $=
        ( wff-true wff-and ndtruei-P3.17 ndandel-P3.8 ndtruee-P3.18 )
        BABDABECFGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Right Conjunction Elimination. 
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndander-P3.9 when '`w_ga`' is empty.
$)

${
    rcp-NDANDER0.1 $e |- ( w_ph /\ w_ps ) $.

    $( Right '`/\`' Elimination. `t.` $)
    rcp-NDANDER0 $p |- w_ph $=
        ( wff-true wff-and ndtruei-P3.17 ndander-P3.9 ndtruee-P3.18 )
        AABDABECFGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Left Disjunction Introduction. 
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndoril-P3.10 when '`w_ga`' is empty.
$)

${
    rcp-NDORIL0.1 $e |- w_ph $.

    $( Left '`\/`' Introduction. `t.` $)
    rcp-NDORIL0 $p |- ( w_ps \/ w_ph ) $= 
        ( wff-or wff-true ndtruei-P3.17 ndoril-P3.10 ndtruee-P3.18 )
    BADABEACFGH $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Right Disjunction Introduction. 
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndorir-P3.11 when '`w_ga`' is empty.
$)

${
    rcp-NDORIR0.1 $e |- w_ph $.

    $( Right '`\/`' Introduction. `t.` $)
    rcp-NDORIR0 $p |- ( w_ph \/ w_ps ) $=
        ( wff-or wff-true ndtruei-P3.17 ndorir-P3.11 ndtruee-P3.18 )
        ABDABEACFGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rules for Disjunction Elimination
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~ndore-P3.12 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-NDORE1.1 $e |- ( w_ph -> w_ch ) $.
    rcp-NDORE1.2 $e |- ( w_ps -> w_ch ) $.
    rcp-NDORE1.3 $e |- ( w_ph \/ w_ps ) $.

    $(  `\/` Elimination Recipe. `t.`  $)
    rcp-NDORE1 $p |- w_ch $=
        ( wff-true wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP0addall ndime-P3.6
          wff-or ndtruei-P3.17 ndore-P3.12 ndtruee-P3.18 )
        CABCGZACQAHZQAIACJRDKLBCQBHZQBIBCJSEKLABMFNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDORE2.1 $e |- ( ( w_ga1 /\ w_ph ) -> w_ch ) $.
    rcp-NDORE2.2 $e |- ( ( w_ga1 /\ w_ps ) -> w_ch ) $.
    rcp-NDORE2.3 $e |- ( w_ga1 -> ( w_ph \/ w_ps ) ) $.

    $( `\/` Elimination Recipe. `t.` $)
    rcp-NDORE2 $p |- ( w_ga1 -> w_ch ) $=
        ( ndore-P3.12 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDORE3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ph ) -> w_ch ) $.
    rcp-NDORE3.2 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ps ) -> w_ch ) $.
    rcp-NDORE3.3 $e |- ( ( w_ga1 /\ w_ga2 ) -> ( w_ph \/ w_ps ) ) $.

    $( `\/` Elimination Recipe. `t.` $)
    rcp-NDORE3 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ch ) $=
        ( wff-and rcp-NDSEP3 ndore-P3.12 ) ABCDEICDEAFJCDEBGJHK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDORE4.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ph ) -> w_ch ) $.
    rcp-NDORE4.2 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ps ) -> w_ch ) $.
    rcp-NDORE4.3 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> ( w_ph \/ w_ps ) ) $.

    $( `\/` Elimination Recipe. `t.` $)
    rcp-NDORE4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ch ) $=
        ( wff-rcp-AND3 rcp-NDSEP4 ndore-P3.12 ) ABCDEFJCDEFAGKCDEFBHKIL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-NDORE5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ph ) -> w_ch )
    $.

    rcp-NDORE5.2 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ps ) -> w_ch )
    $.

    rcp-NDORE5.3 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> ( w_ph \/ w_ps ) )
    $.

    $( `\/` Elimination Recipe. `t.` $)
    rcp-NDORE5 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ch ) $=
        ( wff-rcp-AND4 rcp-NDSEP5 ndore-P3.12 ) ABCDEFGKCDEFGAHLCDEFGBILJM
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Biconditional Introduction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndbii-P3.13 when '`w_ga`' is empty.
$)

${
    rcp-NDBII0.1 $e |- ( w_ph -> w_ps ) $.
    rcp-NDBII0.2 $e |- ( w_ps -> w_ph ) $.

    $( '`<->`' Introduction. `t.` $)
    rcp-NDBII0 $p |- ( w_ph <-> w_ps ) $=
        ( wff-bi wff-true wff-imp ndtruei-P3.17 ndbii-P3.13 ndtruee-P3.18 )
        ABEABFABGCHBAGDHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Biconditional Forward Implication.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndbief-P3.14 when '`w_ga`' is empty.
$)

${
    rcp-NDBIEF0.1 $e |- ( w_ph <-> w_ps ) $.

    $( '`<->`' Elimination by Forward Implication Introduction. `t.` $)
    rcp-NDBIEF0 $p |- ( w_ph -> w_ps ) $=
        ( wff-imp wff-true wff-bi ndtruei-P3.17 ndbief-P3.14 ndtruee-P3.18 )
        ABDABEABFCGHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rule for Biconditional Reverse Implication.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  This derived rule is used in place of ~ndbier-P3.15 when '`w_ga`' is empty.
$)

${
    rcp-NDBIER0.1 $e |- ( w_ph <-> w_ps ) $.

    $( '`<->`' Elimination by Reverse Implication Introduction. `t.` $)
    rcp-NDBIER0 $p |- ( w_ps -> w_ph ) $=
        ( wff-imp wff-true wff-bi ndtruei-P3.17 ndbier-P3.15 ndtruee-P3.18 )
        BADABEABFCGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Closed Forms of Natural Deduction Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Closed Form of ~ndnegi-P3.3 . `t.` $)
    ndnegi-P3.3.CL $p
        |- ( ( ( w_ph -> w_ps ) /\ ( w_ph -> -. w_ps ) ) -> -. w_ph )
    $=
        ( wff-imp wff-neg wff-rcp-AND3 rcp-NDASM3of3 rcp-NDASM1of3
          ndime-P3.6 rcp-NDASM2of3 rcp-NDNEGI3 )
        BABCZABDZCZAABKMAEZKMAFZKMAGHALNOKMAIHJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndnege-P3.4 . `t.` $)
    ndnege-P3.4.CL $p |- ( ( w_ph /\ -. w_ph ) -> w_ps ) $=
        ( wff-neg wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndnege-P3.4 )
        ABAACZDAHEAHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndime-P3.6 . `t.` $)
    ndime-P3.6.CL $p |- ( ( w_ph /\ ( w_ph -> w_ps ) ) -> w_ps ) $=
        ( wff-imp wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndime-P3.6 )
        ABAABCZDAHEAHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndoril-P3.10 . `t.` $)
    ndoril-P3.10.CL $p |- ( w_ph -> ( w_ps \/ w_ph ) ) $=
        ( rcp-NDASM1of1 ndoril-P3.10 ) ABAACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndorir-P3.11 . `t.` $)
    ndorir-P3.11.CL $p |- ( w_ph -> ( w_ph \/ w_ps ) ) $=
        ( rcp-NDASM1of1 ndorir-P3.11 ) ABAACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndore-P3.12 . `t.` $)
    ndore-P3.12.CL $p
        |- (
          ( ( w_ph -> w_ch ) /\ ( w_ps -> w_ch ) /\ ( w_ph \/ w_ps ) ) -> w_ch
        )
    $=
        ( wff-imp wff-or wff-rcp-AND4 rcp-NDASM4of4 rcp-NDASM1of4 ndime-P3.6
          rcp-NDASM2of4 rcp-NDASM3of3 rcp-NDORE4 )
        ABCACDZBCDZABEZACMNOAFMNOAGMNOAHIBCMNOBFMNOBGMNOBJIMNOKL
    $.
$}
$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndbii-P3.13 . `t.` $)
    ndbii-P3.13.CL $p
        |- ( ( ( w_ph -> w_ps ) /\ ( w_ps -> w_ph ) ) -> ( w_ph <-> w_ps ) )
    $=
        ( wff-imp wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndbii-P3.13 )
        ABABCZBACZDHIEHIFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndbief-P3.14 . `t.` $)
    ndbief-P3.14.CL $p |- ( ( w_ph <-> w_ps ) -> ( w_ph -> w_ps ) ) $=
        ( wff-bi rcp-NDASM1of1 ndbief-P3.14 ) ABABCZFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndbier-P3.15 . `t.` $)
    ndbier-P3.15.CL $p |- ( ( w_ph <-> w_ps ) -> ( w_ps -> w_ph ) ) $=
        ( wff-bi rcp-NDASM1of1 ndbier-P3.15 ) ABABCZFDE
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  A More Convenient form of Law of Excluded Middle.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Alternate Form of Excluded Middle. $)
    ndexclmid-P3.16.AC $p |- ( w_ga -> ( w_ph \/ -. w_ph ) ) $=
        ( wff-neg wff-or ndexclmid-P3.16 rcp-NDIMP0addall ) AACDBAEF
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Revisiting Chapter 1.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Propositional Axioms L1 and L2.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    axL1-P3.21.1 $e |- ( w_ga -> w_ph ) $.

    $( Re-derived Deductive Form of Axiom L1. `t.` $)
    axL1-P3.21 $p |- ( w_ga -> ( w_ps -> w_ph ) ) $=
        ( rcp-NDIMP1add1 rcp-NDIMI2 ) ACBACBDEF
    $.
$}

${
    $( Closed Form of ~axL1-P3.21 . `t.` $)
    axL1-P3.21.CL $p |- ( w_ph -> ( w_ps -> w_ph ) ) $=
        ( rcp-NDASM1of1 axL1-P3.21 ) ABAACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    axL2-P3.22.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Re-derived Deductive Form of Axiom L2. `t.` $)
    axL2-P3.22 $p |- ( w_ga -> ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) ) $=
        ( wff-imp wff-rcp-AND3 rcp-NDASM3of3 rcp-NDASM2of3 ndime-P3.6
          rcp-NDIMP1add2 rcp-NDIMI3 rcp-NDIMI2 )
        ACFDABFZCDNABCDNAGZABODNAHZDNAIJABCFZOPAQFDNAEKJJLM
    $.
$}

${
    axL2-P3.22.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~axL2-P3.22 . `t.` $)
    axL2-P3.22.RC $p |- ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) $=
        ( wff-imp wff-true ndtruei-P3.17 axL2-P3.22 ndtruee-P3.18 )
        ABEACEEABCFABCEEDGHI
    $.
$}

${
    $( Closed Form of ~axL2-P3.22 . `t.` $)
    axL2-P3.22.CL $p
        |- (
          ( w_ph -> ( w_ps -> w_ch ) ) ->
          ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) )
        )
    $=
        ( wff-imp rcp-NDASM1of1 axL2-P3.22 ) ABCABCDDZGEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Other Implication Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    mae-P3.23.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.
    mae-P3.23.2 $e |- ( w_ga -> w_ps ) $.

    $( Middle Antecedent Elimination. `t.` $)
    mae-P3.23 $p |- ( w_ga -> ( w_ph -> w_ch ) ) $=
        ( wff-and rcp-NDIMP1add1 wff-imp rcp-NDASM2of2 ndime-P3.6
          rcp-NDIMI2 )
        CDABCDAGZBDAFHABCIZMDAJANIDAEHKKL
    $.
$}

${
    mae-P3.23.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.
    mae-P3.23.RC.2 $e |- w_ps $.

    $( Inference Form of ~mae-P3.23 . `t.` $)
    mae-P3.23.RC $p |- ( w_ph -> w_ch ) $=
        ( wff-imp wff-true ndtruei-P3.17 mae-P3.23 ndtruee-P3.18 )
        ACFABCGABCFFDHBEHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
   syl-P3.24.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
   syl-P3.24.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.

   $( Syllogism. `t.` $)
   syl-P3.24 $p |- ( w_ga -> ( w_ph -> w_ch ) ) $=
       ( wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1 ndime-P3.6
         rcp-NDIMI2 )
       CDABCDAGZABMDAHABIDAEJKBCIDAFJKL
   $.
$}

${
    syl-P3.24.RC.1 $e |- ( w_ph -> w_ps ) $.
    syl-P3.24.RC.2 $e |- ( w_ps -> w_ch ) $.

    $( Inference Form of ~syl-P3.24.RC . `t.` $)
    syl-P3.24.RC $p |- ( w_ph -> w_ch ) $=
        ( wff-imp wff-true ndtruei-P3.17 syl-P3.24 ndtruee-P3.18 )
        ACFABCGABFDHBCFEHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dsyl-P3.25.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    dsyl-P3.25.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.
    dsyl-P3.25.3 $e |- ( w_ga -> ( w_ch -> w_th ) ) $.

    $( Double Syllogism. `t.` $)
    dsyl-P3.25 $p |- ( w_ga -> ( w_ph -> w_th ) ) $=
        ( syl-P3.24 ) ACDEABCEFGIHI
    $.
$}

${
    dsyl-P3.25.RC.1 $e |- ( w_ph -> w_ps ) $.
    dsyl-P3.25.RC.2 $e |- ( w_ps -> w_ch ) $.
    dsyl-P3.25.RC.3 $e |- ( w_ch -> w_th ) $.

    $( Inference Form of ~dsyl-P3.25 . `t.` $)
    dsyl-P3.25.RC $p |- ( w_ph -> w_th ) $=
        ( wff-imp wff-true ndtruei-P3.17 dsyl-P3.25 ndtruee-P3.18 )
        ADHABCDIABHEJBCHFJCDHGJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rae-P3.26.1 $e |- ( w_ga -> ( w_ph -> ( w_ph -> w_ps ) ) ) $.

    $( Redundant Antecedent Elimination. `t.` $)
    rae-P3.26 $p |- ( w_ga -> ( w_ph -> w_ps ) ) $=
        ( wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1 ndime-P3.6
          rcp-NDIMI2 ) BCAABCAEZCAFZAABGZKLAMGCADHIIJ
    $.
$}

${
    rae-P3.26.RC.1 $e |- ( w_ph -> ( w_ph -> w_ps ) ) $.

    $( Inference Form of ~rae-P3.26 . `t.` $)
    rae-P3.26.RC $p |- ( w_ph -> w_ps ) $=
        ( wff-imp wff-true ndtruei-P3.17 rae-P3.26 ndtruee-P3.18 )
        ABDZABEAIDCFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    imcomm-P3.27.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Commutation of Antecedents. `t.` $)
    imcomm-P3.27 $p |- ( w_ga -> ( w_ps -> ( w_ph -> w_ch ) ) ) $=
        ( wff-imp wff-rcp-AND3 rcp-NDASM2of3 rcp-NDASM3of3 rcp-NDIMP1add2
          ndime-P3.6 rcp-NDIMI3 rcp-NDIMI2 )
        ACFDBCDBABCDBAGZDBAHABCFZNDBAIAOFDBAEJKKLM
    $.
$}

${
    imcomm-P3.27.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~imcomm-P3.27 . `t.` $)
    imcomm-P3.27.RC $p |- ( w_ps -> ( w_ph -> w_ch ) ) $=
        ( wff-imp wff-true ndtruei-P3.17 imcomm-P3.27 ndtruee-P3.18 )
        BACEEABCFABCEEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    imsubl-P3.28a.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Implication Substitution (left). `t.` $)
    imsubl-P3.28a $p
        |- ( w_ga -> ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) )
    $=
        ( wff-imp wff-and rcp-NDIMP1add1 rcp-NDASM2of2 syl-P3.24
          rcp-NDIMI2 )
        ACFDBCFZABCDLGABFDLEHDLIJK
    $.
$}

${
    imsubl-P3.28a.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~imsubl-P3.28a . `t.` $)
    imsubl-P3.28a.RC $p |- ( ( w_ps -> w_ch ) -> ( w_ph -> w_ch ) ) $=
        ( wff-imp wff-true ndtruei-P3.17 imsubl-P3.28a ndtruee-P3.18 )
        BCEACEEABCFABEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    imsubr-P3.28b.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Implication Substitution (right). `t.` $)
    imsubr-P3.28b $p
        |- ( w_ga -> ( ( w_ch -> w_ph ) -> ( w_ch -> w_ps ) ) )
    $=
        ( wff-imp wff-and rcp-NDASM2of2 rcp-NDIMP1add1 syl-P3.24
          rcp-NDIMI2 )
        CBFDCAFZCABDLGDLHABFDLEIJK
    $.
$}

${
    imsubr-P3.28b.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~imsubr-P3.28b . `t.` $)
    imsubr-P3.28b.RC $p |- ( ( w_ch -> w_ph ) -> ( w_ch -> w_ps ) ) $=
        ( wff-imp wff-true ndtruei-P3.17 imsubr-P3.28b ndtruee-P3.18 )
        CAECBEEABCFABEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    imsubd-P3.28c.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    imsubd-P3.28c.2 $e |- ( w_ga -> ( w_ch -> w_th ) ) $.

    $( Implication Substitution (dual) `t.` .

       This can also be called "Linking Syllogism" because the result is
       the statement that adding the missing inner link between the two
       hypotheses links the entire chain as a consequence.

       The mneumonic is as follows...

       If ( 1 `->` 2 ) and ( 3 `->` 4 ) then ( ( 2 `->` 3 ) `->`
       ( 1 `->` 4 ) )...

       or ( left-middle `->` right-middle ) `->` ( left-outer `->`
       right-outer ).

       One can substitute ( 1 `->` 1 ) for ( 1 `->` 2 ), or ( 3 `->` 3 ) for
       ( 3 `->` 4 ) to see how ~imsubr-P3.28b and ~imsubl-P3.28a are related
       as special cases.
    $)    
    imsubd-P3.28c $p
        |- ( w_ga -> ( ( w_ps -> w_ch ) -> ( w_ph -> w_th ) ) )
    $=
        ( wff-imp imsubl-P3.28a imsubr-P3.28b syl-P3.24 )
        BCHACHADHEABCEFICDAEGJK
    $.
$}

${
    imsubd-P3.28c.RC.1 $e |- ( w_ph -> w_ps ) $.
    imsubd-P3.28c.RC.2 $e |- ( w_ch -> w_th ) $.

    $( Inference Form of ~imsubd-P3.28c . `t.` $)
    imsubd-P3.28c.RC $p |- ( ( w_ps -> w_ch ) -> ( w_ph -> w_th ) ) $=
        ( wff-imp wff-true ndtruei-P3.17 imsubd-P3.28c ndtruee-P3.18 )
        BCGADGGABCDHABGEICDGFIJK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Double Negation Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    dnegi-P3.29.1 $e |- ( w_ga -> w_ph ) $.

    $( Double Negation Introduction. `t.`

       This statement does not require ~ndexclmid-P3.16 , and is thus
       derivable with intuitionist logic. $)
    dnegi-P3.29 $p |- ( w_ga -> -. -. w_ph ) $=
        ( wff-neg rcp-NDIMP1add1 rcp-NDASM2of2 rcp-NDNEGI2 )
        ABADZABHCEBHFG
    $.
$}

${
    dnegi-P3.29.RC.1 $e |- w_ph $.

    $( Inference Form of ~dnegi-P3.29 . `t.` $)
    dnegi-P3.29.RC $p |- -. -. w_ph $=
        ( wff-neg wff-true ndtruei-P3.17 dnegi-P3.29 ndtruee-P3.18 )
        ACCADABEFG
    $.
$}

${
    $( Closed Form of ~dnegi-P3.29 . `t.` $)
    dnegi-P3.29.CL $p |- ( w_ph -> -. -. w_ph ) $=
        ( rcp-NDASM1of1 dnegi-P3.29 ) AAABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dnege-P3.30.1 $e |- ( w_ga -> -. -. w_ph ) $.

    $( Double Negation Elimination.

       This statement is equivalent to ~ndexclmid-P3.16 . $)
    dnege-P3.30 $p |- ( w_ga -> w_ph ) $=
        ( wff-neg rcp-NDASM2of2 wff-and rcp-NDIMP1add1 ndnege-P3.4
          ndexclmid-P3.16.AC ndore-P3.12 )
        AADZABBAEKABKFBKEKDBKCGHABIJ
    $.
$}

${
    dnege-P3.30.RC.1 $e |- -. -. w_ph $.

    $( Inference Form of ~dnege-P3.30 . $)
    dnege-P3.30.RC $p |- w_ph $=
        ( wff-true wff-neg ndtruei-P3.17 dnege-P3.30 ndtruee-P3.18 )
        AACADDBEFG
    $.
$}

${
    $( Closed Form of ~dnege-P3.30 . $)
    dnege-P3.30.CL $p |- ( -. -. w_ph -> w_ph ) $=
        ( wff-neg rcp-NDASM1of1 dnege-P3.30 ) AABBZECD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Transposition Rules (including Axiom L3).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    trnsp-P3.31a.1 $e |- ( w_ga -> ( w_ph -> -. w_ps ) ) $.

    $( Transposition Variant A (negation introduction). `t.`

       This statement is the deductive form of ~trnsp-P1.15a .  It does not
       require the Law of Excluded Middle, and is thus derivable with
       intuitionist logic. $)
    trnsp-P3.31a $p |- ( w_ga -> ( w_ps -> -. w_ph ) ) $=
        ( wff-neg rcp-NDASM2of3 wff-rcp-AND3 rcp-NDASM3of3 wff-imp
          rcp-NDIMP1add2 ndime-P3.6 rcp-NDNEGI3 rcp-NDIMI2 )
        AECBBCBACBAFABEZCBAGCBAHANICBADJKLM
    $.
$}

${
    trnsp-P3.31a.RC.1 $e |- ( w_ph -> -. w_ps ) $.

    $( Inference Form of ~trnsp-P3.31a . `t.` $)
    trnsp-P3.31a.RC $p |- ( w_ps -> -. w_ph ) $=
        ( wff-neg wff-imp wff-true ndtruei-P3.17 trnsp-P3.31a ndtruee-P3.18 )
        BADEABFABDECGHI
    $.
$}

${
    $( Closed Form of ~trnsp-P3.31a . `t.` $)
    trnsp-P3.31a.CL $p |- ( ( w_ph -> -. w_ps ) -> ( w_ps -> -. w_ph ) ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 trnsp-P3.31a ) ABABCDZGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    trnsp-P3.31b.1 $e |- ( w_ga -> ( -. w_ph -> w_ps ) ) $.

    $( Transposition Variant B (negation elimination).

       This statement is the deductive form of ~trnsp-P1.15b . It is
       equivalent to Axiom L3 and requires the Law of Excluded Middle. $)
    trnsp-P3.31b $p |- ( w_ga -> ( -. w_ps -> w_ph ) ) $=
        ( wff-neg wff-and wff-rcp-AND3 rcp-NDASM3of3 wff-imp rcp-NDIMP1add2
          ndime-P3.6 rcp-NDASM2of3 rcp-NDNEGI3 dnege-P3.30 rcp-NDIMI2 )
        ACBEZACPFBCPAEZQBCPQGCPQHQBICPQDJKCPQLMNO
    $.
$}

${
    trnsp-P3.31b.RC.1 $e |- ( -. w_ph -> w_ps ) $.

    $( Inference Form of ~trnsp-P3.31b . $)
    trnsp-P3.31b.RC $p |- ( -. w_ps -> w_ph ) $=
        ( wff-neg wff-imp wff-true ndtruei-P3.17 trnsp-P3.31b ndtruee-P3.18 )
        BDAEABFADBECGHI
    $.
$}

${
    $( Closed Form of ~trnsp-P3.31b . $)
    trnsp-P3.31b.CL $p |- ( ( -. w_ph -> w_ps ) -> ( -. w_ps -> w_ph ) ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 trnsp-P3.31b ) ABACBDZGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    trnsp-P3.31c.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Transposition Variant C (negation introduction). `t.`

       This statement is the deductive form of ~trnsp-P1.15c .  It does not
       require the  Law of Excluded Middle, and is thus derivable with
       intuitionist logic. $)
    trnsp-P3.31c $p |- ( w_ga -> ( -. w_ps -> -. w_ph ) ) $=
        ( wff-neg wff-rcp-AND3 rcp-NDASM3of3 wff-imp rcp-NDIMP1add2
          ndime-P3.6 rcp-NDASM2of3 rcp-NDNEGI3 rcp-NDIMI2 )
        AECBEZBCNAABCNAFCNAGABHCNADIJCNAKLM
    $.
$}

${
    trnsp-P3.31c.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~trnsp-P3.31c . `t.` $)
    trnsp-P3.31c.RC $p |- ( -. w_ps -> -. w_ph ) $=
        ( wff-neg wff-imp wff-true ndtruei-P3.17 trnsp-P3.31c ndtruee-P3.18 )
        BDADEABFABECGHI
    $.
$}

${
    $( Closed Form of ~trnsp-P3.31c . `t.` $)
    trnsp-P3.31c.CL $p |- ( ( w_ph -> w_ps ) -> ( -. w_ps -> -. w_ph ) ) $=
        ( wff-imp rcp-NDASM1of1 trnsp-P3.31c ) ABABCZFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    trnsp-P3.31d.1 $e |- ( w_ga -> ( -. w_ph -> -. w_ps ) ) $.

    $( Transposition Variant D (negation elimination).

       This statement is the deductive form of ~trnsp-P1.15d and Axiom L3.
       It requires the Law of Excluded Middle. $)
    trnsp-P3.31d $p |- ( w_ga -> ( w_ps -> w_ph ) ) $=
        ( wff-and wff-neg rcp-NDASM2of3 wff-rcp-AND3 rcp-NDASM3of3 wff-imp
          rcp-NDIMP1add2 ndime-P3.6 rcp-NDNEGI3 dnege-P3.30 rcp-NDIMI2 )
        ACBACBEBCBAFZCBPGPBFZCBPHCBPIPQJCBPDKLMNO
    $.
$}

${
    trnsp-P3.31d.RC.1 $e |- ( -. w_ph -> -. w_ps ) $.

    $( Inference Form of ~trnsp-P3.31d . $)
    trnsp-P3.31d.RC $p |- ( w_ps -> w_ph ) $=
        ( wff-imp wff-true wff-neg ndtruei-P3.17 trnsp-P3.31d ndtruee-P3.18 )
        BADABEAFBFDCGHI
    $.
$}

${
    $( Closed Form of ~trnsp-P3.31d . $)
    trnsp-P3.31d.CL $p |- ( ( -. w_ph -> -. w_ps ) -> ( w_ps -> w_ph ) ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 trnsp-P3.31d ) ABACBCDZGEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Other Rules Involving Negation.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    mt-P3.32a.1 $e |- ( w_ga -> ( w_ph -> -. w_ph ) ) $.

    $( Modus Tollens. `t.`

       This statement is the deductive form of ~nclav-P1.14 .  It does not 
       rely on the Law of Excluded Middle, and is thus deducible with
       intuitionist logic.  $)
    mt-P3.32a $p |- ( w_ga -> -. w_ph ) $=
        ( rcp-NDASM2of2 wff-neg wff-and wff-imp rcp-NDIMP1add1 ndime-P3.6
          rcp-NDNEGI2 )
        ABABADZAAEZBAFKALGBACHIJ
    $.
$}

${
    mt-P3.32a.RC.1 $e |- ( w_ph -> -. w_ph ) $.

    $( Inference Form of ~mt-P3.32a . `t.` $)
    mt-P3.32a.RC $p |- -. w_ph $=
        ( wff-neg wff-true wff-imp ndtruei-P3.17 mt-P3.32a ndtruee-P3.18 )
        ACZADAIEBFGH
    $.
$}

${
    $( Closed Form of ~mt-P3.32a . `t.` $)
    mt-3.32a.CL $p |- ( ( w_ph -> -. w_ph ) -> -. w_ph ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 mt-P3.32a ) AAABCZFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nmt-P3.32b.1 $e |- ( w_ga -> ( -. w_ph -> w_ph ) ) $.
    $(  Negated Modus Tollens.

       This statement is the deductive form of ~clav-P1.12 .  It requires the
       Law of Excluded Middle.  $)
    nmt-P3.32b $p |- ( w_ga -> w_ph ) $=
        ( wff-neg wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1 ndime-P3.6
          rcp-NDNEGI2 dnege-P3.30 )
        ABABADZLABLEBLFZLAGBLCHIMJK
    $.
$}

${
    nmt-P3.32b.RC.1 $e |- ( -. w_ph -> w_ph ) $.

    $( Inference Form of ~nmt-P3.32b . $)
    nmt-P3.32b.RC $p |- w_ph $=
        ( wff-true wff-neg wff-imp ndtruei-P3.17 nmt-P3.32b ndtruee-P3.18 )
        AACADAEBFGH
    $.
$}

${
    $( Closed Form of ~nmt-P3.32b . `t.` $)
    nmt-3.32b.CL $p |- ( ( -. w_ph -> w_ph ) -> w_ph ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 nmt-P3.32b ) AABACZFDE
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Revisiting Chapter 2.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Biconditional Equivalence Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $(  Equivalence Property: '`<->`' Reflexivity. `t.`  $)
    biref-P3.33a $p |- ( w_ph <-> w_ph ) $=
        ( rcp-NDASM1of1 rcp-NDBII0 ) AAABZDC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    bisym-P3.33b.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Equivalence Property: '`<->`' Symmetry. `t.` $)
    bisym-P3.33b $p |- ( w_ga -> ( w_ps <-> w_ph ) ) $=
        ( ndbier-P3.15 ndbief-P3.14 ndbii-P3.13 ) BACABCDEABCDFG
    $.
$}

${
    bisym-P3.33b.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~bisym-P3.33b . `t.` $)
    bisym-P3.33b.RC $p |- ( w_ps <-> w_ph ) $=
        ( wff-bi wff-true ndtruei-P3.17 bisym-P3.33b ndtruee-P3.18 )
        BADABEABDCFGH
    $.
$}

${
    $(  Closed Form of ~bisym-P3.33b . `t.` $)
    bisym-P3.33b.CL $p |- ( ( w_ph <-> w_ps ) -> ( w_ps <-> w_ph ) ) $=
        ( wff-bi rcp-NDASM1of1 bisym-P3.33b ) ABABCZFDE
    $.
$}

${
    $(  Closed Symmetric Form of ~bisym-P3.33b . `t.`  $)
    bisym-P3.33b.CL.SYM $p |- ( ( w_ph <-> w_ps ) <-> ( w_ps <-> w_ph ) ) $=
        ( wff-bi bisym-P3.33b.CL rcp-NDBII0 )
        ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    bitrns-P3.33c.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    bitrns-P3.33c.2 $e |- ( w_ga -> ( w_ps <-> w_ch ) ) $.

    $( Equivalence Property: '`<->`' Transitivity. `t.` $)
    bitrns-P3.33c $p |- ( w_ga -> ( w_ph <-> w_ch ) ) $=
        ( ndbief-P3.14 syl-P3.24 ndbier-P3.15 ndbii-P3.13 )
        ACDABCDABDEGBCDFGHCBADBCDFIABDEIHJ
    $.
$}

${
    bitrns-P3.33c.RC.1 $e |- ( w_ph <-> w_ps ) $.
    bitrns-P3.33c.RC.2 $e |- ( w_ps <-> w_ch ) $.

    $( Inference Form of ~bitrns-P3.33c . `t.` $)
    bitrns-P3.33c.RC $p |- ( w_ph <-> w_ch ) $=
        ( wff-bi wff-true ndtruei-P3.17 bitrns-P3.33c ndtruee-P3.18 )
        ACFABCGABFDHBCFEHIJ
    $.
$}

${
    $( Closed Form of ~bitrns-P3.33c . $)
    bitrns-P3.33c.CL $p
        |- ( 
          ( ( w_ph <-> w_ps ) /\ ( w_ps <-> w_ch ) ) -> ( w_ph <-> w_ch )
        )
    $=
        ( wff-bi wff-and rcp-NDASM1of2 rcp-NDASM2of2 bitrns-P3.33c )
        ABCABDZBCDZEIJFIJGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Importation and Exportation Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These two theorems can be thought of as justification theorems for treating
  a sequent of the form...

  1.) '( `w_ga1`, `w_ga2`, ... , `w_ga`_n ) `|-` `w_ph`'

  as identical to the WFF...

  2.) '`( (` ... `( ( w_ga1 /\ w_ga2 ) /\ w_ga3 ) /\` ... `w_ga`_n
  `) -> w_ph )`.

  To obtain 2.) from 1.), first repeatedly apply ~ndimi-P3.5 to obtain a
  nested implication.  To obtain a nested conjunction we then apply
  ~import-P3.34a.RC repeatedly.

  To obtain 1.) from 2.), first apply ~export-P3.34b.RC repeatedly to obtain a
  nested implication.  From there, use a combination of ~ndasm-P3.1 ,
  ~ndimp-P3.2 , and ~ndime-P3.6 repeatedly to build the sequent back up.
$)

${
    import-P3.34a.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( '`/\`' Importation Theorem. `t.` $)
    import-P3.34a $p |- ( w_ga -> ( ( w_ph /\ w_ps ) -> w_ch ) ) $=
        ( wff-and rcp-NDASM2of2 ndandel-P3.8 wff-imp ndander-P3.9
          rcp-NDIMP1add1 ndime-P3.6 rcp-NDIMI2 )
        CDABFZBCDNFZABODNGZHABCIZOABOPJAQIDNEKLLM
    $.
$}

${
    import-P3.34a.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~import-P3.34a . `t.` $)
    import-P3.34a.RC $p |- ( ( w_ph /\ w_ps ) -> w_ch ) $=
        ( wff-and wff-imp wff-true ndtruei-P3.17 import-P3.34a ndtruee-P3.18 )
        ABECFABCGABCFFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    export-P3.34b.1 $e |- ( w_ga -> ( ( w_ph /\ w_ps ) -> w_ch ) ) $.

    $( '`/\`' Exportation Theorem. `t.` $)
    export-P3.34b $p |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $=
        ( wff-imp wff-and wff-rcp-AND3 rcp-NDASM2of3 rcp-NDASM3of3
          ndandi-P3.7 rcp-NDIMP1add2 ndime-P3.6 rcp-NDIMI3 rcp-NDIMI2 )
        BCFDACDABABGZCDABHZABQDABIDABJKPCFDABELMNO
    $.
$}

${
    export-P3.34b.RC.1 $e |- ( ( w_ph /\ w_ps ) -> w_ch ) $.

   $( Inference Form of ~export-P3.34b . `t.` $)
   export-P3.34b.RC $p |- ( w_ph -> ( w_ps -> w_ch ) ) $=
       ( wff-imp wff-true wff-and ndtruei-P3.17 export-P3.34b ndtruee-P3.18 )
       ABCEEABCFABGCEDHIJ
   $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Commutative and Associative Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Lemma for ~andcomm-P3.35 . `t.` $)
    andcomm-P3.35-L1 $p |- ( ( w_ph /\ w_ps ) -> ( w_ps /\ w_ph ) ) $=
        ( wff-and rcp-NDASM1of1 ndandel-P3.8 ndander-P3.9 ndandi-P3.7 )
        BAABCZABHHDZEABHIFG
    $.
$}

${
    $(  '`/\`' Commutativity. `t.`  $)
    andcomm-P3.35 $p |- ( ( w_ph /\ w_ps ) <-> ( w_ps /\ w_ph ) ) $=
        ( wff-and andcomm-P3.35-L1 rcp-NDBII0 ) ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~andassoc-P3.36 . `t.` $)
    andassoc-P3.36-L1 $p
        |- ( ( ( w_ph /\ w_ps ) /\ w_ch ) -> ( w_ph /\ ( w_ps /\ w_ch ) ) )
    $=
        ( wff-and rcp-NDASM1of1 ndander-P3.9 ndandel-P3.8 ndandi-P3.7 )
        ABCDABDZCDZABJICJJEZFZFBCJABJLGICJKGHH
    $.
$}

${
    $( Lemma for ~andassoc-P3.36 . `t.` $)
    andassoc-P3.36-L2 $p
        |- ( ( w_ph /\ ( w_ps /\ w_ch ) ) -> ( ( w_ph /\ w_ps ) /\ w_ch ) )
    $=
        ( wff-and rcp-NDASM1of1 ndander-P3.9 ndandel-P3.8 ndandi-P3.7 )
        ABDCABCDZDZABJAIJJEZFBCJAIJKGZFHBCJLGH
    $.
$}

${
    $( '`/\`' Associativity. `t.` $)
    andassoc-P3.36 $p
        |- ( ( ( w_ph /\ w_ps ) /\ w_ch ) <-> ( w_ph /\ ( w_ps /\ w_ch ) ) )
    $=
        ( wff-and andassoc-P3.36-L1 andassoc-P3.36-L2 rcp-NDBII0 )
        ABDCDABCDDABCEABCFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~orcomm-P3.37 . `t.` $)
    orcomm-P3.37-L1 $p |- ( ( w_ph \/ w_ps ) -> ( w_ps \/ w_ph ) ) $=
        ( wff-or wff-and rcp-NDASM2of2 ndoril-P3.10 ndorir-P3.11
         rcp-NDASM1of1 rcp-NDORE2 )
        ABBACABCZABJADJAEFBAJBDJBEGJHI
    $.
$}

${
    $( '`\/`' Commutativity. `t.`  $)
    orcomm-P3.37 $p |- ( ( w_ph \/ w_ps ) <-> ( w_ps \/ w_ph ) ) $=
        ( wff-or orcomm-P3.37-L1 rcp-NDBII0 ) ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~orassoc-P3.38 . `t.` $)
    orassoc-P3.38-L1 $p
        |- ( ( ( w_ph \/ w_ps ) \/ w_ch ) -> ( w_ph \/ ( w_ps \/ w_ch ) ) )
    $=
        ( wff-or wff-rcp-AND3 rcp-NDASM3of3 ndorir-P3.11 ndoril-P3.10
         rcp-NDASM2of2 rcp-NDORE3 wff-and rcp-NDASM1of1 rcp-NDORE2 )
        ABDZCABCDZDZNCDZABPQNAOQNAEQNAFGOAQNBEZBCRQNBFGHQNIJOAQCKZCBSQCIHHQLM
    $.
$}

${
    $( Lemma for ~orassoc-P3.38 . `t.` $)
    orassoc-P3.38-L2 $p
        |- ( ( w_ph \/ ( w_ps \/ w_ch ) ) -> ( ( w_ph \/ w_ps ) \/ w_ch ) )
    $=
        ( wff-or wff-and rcp-NDASM2of2 ndorir-P3.11 wff-rcp-AND3
          rcp-NDASM3of3 ndoril-P3.10 rcp-NDORE3 rcp-NDASM1of1
          rcp-NDORE2 )
        ABCDZABDZCDZANDZOCQAEZABRQAFGGBCPQNOCQNBHZBASQNBIJGCOQNCHQNCIJQNFKQLM
    $.
$}

${
    $(  '`\/`' Associativity. `t.`  $)
    orassoc-P3.38 $p
        |- ( ( ( w_ph \/ w_ps ) \/ w_ch ) <-> ( w_ph \/ ( w_ps \/ w_ch ) ) )
    $=
        ( wff-or orassoc-P3.38-L1 orassoc-P3.38-L2 rcp-NDBII0 )
        ABDCDABCDDABCEABCFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These theorems can be chained together to produce a countably infinite set
  of rules of the form...

  `( ( w_ph <-> w_ps ) -> ( w_th <-> w_th ( w_ps `/` w_ph ) )`,

  where '`w_th`' involves some combination of connectives '`-.`', '`->`',
  '`/\`', '`\/`', and '`<->`' and and contains the sub-formula '`w_ph`'.  The
  notation '`w_th ( w_ps `/` w_ph )`' indicates the formula '`w_th`' with one
  or more instances of the sub-formula '`w_ph`' replaced with '`w_ps`'.

  This idea will be expanded to formulas with quantifiers after developing the
  rules of predicate calculus.

  In this section we give proofs that do not use the Chapter 2 definitions
  of '`<->`', '`/\`', and '`\/`'.  Those definitions, involving negation, are
  not valid in the intuitionist framework.
$)

${
    subneg-P3.39.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    $( Substitution Theorem for '`-.`'. `t.`

       Note that the proof of this theorem uses ~trnsp-P3.31c , which does 
       not rely on the Law of Excluded Middle.  This means this theorem is
       deducible with intuitionist logic. $)
    subneg-P3.39 $p |- ( w_ga -> ( -. w_ph <-> -. w_ps ) ) $=
        ( wff-neg ndbier-P3.15 trnsp-P3.31c ndbief-P3.14 ndbii-P3.13 )
        AEBECBACABCDFGABCABCDHGI
    $.
$}

${
    subneg-P3.39.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subneg-P3.39 . `t.` $)
    subneg-P3.39.RC $p |- ( -. w_ph <-> -. w_ps ) $=
        ( wff-neg wff-bi wff-true ndtruei-P3.17 subneg-P3.39 ndtruee-P3.18 )
        ADBDEABFABECGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subiml-P3.40a.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Left Substitution Theorem for '`->`'. `t.` $)
    subiml-P3.40a $p
        |- ( w_ga -> ( ( w_ph -> w_ch ) <-> ( w_ps -> w_ch ) ) )
    $=
        ( wff-imp ndbier-P3.15 imsubl-P3.28a ndbief-P3.14 ndbii-P3.13 )
        ACFBCFDBACDABDEGHABCDABDEIHJ
    $.
$}

${
    subiml-P3.40a.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subiml-P3.40a . `t.` $)
    subiml-P3.40a.RC $p |- ( ( w_ph -> w_ch ) <-> ( w_ps -> w_ch ) ) $=
        ( wff-imp wff-bi wff-true ndtruei-P3.17 subiml-P3.40a ndtruee-P3.18 )
        ACEBCEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subimr-P3.40b.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Right Substitution Theorem for '`->`'. `t.` $)
    subimr-P3.40b $p
        |- ( w_ga -> ( ( w_ch -> w_ph ) <-> ( w_ch -> w_ps ) ) )
    $=
        ( wff-imp ndbief-P3.14 imsubr-P3.28b ndbier-P3.15 ndbii-P3.13 )
        CAFCBFDABCDABDEGHBACDABDEIHJ
    $.
$}

${
    subimr-P3.40b.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subimr-P3.40b . `t.` $)
    subimr-P3.40b.RC $p |- ( ( w_ch -> w_ph ) <-> ( w_ch -> w_ps ) ) $=
        ( wff-imp wff-bi wff-true ndtruei-P3.17 subimr-P3.40b ndtruee-P3.18 )
        CAECBEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subimd-P3.40c.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subimd-P3.40c.2 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Dual Substitution Theorem for '`->`'. `t.` $)
    subimd-P3.40c $p
        |- ( w_ga -> ( ( w_ph -> w_ch ) <-> ( w_ps -> w_th ) ) )
    $=
        ( wff-imp ndbier-P3.15 ndbief-P3.14 imsubd-P3.28c ndbii-P3.13 )
        ACHBDHEBACDEABEFICDEGJKABDCEABEFJCDEGIKL
    $.
$}

${
    subimd-P3.40c.RC.1 $e |- ( w_ph <-> w_ps ) $.
    subimd-P3.40c.RC.2 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subimd-P3.40c . `t.` $)
    subimd-P3.40c.RC $p |- ( ( w_ph -> w_ch ) <-> ( w_ps -> w_th ) ) $=
        ( wff-imp wff-bi wff-true ndtruei-P3.17 subimd-P3.40c ndtruee-P3.18 )
        ACGBDGHABCDIABHEJCDHFJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbil-P3.41a-L1.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Lemma for ~subbil-P3.41a . `t.` $)
    subbil-P3.41a-L1 $p
        |- ( w_ga -> ( ( w_ph <-> w_ch ) -> ( w_ps <-> w_ch ) ) )
    $=
        ( wff-bi wff-and rcp-NDIMP1add1 bisym-P3.33b rcp-NDASM2of2
          bitrns-P3.33c rcp-NDIMI2 )
        BCFDACFZBACDMGZABNABFDMEHIDMJKL
    $.
$}

${
    subbil-P3.41a.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Left Substitution Theorem for '`<->`'. `t.` $)
    subbil-P3.41a $p
        |- ( w_ga -> ( ( w_ph <-> w_ch ) <-> ( w_ps <-> w_ch ) ) )
    $=
        ( wff-bi subbil-P3.41a-L1 bisym-P3.33b ndbii-P3.13 )
        ACFBCFDABCDEGBACDABDEHGI
    $.
$}

${
    subbil-P3.41a.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subbil-P3.41a . `t.` $)
    subbil-P3.41a.RC $p |- ( ( w_ph <-> w_ch ) <-> ( w_ps <-> w_ch ) ) $=
        ( wff-bi wff-true ndtruei-P3.17 subbil-P3.41a ndtruee-P3.18 )
        ACEBCEEABCFABEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbir-P3.41b.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Right Substitution Theorem for '`<->`'. `t.` $)
    subbir-P3.41b $p
        |- ( w_ga -> ( ( w_ch <-> w_ph ) <-> ( w_ch <-> w_ps ) ) )
    $=
        ( wff-bi bisym-P3.33b.CL.SYM rcp-NDIMP0addall subbil-P3.41a
          bitrns-P3.33c )
        CAFZBCFZCBFZDKACFZLDKNFDCAGHABCDEIJLMFDBCGHJ
    $.
$}

${
    subbir-P3.41b.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subbir-P3.41b . `t.` $)
    subbir-P3.41b.RC $p |- ( ( w_ch <-> w_ph ) <-> ( w_ch <-> w_ps ) ) $=
        ( wff-bi wff-true ndtruei-P3.17 subbir-P3.41b ndtruee-P3.18 )
        CAECBEEABCFABEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbid-P3.41c.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subbid-P3.41c.2 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Dual Substitution Theorem for '`<->`'. `t.` $)
    subbid-P3.41c $p
        |- ( w_ga -> ( ( w_ph <-> w_ch ) <-> ( w_ps <-> w_th ) ) )
    $=
        ( wff-bi subbil-P3.41a subbir-P3.41b bitrns-P3.33c )
        ACHBCHBDHEABCEFICDBEGJK
    $.
$}

${
    subbid-P3.41c.RC.1 $e |- ( w_ph <-> w_ps ) $.
    subbid-P3.41c.RC.2 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subbid-P3.41c . `t.` $)
    subbid-P3.41c.RC $p |- ( ( w_ph <-> w_ch ) <-> ( w_ps <-> w_th ) ) $=
        ( wff-bi wff-true ndtruei-P3.17 subbid-P3.41c ndtruee-P3.18 )
        ACGBDGGABCDHABGEICDGFIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandl-P3.42a-L1.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Lemma for ~subandl-P3.42a . `t.` $)
    subandl-P3.42a-L1 $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_ch ) ) )
    $=
        ( wff-and rcp-NDASM2of2 ndander-P3.9 wff-bi rcp-NDIMP1add1
          ndbief-P3.14 ndime-P3.6 ndandel-P3.8 ndandi-P3.7 rcp-NDIMI2 )
        BCFDACFZBCDPFZABQACQDPGZHABQABIDPEJKLACQRMNO
    $.
$}

${
    subandl-P3.42a.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Left Substitution Theorem for '`/\`'. `t.` $)
    subandl-P3.42a $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_ch ) ) )
    $=
        ( wff-and subandl-P3.42a-L1 bisym-P3.33b ndbii-P3.13 )
        ACFBCFDABCDEGBACDABDEHGI
    $.
$}

${
    subandl-P3.42a.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subandl-P3.42a . `t.` $)
    subandl-P3.42a.RC $p |- ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_ch ) ) $=
        ( wff-and wff-bi wff-true ndtruei-P3.17 subandl-P3.42a ndtruee-P3.18 )
        ACEBCEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandr-P3.42b.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Right Substitution Theorem for '`/\`'. `t.` $)
    subandr-P3.42b $p
        |- ( w_ga -> ( ( w_ch /\ w_ph ) <-> ( w_ch /\ w_ps ) ) )
    $=
        ( wff-and wff-bi andcomm-P3.35 rcp-NDIMP0addall subandl-P3.42a
          bitrns-P3.33c )
        CAFZBCFZCBFZDLACFZMDLOGDCAHIABCDEJKMNGDBCHIK
    $.
$}

${
    subandr-P3.42b.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subandr-P3.42b . `t.` $)
    subandr-P3.42b.RC $p |- ( ( w_ch /\ w_ph ) <-> ( w_ch /\ w_ps ) ) $=
        ( wff-and wff-bi wff-true ndtruei-P3.17 subandr-P3.42b ndtruee-P3.18 )
        CAECBEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandd-P3.42c.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subandd-P3.42c.2 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Dual Substitution Theorem for '`/\`'. `t.` $)
    subandd-P3.42c $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_th ) ) )
    $=
        ( wff-and subandl-P3.42a subandr-P3.42b bitrns-P3.33c )
        ACHBCHBDHEABCEFICDBEGJK
    $.
$}

${
    subandd-P3.42c.RC.1 $e |- ( w_ph <-> w_ps ) $.
    subandd-P3.42c.RC.2 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subandd-P3.42c . `t.` $)
    subandd-P3.42c.RC $p |- ( ( w_ph /\ w_ch ) <-> ( w_ps /\ w_th ) ) $=
        ( wff-and wff-bi wff-true ndtruei-P3.17 subandd-P3.42c ndtruee-P3.18 )
        ACGBDGHABCDIABHEJCDHFJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suborl-P3.43a-L1.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Lemma for ~suborl-P3.43a . `t.` $)
    suborl-P3.43a-L1 $p
        |- ( w_ga -> ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_ch ) ) )
    $=
        ( wff-or wff-rcp-AND3 rcp-NDASM3of3 wff-bi rcp-NDIMP1add2
          ndbief-P3.14 ndime-P3.6 ndorir-P3.11 ndoril-P3.10 rcp-NDASM2of2
          rcp-NDORE3 rcp-NDIMI2 )
        BCFZDACFZACRDSBCDSAGZABTDSAHABTABIDSAEJKLMCBDSCGDSCHNDSOPQ
    $.
$}

${
    suborl-P3.43a.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Left Substitution Theorem for '`\/`' . `t.` $)
    suborl-P3.43a $p
        |- ( w_ga -> ( ( w_ph \/ w_ch ) <-> ( w_ps \/ w_ch ) ) )
    $=
        ( wff-or suborl-P3.43a-L1 bisym-P3.33b ndbii-P3.13 )
        ACFBCFDABCDEGBACDABDEHGI
    $.
$}

${
    suborl-P3.43a.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suborl-P3.43a . `t.` $)
    suborl-P3.43a.RC $p |- ( ( w_ph \/ w_ch ) <-> ( w_ps \/ w_ch ) ) $=
        ( wff-or wff-bi wff-true ndtruei-P3.17 suborl-P3.43a ndtruee-P3.18 )
        ACEBCEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suborr-P3.43b.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Right Substitution Theorem for '`\/`' . `t.` $)
    suborr-P3.43b $p
        |- ( w_ga -> ( ( w_ch \/ w_ph ) <-> ( w_ch \/ w_ps ) ) )
    $=
        ( wff-or wff-bi orcomm-P3.37 rcp-NDIMP0addall suborl-P3.43a
          bitrns-P3.33c )
        CAFZBCFZCBFZDLACFZMDLOGDCAHIABCDEJKMNGDBCHIK
    $.
$}

${
    suborr-P3.43b.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suborr-P3.43b . $)
    suborr-P3.43b.RC $p |- ( ( w_ch \/ w_ph ) <-> ( w_ch \/ w_ps ) ) $=
        ( wff-or wff-bi wff-true ndtruei-P3.17 suborr-P3.43b ndtruee-P3.18 )
        CAECBEFABCGABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subord-P3.43c.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subord-P3.43c.2 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Dual Substitution Theorem for '`\/`' . `t.` $)
    subord-P3.43c $p
        |- ( w_ga -> ( ( w_ph \/ w_ch ) <-> ( w_ps \/ w_th ) ) )
    $=
        ( wff-or suborl-P3.43a suborr-P3.43b bitrns-P3.33c )
        ACHBCHBDHEABCEFICDBEGJK
    $.
$}

${
    subord-P3.43c.RC.1 $e |- ( w_ph <-> w_ps ) $.
    subord-P3.43c.RC.2 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subord-P3.43c . `t.` $)
    subord-P3.43c.RC $p |- ( ( w_ph \/ w_ch ) <-> ( w_ps \/ w_th ) ) $=
        ( wff-or wff-bi wff-true ndtruei-P3.17 subord-P3.43c ndtruee-P3.18 )
        ACGBDGHABCDIABHEJCDHFJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Theorems for "True" and "False" Constants.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`T.`' is a theorem. `t.` $)
    true-P3.44 $p |- T. $=
        ( wff-true rcp-NDASM1of1 ndtruee-P3.18 ) AZDBC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`F.`' is refutable. `t.` $)
    false-P3.45 $p |- -. F. $=
        ( wff-false rcp-NDASM1of1 ndfalsee-P3.20 ) AZDBC
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Re-deriving Chapter 2 Definitions.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Lemma for ~andasim-P3.46a and ~andasimint-P3.46b . `t.` $)
    andasim-P3.46-L1 $p |- ( ( w_ph /\ w_ps ) -> -. ( w_ph -> -. w_ps ) ) $=
        ( wff-and wff-neg wff-imp rcp-NDASM1of2 ndandel-P3.8 ndander-P3.9
          rcp-NDASM2of2 ndime-P3.6 rcp-NDNEGI2 )
        BABCZABDZEZABLNCZLNFZGAMOABOPHLNIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~andasim-P3.46a . $)
    andasim-P3.46-L2 $p |- ( -. ( w_ph -> -. w_ps ) -> ( w_ph /\ w_ps ) ) $=
        ( wff-neg wff-imp wff-and rcp-NDASM2of2 axL1-P3.21 trnsp-P3.31a
          rcp-NDASM1of2 rcp-NDNEGI2 dnege-P3.30 ndandi-P3.7 )
        ABABCZDZCZAONOACZBAOPEZPBQOPFGHOPIJKBONOMMAOMEOMFGOMIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' in Terms of '`->`'.

       This is the re-derived Chapter 2 definition.  Only ~andasimint-P3.46b
       is deducible with intuitionist logic. $)
    andasim-P3.46a $p |- ( ( w_ph /\ w_ps ) <-> -. ( w_ph -> -. w_ps ) ) $=
        ( wff-and wff-neg wff-imp andasim-P3.46-L1 andasim-P3.46-L2 rcp-NDBII0 )
        ABCABDEDABFABGH
    $.
$}

$( ------------------------------------------------------------------------- $)

    $( One Direction of '`/\`' in Terms of '`->`'. `t.`

       Only this direction is deducible with intuitionist logic. $)
    andasimint-P3.46b $p |- ( ( w_ph /\ w_ps ) -> -. ( w_ph -> -. w_ps ) ) $=
        ( andasim-P3.46-L1 ) ABC
    $.

$( ------------------------------------------------------------------------- $)

${
    $( Alternate Definition of '`<->`'. `t.` 

       The Chapter 2 definition of '`<->`' comes immediately from combining
       this definition with the previous definition of '`/\`'.  That definition
       really isn't useful enough to state though. $)
    dfbi-P3.47 $p
        |- ( ( w_ph <-> w_ps ) <-> ( ( w_ph -> w_ps ) /\ ( w_ps -> w_ph ) ) )
    $=
        ( wff-bi wff-imp wff-and ndbief-P3.14.CL ndbier-P3.15.CL ndandi-P3.7
          ndbii-P3.13.CL rcp-NDBII0 )
        ABCZABDZBADZELMKABFABGHABIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~orasim-P3.48a and ~orasimint-P3.48b . `t.` $)
    orasim-P3.48-L1 $p |- ( ( w_ph \/ w_ps ) -> ( -. w_ph -> w_ps ) ) $=
        ( wff-or wff-neg wff-rcp-AND3 rcp-NDASM3of3 rcp-NDASM2of3
          ndnege-P3.4 rcp-NDASM1of2 rcp-NDORE3 rcp-NDIMI2 )
        BABCZADZABBLMABLMAELMAFLMAGHLMBFLMIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~orasim-P3.48a . $)
    orasim-P3.48-L2 $p |- ( ( -. w_ph -> w_ps ) -> ( w_ph \/ w_ps ) ) $=
        ( wff-neg wff-or wff-imp wff-and rcp-NDASM2of2 ndorir-P3.11
          rcp-NDASM1of2 ndime-P3.6 ndoril-P3.10 ndexclmid-P3.16.AC
          rcp-NDORE2 )
        AACZABDNBEZABOAFOAGHBAONFZNBPONGONIJKAOLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' in Terms of '`->`'.

       This is the re-derived Chapter 2 definition.  Only ~orasimint-P3.48b
       is deducible with intuitionist logic. $)
    orasim-P3.48a $p |- ( ( w_ph \/ w_ps ) <-> ( -. w_ph -> w_ps ) ) $=
        ( wff-or wff-neg wff-imp orasim-P3.48-L1 orasim-P3.48-L2 rcp-NDBII0 )
        ABCADBEABFABGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`\/`' in Terms of '`->`'. `t.`

       Only this direction is deducible with intuitionist logic. $)
    orasimint-P3.48b $p |- ( ( w_ph \/ w_ps ) -> ( -. w_ph -> w_ps ) ) $=
        ( orasim-P3.48-L1 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~dffalse-P3.49 . `t.` $)
    dffalse-P3.49-L1 $p |- ( F. -> -. T. ) $=
        ( wff-true wff-false wff-neg false-P3.45 ndtruei-P3.17
          trnsp-P3.31a.RC )
        ABZGCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~dffalse-P3.49 . `t.` $)
    dffalse-P3.49-L2 $p |- ( -. T. -> F. ) $=
        ( wff-true wff-neg true-P3.44 dnegi-P3.29.RC ndfalsei-P3.19 )
        AZBFCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Re-derived Chapter 2 '`F.`' definition. `t.` $)
    dffalse-P3.49 $p |- ( F. <-> -. T. ) $=
        ( wff-false wff-true wff-neg dffalse-P3.49-L1 dffalse-P3.49-L2
          rcp-NDBII0 )
        ABCDEF
    $.
$}
$( End $[ bfol-ch3.mm $] $)
$( Begin $[ bfol-ch4.mm $] $)

$(
##############################################################################
  Chapter 4: Propositional Calculus (continued)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  More Useful Rules.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Law of Non-contradiction.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Law of Non-contradiction. `t.` $)
    ncontra-P4.1 $p |- -. ( w_ph /\ -. w_ph ) $=
        ( wff-neg wff-and rcp-NDASM1of2 rcp-NDASM2of2 rcp-NDNEGI1 )
        AAABZCAGDAGEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Dual Forms of Introduction and Elimination Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    norel-P4.2a.1 $e |- ( w_ga -> -. ( w_ph \/ w_ps ) ) $.

    $( Negated Left '`\/`' Elimination. `t.` $)
    norel-P4.2a $p |- ( w_ga -> -. w_ps ) $=
        ( wff-or wff-and rcp-NDASM2of2 ndoril-P3.10 wff-neg rcp-NDIMP1add1
          rcp-NDNEGI2 )
        ABEZCBBACBFCBGHLICBDJK
    $.
$}

${
    norel-P4.2a.RC.1 $e |- -. ( w_ph \/ w_ps ) $.

    $( Inference Form of ~norel-P4.2a . `t.` $)
    norel-P4.2a.RC $p |- -. w_ps $=
        ( wff-neg wff-true wff-or ndtruei-P3.17 norel-P4.2a ndtruee-P3.18 )
        BDABEABFDCGHI
    $.
$}

${
    $( Closed Form of ~norel-P4.2a . `t.` $)
    norel-P4.2a.CL $p |- ( -. ( w_ph \/ w_ps ) -> -. w_ps )
        $= ( wff-or wff-neg rcp-NDASM1of1 norel-P4.2a ) ABABCDZGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    norer-P4.2b.1 $e |- ( w_ga -> -. ( w_ph \/ w_ps ) ) $.

    $( Negated Right '`\/`' Elimination. `t.` $)
    norer-P4.2b $p |- ( w_ga -> -. w_ph ) $= 
        ( wff-or wff-and rcp-NDASM2of2 ndorir-P3.11 wff-neg rcp-NDIMP1add1
          rcp-NDNEGI2 )
        ABEZCAABCAFCAGHLICADJK
    $.
$}

${
    norer-P4.2b.RC.1 $e |- -. ( w_ph \/ w_ps ) $.

    $( Inference Form of ~norer-P4.2b . `t.` $)
    norer-P4.2b.RC $p |- -. w_ph $=
        ( wff-neg wff-true wff-or ndtruei-P3.17 norer-P4.2b ndtruee-P3.18 )
        ADABEABFDCGHI
    $.
$}

${
    $( Closed Form of ~norer-P4.2b . `t.` $)
    norer-P4.2b.CL $p |- ( -. ( w_ph \/ w_ps ) -> -. w_ph ) $=
        ( wff-or wff-neg rcp-NDASM1of1 norer-P4.2b ) ABABCDZGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nandil-P4.3a.1 $e |- ( w_ga -> -. w_ph ) $.

    $(  Negated Left '`/\`' Introduction. `t.`  $)
    nandil-P4.3a $p |- ( w_ga -> -. ( w_ps /\ w_ph ) ) $=
        ( wff-and rcp-NDASM2of2 ndandel-P3.8 wff-neg rcp-NDIMP1add1
          rcp-NDNEGI2 )
        ACBAEZBACKECKFGAHCKDIJ
    $.
$}

${
    nandil-P4.3a.RC.1 $e |- -. w_ph $.

    $( Inference Form of ~nandil-P4.3a . `t.` $)
    nandil-P4.3a.RC $p |- -. ( w_ps /\ w_ph ) $=
        ( wff-and wff-neg wff-true ndtruei-P3.17 nandil-P4.3a ndtruee-P3.18 )
        BADEABFAECGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nandir-P4.3b.1 $e |- ( w_ga -> -. w_ph ) $.

    $( Negated Right '`/\`' Introduction. `t.` $)
    nandir-P4.3b $p |- ( w_ga -> -. ( w_ph /\ w_ps ) ) $=
        ( wff-and rcp-NDASM2of2 ndander-P3.9 wff-neg rcp-NDIMP1add1
          rcp-NDNEGI2 )
        ACABEZABCKECKFGAHCKDIJ
    $.
$}

${
    nandir-P4.3b.RC.1 $e |- -. w_ph $.

    $( Inference Form of ~nandir-P4.3b . `t.` $)
    nandir-P4.3b.RC $p |- -. ( w_ph /\ w_ps ) $=
        ( wff-and wff-neg wff-true ndtruei-P3.17 nandir-P4.3b ndtruee-P3.18 )
        ABDEABFAECGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Other Forms of the Principle Of Explosion.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    impoe-P4.4a.1 $e |- ( w_ga -> -. w_ph ) $.

    $( Variation of Principle of Explosion Using Implication.
       `t.` $)
    impoe-P4.4a $p |- ( w_ga -> ( w_ph -> w_ps ) ) $=
        ( wff-and rcp-NDASM2of2 wff-neg rcp-NDIMP1add1 ndnege-P3.4
        rcp-NDIMI2 )
        BCAABCAECAFAGCADHIJ
    $.
$}

${
    impoe-P4.4a.RC.1 $e |- -. w_ph $.

    $( Inference Form of ~impoe-P4.4a . `t.` $)
    impoe-P4.4a.RC $p |- ( w_ph -> w_ps ) $=
        ( wff-imp wff-true wff-neg ndtruei-P3.17 impoe-P4.4a ndtruee-P3.18 )
        ABDABEAFCGHI
    $.
$}

${
    $( Closed Form of ~impoe-P4.4a . `t.` $)
    impoe-P4.4a.CL $p |- ( -. w_ph -> ( w_ph -> w_ps ) ) $=
        ( wff-neg rcp-NDASM1of1 impoe-P4.4a ) ABACZFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nimpoe-P4.4b.1 $e |- ( w_ga -> w_ph ) $.

    $( Variation of Principle of Explosion Using Implication (negated form).
       `t.` $)
    nimpoe-P4.4b $p |- ( w_ga -> ( -. w_ph -> w_ps ) ) $=
        ( wff-neg wff-and rcp-NDIMP1add1 rcp-NDASM2of2 ndnege-P3.4
          rcp-NDIMI2 )
        BCAEZABCKFACKDGCKHIJ
    $.
$}

${
    nimpoe-P4.4b.RC.1 $e |- w_ph $.

    $( Inference Form of ~nimpoe-P4.4b . `t.` $)
    nimpoe-P4.4b.RC $p |- ( -. w_ph -> w_ps ) $=
        ( wff-neg wff-imp wff-true ndtruei-P3.17 nimpoe-P4.4b ndtruee-P3.18 )
        ADBEABFACGHI
    $.
$}

${
    $( Closed Form of ~nimpoe-P4.4b . `t.` $)
    nimpoe-P4.4b.CL $p |- ( w_ph -> ( -. w_ph -> w_ps ) ) $=
        ( rcp-NDASM1of1 nimpoe-P4.4b ) ABAACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    falseimpoe-P4.4c.1 $e |- ( w_ga -> F. ) $.

    $( Principle of Explosion Utilising '`F.`'. `t.` $)
    falseimpoe-P4.4c $p |- ( w_ga -> w_ph ) $=
        ( ndfalsee-P3.20 impoe-P4.4a.RC ) BABCDE
    $.
$}

${
    falseimpoe-P4.4c.RC.1 $e |- F. $.

    $( Inference Form of ~falseimpoe-P4.4c . `t.`

       In an inconsistent system, every wff is a theorem. $)
    falseimpoe-P4.4c.RC $p |- w_ph $=
        ( wff-true wff-false ndtruei-P3.17 falseimpoe-P4.4c ndtruee-P3.18 )
        AACDBEFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Process of Elimination.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    profeliml-P4.5a.1 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.
    profeliml-P4.5a.2 $e |- ( w_ga -> -. w_ph ) $.

    $( Process of Elimination (left). `t.` $)
    profeliml-P4.5a $p |- ( w_ga -> w_ps ) $=
        ( wff-and rcp-NDASM2of2 wff-neg rcp-NDIMP1add1 ndnege-P3.4
          rcp-NDORE2 )
         ABBCABCAFCAGAHCAEIJCBGDK
    $.
$}

${
    profeliml-P4.5a.RC.1 $e |- ( w_ph \/ w_ps ) $.
    profeliml-P4.5a.RC.2 $e |- -. w_ph $.

    $( Inference Form of ~profeliml-P4.5a . `t.` $)
    profeliml-P4.5a.RC $p |- w_ps $=
        ( wff-true wff-or ndtruei-P3.17 wff-neg profeliml-P4.5a
          ndtruee-P3.18 )
        BABEABFCGAHDGIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    profelimr-P4.5b.1 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.
    profelimr-P4.5b.2 $e |- ( w_ga -> -. w_ps ) $.

    $( Process of Elimination (right). `t.` $)
    profelimr-P4.5b $p |- ( w_ga -> w_ph ) $=
        ( rcp-NDASM2of2 wff-and wff-neg rcp-NDIMP1add1
          ndnege-P3.4 rcp-NDORE2 )
        ABACCAFBACBGCBFBHCBEIJDK
    $.
$}

${
    profelimr-P4.5b.RC.1 $e |- ( w_ph \/ w_ps ) $.
    profelimr-P4.5b.RC.2 $e |- -. w_ps $.

    $( Inference Form of ~profelimr-P4.5b . `t.` $)
    profelimr-P4.5b.RC $p |- w_ph $=
        ( wff-true wff-or ndtruei-P3.17 wff-neg profelimr-P4.5b
          ndtruee-P3.18 )
        AABEABFCGBHDGIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nprofeliml-P4.6a.1 $e |- ( w_ga -> -. ( w_ph /\ w_ps ) ) $.
    nprofeliml-P4.6a.2 $e |- ( w_ga -> w_ph ) $.

    $( Negated Process of Elimination (left). `t.` $)
    nprofeliml-P4.6a $p |- ( w_ga -> -. w_ps ) $=
        ( wff-and rcp-NDIMP1add1 rcp-NDASM2of2 ndandi-P3.7 wff-neg
          rcp-NDNEGI2 )
        ABFZCBABCBFACBEGCBHILJCBDGK
    $.
$}

${
    nprofeliml-P4.6a.RC.1 $e |- -. ( w_ph /\ w_ps ) $.
    nprofeliml-P4.6a.RC.2 $e |- w_ph $.

    $( Inference Form of ~nprofeliml-P4.6a . `t.` $)
    nprofeliml-P4.6a.RC $p |- -. w_ps $=
        ( wff-neg wff-true wff-and ndtruei-P3.17 nprofeliml-P4.6a
          ndtruee-P3.18 )
        BEABFABGECHADHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nprofelimr-P4.6b.1 $e |- ( w_ga -> -. ( w_ph /\ w_ps ) ) $.
    nprofelimr-P4.6b.2 $e |- ( w_ga -> w_ps ) $.

    $( Negated Process of Elimination (right). `t.` $)
    nprofelimr-P4.6b $p |- ( w_ga -> -. w_ph ) $=
        ( wff-and rcp-NDASM2of2 rcp-NDIMP1add1 ndandi-P3.7 wff-neg
          rcp-NDNEGI2 )
        ABFZCAABCAFCAGBCAEHILJCADHK
    $.
$}

${
    nprofelimr-P4.6b.RC.1 $e |- -. ( w_ph /\ w_ps ) $.
    nprofelimr-P4.6b.RC.2 $e |- w_ps $.

    $( Inference Form of ~nprofelimr-P4.6b . `t.` $)
    nprofelimr-P4.6b.RC $p |- -. w_ph $=
        ( wff-neg wff-true wff-and ndtruei-P3.17 nprofelimr-P4.6b
          ndtruee-P3.18 )
        AEABFABGECHBDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    falseprofeliml-P4.7a.1 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.
    falseprofeliml-P4.7a.2 $e |- ( w_ga -> ( w_ph -> F. ) ) $.

    $( Process of Elimination Utilising '`F.`' (left). `t.` $)
    falseprofeliml-P4.7a $p |- ( w_ga -> w_ps ) $=
        ( wff-false wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1
          ndime-P3.6 wff-neg falseimpoe-P4.4c rcp-NDNEGI2 profeliml-P4.5a )
        ABCDFZCAAPCAGZCAHAPICAEJKZPLQRMNO
    $.
$}

${
    falseprofeliml-P4.7a.RC.1 $e |- ( w_ph \/ w_ps ) $.
    falseprofeliml-P4.7a.RC.2 $e |- ( w_ph -> F. ) $.

    $( Inference Form of ~falseprofeliml-P4.7a . `t.` $)
    falseprofeliml-P4.7a.RC $p |- w_ps $=
        ( wff-true wff-or ndtruei-P3.17 wff-false wff-imp falseprofeliml-P4.7a
          ndtruee-P3.18 )
        BABEABFCGAHIDGJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    falseprofelimr-P4.7b.1 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.
    falseprofelimr-P4.7b.2 $e |- ( w_ga -> ( w_ps -> F. ) ) $.

    $( Process of Elimination Utilizing '`F.`' (right). `t.` $)
    falseprofelimr-P4.7b $p |- ( w_ga -> w_ph ) $=
        ( wff-false wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1 ndime-P3.6
          wff-neg falseimpoe-P4.4c rcp-NDNEGI2 profelimr-P4.5b )
        ABCDFZCBBPCBGZCBHBPICBEJKZPLQRMNO
    $.
$}

${
    falseprofelimr-P4.7b.RC.1 $e |- ( w_ph \/ w_ps ) $.
    falseprofelimr-P4.7b.RC.2 $e |- ( w_ps -> F. ) $.

    $( Inference Form of ~falseprofelimr-P4.7b . `t.` $)
    falseprofelimr-P4.7b.RC $p |- w_ph $=
        ( wff-true wff-or ndtruei-P3.17 wff-false wff-imp falseprofelimr-P4.7b
          ndtruee-P3.18 )
        AABEABFCGBHIDGJK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Joining Implications.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    joinimandinc-P4.8a.1 $e
        |- ( w_ga -> ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) )
    $.

    $( Join Two Implications Through Conjunction (Inclusive). `t.` $)
    joinimandinc-P4.8a $p
        |- ( w_ga -> ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_th ) ) )
    $=
        ( wff-or wff-rcp-AND3 rcp-NDASM3of3 wff-imp wff-and rcp-NDIMP1add2
          ndander-P3.9 ndime-P3.6 ndorir-P3.11 ndandel-P3.8 ndoril-P3.10
          rcp-NDASM2of2 rcp-NDORE3 rcp-NDIMI2 )
        BDGZEACGZACUAEUBBDEUBAHZABUCEUBAIABJZCDJZUCUDUEKZEUBAFLMNODBEUBCHZCDUG
        EUBCIUDUEUGUFEUBCFLPNQEUBRST
    $.
$}

${
    joinimandinc-P4.8a.RC.1 $e |- ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) $.

    $( Inference Form of ~joinimandinc-P4.8a . `t.` $)
    joinimandinc-P4.8a.RC $p |- ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_th ) ) $=
        ( wff-or wff-imp wff-true wff-and ndtruei-P3.17 joinimandinc-P4.8a
          ndtruee-P3.18 )
        ACFBDFGABCDHABGCDGIEJKL
    $.
$}

${
    $( Closed Form of ~joinimandinc-P4.8a . `t.` $)
    joinimandinc-P4.8a.CL $p
        |- (
          ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) ->
          ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_th ) )
        )
    $=
        ( wff-imp wff-and rcp-NDASM1of1 joinimandinc-P4.8a ) ABCDABECDEFZIGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimandres-P4.8b.1 $e
        |- ( w_ga -> ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) )
    $.

    $( Join Two Implications Through Conjunction (Restrictive). `t.` $)
    joinimandres-P4.8b $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_th ) ) )
    $=
        ( wff-and rcp-NDASM2of2 ndander-P3.9 wff-imp rcp-NDIMP1add1
          ndime-P3.6 ndandel-P3.8 ndandi-P3.7 rcp-NDIMI2 )
        BDGEACGZBDEPGZABQACQEPHZIABJZCDJZQSTGEPFKZILCDQACQRMSTQUAMLNO
    $.
$}

${
    joinimandres-P4.8b.RC.1 $e |- ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) $.

    $( Inference Form of ~joinimandres-P4.8b . `t.` $)
    joinimandres-P4.8b.RC $p |- ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_th ) ) $=
        ( wff-and wff-imp wff-true ndtruei-P3.17 joinimandres-P4.8b
          ndtruee-P3.18 )
        ACFBDFGABCDHABGCDGFEIJK
    $.
$}

${
    $( Closed Form of ~joinimandres-P4.8b . `t.` $)
    joinimandres-P4.8b.CL $p
        |- (
          ( ( w_ph -> w_ps ) /\ ( w_ch -> w_th ) ) ->
          ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_th ) )
        )
    $=
        ( wff-imp wff-and rcp-NDASM1of1 joinimandres-P4.8b ) ABCDABECDEFZIGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimor-P4.8c.1 $e
        |- ( w_ga -> ( ( w_ph -> w_ps ) \/ ( w_ch -> w_th ) ) )
    $.

    $( Join Two Implications Through Disjunction. `t.` $)
    joinimor-P4.8c $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) -> ( w_ps \/ w_th ) ) )
    $=
        ( wff-or wff-and wff-imp wff-rcp-AND3 rcp-NDASM2of3 ndander-P3.9
          rcp-NDASM3of3 ndime-P3.6 ndorir-P3.11 ndandel-P3.8 ndoril-P3.10
          rcp-NDIMP1add1 rcp-NDORE3 rcp-NDIMI2 )
        BDGZEACHZABIZCDIZUAEUBBDEUBUCJZABUEACUEEUBUCKLEUBUCMNODBEUBUDJZCDUFACU
        FEUBUDKPEUBUDMNQUCUDGEUBFRST
    $.
$}

${
    joinimor-P4.8c.RC.1 $e |- ( ( w_ph -> w_ps ) \/ ( w_ch -> w_th ) ) $.

    $( Inference Form of ~joinimor-P4.8c . `t.` $)
    joinimor-P4.8c.RC $p |- ( ( w_ph /\ w_ch ) -> ( w_ps \/ w_th ) ) $=
        ( wff-and wff-or wff-imp wff-true ndtruei-P3.17 joinimor-P4.8c
          ndtruee-P3.18 )
        ACFBDGHABCDIABHCDHGEJKL
    $.
$}

${
    $( Closed Form of ~joinimor-P4.8c . `t.` $)
    joinimor-P4.8c.CL $p
        |- (
          ( ( w_ph -> w_ps ) \/ ( w_ch -> w_th ) ) ->
          ( ( w_ph /\ w_ch ) -> ( w_ps \/ w_th ) )
        )
    $=
        ( wff-imp wff-or rcp-NDASM1of1 joinimor-P4.8c ) ABCDABECDEFZIGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Separating Implications.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    sepimandr-P4.9a.1 $e |- ( w_ga -> ( w_ph -> ( w_ps /\ w_ch ) ) ) $.

    $( Separate Right Conjunction from Implication. `t.` $)
    sepimandr-P4.9a $p
        |- ( w_ga -> ( ( w_ph -> w_ps ) /\ ( w_ph -> w_ch ) ) )
    $=
        ( wff-imp wff-and rcp-NDASM2of2 rcp-NDIMP1add1 ndime-P3.6
          ndander-P3.9 rcp-NDIMI2 ndandel-P3.8 ndandi-P3.7 )
        ABFACFDBDABCDAGZABCGZODAHAPFDAEIJZKLCDABCOQMLN
    $.
$}

${
    sepimandr-P4.9a.RC.1 $e |- ( w_ph -> ( w_ps /\ w_ch ) ) $.

    $( Inference Form of ~sepimandr-P4.9a . `t.` $)
    sepimandr-P4.9a.RC $p |- ( ( w_ph -> w_ps ) /\ ( w_ph -> w_ch ) ) $=
        ( wff-imp wff-and wff-true ndtruei-P3.17 sepimandr-P4.9a
          ndtruee-P3.18 )
        ABEACEFABCGABCFEDHIJ
    $.
$}

${
    $( Closed Form of ~sepimandr-P4.9a . `t.` $)
    sepimandr-P4.9a.CL $p
        |- (
          ( w_ph -> ( w_ps /\ w_ch ) ) ->
          ( ( w_ph -> w_ps ) /\ ( w_ph -> w_ch ) )
        )
    $=
        ( wff-and wff-imp rcp-NDASM1of1 sepimandr-P4.9a ) ABCABCDEZHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    sepimorl-P4.9b.1 $e |- ( w_ga -> ( ( w_ph \/ w_ps ) -> w_ch ) ) $.

    $( Separate Left Disjunction from Implication. `t.` $)
    sepimorl-P4.9b $p
        |- ( w_ga -> ( ( w_ph -> w_ch ) /\ ( w_ps -> w_ch ) ) )
    $=
        ( wff-imp wff-or wff-and rcp-NDASM2of2 ndorir-P3.11 rcp-NDIMP1add1
          ndime-P3.6 rcp-NDIMI2 ndoril-P3.10 ndandi-P3.7 )
        ACFBCFDCDAABGZCDAHZABQDAIJPCFZDAEKLMCDBPCDBHZBASDBINRDBEKLMO
    $.
$}

${
    sepimorl-P4.9b.RC.1 $e |- ( ( w_ph \/ w_ps ) -> w_ch ) $.

    $( Inference Form of ~sepimorl-P4.9b . `t.` $)
    sepimorl-P4.9b.RC $p |- ( ( w_ph -> w_ch ) /\ ( w_ps -> w_ch ) ) $=
        ( wff-imp wff-and wff-true wff-or ndtruei-P3.17 sepimorl-P4.9b
          ndtruee-P3.18 )
        ACEBCEFABCGABHCEDIJK
    $.
$}

${
    $( Closed Form of ~sepimorl-P4.9b . `t.` $)
    sepimorl-P4.9b.CL $p
        |- (
          ( ( w_ph \/ w_ps ) -> w_ch ) ->
          ( ( w_ph -> w_ch ) /\ ( w_ps -> w_ch ) )
        )
    $=
        ( wff-or wff-imp rcp-NDASM1of1 sepimorl-P4.9b ) ABCABDCEZHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    sepimorr-P4.9c.1 $e |- ( w_ga -> ( w_ph -> ( w_ps \/ w_ch ) ) ) $.

    $( Separate Right Disjunction from Implication. $)
    sepimorr-P4.9c $p
        |- ( w_ga -> ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) )
    $=
        ( wff-neg wff-imp wff-or wff-and rcp-NDASM2of2 axL1-P3.21
          ndorir-P3.11 wff-rcp-AND3 rcp-NDASM3of3 rcp-NDIMP1add2 ndime-P3.6
          rcp-NDASM2of3 profeliml-P4.5a rcp-NDIMI3 ndoril-P3.10
          ndexclmid-P3.16.AC rcp-NDORE2 )
        BBFZABGZACGZHDUDUEDBIZBAUFDBJKLUEUDDUCICDUCABCDUCAMZABCHZUGDUCANAUHGDU
        CAEOPDUCAQRSTBDUAUB
    $.
$}

${
    sepimorr-P4.9c.RC.1 $e |- ( w_ph -> ( w_ps \/ w_ch ) ) $.

    $( Inference Form of ~sepimorr-P4.9c . $)
    sepimorr-P4.9c.RC $p |- ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) $=
        ( wff-imp wff-or wff-true ndtruei-P3.17 sepimorr-P4.9c ndtruee-P3.18 )
        ABEACEFABCGABCFEDHIJ
    $.
$}

${
    $( Closed Form of ~sepimorr-P4.9c . $)
    sepimorr-P4.9c.CL $p
        |- (
          ( w_ph -> ( w_ps \/ w_ch ) ) ->
          ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) )
        )
    $=
        ( wff-or wff-imp rcp-NDASM1of1 sepimorr-P4.9c ) ABCABCDEZHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    sepimandl-P4.9d.1 $e |- ( w_ga -> ( ( w_ph /\ w_ps ) -> w_ch ) ) $.

    $( Separate Left Conjunction from Implication. $)
    sepimandl-P4.9d $p
        |- ( w_ga -> ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) ) )
    $=
        ( wff-neg wff-imp wff-or wff-and wff-rcp-AND3 rcp-NDASM3of3
          rcp-NDIMP1add2 trnsp-P3.31c ndime-P3.6 rcp-NDASM2of3
          nprofeliml-P4.6a rcp-NDIMI3 trnsp-P3.31d ndoril-P3.10 rcp-NDASM2of2
          axL1-P3.21 ndorir-P3.11 ndexclmid-P3.16.AC rcp-NDORE2 )
        AAFZACGZBCGZHDUGUFDAIZCBUHBFDACFZABDAUIJZUIABIZFUJDAUIKUKCUJUKCGDAUIEL
        MNDAUIOPQRSUFUGDUEIZCAULUEUIULDUETUARUBADUCUD
    $.
$}

${
    sepimandl-P4.9d.RC.1 $e |- ( ( w_ph /\ w_ps ) -> w_ch ) $.

    $( Inference Form of ~sepimandl-P4.9d . $)
    sepimandl-P4.9d.RC $p |- ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) ) $=
        ( wff-imp wff-or wff-true wff-and ndtruei-P3.17 sepimandl-P4.9d
          ndtruee-P3.18 )
        ACEBCEFABCGABHCEDIJK
    $.
$}

${
    $( Closed Form of ~sepimandl-P4.9d . $)
    sepimandl-P4.9d.CL $p
        |- (
          ( ( w_ph /\ w_ps ) -> w_ch ) ->
          ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) )
        )
    $=
        ( wff-and wff-imp rcp-NDASM1of1 sepimandl-P4.9d ) ABCABDCEZHFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Some Double Negation Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $(  Double Negation Equivalence Property.  $)
    dnegeq-P4.10 $p |- ( -. -. w_ph <-> w_ph ) $=
        ( wff-neg dnege-P3.30.CL dnegi-P3.29.CL rcp-NDBII0 ) ABBAACADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    negbicancel-P4.11.1 $e |- ( w_ga -> ( -. w_ph <-> -. w_ps ) ) $.

    $( Negation Cancellation Rule. $)
    negbicancel-P4.11 $p |- ( w_ga -> ( w_ph <-> w_ps ) ) $=
        ( wff-neg wff-bi subneg-P3.39 dnegeq-P4.10 rcp-NDIMP0addall
          subbid-P3.41c ndbief-P3.14 ndime-P3.6 )
        AEZEZBEZEZFZABFZCMOCDGQRCNAPBCNAFCAHIPBFCBHIJKL
    $.
$}

${
    negbicancel-P4.11.RC.1 $e |- ( -. w_ph <-> -. w_ps ) $.

    $( Inference Form of ~negbicancel-P4.11 . $)
    negbicancel-P4.11.RC $p |- ( w_ph <-> w_ps ) $=
        ( wff-bi wff-true wff-neg ndtruei-P3.17 negbicancel-P4.11
          ndtruee-P3.18 )
        ABDABEAFBFDCGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dnegeint-P4.12.1 $e |- ( w_ga -> -. -. -. w_ph ) $.

    $( Version of Double Negative Elimination derivalbe with intuitionist
       logic. `t.` $)
    dnegeint-P4.12 $p |- ( w_ga -> -. w_ph ) $=
        ( wff-neg wff-and rcp-NDASM2of2 dnegi-P3.29 rcp-NDIMP1add1
          rcp-NDNEGI2 )
        ADDZBAABAEBAFGJDBACHI
    $.
$}

${
    dnegeint-P4.12.RC.1 $e |- -. -. -. w_ph $.

    $( Inference Form of ~dnegeint-P4.12 . `t.` $)
    dnegeint-P4.12.RC $p |- -. w_ph $=
        ( wff-neg wff-true ndtruei-P3.17 dnegeint-P4.12 ndtruee-P3.18 )
        ACZADHCCBEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Double Negative Equivalence Property deducible with intuitionist logic.
       `t.` $)
    dnegeqint-P4.13 $p |- ( -. -. -. w_ph <-> -. w_ph ) $=
        ( wff-neg rcp-NDASM1of1 dnegeint-P4.12 dnegi-P3.29.CL rcp-NDBII0 )
        ABZBBZGAHHCDGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    negbicancelint-P4.14.1 $e |- ( w_ga -> ( -. -. w_ph <-> -. -. w_ps ) ) $.

    $( Negation Cancellation Rule derivalbe with intuitionist logic. `t.` $)
    negbicancelint-P4.14 $p |- ( w_ga -> ( -. w_ph <-> -. w_ps ) ) $=
        ( wff-neg wff-bi subneg-P3.39 dnegeqint-P4.13 rcp-NDIMP0addall
          subbid-P3.41c ndbief-P3.14 ndime-P3.6 )
        AEZEZEZBEZEZEZFZMPFZCNQCDGSTCOMRPCOMFCAHIRPFCBHIJKL
    $.
$}

${
    negbicancelint-P4.14.RC.1 $e |- ( -. -. w_ph <-> -. -. w_ps ) $.

    $( Inference Form of ~negbicancelint-P4.14 . `t.` $)
    negbicancelint-P4.14.RC $p |- ( -. w_ph <-> -. w_ps ) $=
        ( wff-neg wff-bi wff-true ndtruei-P3.17 negbicancelint-P4.14
          ndtruee-P3.18 )
        ADZBDZEABFJDKDECGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Extended Syllogism and Transitivity Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    tsyl-P4.15.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    tsyl-P4.15.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.
    tsyl-P4.15.3 $e |- ( w_ga -> ( w_ch -> w_th ) ) $.
    tsyl-P4.15.4 $e |- ( w_ga -> ( w_th -> w_ta ) ) $.

    $( Triple Syllogism. `t.` $)
    tsyl-P4.15 $p |- ( w_ga -> ( w_ph -> w_ta ) ) $=
        ( dsyl-P3.25 syl-P3.24 ) ADEFABCDFGHIKJL
    $.
$}

${
    tsyl-P4.15.RC.1 $e |- ( w_ph -> w_ps ) $.
    tsyl-P4.15.RC.2 $e |- ( w_ps -> w_ch ) $.
    tsyl-P4.15.RC.3 $e |- ( w_ch -> w_th ) $.
    tsyl-P4.15.RC.4 $e |- ( w_th -> w_ta ) $.

    $( Inference form of ~tsyl-P4.15 . `t.` $)
    tsyl-P4.15.RC $p |- ( w_ph -> w_ta ) $=
        ( wff-imp wff-true ndtruei-P3.17 tsyl-P4.15 ndtruee-P3.18 )
        AEJABCDEKABJFLBCJGLCDJHLDEJILMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dbitrns-P4.16.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    dbitrns-P4.16.2 $e |- ( w_ga -> ( w_ps <-> w_ch ) ) $.
    dbitrns-P4.16.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Doubled Transitive Rule for Biconditional. `t.` $)
    dbitrns-P4.16 $p |- ( w_ga -> ( w_ph <-> w_th ) ) $=
        ( bitrns-P3.33c ) ACDEABCEFGIHI
    $.
$}

${
    dbitrns-P4.16.RC.1 $e |- ( w_ph <-> w_ps ) $.
    dbitrns-P4.16.RC.2 $e |- ( w_ps <-> w_ch ) $.
    dbitrns-P4.16.RC.3 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~dbitrns-P4.16 . `t.` $)
    dbitrns-P4.16.RC $p |- ( w_ph <-> w_th ) $=
        ( wff-bi wff-true ndtruei-P3.17 dbitrns-P4.16 ndtruee-P3.18 )
        ADHABCDIABHEJBCHFJCDHGJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    tbitrns-P4.17.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    tbitrns-P4.17.2 $e |- ( w_ga -> ( w_ps <-> w_ch ) ) $.
    tbitrns-P4.17.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.
    tbitrns-P4.17.4 $e |- ( w_ga -> ( w_th <-> w_ta ) ) $.

    $( Triple Transitive Rule for Biconditional. `t.` $)
    tbitrns-P4.17 $p |- ( w_ga -> ( w_ph <-> w_ta ) ) $=
        ( dbitrns-P4.16 bitrns-P3.33c ) ADEFABCDFGHIKJL
    $.
$}

${
    tbitrns-P4.17.RC.1 $e |- ( w_ph <-> w_ps ) $.
    tbitrns-P4.17.RC.2 $e |- ( w_ps <-> w_ch ) $.
    tbitrns-P4.17.RC.3 $e |- ( w_ch <-> w_th ) $.
    tbitrns-P4.17.RC.4 $e |- ( w_th <-> w_ta ) $.

    $( Inference Form of ~tbitrns-P4.17 . `t.` $)
    tbitrns-P4.17.RC $p |- ( w_ph <-> w_ta ) $=
        ( wff-bi wff-true ndtruei-P3.17 tbitrns-P4.17 ndtruee-P3.18 )
        AEJABCDEKABJFLBCJGLCDJHLDEJILMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Negation Introduction Using "False" Constant. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  The following scheme is useful for shortening proofs where one must derive
  an absurdity from each statement within a disjunction in order to show that
  the entire disjunction is absurd.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Rule.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    falsenegi-P4.18.1 $e |- ( ( w_ga /\ w_ph ) -> F. ) $.
    
    $( Derived Natural Deduction Rule Using '`F.`'. `t.` $)
    falsenegi-P4.18 $p |- ( w_ga -> -. w_ph ) $=
        ( wff-false wff-neg wff-and falseimpoe-P4.4c rcp-NDNEGI2 )
        DZBACIEBAFCGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Scheme.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~falsenegi-P4.18 .
$)

${
    rcp-FALSENEGI1.1 $e |- ( w_ga1 -> F. ) $.

    $( '`-.`' Introduction with '`F.`'. `t.` $)
    rcp-FALSENEGI1 $p |- -. w_ga1 $=
        ( ndfalsee-P3.20 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSENEGI2.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> F. ) $.

    $( '`-.`' Introduction with '`F.`'. `t.` $)
    rcp-FALSENEGI2 $p |- ( w_ga1 -> -. w_ga2 ) $=
        ( falsenegi-P4.18 ) BACD 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSENEGI3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> F. ) $.

    $( '`-.`' Introduction with '`F.`'. `t.` $)
    rcp-FALSENEGI3 $p |- ( ( w_ga1 /\ w_ga2 ) -> -. w_ga3 ) $=
        ( wff-and wff-false rcp-NDSEP3 falsenegi-P4.18 ) CABEFABCDGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSENEGI4.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> F. ) $.

    $( '`-.`' Introduction with '`F.`'. `t.` $)
    rcp-FALSENEGI4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> -. w_ga4 ) $=
        ( wff-rcp-AND3 wff-false rcp-NDSEP4 falsenegi-P4.18 ) DABCFGABCDEHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSENEGI5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ga5 ) -> F. )
    $.

    $( '`-.`' Introduction with '`F.`'. `t.` $)
    rcp-FALSENEGI5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> -. w_ga5 )
    $=
        ( wff-rcp-AND4 wff-false rcp-NDSEP5 falsenegi-P4.18 ) EABCDGHABCDEFIJ
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Logical Equivalencies.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Identity Laws for Conjunction and Disjunction.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`/\`' Identity is '`T.`' (left). `t.` $)
    idandtruel-P4.19a $p |- ( ( T. /\ w_ph ) <-> w_ph ) $=
        ( wff-true wff-and rcp-NDASM2of2 true-P3.44 rcp-NDIMP0addall
          rcp-NDASM1of1 ndandi-P3.7 rcp-NDBII0 )
        BZACAJADJAAJAEFAGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Identity is '`T.`' (right). `t.` $)
    idandtruer-P4.19b $p |- ( ( w_ph /\ T. ) <-> w_ph ) $=
        ( wff-true wff-and wff-bi idandtruel-P4.19a andcomm-P3.35
          subbil-P3.41a.RC rcp-NDBIEF0 rcp-NDIME0 )
        BZACZADZAJCZADZAELNKMAJAFGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' Identity is '`F.`' (left). `t.` $)
    idorfalsel-P4.20a $p |- ( ( F. \/ w_ph ) <-> w_ph ) $=
        ( wff-false wff-or wff-and rcp-NDASM2of2 falseimpoe-P4.4c
          rcp-NDASM1of1 rcp-NDORE2 ndoril-P3.10.CL rcp-NDBII0 )
        BZACZAKAALALKDLKEFLAELGHAKIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' Identity is '`F.`' (right). `t.` $)
    idorfalser-P4.20b $p |- ( ( w_ph \/ F. ) <-> w_ph ) $=
        ( wff-false wff-or wff-bi idorfalsel-P4.20a orcomm-P3.37
          subbil-P3.41a.RC rcp-NDBIEF0 rcp-NDIME0 )
        BZACZADZAJCZADZAELNKMAJAFGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Equivalence Laws Involving "True" and "False".
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    thmeqtrue-P4.21a.1 $e |- w_ph $.
    $( Any Theorem is Logically Equivalent to '`T.`'. `t.` $)
    thmeqtrue-P4.21a $p |- ( w_ph <-> T. ) $=
        ( wff-true true-P3.44 rcp-NDIMP0addall ndtruei-P3.17 rcp-NDBII0 )
        ACZHADEABFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nthmeqfalse-P4.21b.1 $e |- -. w_ph $.
    $( Any Refuted Statement is Logically Equivalent to '`F.`'. `t.` $)
    nthmeqfalse-P4.21b $p |- ( w_ph <-> F. ) $=
        ( wff-false ndfalsei-P3.19 rcp-NDASM1of1 falseimpoe-P4.4c rcp-NDBII0 )
        ACZABDAHHEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
   $( '`T.`' Introduction and Elimination (closed form). `t.` $)
   trueie-P4.22a $p |- ( ( T. -> w_ph ) <-> w_ph ) $=
       ( wff-true wff-imp ndime-P3.6.CL rcp-NDIMI2 ndtruee-P3.18 axL1-P3.21.CL
         rcp-NDBII0 )
       BZACZAJACAIJIADEFAIGH
   $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`F.`' Introduction and Elimination (closed form). `t.` $)
    falseie-P4.22b $p |- ( ( w_ph -> F. ) <-> -. w_ph ) $=
        ( wff-false wff-imp wff-neg wff-and rcp-NDASM2of2 rcp-NDASM1of2
          ndime-P3.6 falsenegi-P4.18 rcp-NDASM1of1 impoe-P4.4a rcp-NDBII0 )
        ABZCZADZANAMNAENAFNAGHIAMOOJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Identity Laws Involving Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    idandthml-P4.23a.1 $e |- w_ph $.

    $( '`/\`' Identity is Any Theorem (left). `t.` $)
    idandthml-P4.23a $p |- ( ( w_ph /\ w_ps ) <-> w_ps ) $=
        ( wff-true wff-and wff-bi idandtruel-P4.19a thmeqtrue-P4.21a
          subandl-P3.42a.RC subbil-P3.41a.RC rcp-NDBIER0 rcp-NDIME0 )
        DZBEZBFZABEZBFZBGQOPNBAMBACHIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    idandthmr-P4.23b.1 $e |- w_ph $.
    $( '`/\`' Identity is Any Theorem (right). `t.` $)
    idandthmr-P4.23b $p |- ( ( w_ps /\ w_ph ) <-> w_ps ) $=
        ( wff-true wff-and wff-bi idandtruer-P4.19b thmeqtrue-P4.21a
          subandr-P3.42b.RC subbil-P3.41a.RC rcp-NDBIER0 rcp-NDIME0 )
        BDZEZBFZBAEZBFZBGQOPNBAMBACHIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    idornthml-P4.24a.1 $e |- -. w_ph $.

    $( '`\/`' Identity is Any Refuted Statement (left). `t.` $)
    idornthml-P4.24a $p |- ( ( w_ph \/ w_ps ) <-> w_ps ) $=
        ( wff-false wff-or wff-bi idorfalsel-P4.20a nthmeqfalse-P4.21b
          suborl-P3.43a.RC subbil-P3.41a.RC rcp-NDBIER0 rcp-NDIME0 )
        DZBEZBFZABEZBFZBGQOPNBAMBACHIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    idornthmr-P4.24b.1 $e |- -. w_ph $.

    $( '`\/`' Identity is Any Refuted Statement (right). `t.` $)
    idornthmr-P4.24b $p |- ( ( w_ps \/ w_ph ) <-> w_ps ) $=
        ( wff-false wff-or wff-bi idorfalser-P4.20b nthmeqfalse-P4.21b
          suborr-P3.43b.RC subbil-P3.41a.RC rcp-NDBIER0 rcp-NDIME0 )
        BDZEZBFZBAEZBFZBGQOPNBAMBACHIJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Idempotent Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Idempotent Law for '`/\`'. `t.` $)
    idempotand-P4.25a $p |- ( ( w_ph /\ w_ph ) <-> w_ph ) $=
        ( wff-and rcp-NDASM1of2 rcp-NDASM1of1 ndandi-P3.7 rcp-NDBII0 )
        AABAAACAAAADZGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotent Law for '`\/`'. `t.` $)
    idempotor-P4.25b $p |- ( ( w_ph \/ w_ph ) <-> w_ph ) $=
        ( wff-or rcp-NDASM2of2 rcp-NDASM1of1 rcp-NDORE2 ndoril-P3.10.CL
          rcp-NDBII0 )
        AABZAAAAHHACZIHDEAAFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  De Morgan's Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Parts of De Morgan's Laws.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( De Morgan's Law A: Forward Implication Lemma. `t.` $)
    dmorgafwd-L4.1 $p |- ( -. ( w_ph \/ w_ps ) -> ( -. w_ph /\ -. w_ps ) ) $=
        ( wff-neg wff-or norer-P4.2b.CL norel-P4.2a.CL ndandi-P3.7 )
        ACBCABDCABEABFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( De Morgan's Law A: Reverse Implication Lemma. `t.` $)
    dmorgarev-L4.2 $p |- ( ( -. w_ph /\ -. w_ps ) -> -. ( w_ph \/ w_ps ) ) $=
        ( wff-neg wff-and wff-or wff-false wff-rcp-AND3 rcp-NDASM3of3
          rcp-NDASM1of3 ndander-P3.9 ndnege-P3.4 ndandel-P3.8
          rcp-NDASM2of2 rcp-NDORE3 rcp-FALSENEGI2 )
        ACZBCZDZABEZABFZRSATRSAGZRSAHPQUARSAIJKBTRSBGZRSBHPQUBRSBILKRSMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( De Morgan's Law B: Forward Implication Lemma. $)
    dmorgbfwd-L4.3 $p |- ( -. ( w_ph /\ w_ps ) -> ( -. w_ph \/ -. w_ps ) ) $=
        ( wff-neg wff-or wff-and norer-P4.2b.CL dnege-P3.30 norel-P4.2a.CL
          ndandi-P3.7 trnsp-P3.31b.RC )
        ACZBCZDZABEABMCZANKLFGBNKLHGIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( De Morgan's Law B: Reverse Implication Lemma. `t.` $)
    dmorgbrev-L4.4 $p |- ( ( -. w_ph \/ -. w_ps ) -> -. ( w_ph /\ w_ps ) ) $=
        ( wff-neg wff-and wff-or rcp-NDASM2of2 nandir-P4.3b nandil-P4.3a
          rcp-NDASM1of1 rcp-NDORE2 )
        ACZBCZABDCKLEZABMKDMKFGBAMLDMLFHMIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  De Morgan's Laws.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
   $( De Morgan's Law A. `t.` $)
   dmorga-P4.26a $p |- ( -. ( w_ph \/ w_ps ) <-> ( -. w_ph /\ -. w_ps ) ) $=
       ( wff-or wff-neg wff-and dmorgafwd-L4.1 dmorgarev-L4.2 rcp-NDBII0 )
       ABCDADBDEABFABGH
   $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( De Morgan's Law B. $)
    dmorgb-P4.26b $p |- ( -. ( w_ph /\ w_ps ) <-> ( -. w_ph \/ -. w_ps ) ) $=
        ( wff-and wff-neg wff-or dmorgbfwd-L4.3 dmorgbrev-L4.4 rcp-NDBII0 )
        ABCDADBDEABFABGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( De Morgan's Law B ( Intuitionist Version ). `t.`

       The reverse of this implication cannot be proven in an intuitionist
       framework. However, it can be added as an axiom to create an
       intermediate strength logic. $)
    dmorgbint-P4.26c $p
        |- ( ( -. w_ph \/ -. w_ps ) -> -. ( w_ph /\ w_ps ) )
    $=
        ( dmorgbrev-L4.4 ) ABC
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Distributive Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Conjunction and Disjunction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Lemma for ~andoveror-P4.27a . `t.` $)
    andoveror-P4.27-L1 $p
        |- ( 
          ( w_ph /\ ( w_ps \/ w_ch ) ) ->
          ( ( w_ph /\ w_ps ) \/ ( w_ph /\ w_ch ) )
        )
    $=
        ( wff-and wff-or wff-rcp-AND3 rcp-NDASM1of3 rcp-NDASM3of3
          ndandi-P3.7 ndorir-P3.11 ndoril-P3.10 rcp-NDASM2of2
          rcp-NDORE3 )
        BCABDZACDZEABCEZNOAPBFZABQAPBGAPBHIJONAPCFZACRAPCGAPCHIKAPLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~andoveror-P4.27a . `t.` $)
    andoveror-P4.27-L2 $p
        |- (
          ( ( w_ph /\ w_ps ) \/ ( w_ph /\ w_ch ) ) ->
          ( w_ph /\ ( w_ps \/ w_ch ) )
        )
    $=
        ( wff-and wff-or rcp-NDASM2of2 ndander-P3.9 ndandel-P3.8
          ndorir-P3.11 ndandi-P3.7 ndoril-P3.10 rcp-NDASM1of1 rcp-NDORE2 )
        ABDZACDZABCEZDNOEZAPQNDZABRQNFZGBCRABRSHIJAPQODZACTQOFZGCBTACTUAHKJQLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Distributes Over '`\/`' . `t.` $)
    andoveror-P4.27a $p
        |- (
          ( w_ph /\ ( w_ps \/ w_ch ) ) <->
          ( ( w_ph /\ w_ps ) \/ ( w_ph /\ w_ch ) )
        )
    $=
        ( wff-or wff-and andoveror-P4.27-L1 andoveror-P4.27-L2 rcp-NDBII0 )
        ABCDEABEACEDABCFABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~oroverand-P4.27b . `t.` $)
    oroverand-P4.27-L3 $p
        |- (
          ( w_ph \/ ( w_ps /\ w_ch ) ) ->
          ( ( w_ph \/ w_ps ) /\ ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-and wff-or rcp-NDASM2of2 ndorir-P3.11 ndandi-P3.7
          ndander-P3.9 ndoril-P3.10 ndandel-P3.8 rcp-NDASM1of1 rcp-NDORE2 )
        ABCDZABEZACEZDANEZOPQADZABRQAFZGACRSGHOPQNDZBATBCTQNFZIJCATBCTUAKJHQLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~oroverand-P4.27b . `t.` $)
    oroverand-P4.27-L4 $p
        |- (
          ( ( w_ph \/ w_ps ) /\ ( w_ph \/ w_ch ) ) ->
          ( w_ph \/ ( w_ps /\ w_ch ) )
        )
    $=
        ( wff-and wff-or wff-rcp-AND3 rcp-NDASM3of3 ndorir-P3.11 wff-rcp-AND4
          rcp-NDASM4of4 rcp-NDASM3of4 ndandi-P3.7 ndoril-P3.10
          rcp-NDASM2of3 rcp-NDORE4 rcp-NDASM1of2 rcp-NDORE3 )
        ABABCDZEZABEZACEZARTUAAFTUAAGHACSTUABARTUABAITUABAJHRATUABCIZBCUBTUABC
        KTUABCJLMTUABNOTUAPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' Distributes Over '`/\`'. `t.` $)
    oroverand-P4.27b $p
        |- (
          ( w_ph \/ ( w_ps /\ w_ch ) ) <->
          ( ( w_ph \/ w_ps ) /\ ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-and wff-or oroverand-P4.27-L3 oroverand-P4.27-L4 rcp-NDBII0 )
        ABCDEABEACEDABCFABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~oroverim-P4.28a and ~oroverimint-P4.28c . `t.` $)
    oroverim-P4.28-L1 $p
        |- (
          ( w_ph \/ ( w_ps -> w_ch ) ) ->
          ( ( w_ph \/ w_ps ) -> ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-imp wff-or wff-true wff-and trueie-P4.22a bisym-P3.33b.RC
          suborl-P3.43a.RC rcp-NDBIEF0 joinimor-P4.8c idandtruel-P4.19a
          subiml-P3.40a.RC ndorir-P3.11.CL idandthml-P4.23a rcp-NDBIER0
          joinimandinc-P4.8a idempotor-P4.25b subimr-P3.40b.RC tsyl-P4.15.RC )
        ABCDZEZFZBGZACEZDZBUFDZABEZUFUFEZDZUIUFDZUDABCUCUCUDADZUBEAUMUBUMAAHIJ
        KLUGUHUEBUFBMNKAUFBUFUHAUFDZUHGUHUNUHACOPQRUKULUJUFUIUFSTKUA $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~oroverim-P4.28a . $)
    oroverim-P4.28-L2 $p
        |- (
          ( ( w_ph \/ w_ps ) -> ( w_ph \/ w_ch ) ) ->
          ( w_ph \/ ( w_ps -> w_ch ) )
        )
    $=
        ( wff-neg wff-imp wff-or wff-and rcp-NDASM2of2 ndorir-P3.11
          wff-rcp-AND3 rcp-NDASM3of3 ndoril-P3.10 rcp-NDASM1of3 ndime-P3.6
          rcp-NDASM2of3 profeliml-P4.5a rcp-NDIMI3 ndexclmid-P3.16.AC
          rcp-NDORE2 )
        AADZABCEZFABFZACFZEZAUAUDAGUDAHIUAAUDTGCUDTBACUDTBJZUBUCUEBAUEUDTBKLUD
        TBMNUDTBOPQLAUDRS
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' Distributes Over '`->`'. $)
    oroverim-P4.28a $p
        |- (
          ( w_ph \/ ( w_ps -> w_ch ) ) <->
          ( ( w_ph \/ w_ps ) -> ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-imp wff-or oroverim-P4.28-L1 oroverim-P4.28-L2 rcp-NDBII0 )
        ABCDEABEACEDABCFABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~oroverbi-P4.28b and ~oroverbiint-P4.28d . `t.` $)
    oroverbi-P4.28-L3 $p
        |- (
          ( w_ph \/ ( w_ps <-> w_ch ) ) <->
          ( ( w_ph \/ ( w_ps -> w_ch ) ) /\ ( w_ph \/ ( w_ch -> w_ps ) ) )
        )
    $=
        ( wff-bi wff-or wff-imp wff-and dfbi-P3.47 suborr-P3.43b.RC
          oroverand-P4.27b bitrns-P3.33c.RC )
        ABCDZEABCFZCBFZGZEAMEANEGLOABCHIAMNJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`\/`' Distributes Over '`<->`'. $)
    oroverbi-P4.28b $p
        |- (
          ( w_ph \/ ( w_ps <-> w_ch ) ) <->
          ( ( w_ph \/ w_ps ) <-> ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-bi wff-or wff-imp wff-and oroverbi-P4.28-L3 oroverim-P4.28a
          subandd-P3.42c.RC dfbi-P3.47 bisym-P3.33b.RC dbitrns-P4.16.RC )
        ABCDEABCFEZACBFEZGABEZACEZFZQPFZGZPQDZABCHNROSABCIACBIJUATPQKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`\/`' Distributes Over '`->`'. `t.`

       Only this version is derivalbe with intuitionist logic. $)
    oroverimint-P4.28c $p
        |- (
          ( w_ph \/ ( w_ps -> w_ch ) ) ->
          ( ( w_ph \/ w_ps ) -> ( w_ph \/ w_ch ) )
        )
    $=
        ( oroverim-P4.28-L1 ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`\/`' Distributes Over '`<->`'. `t.`

       Only this version is deducible with intuitionist logic.  $)
    oroverbiint-P4.28d $p
        |- (
          ( w_ph \/ ( w_ps <-> w_ch ) ) ->
          ( ( w_ph \/ w_ps ) <-> ( w_ph \/ w_ch ) )
        )
    $=
        ( wff-or wff-bi wff-imp wff-and oroverbi-P4.28-L3 rcp-NDBIEF0
          ndander-P3.9 oroverim-P4.28-L1 syl-P3.24.RC ndandel-P3.8
          ndbii-P3.13 )
        ABDZACDZABCEDZQABCFDZOPFRACBFDZQQRSGABCHIZJABCKLQSPOFRSQTMACBKLN
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Left Implication.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( '`->`' Left Distributes Over '`/\`'. `t.` $)
    imoverand-P4.29a $p
        |- (
          ( w_ph -> ( w_ps /\ w_ch ) ) <->
          ( ( w_ph -> w_ps ) /\ ( w_ph -> w_ch ) )
        )
    $=
        ( wff-and wff-imp sepimandr-P4.9a.CL joinimandres-P4.8b.CL
          idempotand-P4.25a subiml-P3.40a.RC rcp-NDBIEF0 syl-P3.24.RC
          rcp-NDBII0 )
        ABCDZEZABEACEDZABCFOAADZMEZNABACGQNPAMAHIJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~imoveror-P4.29b and ~imoverorint-P4.29c . `t.`  $)
    imoveror-P4.29-L1 $p
        |- (
          ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) ->
          ( w_ph -> ( w_ps \/ w_ch ) )
        )
    $=
        ( wff-imp wff-or wff-and joinimor-P4.8c.CL idempotand-P4.25a
          subiml-P3.40a.RC rcp-NDBIEF0 syl-P3.24.RC )
        ABDACDEAAFZBCEZDZAMDZABACGNOLAMAHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' Left Distributes Over '`\/`' . $)
    imoveror-P4.29b $p
        |- (
          ( w_ph -> ( w_ps \/ w_ch ) ) <->
          ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) )
        )
    $=
        ( wff-or wff-imp sepimorr-P4.9c.CL imoveror-P4.29-L1 rcp-NDBII0 )
        ABCDEABEACEDABCFABCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`->`' Left Distributes Over '`\/`' . `t.`

       Only this direction is deducible with intuitionist logic. $)
    imoverorint-P4.29c $p
        |- (
          ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) ->
          ( w_ph -> ( w_ps \/ w_ch ) )
        )
    $=
        ( imoveror-P4.29-L1 ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for imoverim-P4.30a . `t.` $)
    imoverim-P4.30-L1 $p
        |- (
          ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) ) ->
          ( w_ph -> ( w_ps -> w_ch ) )
        )
    $=
        ( wff-imp wff-and rcp-NDASM2of2 axL1-P3.21 rcp-NDASM1of2 ndime-P3.6
          rcp-NDIMI2 imcomm-P3.27 )
        BACABDZACDZDZMNBLMNBEZBAONBFGNBHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' Distributes Over Itself . `t.` $)
    imoverim-P4.30a $p
        |- (
          ( w_ph -> ( w_ps -> w_ch ) ) <->
          ( ( w_ph -> w_ps ) -> ( w_ph -> w_ch ) )
        )
    $=
        ( wff-imp axL2-P3.22.CL imoverim-P4.30-L1 rcp-NDBII0 )
        ABCDDABDACDDABCEABCFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~imoverbi-P4.30b . `t.` $)
    imoverbi-P4.30-L2 $p
        |- (
          ( w_ph -> ( w_ps <-> w_ch ) ) <->
          ( ( w_ph -> ( w_ps -> w_ch ) ) /\ ( w_ph -> ( w_ch -> w_ps ) ) )
        )
    $=
        ( wff-bi wff-imp wff-and dfbi-P3.47 subimr-P3.40b.RC imoverand-P4.29a
          bitrns-P3.33c.RC )
        ABCDZEABCEZCBEZFZEALEAMEFKNABCGHALMIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' Left Distributes Over '`<->`'. `t.` $)
    imoverbi-P4.30b $p
        |- (
          ( w_ph -> ( w_ps <-> w_ch ) ) <->
          ( ( w_ph -> w_ps ) <-> ( w_ph -> w_ch ) )
        )
    $=
        ( wff-bi wff-imp wff-and imoverbi-P4.30-L2 imoverim-P4.30a
          subandd-P3.42c.RC dfbi-P3.47 bisym-P3.33b.RC dbitrns-P4.16.RC )
        ABCDEABCEEZACBEEZFABEZACEZEZPOEZFZOPDZABCGMQNRABCHACBHITSOPJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Antidistributive Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Lemma for ~rimoverand-P4.31a and ~rimoverandint-P4.31c . `t.` $)
    rimoverand-P4.31-L1 $p
        |- (
          ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) ) ->
          ( ( w_ph /\ w_ps ) -> w_ch )
        )
    $=
        ( wff-imp wff-or wff-and joinimor-P4.8c.CL idempotor-P4.25b
          subimr-P3.40b.RC rcp-NDBIEF0 syl-P3.24.RC )
        ACDBCDEABFZCCEZDZLCDZACBCGNOMCLCHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $(  '`->`' is Antidistributive on the Right Over '`/\`'.  $)
    rimoverand-P4.31a $p
        |- (
          ( ( w_ph /\ w_ps ) -> w_ch ) <->
          ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) )
        )
    $=
        ( wff-and wff-imp wff-or sepimandl-P4.9d.CL rimoverand-P4.31-L1
          rcp-NDBII0 )
        ABDCEACEBCEFABCGABCHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' is Antidistributive on the Right Over '`\/`' . `t.` $)
    rimoveror-P4.31b $p
        |- (
          ( ( w_ph \/ w_ps ) -> w_ch ) <->
          ( ( w_ph -> w_ch ) /\ ( w_ps -> w_ch ) )
        )
    $=
        ( wff-or wff-imp wff-and sepimorl-P4.9b.CL joinimandinc-P4.8a.CL
          idempotor-P4.25b subimr-P3.40b.RC rcp-NDBIEF0 syl-P3.24.RC
          rcp-NDBII0 )
        ABDZCEZACEBCEFZABCGPNCCDZEZOACBCHROQCNCIJKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`->`' is Antidistributive on the Right Over '`/\`' .
       `t.`

       Only this direction is deducible with intuitionist logic. $)
    rimoverandint-P4.31c $p
        |- (
          ( ( w_ph -> w_ch ) \/ ( w_ps -> w_ch ) ) ->
          ( ( w_ph /\ w_ps ) -> w_ch )
        )
    $=
        ( rimoverand-P4.31-L1 ) ABCD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Useful Logical Equivalencies.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Lemma 4.5. $)
    lemma-L4.5 $p |- ( -. ( w_ph /\ -. w_ps ) <-> ( -. w_ph \/ w_ps ) ) $=
        ( wff-neg wff-and wff-or dmorgb-P4.26b dnegeq-P4.10 suborr-P3.43b.RC
          bitrns-P3.33c.RC )
        ABCZDCACZJCZEKBEAJFLBKBGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~imasor-P4.32a . $)
    imasor-P4.32-L1 $p |- ( ( w_ph -> w_ps ) -> ( -. w_ph \/ w_ps ) ) $=
        ( wff-neg wff-or wff-imp wff-and rcp-NDASM2of2 rcp-NDASM1of2
          ndime-P3.6 ndoril-P3.10 ndorir-P3.11 ndexclmid-P3.16.AC rcp-NDORE2 )
        AACZNBDABEZBNOAFZABPOAGOAHIJNBONFONGKAOLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~imasor-P4.32a and ~imasorint-P4.32b . `t.` $)
    imasor-P4.32-L2 $p |- ( ( -. w_ph \/ w_ps ) -> ( w_ph -> w_ps ) ) $=
        ( wff-neg wff-imp wff-or wff-and rcp-NDASM2of2 impoe-P4.4a axL1-P3.21
          rcp-NDASM1of1 rcp-NDORE2 )
        ACZBABDLBEZABMLFMLGHBAMBFMBGIMJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' in Terms of '`\/`'. $)
    imasor-P4.32a $p |- ( ( w_ph -> w_ps ) <-> ( -. w_ph \/ w_ps ) ) $=
        ( wff-imp wff-neg wff-or imasor-P4.32-L1 imasor-P4.32-L2 rcp-NDBII0 )
        ABCADBEABFABGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`->`' in Terms of '`\/`'. `t.`

       Only this direction is deducible with intuitionist logic. $)
    imasorint-P4.32b $p |- ( ( -. w_ph \/ w_ps ) -> ( w_ph -> w_ps ) ) $=
        ( imasor-P4.32-L2 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`->`' in Terms of '`/\`'. $)
    imasand-P4.33a $p |- ( ( w_ph -> w_ps ) <-> -. ( w_ph /\ -. w_ps ) ) $=
        ( wff-imp wff-neg wff-or wff-and imasor-P4.32a lemma-L4.5
          bisym-P3.33b.RC bitrns-P3.33c.RC )
        ABCADBEZABDFDZABGLKABHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of '`->`' in Terms of '`/\`'. `t.`

       Only this direction is deducible with intuitionist logic. $)
    imasandint-P4.33b $p |- ( ( w_ph -> w_ps ) -> -. ( w_ph /\ -. w_ps ) ) $=
        ( wff-imp wff-neg wff-and rcp-NDASM2of2 ndander-P3.9 rcp-NDASM1of2
          ndime-P3.6 ndandel-P3.8 rcp-NDNEGI2 )
        BABCZABDZEZABLNEZAMOLNFZGLNHIAMOPJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`<->`' in Terms of '`/\`' and '`\/`'. $)
    biasandor-P4.34a $p
        |- (
          ( w_ph <-> w_ps ) <->
          ( ( w_ph /\ w_ps ) \/ ( -. w_ph /\ -. w_ps ) )
        )
    $=
        ( wff-bi wff-neg wff-and wff-or wff-imp dfbi-P3.47 imasor-P4.32a
          subandd-P3.42c.RC andoveror-P4.27a andcomm-P3.35 subord-P3.43c.RC
          ncontra-P4.1 idornthmr-P4.24b tbitrns-P4.17.RC idornthml-P4.24a
          dbitrns-P4.16.RC orcomm-P3.37 bitrns-P3.33c.RC )
        ABCZADZBDZEZABEZFZUEUDFUAABGZBAGZEUBBFZUCAFZEUIUCEZUIAEZFUFABHUGUIUHUJ
        ABIBAIJUIUCAKUKUDULUEUKUCUIEUCUBEZUCBEZFUDBUCEZFUDUIUCLUCUBBKUMUDUNUOU
        CUBLUCBLMUOUDBNOPULAUIEAUBEZUEFUEUIALAUBBKUPUEANQRMPUDUEST
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One direction of '`<->`' in Terms of '`/\`' and '`\/`'. `t.`

       Only this direction is deducible with intuitionist logic. $)
    biasandorint-P4.34b $p
        |- (
          ( ( w_ph /\ w_ps ) \/ ( -. w_ph /\ -. w_ps ) ) ->
          ( w_ph <-> w_ps )
        )
    $=
        ( wff-and wff-neg wff-bi wff-or rcp-NDASM2of2 ndandel-P3.8
          axL1-P3.21 ndander-P3.9 ndbii-P3.13 impoe-P4.4a rcp-NDASM1of1
          rcp-NDORE2 )
        ABCZADZBDZCZABEORFZABSOCZBATABTSOGZHIABTABTUAJIKABSRCZABUBPQUBSRGZJLBA
        UBPQUBUCHLKSMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Truth Tables.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Negation.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( `-.` T `<=>` F. `t.` $)
    truthtblnegt-P4.35a $p |- ( -. T. <-> F. ) $=
        ( wff-false wff-true wff-neg dffalse-P3.49 bisym-P3.33b.RC ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( `-.` F `<=>` T. `t.` $)
    truthtblnegf-P4.35b $p |- ( -. F. <-> T. ) $=
        ( wff-false wff-neg false-P3.45 thmeqtrue-P4.21a ) ABCD
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Implication.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ( T `->` T ) `<=>` T. `t.` $)
    truthtbltimt-P4.36a $p |- ( ( T. -> T. ) <-> T. ) $=
        ( wff-true trueie-P4.22a ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( T `->` F ) `<=>` F. `t.` $)
    truthtbltimf-P4.36b $p |- ( ( T. -> F. ) <-> F. ) $=
        ( wff-false trueie-P4.22a ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `->` T ) `<=>` T. `t.` $)
    truthtblfimt-P4.36c $p |- ( ( F. -> T. ) <-> T. ) $=
        ( wff-false wff-true wff-imp rcp-NDASM1of1 falseimpoe-P4.4c
          thmeqtrue-P4.21a )
        AZBZCHGGDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `->` F ) `<=>` T. `t.` $)
    truthtblfimf-P4.36d $p |- ( ( F. -> F. ) <-> T. ) $=
        ( wff-false wff-imp rcp-NDASM1of1 thmeqtrue-P4.21a ) AZEBECD
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Conjunction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ( T `/\` T ) `<=>` T. `t.` $)
    truthtbltandt-P4.37a $p |- ( ( T. /\ T. ) <-> T. ) $=
        ( wff-true idandtruel-P4.19a ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( T `/\` F ) `<=>` F. `t.` $)
    truthtbltandf-P4.37b $p |- ( ( T. /\ F. ) <-> F. ) $=
        ( wff-false idandtruel-P4.19a ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `/\` T ) `<=>` F. `t.` $)
    truthtblfandt-P4.37c $p |- ( ( F. /\ T. ) <-> F. ) $=
        ( wff-false idandtruer-P4.19b ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `/\` F ) `<=>` F. `t.` $)
    truthtblfandf-P4.37d $p |- ( ( F. /\ F. ) <-> F. ) $=
        ( wff-false idempotand-P4.25a ) AB
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Disjunction.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ( T `\/` T ) `<=>` T. `t.` $)
    truthtbltort-P4.38a $p |- ( ( T. \/ T. ) <-> T. ) $=
        ( wff-true idempotor-P4.25b ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( T `\/` F ) `<=>` T. `t.` $)
    truthtbltorf-P4.38b $p |- ( ( T. \/ F. ) <-> T. ) $=
        ( wff-true idorfalser-P4.20b ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `\/` T ) `<=>` T. `t.` $)
    truthtblfort-P4.38c $p |- ( ( F. \/ T. ) <-> T. ) $=
        ( wff-true idorfalsel-P4.20a ) AB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `\/` F ) `<=>` F. `t.` $)
    truthtblforf-P4.38d $p |- ( ( F. \/ F. ) <-> F. ) $=
        ( wff-false idorfalsel-P4.20a ) AB
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Equivalence.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ( T `<->` T ) `<=>` T. `t.` $)
    truthtbltbit-P4.39a $p |- ( ( T. <-> T. ) <-> T. ) $=
        ( wff-true wff-bi biref-P3.33a thmeqtrue-P4.21a ) AZEBECD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( T `<->` F ) `<=>` F. `t.` $)
    truthtbltbif-P4.39b $p |- ( ( T. <-> F. ) <-> F. ) $=
        ( wff-true wff-false wff-bi true-P3.44 rcp-NDIMP0addall ndbief-P3.14.CL
          ndime-P3.6 ndfalsee-P3.20 nthmeqfalse-P4.21b )
        AZBZCZLJKLJLDEJKFGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `<->` T ) `<=>` F. `t.` $)
    truthtblfbit-P4.39c $p |- ( ( F. <-> T. ) <-> F. ) $=
        ( wff-false wff-true wff-bi true-P3.44 rcp-NDIMP0addall ndbier-P3.15.CL
          ndime-P3.6 ndfalsee-P3.20 nthmeqfalse-P4.21b )
        AZBZCZLKJLKLDEJKFGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ( F `<->` F ) `<=>` T. `t.` $)
    truthtblfbif-P4.39d $p |- ( ( F. <-> F. ) <-> T. ) $=
        ( wff-false wff-bi biref-P3.33a thmeqtrue-P4.21a ) AZEBECD
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Peirce's Law.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Classical Proof.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Peirce's Law.

       Cannot be proven without the Law of Excluded Middle. $)
    peirce-P4.40 $p |- ( ( ( w_ph -> w_ps ) -> w_ph ) -> w_ph ) $=
        ( wff-neg wff-imp rcp-NDASM2of2 wff-and impoe-P4.4a rcp-NDASM1of2
          ndime-P3.6 ndexclmid-P3.16.AC rcp-NDORE2 )
        AACZAABDZADZNAEMANLFZABONLEGNLHIANJK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Equivalence of Peirce's Law and Law of Excluded Middle.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    exclmid2peirce-P4.41a.1 $e |- ( w_ph \/ -. w_ph ) $.

    $( Peirce's Law from Law of Excluded Middle. `t.`

       The use of ~ndexclmid-P3.16 is simply replaced with a hypothesis. All
       the other rules used are valid in intuitionist logic.
    $)
    exclmid2peirce-P4.41a $p |- ( ( ( w_ph -> w_ps ) -> w_ph ) -> w_ph ) $=
        ( wff-neg wff-imp rcp-NDASM2of2 wff-and impoe-P4.4a rcp-NDASM1of2
          ndime-P3.6 wff-or rcp-NDIMP0addall rcp-NDORE2 )
        AADZAABEZAEZPAFOAPNGZABQPNFHPNIJANKPCLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    peirce2exclmid-P4.41b.1 $e
        |- (
          ( ( ( w_ph \/ -. w_ph ) -> F. ) -> ( w_ph \/ -. w_ph ) ) ->
          ( w_ph \/ -. w_ph )
        )
    $.

    $( Law of Excluded Middle from Peirce's Law. `t.` 

       The hypothesis is a special case of Peirce's Law. $)
    peirce2exclmid-P4.41b $p |- ( w_ph \/ -. w_ph ) $=
        ( wff-neg wff-or wff-false wff-imp norer-P4.2b.CL ndoril-P3.10
          falseie-P4.22b bisym-P3.33b.RC subiml-P3.40a.RC rcp-NDBIEF0
          rcp-NDIME0 )
        AACZDZEFZOFZOOCZOFZQNARANGHSQRPOPROIJKLMBM
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Appendix: Convenience Theorems.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Reductio ad Absurdum. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  This scheme relies on the Law of Excluded Middle.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Rule.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    raa-P4.1 $e |- ( ( w_ga /\ -. w_ph ) -> w_ps ) $.
    raa-P4.2 $e |- ( ( w_ga /\ -. w_ph ) -> -. w_ps ) $.
    $( Reductio ad Absurdum.

       This rule combines ~ndnegi-P3.3 with double negative elimination, and
       is thus dependent on the Law of Excluded Middle. $)
    raa-P4 $p |- ( w_ga -> w_ph ) $=
        ( wff-neg ndnegi-P3.3 dnege-P3.30 ) ACAFBCDEGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Scheme.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~raa-P4 .
$)

${
    rcp-RAA1.1 $e |- ( -. w_ga1 -> w_ph ) $.
    rcp-RAA1.2 $e |- ( -. w_ga1 -> -. w_ph ) $.

    $( Reductio ad Absurdum. $)
    rcp-RAA1 $p |- w_ga1 $=
        ( wff-neg rcp-NDNEGI1 dnege-P3.30.RC ) BABECDFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-RAA2.1 $e |- ( ( w_ga1 /\ -. w_ga2 ) -> w_ph ) $.
    rcp-RAA2.2 $e |- ( ( w_ga1 /\ -. w_ga2 ) -> -. w_ph ) $.

    $( Reductio ad Absurdum. $)
    rcp-RAA2 $p |- ( w_ga1 -> w_ga2 ) $=
        ( wff-neg rcp-NDNEGI2 dnege-P3.30 ) CBABCFDEGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-RAA3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ -. w_ga3 ) -> w_ph ) $.
    rcp-RAA3.2 $e |- ( ( w_ga1 /\ w_ga2 /\ -. w_ga3 ) -> -. w_ph ) $.

    $( Reductio ad Absurdum. $)
    rcp-RAA3 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ga3 ) $=
        ( wff-and wff-neg rcp-NDNEGI3 dnege-P3.30 ) DBCGABCDHEFIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-RAA4.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ -. w_ga4 ) -> w_ph )
    $.

    rcp-RAA4.2 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ -. w_ga4 ) -> -. w_ph )
    $.

    $( Reductio ad Absurdum. $)
    rcp-RAA4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ga4 ) $=
        ( wff-rcp-AND3 wff-neg rcp-NDNEGI4 dnege-P3.30 ) EBCDHABCDEIFGJK
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    rcp-RAA5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ -. w_ga5 ) -> w_ph )
    $.

    rcp-RAA5.2 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ -. w_ga5 ) -> -. w_ph )
    $.

    $( Reductio ad Absurdum. $)
    rcp-RAA5 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga5 ) $=
        ( wff-rcp-AND4 wff-neg rcp-NDNEGI5 dnege-P3.30 ) FBCDEIABCDEFJGHKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Reductio ad Absurdum Using "False" Constant. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Rule.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    falseraa-P4.1 $e |- ( ( w_ga /\ -. w_ph ) -> F. ) $.
    $( Reductio ad Absurdum Using '`F.`'.

       This rule combines ~falsenegi-P4.18 with double negative elimination,
       and is thus dependent on the Law of Excluded Middle. $)
    falseraa-P4 $p |- ( w_ga -> w_ph ) $=
        ( wff-neg falsenegi-P4.18 dnege-P3.30 ) ABADBCEF
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Scheme.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~falseraa-P4 .
$)

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSERAA1.1 $e |- ( -. w_ga1 -> F. ) $.

    $( Reductio ad Absurdum Using '`F.`'. $)
    rcp-FALSERAA1 $p |- w_ga1 $=
        ( wff-neg rcp-FALSENEGI1 dnege-P3.30.RC ) AACBDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSERAA2.1 $e |- ( ( w_ga1 /\ -. w_ga2 ) -> F. ) $.

    $( Reductio ad Absurdum Using '`F.`'. $)
    rcp-FALSERAA2-P $p |- ( w_ga1 -> w_ga2 ) $=
        ( wff-neg rcp-FALSENEGI2 dnege-P3.30 ) BAABDCEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSERAA3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ -. w_ga3 ) -> F. ) $.

    $( Reductio ad Absurdum Using '`F.`'. $)
    rcp-FALSERAA3 $p |- ( ( w_ga1 /\ w_ga2 ) -> w_ga3 ) $=
        ( wff-and wff-neg rcp-FALSENEGI3 dnege-P3.30 ) CABEABCFDGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSERAA4.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ -. w_ga4 ) -> F. )
    $.

    $( Reductio ad Absurdum Using '`F.`'. $)
    rcp-FALSERAA4 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> w_ga4 ) $=
        ( wff-rcp-AND3 wff-neg rcp-FALSENEGI4 dnege-P3.30 ) DABCFABCDGEHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-FALSERAA5.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ -. w_ga5 ) -> F. )
    $.

    $( Reductio ad Absurdum Using '`F.`'. $)
    rcp-FALSERAA5 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> w_ga5 )
    $=
        ( wff-rcp-AND4 wff-neg rcp-FALSENEGI5 dnege-P3.30 ) EABCDGABCDEHFIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Convert Implication to Assumption. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Rule.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    impime-P4.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( '`->`' Elimination with Importation. `t.` $)
    impime-P4 $p |- ( ( w_ga /\ w_ph ) -> w_ps ) $=
        ( wff-and rcp-NDASM2of2 wff-imp rcp-NDIMP1add1 ndime-P3.6 )
        ABCAECAFABGCADHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Scheme.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~impime-P4 .
$)

${
    rcp-IMPIME1.1 $e |- ( w_ga1 -> ( w_ph -> w_ps ) ) $.

    $( '`->`' Elimination with Importation. `t.` $)
    rcp-IMPIME1 $p |- ( ( w_ga1 /\ w_ph ) -> w_ps ) $=
        ( impime-P4 ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-IMPIME2.1 $e |- ( ( w_ga1 /\ w_ga2 ) -> ( w_ph -> w_ps ) ) $.

    $( '`->`' Elimination with Importation. `t.` $)
    rcp-IMPIME2 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ph ) -> w_ps ) $=
        ( wff-and impime-P4 rcp-NDJOIN3 ) BCDAABCDFEGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-IMPIME3.1 $e |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 ) -> ( w_ph -> w_ps ) ) $.

    $( '`->`' Elimination with Importation. `t.` $)
    rcp-IMPIME3 $p |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ph ) -> w_ps ) $=
        ( wff-rcp-AND3 impime-P4 rcp-NDJOIN4 ) BCDEAABCDEGFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    rcp-IMPIME4.1 $e
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 ) -> ( w_ph -> w_ps ) )
    $.

    $( '`->`' Elimination with Importation. `t.` $)
    rcp-IMPIME4 $p
        |- ( ( w_ga1 /\ w_ga2 /\ w_ga3 /\ w_ga4 /\ w_ph ) -> w_ps )
    $=
        ( wff-rcp-AND4 impime-P4 rcp-NDJOIN5 ) BCDEFAABCDEFHGIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Combine Biconditional Elimination with Modus Ponens. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    bimpf-P4.1 $e |- ( w_ga -> w_ph ) $.
    bimpf-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Modus Ponens with '`<->`' (forward). `t.` $)
    bimpf-P4 $p |- ( w_ga -> w_ps ) $=
        ( ndbief-P3.14 ndime-P3.6 ) ABCDABCEFG
    $.
$}

${
    bimpf-P4.RC.1 $e |- w_ph $.
    bimpf-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~bimpf-P4 . `t.` $)
    bimpf-P4.RC $p |- w_ps $=
        ( wff-true ndtruei-P3.17 wff-bi bimpf-P4 ndtruee-P3.18 )
        BABEACFABGDFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    bimpr-P4.1 $e |- ( w_ga -> w_ps ) $.
    bimpr-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Modus Ponens with '`<->`' (reverse). `t.` $)
    bimpr-P4 $p |- ( w_ga -> w_ph ) $=
        ( ndbier-P3.15 ndime-P3.6 ) BACDABCEFG
    $.
$}

${
    bimpr-P4.RC.1 $e |- w_ps $.
    bimpr-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~bimpr-P4 . `t.` $)
    bimpr-P4.RC $p |- w_ph $=
        ( wff-true ndtruei-P3.17 wff-bi bimpr-P4 ndtruee-P3.18 )
        AABEBCFABGDFHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Transposition Laws as Equivalence Laws. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Transposition Equivalence Law ( ~trnsp-P3.31a ). `t.` $)
    trnspeq-P4a $p |- ( ( w_ph -> -. w_ps ) <-> ( w_ps -> -. w_ph ) ) $=
        ( wff-neg wff-imp trnsp-P3.31a.CL rcp-NDBII0 ) ABCDBACDABEBAEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Transposition Equivalence Law ( ~trnsp-P3.31b ). $)
    trnspeq-P4b $p |- ( ( -. w_ph -> w_ps ) <-> ( -. w_ps -> w_ph ) ) $=
        ( wff-neg wff-imp trnsp-P3.31b.CL rcp-NDBII0 ) ACBDBCADABEBAEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Transposition Equivalence Law ( ~trnsp-P3.31c and ~trnsp-P3.31d ). $)
    trnspeq-P4c $p |- ( ( w_ph -> w_ps ) <-> ( -. w_ps -> -. w_ph ) ) $=
        ( wff-imp wff-neg trnsp-P3.31c.CL trnsp-P3.31d.CL rcp-NDBII0 )
        ABCBDADCABEBAFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Different Form for Substitution Theorems. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    subneg2-P4.1 $e |- ( w_ga -> -. w_ph ) $.
    subneg2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subneg-P3.39 . `t.` $)
    subneg2-P4 $p |- ( w_ga -> -. w_ps ) $=
        ( wff-neg subneg-P3.39 ndbief-P3.14 ndime-P3.6 ) AFZBFZCDJKCABCEGHI
    $.
$}

${
    subneg2-P4.RC.1 $e |- -. w_ph $.
    subneg2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subneg2-P4 . `t.` $)
    subneg2-P4.RC $p |- -. w_ps $=
        ( wff-neg wff-true ndtruei-P3.17 wff-bi subneg2-P4 ndtruee-P3.18 )
        BEABFAECGABHDGIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subiml2-P4.1 $e |- ( w_ga -> ( w_ph -> w_ch ) ) $.
    subiml2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subiml-P3.40a . `t.` $)
    subiml2-P4 $p |- ( w_ga -> ( w_ps -> w_ch ) ) $=
        ( wff-imp subiml-P3.40a ndbief-P3.14 ndime-P3.6 ) ACGZBCGZDEKLDABCDFHIJ
    $.
$}

${
    subiml2-P4.RC.1 $e |- ( w_ph -> w_ch ) $.
    subiml2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subiml2-P4 . `t.` $)
    subiml2-P4.RC $p |- ( w_ps -> w_ch ) $=
        ( wff-imp wff-true ndtruei-P3.17 wff-bi subiml2-P4 ndtruee-P3.18 )
        BCFABCGACFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subimr2-P4.1 $e |- ( w_ga -> ( w_ch -> w_ph ) ) $.
    subimr2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subimr-P3.40b . `t.` $)
    subimr2-P4 $p |- ( w_ga -> ( w_ch -> w_ps ) ) $=
        ( wff-imp subimr-P3.40b ndbief-P3.14 ndime-P3.6 ) CAGZCBGZDEKLDABCDFHIJ
    $.
$}

${
    subimr2-P4.RC.1 $e |- ( w_ch -> w_ph ) $.
    subimr2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subimr2-P4 . `t.` $)
    subimr2-P4.RC $p |- ( w_ch -> w_ps ) $=
        ( wff-imp wff-true ndtruei-P3.17 wff-bi subimr2-P4 ndtruee-P3.18 )
        CBFABCGCAFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subimd2-P4.1 $e |- ( w_ga -> ( w_ph -> w_ch ) ) $.
    subimd2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subimd2-P4.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Alternate Form of ~subimd-P3.40c . `t.` $)
    subimd2-P4 $p |- ( w_ga -> ( w_ps -> w_th ) ) $=
        ( wff-imp subimd-P3.40c ndbief-P3.14 ndime-P3.6 )
        ACIZBDIZEFMNEABCDEGHJKL
    $.
$}

${
    subimd2-P4.RC.1 $e |- ( w_ph -> w_ch ) $.
    subimd2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.
    subimd2-P4.RC.3 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subimd2-P4 . `t.` $)
    subimd2-P4.RC $p |- ( w_ps -> w_th ) $=
        ( wff-imp wff-true ndtruei-P3.17 wff-bi subimd2-P4 ndtruee-P3.18 )
        BDHABCDIACHEJABKFJCDKGJLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbil2-P4.1 $e |- ( w_ga -> ( w_ph <-> w_ch ) ) $.
    subbil2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subbil-P3.41a . `t.` $)
    subbil2-P4 $p |- ( w_ga -> ( w_ps <-> w_ch ) ) $=
        ( wff-bi subbil-P3.41a ndbief-P3.14 ndime-P3.6 ) ACGZBCGZDEKLDABCDFHIJ
    $.
$}

${
    subbil2-P4.RC.1 $e |- ( w_ph <-> w_ch ) $.
    subbil2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subbil2-P4 . `t.` $)
    subbil2-P4.RC $p |- ( w_ps <-> w_ch ) $=
        ( wff-bi wff-true ndtruei-P3.17 subbil2-P4 ndtruee-P3.18 )
        BCFABCGACFDHABFEHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbir2-P4.1 $e |- ( w_ga -> ( w_ch <-> w_ph ) ) $.
    subbir2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    $( Alternate Form of ~subbir-P3.41b . `t.` $)
    subbir2-P4 $p |- ( w_ga -> ( w_ch <-> w_ps ) ) $=
        ( wff-bi subbir-P3.41b ndbief-P3.14 ndime-P3.6 ) CAGZCBGZDEKLDABCDFHIJ
    $.
$}

${
    subbir2-P4.RC.1 $e |- ( w_ch <-> w_ph ) $.
    subbir2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subbir2-P4 . `t.` $)
    subbir2-P4.RC $p |- ( w_ch <-> w_ps ) $=
        ( wff-bi wff-true ndtruei-P3.17 bitrns-P3.33c ndtruee-P3.18 )
        CBFCABGCAFDHABFEHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subbid2-P4.1 $e |- ( w_ga -> ( w_ph <-> w_ch ) ) $.
    subbid2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subbid2-P4.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Alternate Form of ~subbid-P3.41c . `t.` $)
    subbid2-P4 $p |- ( w_ga -> ( w_ps <-> w_th ) ) $=
        ( wff-bi subbid-P3.41c ndbief-P3.14 ndime-P3.6 )
        ACIZBDIZEFMNEABCDEGHJKL
    $.
$}

${
    subbid2-P4.RC.1 $e |- ( w_ph <-> w_ch ) $.
    subbid2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.
    subbid2-P4.RC.3 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subbid2-P4 . `t.` $)
    subbid2-P4.RC $p |- ( w_ps <-> w_th ) $=
        ( wff-bi wff-true ndtruei-P3.17 subbid2-P4 ndtruee-P3.18 )
        BDHABCDIACHEJABHFJCDHGJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandl2-P4.1 $e |- ( w_ga -> ( w_ph /\ w_ch ) ) $.
    subandl2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subandl-P3.42a . `t.` $)
    subandl2-P4 $p |- ( w_ga -> ( w_ps /\ w_ch ) ) $=
        ( wff-and subandl-P3.42a ndbief-P3.14 ndime-P3.6 )
        ACGZBCGZDEKLDABCDFHIJ
    $.
$}

${
    subandl2-P4.RC.1 $e |- ( w_ph /\ w_ch ) $.
    subandl2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subandl2-P4 . `t.` $)
    subandl2-P4.RC $p |- ( w_ps /\ w_ch ) $=
        ( wff-and wff-true ndtruei-P3.17 wff-bi subandl2-P4 ndtruee-P3.18 )
        BCFABCGACFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandr2-P4.1 $e |- ( w_ga -> ( w_ch /\ w_ph ) ) $.
    subandr2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~subandr-P3.42b . `t.` $)
    subandr2-P4 $p |- ( w_ga -> ( w_ch /\ w_ps ) ) $=
        ( wff-and subandr-P3.42b ndbief-P3.14 ndime-P3.6 )
        CAGZCBGZDEKLDABCDFHIJ
    $.
$}

${
    subandr2-P4.RC.1 $e |- ( w_ch /\ w_ph ) $.
    subandr2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subandr2-P4 . `t.` $)
    subandr2-P4.RC $p |- ( w_ch /\ w_ps ) $=
        ( wff-and wff-true ndtruei-P3.17 wff-bi subandr2-P4 ndtruee-P3.18 )
        CBFABCGCAFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subandd2-P4.1 $e |- ( w_ga -> ( w_ph /\ w_ch ) ) $.
    subandd2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subandd2-P4.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Alternate Form of ~subandd-P3.42c . `t.` $)
    subandd2-P4 $p |- ( w_ga -> ( w_ps /\ w_th ) ) $=
        ( wff-and subandd-P3.42c ndbief-P3.14 ndime-P3.6 )
        ACIZBDIZEFMNEABCDEGHJKL
    $.
$}

${
    subandd2-P4.RC.1 $e |- ( w_ph /\ w_ch ) $.
    subandd2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.
    subandd2-P4.RC.3 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subandd2-P4 . `t.` $)
    subandd2-P4.RC $p |- ( w_ps /\ w_th ) $=
        ( wff-and wff-true ndtruei-P3.17 wff-bi subandd2-P4 ndtruee-P3.18 )
        BDHABCDIACHEJABKFJCDKGJLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suborl2-P4.1 $e |- ( w_ga -> ( w_ph \/ w_ch ) ) $.
    suborl2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~suborl-P3.43a . `t.` $)
    suborl2-P4 $p |- ( w_ga -> ( w_ps \/ w_ch ) ) $=
        ( wff-or suborl-P3.43a ndbief-P3.14 ndime-P3.6 ) ACGZBCGZDEKLDABCDFHIJ
    $.
$}

${
    suborl2-P4.RC.1 $e |- ( w_ph \/ w_ch ) $.
    suborl2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suborl2-P4 . `t.` $)
    suborl2-P4.RC $p |- ( w_ps \/ w_ch ) $=
        ( wff-or wff-true ndtruei-P3.17 wff-bi suborl2-P4 ndtruee-P3.18 )
        BCFABCGACFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suborr2-P4.1 $e |- ( w_ga -> ( w_ch \/ w_ph ) ) $.
    suborr2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Alternate Form of ~suborr-P3.43b . `t.` $)
    suborr2-P4 $p |- ( w_ga -> ( w_ch \/ w_ps ) ) $=
        ( wff-or suborr-P3.43b ndbief-P3.14 ndime-P3.6 ) CAGZCBGZDEKLDABCDFHIJ
    $.
$}

${
    suborr2-P4.RC.1 $e |- ( w_ch \/ w_ph ) $.
    suborr2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suborr2-P4 . `t.` $)
    suborr2-P4.RC $p |- ( w_ch \/ w_ps ) $=
        ( wff-or wff-true ndtruei-P3.17 wff-bi suborr2-P4 ndtruee-P3.18 )
        CBFABCGCAFDHABIEHJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subord2-P4.1 $e |- ( w_ga -> ( w_ph \/ w_ch ) ) $.
    subord2-P4.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.
    subord2-P4.3 $e |- ( w_ga -> ( w_ch <-> w_th ) ) $.

    $( Alternate Form of ~subord-P3.43c . `t.` $)
    subord2-P4 $p |- ( w_ga -> ( w_ps \/ w_th ) ) $=
        ( wff-or subord-P3.43c ndbief-P3.14 ndime-P3.6 )
        ACIZBDIZEFMNEABCDEGHJKL
    $.
$}

${
    subord2-P4.RC.1 $e |- ( w_ph \/ w_ch ) $.
    subord2-P4.RC.2 $e |- ( w_ph <-> w_ps ) $.
    subord2-P4.RC.3 $e |- ( w_ch <-> w_th ) $.

    $( Inference Form of ~subord2-P4 . `t.` $)
    subord2-P4.RC $p |- ( w_ps \/ w_th ) $=
        ( wff-or wff-true ndtruei-P3.17 wff-bi subord2-P4 ndtruee-P3.18 )
        BDHABCDIACHEJABKFJCDKGJLM
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Convenient Forms for Commutivity Laws. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    andcomm2-P4.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.

    $( Alternate Form of ~andcomm-P3.35 . `t.` $)
    andcomm2-P4 $p |- ( w_ga -> ( w_ps /\ w_ph ) ) $=
        ( wff-and wff-bi andcomm-P3.35 rcp-NDIMP0addall bimpf-P4 )
        ABEZBAEZCDJKFCABGHI
    $.
$}

${
    andcomm2-P4.RC.1 $e |- ( w_ph /\ w_ps ) $.

    $( Inference Form of ~andcomm2-P4 . `t.` $)
    andcomm2-P4.RC $p |- ( w_ps /\ w_ph ) $=
        ( wff-and wff-true ndtruei-P3.17 andcomm2-P4 ndtruee-P3.18 )
        BADABEABDCFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    orcomm2-P4.1 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.

    $( Alternate Form of ~orcomm-P3.37 . `t.` $)
    orcomm2-P4 $p |- ( w_ga -> ( w_ps \/ w_ph ) ) $=
        ( wff-or wff-bi orcomm-P3.37 rcp-NDIMP0addall bimpf-P4 )
        ABEZBAEZCDJKFCABGHI
    $.
$}

${
    orcomm2-P4.RC.1 $e |- ( w_ph \/ w_ps ) $.

    $( Inference Form of ~orcomm2-P4 . `t.` $)
    orcomm2-P4.RC $p |- ( w_ps \/ w_ph ) $=
        ( wff-or wff-true ndtruei-P3.17 orcomm2-P4 ndtruee-P3.18 )
        BADABEABDCFGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Convenient Forms for Associativity Laws. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    andassoc2a-P4.1 $e |- ( w_ga -> ( ( w_ph /\ w_ps ) /\ w_ch ) ) $.

    $( Alternate Form A of ~andassoc-P3.36 . `t.` $)
    andassoc2a-P4 $p |- ( w_ga -> ( w_ph /\ ( w_ps /\ w_ch ) ) ) $=
        ( wff-and andassoc-P3.36 subimr2-P4.RC ) ABFCFABCFFDEABCGH
    $.
$}

${
    andassoc2a-P4.RC.1 $e |- ( ( w_ph /\ w_ps ) /\ w_ch ) $.

    $( Inference Form of ~andassoc2a-P4 . `t.` $)
    andassoc2a-P4.RC $p |- ( w_ph /\ ( w_ps /\ w_ch ) ) $=
        ( wff-and wff-true ndtruei-P3.17 andassoc2a-P4 ndtruee-P3.18 )
        ABCEEABCFABECEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    andassoc2b-P4.1 $e |- ( w_ga -> ( w_ph /\ ( w_ps /\ w_ch ) ) ) $.

    $( Alternate Form B of ~andassoc-P3.36 . `t.` $)
    andassoc2b-P4 $p |- ( w_ga -> ( ( w_ph /\ w_ps ) /\ w_ch ) ) $=
        ( wff-and andassoc-P3.36 bisym-P3.33b.RC subimr2-P4.RC )
        ABCFFZABFCFZDEKJABCGHI
    $.
$}

${
    andassoc2b-P4.RC.1 $e |- ( w_ph /\ ( w_ps /\ w_ch ) ) $.

    $( Inference Form of ~andassoc2b-P4 . `t.` $)
    andassoc2b-P4.RC $p |- ( ( w_ph /\ w_ps ) /\ w_ch ) $=
        ( wff-and wff-true ndtruei-P3.17 andassoc2b-P4 ndtruee-P3.18 )
        ABECEABCFABCEEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    orassoc2a-P4.1 $e |- ( w_ga -> ( ( w_ph \/ w_ps ) \/ w_ch ) ) $.

    $( Alternate Form A of ~orassoc-P3.38 . `t.` $)
    orassoc2a-P4 $p |- ( w_ga -> ( w_ph \/ ( w_ps \/ w_ch ) ) ) $=
        ( wff-or orassoc-P3.38 subimr2-P4.RC )
        ABFCFABCFFDEABCGH
    $.
$}

${
    orassoc2a-P4.RC.1 $e |- ( ( w_ph \/ w_ps ) \/ w_ch ) $.

    $( Inference Form of ~orassoc2a-P4 . `t.` $)
    orassoc2a-P4.RC $p |- ( w_ph \/ ( w_ps \/ w_ch ) ) $=
        ( wff-or wff-true ndtruei-P3.17 orassoc2a-P4 ndtruee-P3.18 )
        ABCEEABCFABECEDGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    orassoc2b-P4.1 $e |- ( w_ga -> ( w_ph \/ ( w_ps \/ w_ch ) ) ) $.

    $( Alternate Form B of ~orassoc-P3.38 . `t.` $)
    orassoc2b-P4 $p |- ( w_ga -> ( ( w_ph \/ w_ps ) \/ w_ch ) ) $=
        ( wff-or orassoc-P3.38 bisym-P3.33b.RC subimr2-P4.RC )
        ABCFFZABFCFZDEKJABCGHI
    $.
$}

${
    orassoc2b-P4.RC.1 $e |- ( w_ph \/ ( w_ps \/ w_ch ) ) $.

    $( Inference Form of ~orassoc2b-P4 . `t.` $)
    orassoc2b-P4.RC $p |- ( ( w_ph \/ w_ps ) \/ w_ch ) $=
        ( wff-or wff-true ndtruei-P3.17 orassoc2b-P4 ndtruee-P3.18 )
        ABECEABCFABCEEDGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Convenient Forms for Joining Implications. 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    joinimandinc2-P4.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    joinimandinc2-P4.2 $e |- ( w_ga -> ( w_ch -> w_th ) ) $.

    $( Alternate form of ~joinimandinc-P4.8a . `t.` $)
    joinimandinc2-P4 $p
        |- ( w_ga -> ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_th ) ) )
    $=
        ( wff-imp ndandi-P3.7 joinimandinc-P4.8a ) ABCDEABHCDHEFGIJ
    $.
$}

${
    joinimandinc2-P4.RC.1 $e |- ( w_ph -> w_ps ) $.
    joinimandinc2-P4.RC.2 $e |- ( w_ch -> w_th ) $.

    $( Inference Form of ~joinimandinc2-P4 . `t.` $)
    joinimandinc2-P4.RC $p |- ( ( w_ph \/ w_ch ) -> ( w_ps \/ w_th ) ) $=
        ( wff-or wff-imp wff-true ndtruei-P3.17 joinimandinc2-P4
          ndtruee-P3.18 )
        ACGBDGHABCDIABHEJCDHFJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimandinc3-P4.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    joinimandinc3-P4.2 $e |- ( w_ga -> ( w_ch -> w_ps ) ) $.

    $( Alternate form of ~joinimandinc-P4.8a . `t.` $)
    joinimandinc3-P4 $p |- ( w_ga -> ( ( w_ph \/ w_ch ) -> w_ps ) ) $=
        ( wff-or wff-imp ndandi-P3.7 joinimandinc-P4.8a wff-bi
          idempotor-P4.25b rcp-NDIMP0addall subimr2-P4 )
        BBGZBACGDABCBDABHCBHDEFIJOBKDBLMN
    $.
$}

${
    joinimandinc3-P4.RC.1 $e |- ( w_ph -> w_ps ) $.
    joinimandinc3-P4.RC.2 $e |- ( w_ch -> w_ps ) $.

    $( Inference Form of ~joinimandinc3-P4 . `t.` $)
    joinimandinc3-P4.RC $p |- ( ( w_ph \/ w_ch ) -> w_ps ) $=
        ( wff-or wff-imp wff-true ndtruei-P3.17 joinimandinc3-P4
          ndtruee-P3.18 )
        ACFBGABCHABGDICBGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimandres2-P4.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    joinimandres2-P4.2 $e |- ( w_ga -> ( w_ch -> w_th ) ) $.

    $( Alternate form of ~joinimandres-P4.8b . `t.` $)
    joinimandres2-P4 $p
        |- ( w_ga -> ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_th ) ) )
    $=
        ( wff-imp ndandi-P3.7 joinimandres-P4.8b ) ABCDEABHCDHEFGIJ
    $.
$}

${
    joinimandres2-P4.RC.1 $e |- ( w_ph -> w_ps ) $.
    joinimandres2-P4.RC.2 $e |- ( w_ch -> w_th ) $.

    $( Inference Form of ~joinimandres2-P4 . `t.` $)
    joinimandres2-P4.RC $p |- ( ( w_ph /\ w_ch ) -> ( w_ps /\ w_th ) ) $=
        ( wff-and wff-imp wff-true ndtruei-P3.17 joinimandres2-P4
          ndtruee-P3.18 )
        ACGBDGHABCDIABHEJCDHFJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimandres3-P4.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    joinimandres3-P4.2 $e |- ( w_ga -> ( w_ph -> w_ch ) ) $.

    $( Alternate form of ~joinimandres-P4.8b . `t.` $)
    joinimandres3-P4 $p |- ( w_ga -> ( w_ph -> ( w_ps /\ w_ch ) ) ) $=
        ( wff-and wff-imp ndandi-P3.7 joinimandres-P4.8b wff-bi
          idempotand-P4.25a rcp-NDIMP0addall subiml2-P4 )
        AAGZABCGDABACDABHACHDEFIJOAKDALMN
    $.
$}

${
    joinimandres3-P4.RC.1 $e |- ( w_ph -> w_ps ) $.
    joinimandres3-P4.RC.2 $e |- ( w_ph -> w_ch ) $.

    $( Inference Form of ~joinimandres3-P4 . `t.` $)
    joinimandres3-P4.RC $p |- ( w_ph -> ( w_ps /\ w_ch ) ) $=
        ( wff-and wff-imp wff-true ndtruei-P3.17 joinimandres3-P4
          ndtruee-P3.18 )
        ABCFGABCHABGDIACGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimor2-P4.1 $e
        |- ( w_ga -> ( ( w_ph -> w_ps ) \/ ( w_ch -> w_ps ) ) )
    $.

    $( Alternate form of ~joinimor-P4.8c . `t.` $)
    joinimor2-P4 $p |- ( w_ga -> ( ( w_ph /\ w_ch ) -> w_ps ) ) $=
        ( wff-or wff-and joinimor-P4.8c wff-bi idempotor-P4.25b
          rcp-NDIMP0addall subimr2-P4 )
        BBFZBACGDABCBDEHMBIDBJKL
    $.
$}

${
    joinimor2-P4.RC.1 $e |- ( ( w_ph -> w_ps ) \/ ( w_ch -> w_ps ) ) $.

    $( Inference Form of ~joinimor2-P4 . `t.` $)
    joinimor2-P4.RC $p |- ( ( w_ph /\ w_ch ) -> w_ps ) $=
        ( wff-and wff-imp wff-true wff-or ndtruei-P3.17 joinimor2-P4
          ndtruee-P3.18 )
        ACEBFABCGABFCBFHDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    joinimor3-P4.1 $e
        |- ( w_ga -> ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) )
    $.

    $( Alternate form of ~joinimor-P4.8c . `t.` $)
    joinimor3-P4 $p |- ( w_ga -> ( w_ph -> ( w_ps \/ w_ch ) ) ) $=
        ( wff-and wff-or joinimor-P4.8c wff-bi idempotand-P4.25a
          rcp-NDIMP0addall subiml2-P4 )
        AAFZABCGDABACDEHMAIDAJKL
    $.
$}

${
    joinimor3-P4.RC.1 $e |- ( ( w_ph -> w_ps ) \/ ( w_ph -> w_ch ) ) $.

    $( Inference Form of ~joinimor3-P4 . `t.` $)
    joinimor3-P4.RC $p |- ( w_ph -> ( w_ps \/ w_ch ) ) $=
        ( wff-or wff-imp wff-true ndtruei-P3.17 joinimor3-P4 ndtruee-P3.18 )
        ABCEFABCGABFACFEDHIJ
    $.
$}
$( End $[ bfol-ch4.mm $] $)
$( Begin $[ bfol-ch5.mm $] $)

$(
##############################################################################
  Chapter 5: Predicate Calculus (FOL Axioms)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Consequences of ax-GEN and ax-L4.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  The Universal Quantifier.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alloverim-P5.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.

    $( '`A. x`' Distributes Over '`->`'.

       This is the deductive form of ~ax-L4 . $)
    alloverim-P5 $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $= 
        ( wff-imp wff-forall ax-L4 rcp-NDIMP0addall ndime-P3.6 )
        ABFDGZADGBDGFZCEKLFCABDHIJ
    $.
$}

${
    alloverim-P5.RC.1 $e |- A. x ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverim-P5 . $)
    alloverim-P5.RC $p |- ( A. x w_ph -> A. x w_ps ) $= 
        ( wff-forall wff-imp wff-true ndtruei-P3.17 alloverim-P5
          ndtruee-P3.18 )
        ACEBCEFABGCABFCEDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dalloverim-P5.1 $e |- ( w_ga -> A. x ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Double '`A. x`' Distribution Over '`->`'. $)
    dalloverim-P5 $p
        |- ( w_ga -> ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) )
    $=
        ( wff-forall wff-imp wff-and alloverim-P5 rcp-IMPIME1 rcp-NDIMI2 )
        BEGCEGHDAEGZBCDMIEMBCHZEGDANDEFJKJL
    $.
$}

${
    dalloverim-P5.RC.1 $e |- A. x ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverim-P5 . $)
    dalloverim-P5.RC $p |- ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) $=
        ( wff-forall wff-imp wff-true ndtruei-P3.17 dalloverim-P5
          ndtruee-P3.18 )
        ADFBDFCDFGGABCHDABCGGDFEIJK
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Generalization Augmentation.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    alloverim-P5.RC.GEN.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverim-P5 with Generalization.

       For the deductive form with a variable restriction see
       ~alloverim-P5.GENV .  For the most general form, see
       ~alloverim-P5.GENF . $)
    alloverim-P5.RC.GEN $p |- ( A. x w_ph -> A. x w_ps ) $=
        ( wff-imp ax-GEN alloverim-P5.RC ) ABCABECDFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dalloverim-P5.RC.GEN.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverim-P5 with generalization. $)
    dalloverim-P5.RC.GEN $p |- ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) $=
        ( wff-imp ax-GEN dalloverim-P5.RC ) ABCDABCFFDEGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  A Substitution Theorem for Universal Quantification.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    suballinf-P5.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Version of '`A. x`' Substitution Theorem.

       For the deductive form with a variable restriction, see ~suballv-P5 .
       For the most general form, see ~suball-P6 . $)
    suballinf-P5 $p |- ( A. x w_ph <-> A. x w_ps ) $=
        ( wff-forall wff-imp rcp-NDBIEF0 ax-GEN alloverim-P5.RC rcp-NDBIER0
          rcp-NDBII0 )
        ACEBCEABCABFCABDGHIBACBAFCABDJHIK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  The Existential Quantifier.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the existential quantifier '`E.`'. $)
    wff-exists $a wff E. x w_ph $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of Existential Quantifier, '`E.`'.  Read as 
       "there exists". $)
    df-exists-D5.1 $a |- ( E. x w_ph <-> -. A. x -. w_ph ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Dual Properties of Universal / Existential Quantification.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( "For all not" is Equivalent to "Does not exist". 

       Dual of ~exnegall-P5 . $)

    allnegex-P5 $p |- ( A. x -. w_ph <-> -. E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall df-exists-D5.1 subneg-P3.39.RC
          dnegeq-P4.10 bitrns-P3.33c.RC bisym-P3.33b.RC )
        ABCZDZADBEZLMDZDMKNABFGMHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "Exists a negative" is Equivalent to "Not for all".

       Dual of ~allnegex-P5 . $)
    exnegall-P5 $p |- ( E. x -. w_ph <-> -. A. x w_ph ) $=
        ( wff-neg wff-exists wff-forall df-exists-D5.1 dnegeq-P4.10
          suballinf-P5 subneg-P3.39.RC bitrns-P3.33c.RC )
        ACZBDKCZBEZCABEZCKBFMNLABAGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Universal Quantification in Terms of Existential Quantification. 

       Dual of ~df-exists-D5.1 . $)
    allasex-P5 $p |- ( A. x w_ph <-> -. E. x -. w_ph ) $=
        ( wff-neg wff-exists wff-forall exnegall-P5 subneg-P3.39.RC
          dnegeq-P4.10 bitrns-P3.33c.RC bisym-P3.33b.RC )
        ACBDZCZABEZLMCZCMKNABFGMHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Transpositional Quantifier Equivalence Lemma. $)
    lemma-L5.01a $p
        |- ( ( E. x w_ph -> w_ph ) <-> ( -. w_ph -> A. x -. w_ph ) )
    $=
        ( wff-exists wff-imp wff-neg wff-forall df-exists-D5.1
          subiml-P3.40a.RC trnspeq-P4b bitrns-P3.33c.RC )
        ABCZADAEZBFZEZADLMDKNAABGHMAIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Quantifier Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alloverimex-P5.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.

    $( Alternate version of ~alloverim-P5 that produces existential
       quantifiers. $)
    alloverimex-P5 $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-exists wff-neg wff-forall wff-imp wff-bi trnspeq-P4c
          suballinf-P5 rcp-NDIMP0addall bimpf-P4 alloverim-P5 allnegex-P5
          subimd2-P4 trnsp-P3.31d )
        BDFZADFZCBGZDHZSGZAGZDHZTGZCUAUDCDABIZDHZUAUDIZDHZCEUHUJJCUGUIDABKLMNO
        UBUCJCBDPMUEUFJCADPMQR
    $.
$}

${
    alloverimex-P5.RC.1 $e |- A. x ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverimex-P5 . $)
    alloverimex-P5.RC $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( wff-exists wff-imp wff-true wff-forall ndtruei-P3.17 alloverimex-P5
          ndtruee-P3.18 )
        ACEBCEFABGCABFCHDIJK
    $.
$}

${
    alloverimex-P5.RC.GEN.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverimex-P5 with Generalization. 

       For the deductive form with a variable restriction, see
       ~alloverimex-P5.GENV .  For the most general form see
       ~alloverimex-P5.GENF . $)
    alloverimex-P5.RC.GEN $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( wff-imp ax-GEN alloverimex-P5.RC ) ABCABECDFG
    $.
$}

${
    $( Closed Form of ~alloverimex-P5 . $)
    alloverimex-P5.CL $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> E. x w_ps ) )
    $=
        ( wff-imp wff-forall rcp-NDASM1of1 alloverimex-P5 ) ABABDCEZCHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dalloverimex-P5.1 $e |- ( w_ga -> A. x ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Alternate version of ~dalloverim-P5 that produces existential
       quantifiers. $)
    dalloverimex-P5 $p
        |- ( w_ga -> ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) )
    $=
        ( wff-exists wff-imp wff-forall wff-and alloverim-P5 import-P3.34a.RC
          alloverimex-P5 rcp-NDIMI2 )
        BEGCEGHDAEIZBCDOJEDOBCHZEIAPDEFKLMN
    $.
$}

${
    dalloverimex-P5.RC.1 $e |- A. x ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverimex-P5 . $)
    dalloverimex-P5.RC $p |- ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) $=
        ( wff-forall wff-exists wff-imp wff-true ndtruei-P3.17 dalloverimex-P5
          ndtruee-P3.18 )
        ADFBDGCDGHHABCIDABCHHDFEJKL
    $.
$}

${
    dalloverimex-P5.RC.GEN.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverimex-P5 with Generalization. $)
    dalloverimex-P5.RC.GEN $p
        |- ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) )
    $=
        ( wff-imp ax-GEN dalloverimex-P5.RC ) ABCDABCFFDEGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  A Substitution Theorem for Existential Quantification.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    subexinf-P5.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Version of '`E. x`' Substitution Theorem.

       For the deductive form with a variable restriction see ~subexv-P5 .
       For the most general form see ~subex-P6 . $)
    subexinf-P5 $p |- ( E. x w_ph <-> E. x w_ps ) $=
        ( wff-exists rcp-NDBIEF0 alloverimex-P5.RC.GEN rcp-NDBIER0
          rcp-NDBII0 )
        ACEBCEABCABDFGBACABDHGI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantified Implication Equivalence Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Partial Quantified Implication Equivalence Law ( ( E `->` U ) `->` U ).
     
       The reverse implication is only true when '`x`' either does not occur
       in '`w_ph`' ( ~qimeqallav-P5 ) or '`w_ps`' ( ~qimeqallbv-P5 ), or does
       not occur free in '`w_ph`' ( ~qimeqalla-P6 ) or '`w_ps`'
       ( ~qimeqallb-P6 ). $)
    qimeqallhalf-P5 $p
        |- ( ( E. x w_ph -> A. x w_ps ) -> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-neg wff-forall wff-or wff-imp impoe-P4.4a.CL
          alloverim-P5.RC.GEN allnegex-P5 subiml2-P4.RC axL1-P3.21.CL
          joinimandinc3-P4.RC imasor-P4.32a bisym-P3.33b.RC )
        ACDZEZBCFZGZQSHZABHZCFZRUCSAEZCFRUCUDUBCABIJACKLBUBCBAMJNUATQSOPL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~qimeqex-P5 . $)
    qimeqex-P5-L1 $p
        |- ( ( A. x w_ph -> E. x w_ps ) -> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-neg wff-exists wff-or wff-imp impoe-P4.4a.CL
          alloverimex-P5.RC.GEN exnegall-P5 subiml2-P4.RC axL1-P3.21.CL
          joinimandinc3-P4.RC imasor-P4.32a bisym-P3.33b.RC )
        ACDZEZBCFZGZQSHZABHZCFZRUCSAEZCFRUCUDUBCABIJACKLBUBCBAMJNUATQSOPL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~qimeqex-P5 . $)
    qimeqex-P5-L2 $p
        |- ( E. x ( w_ph -> w_ps ) -> ( A. x w_ph -> E. x w_ps ) )
    $=
        ( wff-forall wff-imp wff-exists ndime-P3.6.CL rcp-NDIMI2
          dalloverimex-P5.RC.GEN imcomm-P3.27.RC )
        ACDABEZCFBCFAKBCBAKABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Quantified Implication Equivalence Law ( ( U `->` E ) `<->` E ). $)
    qimeqex-P5 $p
        |- ( ( A. x w_ph -> E. x w_ps ) <-> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-exists wff-imp qimeqex-P5-L1 qimeqex-P5-L2
          rcp-NDBII0 )
        ACDBCEFABFCEABCGABCHI
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Consequences of ax-L5.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

${
    $d w_ph x $.
    $( Dual of ~ax-L5 . 

       '`x`' does not occur in '`w_ph`'. $)
    axL5ex-P5 $p |- ( E. x w_ph -> w_ph ) $=
        ( wff-exists wff-imp wff-neg wff-forall ax-L5 lemma-L5.01a
          bimpr-P4.RC )
        ABCADAEZJBFDJBGABHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    allicv-P5.1 $e |- ( w_ph -> w_ps ) $.

    $( Introduction of Universal Quantifier as Consequent. (variable
       restriction).

       '`x`' may occur in '`w_ps`' but not '`w_ph`'. 

       This is a weak version of the '`A.`' intruduction rule in the natural
       deduction system. The version with a non-freeness condition is
       ~allic-P6 . $)
    allicv-P5 $p |- ( w_ph -> A. x w_ps ) $=
        ( wff-forall ax-L5 alloverim-P5.RC.GEN syl-P3.24.RC )
        AACEBCEACFABCDGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.

    exiav-P5.1 $e |- ( w_ph -> w_ps ) $.

    $( Introduction of Existential Quantifier as Antecedent (variable 
       restriction).  
        
       '`x`' may occur in '`w_ph`', but not '`w_ps`'.

       This is a weaker version of the '`E.`' elimination rule in the natural
       deduction system.  The version with a non-freeness condition is
       ~exia-P6 . $)
    exiav-P5 $p |- ( E. x w_ph -> w_ps ) $=
        ( wff-exists alloverimex-P5.RC.GEN axL5ex-P5 syl-P3.24.RC )
        ACEBCEBABCDFBCGH
    $.
$}

${
    $d w_ps x $.

    exiav-P5.SH.1 $e |- ( w_ph -> w_ps ) $.
    exiav-P5.SH.2 $e |- E. x w_ph $.

    $( Inference Form of ~exiav-P5 . $)
    exiav-P5.SH $p |- w_ps $=
        ( wff-exists exiav-P5 rcp-NDIME0 ) ACFBEABCDGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    $( Lemma for ~qimeqallav-P5 . $)
    qimeqallav-P5-L1 $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp axL5ex-P5 rcp-NDIMP0addall ax-L5 ax-L4
          dsyl-P3.25 )
        ACDZAACEZBCEABFCEZLAFNACGHAMFNACIHABCJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    $( First Bi-directional Form of ~qimeqallhalf-P5 ( ( E `->` U ) `<->` U )
       (variable restriction a).

       Holds when '`x`' does not occur in '`w_ph`'.  The most general version
       is ~qimeqalla-P6 . $)
    qimeqallav-P5 $p
        |- ( ( E. x w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallhalf-P5 qimeqallav-P5-L1
          rcp-NDBII0 )
        ACDBCEFABFCEABCGABCHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.

    $( Lemma for ~qimeqallbv-P5 . $)
    qimeqallbv-P5-L1 $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp rcp-NDASM1of1 dalloverimex-P5.RC.GEN
          axL5ex-P5 rcp-NDIMP0addall ax-L5 dsyl-P3.25 )
        ACDBCDZBBCEZABFZCEZOABCOGHMBFPBCIJBNFPBCKJL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.

    $( Second Bi-directional Form of ~qimeqallhalf-P5 ( ( E `->` U ) `<->` U )
       (variable restriction b).

       Holds when '`x`' does not occur in '`w_ps`'.  The most general version
       is ~qimeqallb-P6 . $)
    qimeqallbv-P5 $p
        |- ( ( E. x w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallhalf-P5 qimeqallbv-P5-L1
          rcp-NDBII0 )
        ACDBCEFABFCEABCGABCHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Generalization Augmentation with Context.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ga x $.

    alloverim-P5.GENV.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverim-P5 with Generalization (variable restriction).  The most
       general form is ~alloverim-P5.GENF . $)
    alloverim-P5.GENV $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp allicv-P5 alloverim-P5 ) ABCDCABFDEGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x $.

    alloverimex-P5.GENV.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverimex-P5 with Generalization (variable restriction).  The most
       general form is ~alloverimex-P5.GENF . $)
    alloverimex-P5.GENV $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-imp allicv-P5 alloverimex-P5 ) ABCDCABFDEGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Theorems for Quantifiers.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ga x $.

    suballv-P5.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`A. x`' (variable restriction).  The most
       general form is ~suball-P6 . $)
    suballv-P5 $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( wff-forall ndbief-P3.14 alloverim-P5.GENV ndbier-P3.15 ndbii-P3.13 )
        ADFBDFCABCDABCEGHBACDABCEIHJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x $.

    subexv-P5.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`E. x`' (variable restriction).  The most
       general form is ~subex-P6 . $)
    subexv-P5 $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( wff-exists ndbief-P3.14 alloverimex-P5.GENV ndbier-P3.15 ndbii-P3.13 )
        ADFBDFCABCDABCEGHBACDABCEIHJ
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Consequences of Axioms Involving Equality ( ax-L6 - ax-L9 ).
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

${
    $d t_t x $.

    $( Existential Form of ~ax-L6 . $)
    axL6ex-P5 $p |- E. x x = t_t $=
        ( term-obj wff-equals wff-exists wff-neg wff-forall ax-L6
          df-exists-D5.1 bimpr-P4.RC )
        BCADZBEKFBGFABHKBIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Equivalence Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Show that '`=`' is an equivalence relation.
$)

${
    $d t_t x $.

    $( Equivalence Property: '`=`' Reflexivity. $)
    eqref-P5 $p |- t_t = t_t $=
        ( objvar-x term-obj wff-equals ax-L7 rae-P3.26.RC axL6ex-P5
          exiav-P5.SH )
        BCZADZAADZBJKIAAEFABGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    eqsym-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Equivalence Property: '`=`' symmetry. $)
    eqsym-P5 $p |- ( w_ga -> t_u = t_t ) $=
        ( wff-equals wff-imp ax-L7 rcp-NDIMP0addall eqref-P5 mae-P3.23
          ndime-P3.6 )
        BCEZCBEZADLBBEZMALNMFFABCBGHNABIHJK
    $.
$}

${
    $(  Closed Form of ~eqsym-P5 .  $)
    eqsym-P5.CL $p |- ( t_t = t_u -> t_u = t_t ) $=
        ( wff-equals rcp-NDASM1of1 eqsym-P5 ) ABCZABFDE
    $.
$}

${
    $( Closed Symmetric Form of ~eqsym-P5 . $)
    eqsym-P5.CL.SYM $p |- ( t_t = t_u <-> t_u = t_t ) $=
        ( wff-equals eqsym-P5.CL rcp-NDBII0 ) ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    eqtrns-P5.1 $e |- ( w_ga -> t_t = t_u ) $.
    eqtrns-P5.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Equivalence Property: '`=`' Transitivity. $)
    eqtrns-P5 $p |- ( w_ga -> t_t = t_w ) $=
        ( wff-equals wff-imp ax-L7 eqsym-P5.CL.SYM subiml2-P4.RC
          rcp-NDIMP0addall ndime-P3.6 )
        CDGZBDGZAFBCGZNOHZAEPQHACBGPQCBDICBJKLMM
    $.
$}

${
    $( Closed Form of ~eqtrns-P5 . $)
    eqtrns-P5.CL $p |- ( ( t_t = t_u /\ t_u = t_w ) -> t_t = t_w ) $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 eqtrns-P5 )
        ABDZBCDZEABCIJFIJGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Substitution Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Substitution Theorems for Equality.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    subeql-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Left Substitution Theorem for '`=`' . $)
    subeql-P5 $p |- ( w_ga -> ( t_t = t_w <-> t_u = t_w ) ) $=
        ( wff-equals wff-imp ax-L7 rcp-NDIMP0addall ndime-P3.6 eqsym-P5
          ndbii-P3.13 )
        BDFZCDFZABCFZMNGZAEOPGABCDHIJCBFZNMGZAABCEKQRGACBDHIJL
    $.
$}

${
    $( Closed Form of ~subeql-P5 . $)
    subeql-P5.CL $p |- ( t_t = t_u -> ( t_t = t_w <-> t_u = t_w ) ) $=
        ( wff-equals rcp-NDASM1of1 subeql-P5 ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~subeqr-P5 . $)
    subeqr-P5-L1 $p |- ( t_t = t_u -> ( t_w = t_t -> t_w = t_u ) ) $=
        ( wff-equals wff-imp ax-L7 eqsym-P5.CL.SYM subimd-P3.40c.RC
          subimr2-P4.RC )
        ACDZBCDZECADZCBDZEABDABCFJLKMACGBCGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subeqr-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Right Substitution Theorem for '`=`' . $)
    subeqr-P5 $p |- ( w_ga -> ( t_w = t_t <-> t_w = t_u ) ) $=
        ( wff-equals wff-bi subeqr-P5-L1 wff-imp eqsym-P5.CL.SYM subiml2-P4.RC
          ndbii-P3.13 syl-P3.24.RC )
        ABCFZDBFZDCFZGEOPNBCDHCBFNPOICBDHCBJKLM
    $.
$}

${
    $( Closed Form of ~subeqr-P5 . $)
    subeqr-P5.CL $p |- ( t_t = t_u -> ( t_w = t_t <-> t_w = t_u ) ) $=
        ( wff-equals rcp-NDASM1of1 subeqr-P5 ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subeqd-P5.1 $e |- ( w_ga -> t_s = t_t ) $.
    subeqd-P5.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Dual Substitution Theorem for '`=`'. $)
    subeqd-P5 $p |- ( w_ga -> ( t_s = t_u <-> t_t = t_w ) ) $=
        ( wff-equals subeql-P5 subeqr-P5 bitrns-P3.33c )
        BDHCDHCEHAABCDFIADECGJK
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Substitution Theorems for Primitive Predicate.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    subelofl-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Left Substitution for '`e.`'. $)
    subelofl-P5 $p |- ( w_ga -> ( t_t e. t_w <-> t_u e. t_w ) ) $=
        ( wff-equals wff-elemof wff-bi ax-L8-inl wff-imp eqsym-P5.CL.SYM
          subiml2-P4.RC ndbii-P3.13 syl-P3.24.RC )
        ABCFZBDGZCDGZHEPQOBCDICBFOQPJCBDICBKLMN
    $.
$}

${
    $( Closed Form of ~subelofl-P5.CL $)
    subelofl-P5.CL $p |- ( t_t = t_u -> ( t_t e. t_w <-> t_u e. t_w ) ) $=
        ( wff-equals rcp-NDASM1of1 subelofl-P5 ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subelofr-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Right Substitution for '`e.`'. $)
    subelofr-P5 $p |- ( w_ga -> ( t_w e. t_t <-> t_w e. t_u ) ) $=
        ( wff-equals wff-elemof wff-bi ax-L8-inr wff-imp eqsym-P5.CL.SYM
          subiml2-P4.RC ndbii-P3.13 syl-P3.24.RC )
        ABCFZDBGZDCGZHEPQOBCDICBFOQPJCBDICBKLMN
    $.
$}

${
    $( Closed Form of ~subelofr-P5.CL $)
    subelofr-P5.CL $p |- ( t_t = t_u -> ( t_w e. t_t <-> t_w e. t_u ) ) $=
        ( wff-equals rcp-NDASM1of1 subelofr-P5 ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subelofd-P5.1 $e |- ( w_ga -> t_s = t_t ) $.
    subelofd-P5.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Dual Substitution for '`e.`'. $)
    subelofd-P5 $p |- ( w_ga -> ( t_s e. t_u <-> t_t e. t_w ) ) $=
        ( wff-elemof subelofl-P5 subelofr-P5 bitrns-P3.33c )
        BDHCDHCEHAABCDFIADECGJK
    $.
$}

${
    $( Closed Form of ~subelofd-P5 . $)
    subelofd-P5.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s e. t_u <-> t_t e. t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 subelofd-P5 )
        ABEZCDEZFABCDJKGJKHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Substitution Theorems for Functions.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

$( ------------------------------------------------------------------------- $)

${
    subsucc-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Substitution Theorem for 's&lsquo;'. $)
    subsucc-P5 $p |- ( w_ga -> s` t_t = s` t_u ) $=
        ( wff-equals term_succ ax-L9-succ syl-P3.24.RC ) ABCEBFCFEDBCGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subaddl-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Left Substitution Theorem for '`+`'. $)
    subaddl-P5 $p |- ( w_ga -> ( t_t + t_w ) = ( t_u + t_w ) ) $=
        ( wff-equals term-add ax-L9-addl syl-P3.24.RC ) ABCFBDGCDGFEBCDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subaddr-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Right Substitution Theorem for '`+`'. $)
    subaddr-P5 $p |- ( w_ga -> ( t_w + t_t ) = ( t_w + t_u ) ) $=
        ( wff-equals term-add ax-L9-addr syl-P3.24.RC ) ABCFDBGDCGFEBCDHI
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    subaddd-P5.1 $e |- ( w_ga -> t_s = t_t ) $.
    subaddd-P5.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Dual Substitution Theorem for '`+`'. $)
    subaddd-P5 $p |- ( w_ga -> ( t_s + t_u ) = ( t_t + t_w ) ) $=
        ( term-add subaddl-P5 subaddr-P5 eqtrns-P5 ) ABDHCDHCEHABCDFIADECGJK
    $.
$}

${
    $( Closed Form of ~subaddd-P5 . $)
    subaddd-P5.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s + t_u ) = ( t_t + t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 subaddd-P5 )
        ABEZCDEZFABCDJKGJKHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    submultl-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Left Substitution Theorem for '`x.`'. $)
    submultl-P5 $p |- ( w_ga -> ( t_t x. t_w ) = ( t_u x. t_w ) ) $=
        ( wff-equals term-mult ax-L9-multl syl-P3.24.RC ) ABCFBDGCDGFEBCDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    submultr-P5.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Right Substitution Theorem for '`x.`'. $)
    submultr-P5 $p |- ( w_ga -> ( t_w x. t_t ) = ( t_w x. t_u ) ) $=
        ( wff-equals term-mult ax-L9-multr syl-P3.24.RC ) ABCFDBGDCGFEBCDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    submultd-P5.1 $e |- ( w_ga -> t_s = t_t ) $.
    submultd-P5.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Dual Substitution Theorem for '`x.`'. $)
    submultd-P5 $p |- ( w_ga -> ( t_s x. t_u ) = ( t_t x. t_w ) ) $=
        ( term-mult submultl-P5 submultr-P5 eqtrns-P5 )
        ABDHCDHCEHABCDFIADECGJK
    $.
$}

${
    $( Closed Form of ~submultd-P5 . $)
    submultd-P5.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s x. t_u ) = ( t_t x. t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 submultd-P5 )
        ABEZCDEZFABCDJKGJKHI
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Implicit Variable Substitution and Law of Specialization.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Preliminary Law of Specialization.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ps x $.
    $d t_t x $.

    lemma-L5.02a.1 $e |- ( x = t_t -> ( w_ph -> w_ps ) ) $.
    $( A lemma used for bound variable substitution and specialization
       theorems.

       '`x`' cannot occur in either '`t_t`' or '`w_ps`'.

       The '`->`' in the hypothesis is replaced with a '`<->`' in ~specisub-P5
       to make the practical usage more clear. $)
    lemma-L5.02a $p |- ( A. x w_ph -> w_ps ) $=
        ( wff-forall wff-exists term-obj wff-equals imcomm-P3.27.RC
          dalloverimex-P5.RC.GEN axL6ex-P5 mae-P3.23.RC axL5ex-P5
          syl-P3.24.RC )
        ADFZBDGZBPDHCIZDGQARBDRABEJKCDLMBDNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.
    $d t_t x $.

    specisub-P5.1 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Specialization Theorem with Implicit Substitution.

       '`x`' cannot occur in either '`t_t`' or '`w_ps`'.

       The hypothesis is fulfilled when every free occurence of '`x`' in
       '`w_ph`' is replaced with the term '`t_t`', and every bound occurence
       of '`x`' is replaced with a fresh variable (one for each quantifier).
       The resulting WFF is '`w_ps`'.  After this operation, '`x`' will not
       occur in '`w_ps`'.  '`x`' cannot occur in '`t_t`' either, or it
       would occur in '`w_ps`' wherever '`x`' was replaced. $)
    specisub-P5 $p |- ( A. x w_ph -> w_ps ) $=
        ( term-obj wff-equals ndbief-P3.14 lemma-L5.02a ) ABCDABDFCGEHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.
    $d t_t x $.

    exiisub-P5.1 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.
    $( Existential Quantifier Introduction Law with Implicit Substitution.

       '`x`' cannot occur in either '`t_t`' or '`w_ps`'.

       This is the dual of ~specisub-P5 .

       The hypothesis is fulfilled when every free occurence of '`x`' in
       '`w_ph`' is replaced with the term '`t_t`', and every bound occurence
       of '`x`' is replaced with a fresh variable (one for each quantifier).
       The resulting WFF is '`w_ps`'.  '`x`' cannot occur in '`t_t`' either,
       or it would occur in '`w_ps`' wherever '`x`' was replaced. $)
    exiisub-P5 $p |- ( w_ps -> E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall term-obj wff-equals subneg-P3.39
          specisub-P5 allnegex-P5 subiml2-P4.RC trnsp-P3.31d.RC )
        ADFZBAGZDHPGBGZQRCDABDICJEKLADMNO
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Removal Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ph y $.
    $d w_ph x $.
    $d x y $.

    $( Universal Quantifier Removal (variable restriction). 

       '`x`' cannot occur in '`w_ph`'.

       The most general form is ~qremall-P6 . $)
    qremallv-P5 $p |- ( A. x w_ph <-> w_ph ) $=
        ( wff-forall objvar-y term-obj wff-bi wff-equals biref-P3.33a
          rcp-NDIMP0addall specisub-P5 ax-L5 rcp-NDBII0 )
        ABCAAADEZBAAFBEMGAHIJABKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $.
    $d w_ph x $. 
    $d x y $.

    $( Existential Quantifier Removal (variable restriction). 

       '`x`' cannot occur in '`w_ph`'.

       The most general form is ~qremex-P6 . $)
    qremexv-P5 $p |- ( E. x w_ph <-> w_ph ) $=
        ( wff-exists axL5ex-P5 objvar-y term-obj wff-bi wff-equals
          biref-P3.33a rcp-NDIMP0addall exiisub-P5 rcp-NDBII0 )
        ABCAABDAAEFZBAAGBFMHAIJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Change of Bound Variables Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ph y $. $d w_ps x $. 
    $d x y $.

    cbvallv-P5-L1.1 $e |- ( x = y -> ( w_ph -> w_ps ) ) $.

    $( Lemma for ~cbvallv-P5 . $)
    cbvallv-P5-L1 $p |- ( A. x w_ph -> A. y w_ps ) $=
        ( wff-forall ax-L5 term-obj lemma-L5.02a alloverim-P5.RC.GEN
          syl-P3.24.RC )
        ACFZLDFBDFLDGLBDABDHCEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps x $. 
    $d x y $.

    cbvallv-P5.1 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`A. x`' (variable restriction).

       '`x`' cannot occur in '`w_ps`' and '`y`' cannot occur in '`w_ph`'.

       The hypothesis is fulfilled when every free occurrence of '`x`' in
       '`w_ph`' is replaced with '`y`', and every bound occurance of '`x`' is
       replaced with a fresh variable (one for each quantifier).  The
       resulting WFF is '`w_ps`'. 

       The most general form is ~cbvall-P6 . $)
    cbvallv-P5 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( wff-forall term-obj wff-equals ndbief-P3.14 cbvallv-P5-L1 wff-imp
          ndbier-P3.15 eqsym-P5.CL.SYM subiml2-P4.RC rcp-NDBII0 )
        ACFBDFABCDABCGZDGZHZEIJBADCRQPHBAKABRELPQMNJO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps x $. 
    $d x y $.

    cbvexv-P5.1 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`E. x`' (variable restriction).

       '`x`' cannot occur in '`w_ps`' and '`y`' cannot occur in '`w_ph`'.

       The hypothesis is fulfilled when every free occurrence of '`x`' in
       '`w_ph`' is replaced with '`y`', and every bound occurance of '`x`' is
       replaced with a fresh variable (one for each quantifier).  The
       resulting WFF is '`w_ps`'.

       The most general form is ~cbvex-P6 . $)
    cbvexv-P5 $p |- ( E. x w_ph <-> E. y w_ps ) $=
        ( wff-exists wff-neg wff-forall df-exists-D5.1 term-obj wff-equals
          subneg-P3.39 cbvallv-P5 subneg-P3.39.RC bisym-P3.33b.RC
          dbitrns-P4.16.RC )
        ACFAGZCHZGBGZDHZGZBDFZACIRTQSCDABCJDJKELMNUBUABDIOP
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Weakened Law of Specialization.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ph x1 $. $d w_ph1 x $. 
    $d x x1 $.

    specw-P5.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( Weak Version of Law of Specialization.

       Note that the hypothesis only requires the existence of a dummy
       variable '`x1`' and dummy formula '`w_ph1`', that is equivalent to
       '`w_ph`' with free occurences of '`x`' replaced with '`x1`' and bound
       occurances of '`x`' replaced with fresh variables.  Using induction on
       formula length, one can prove a meta-theorem stating that such a
       formula always exists.  The building blocks of the inductive proof are
       the substitution theorems (theorems beginning with "sub") and the two
       bound variable replacement theorems ( ~cbvallv-P5 and ~cbvexv-P5 ).

       Because meta-theorems don't exist in metamath, we will need the
       auxiliary "scheme completeness" axiom ~ax-L12 to eliminate the
       hypothesis in the general case (see ~spec-P6 ). $)
    specw-P5 $p |- ( A. x w_ph -> w_ph ) $=
        ( wff-forall cbvallv-P5 rcp-NDBIEF0 term-obj wff-equals wff-imp
          ndbier-P3.15 eqsym-P5.CL.SYM subiml2-P4.RC lemma-L5.02a
          syl-P3.24.RC )
        ACFZBDFZAQRABCDEGHBACIZDSDIZJZTSJBAKABUAELSTMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $. 
    $d x x1 $.

    exiw-P5.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( Weak Version of Existential Quantifier Introduction Law.

       This is the dual form of ~specw-P5 .
       
       Note that the hypothesis only requires the existence of a dummy
       variable '`x1`' and dummy formula '`w_ph1`', that is equivalent to
       '`w_ph`' with free occurences of '`x`' replaced with '`x1`' and bound
       occurances of '`x`' replaced with fresh variables. 

       We will need the auxiliary "scheme completeness" axiom ~ax-L12 to
       eliminate the hypothesis in the general case (see ~exi-P6 ).       $)
    exiw-P5 $p |- ( w_ph -> E. x w_ph ) $=
        ( wff-neg wff-forall wff-exists term-obj wff-equals subneg-P3.39
         specw-P5 trnsp-P3.31a.RC df-exists-D5.1 bisym-P3.33b.RC
         subimr2-P4.RC )
        AFZCGZFZACHZARAQBFCDABCIDIJEKLMTSACNOP
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Hypothesis Elimination Examples.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d x x1 $.

    $( Hypothesis Elimination Example 1. $)
    example-E5.01a $p
        |- (
          x = x1 -> (
            ( t_t x. ( t_u + x ) ) = ( ( t_t x. t_u ) + ( t_t x. x ) ) <->
            ( t_t x. ( t_u + x1 ) ) = ( ( t_t x. t_u ) + ( t_t x. x1 ) )
          )
        )
    $=
        ( term-obj wff-equals term-add term-mult rcp-NDASM1of1 subaddr-P5
          submultr-P5 subeqd-P5 )
        CEZDEZFZABMGZHABNGZHABHZAMHZGRANHZGOPQAOMNBOIZJKOSTROMNAUAKJL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x x1 y z $.

    $( Hypothesis Elimination Example 2. $)
    example-E5.02a $p
        |- (
          x = x1 -> (
            A. y E. z ( ( y + z ) = x \/ ( x + z ) = y ) <->
            A. y E. z ( ( y + z ) = x1 \/ ( x1 + z ) = y )
          )
        )
    $=
        ( term-obj term-add wff-equals wff-or wff-exists rcp-NDASM1of1
          subeqr-P5 subaddl-P5 subeql-P5 subord-P3.43c subexv-P5 suballv-P5 )
        CEZDEZFZAEZGZTRFZQGZHZDISBEZGZUERFZQGZHZDITUEGZCUDUIUJDUAUFUCUHUJUJTUE
        SUJJZKUJUBUGQUJTUERUKLMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d a x x1 y z $.

    $( Hypothesis Elimination Example 3. $)
    example-E5.03a $p
        |- (
          x = x1 -> (
            A. z ( z e. x <-> A. x ( x e. z -> x e. y ) ) <->
            A. z ( z e. x1 <-> A. a ( a e. z -> a e. y ) )
          )
        )
    $=
        ( term-obj wff-elemof wff-imp wff-forall wff-bi wff-equals
          rcp-NDASM1of1 subelofr-P5 subelofl-P5.CL subimd-P3.40c cbvallv-P5
          rcp-NDIMP0addall subbid-P3.41c suballv-P5 )
        DFZAFZGZUATGZUACFZGZHZAIZJTBFZGZEFZTGZUJUDGZHZEIZJUAUHKZDUBUIUGUNUOUOU
        AUHTUOLMUGUNJUOUFUMAEUCUKUEULUAUJKUAUJTNUAUJUDNOPQRS
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Commutivity of Similar Quantifiers (weakened versions).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    $( A Lemma for Universal / Existential Conversion of Nested
       Quantifiers. $)
    lemma-L5.03a $p |- ( A. x A. y -. w_ph <-> -. E. x E. y w_ph ) $=
        ( wff-neg wff-forall wff-exists allnegex-P5 suballinf-P5
          bitrns-P3.33c.RC )
        ADCEZBEACFZDZBEKBFDJLBACGHKBGI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y1 $. $d w_ph1 y $.
    $d x y y1 $.

    lemma-L5.04a.1 $e |- ( y = y1 -> ( w_ph <-> w_ph1 ) ) $.

    $( A lemma for commuting universal quantifiers.

       Requires the existence of '`w_ph1 ( y1 )`' as a replacement for
       '`w_ph ( y )`'. $)
    lemma-L5.04a $p |- ( A. x A. y w_ph -> A. y A. x w_ph ) $=
        ( wff-forall cbvallv-P5 rcp-NDBIEF0 alloverim-P5.RC.GEN ax-L5 term-obj
         wff-equals wff-bi bisym-P3.33b eqsym-P5.CL.SYM subiml2-P4.RC
         specisub-P5 dsyl-P3.25.RC )
        ADGZCGBEGZCGZUBDGACGZDGTUACTUAABDEFHIJUBDKUBUCDUAACBADLZEUDELZMZUEUDMB
        ANABUFFOUDUEPQRJJS
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x y x1 $.

    lemma-L5.05a.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( A lemma for commuting existential quantifiers. 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    lemma-L5.05a $p |- ( E. x E. y w_ph -> E. y E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall term-obj wff-equals subneg-P3.39
          lemma-L5.04a lemma-L5.03a subimd2-P4.RC trnsp-P3.31d.RC )
        ACGEGZAEGCGZAHZCIEIQHSEICIRHSBHECDABCJDJKFLMAECNACENOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d w_ph y1 $. $d w_ph2 y $.

    $d x y x1 y1 $.

    allcommw-P5.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    allcommw-P5.2 $e |- ( y = y1 -> ( w_ph <-> w_ph2 ) ) $.

    $( Universal Quantifier Commutivity (weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`', and the existance of '`w_ph2 ( y1 )`' as a replacement
       for '`w_ph ( y )`'. 

       The form not requiring any hypotheses, but relying on an additional
       axiom is ~allcomm-P6 . $)
    allcommw-P5 $p |- ( A. x A. y w_ph <-> A. y A. x w_ph ) $=
        ( wff-forall lemma-L5.04a rcp-NDBII0 ) AFJDJADJFJACDFGIKABFDEHKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $. 
    $d w_ph y1 $. $d w_ph2 y $.
    $d x y x1 y1 $.

    excommw-P5.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    excommw-P5.2 $e |- ( y = y1 -> ( w_ph <-> w_ph2 ) ) $.

    $( Existential Quantifier Commutivity (weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`', and the existance of '`w_ph2 ( y1 )`' as a replacement
       for '`w_ph ( y )`'.

       The form not requiring any hypotheses, but relying on an additional
       axiom is ~excomm-P6 . $)
    excommw-P5 $p |- ( E. x E. y w_ph <-> E. y E. x w_ph ) $=
        ( wff-exists lemma-L5.05a rcp-NDBII0 ) AFJDJADJFJABDEFHKACFGDIKL
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Quantifier Grouping Laws.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

  The next four theorems are useful for putting a WFF in prenex form.  In this
  form all quantifiers are on the left and no logical connectives appear
  outside the scope of any individual quantifier.  An example is given below. 
$)

${
    $d w_ph x $.

    $( Quantifier Grouping Law, Universal Quantifier Right on Implication.
       (variable restriction).

       '`x`' cannot occur in '`w_ph`'. 

       The most general form is ~qgallimr-P6 . $)
    qgallimrv-P5 $p
        |- ( ( w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallav-P5 qremexv-P5
          subiml-P3.40a.RC subbil2-P4.RC )
        ACDZBCEZFALFABFCEABCGKALACHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    $( Quantifier Grouping Law, Existential Quantifier Right on Implication
       (variable restriction). 

       '`x`' cannot occur in '`w_ph`'.

       The most general form is ~qgeximr-P6 . $)
    qgeximrv-P5 $p
        |- ( ( w_ph -> E. x w_ps ) <-> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-exists wff-imp qimeqex-P5 qremallv-P5
          subiml-P3.40a.RC subbil2-P4.RC )
        ACDZBCEZFALFABFCEABCGKALACHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.

    $( Quantifier Grouping Law, Universal Quantifier Left on Implication
       (variable restriction). 

       '`x`' cannot occur in '`w_ps`'.

       The most general form is ~qgalliml-P6 . $)
    qgallimlv-P5 $p
        |- ( ( A. x w_ph -> w_ps ) <-> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-exists wff-imp qimeqex-P5 qremexv-P5 subimr-P3.40b.RC
          subbil2-P4.RC )
        ACDZBCEZFKBFABFCEABCGLBKBCHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $.

    $( Quantifier Grouping Law, Existential Quantifier Left on Implication
       (variable restriction). 

       '`x`' cannot occur in '`w_ps`'.

       The most general form is ~qgeximl-P6 . $)
    qgeximlv-P5 $p
        |- ( ( E. x w_ph -> w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallbv-P5 qremallv-P5
          subimr-P3.40b.RC subbil2-P4.RC )
        ACDZBCEZFKBFABFCEABCGLBKBCHIJ
    $.
$}


$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Prenex Form Example.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph x1 $. $d w_ph1 x $. $d w_ph2 x $.
    $d w_ph y1 $. $d w_ph1 y1 $. $d w_ph2 y $.

    $d w_ph z $. $d w_ph a $.
    $d w_ph1 z $. $d w_ph1 a $.
    $d w_ph2 z $. $d w_ph2 a $. 

    $d x x1 y y1 z a b $.

    example-E5.04a.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    example-E5.04a.2 $e |- ( y = y1 -> ( w_ph1 <-> w_ph2 ) ) $.

    example-E5.04a.3 $e
        |- (
          A. x E. z A. y ( w_ph -> y = z ) ->
          E. a A. x A. y ( x e. b -> ( w_ph -> y e. a ) )
        )
    $.

    $( Convert Axiom of Replacement to Prenex Form.

       The hypothesis imples we can construct an alternate function,
       '`w_ph2`'.  We first replace '`x`' with '`x1`' in '`w_ph`' to obtain
       '`w_ph1`', then we replace '`y`' with '`y1`' in '`w_ph1`' to obtain
       '`w_ph2`'.
       
       Since '`x1`' and '`y1`' are fresh variables replacing '`x`' and '`y`',
       we need the disjoint variable conditions...
     
       $d `w_ph` `x1` `y1` $. 
       $d `w_ph1` `x` `y1` $. 
       $d `w_ph2` `x` `y` $.

       The other condition, that neither '`z`' nor '`a`' should appear in
       '`w_ph`' (and by extension '`w_ph1`' and '`w_ph2`'), is simply part of
       the hypothesis for with this version of the Axiom of Replacement.
    $)
    example-E5.04a $p
        |- E. a A. x A. y E. x1 A. z E. y1 (
          ( w_ph2 -> y1 = z ) -> ( x e. b -> ( w_ph -> y e. a ) )
        )
    $=
        ( term-obj wff-equals wff-imp wff-forall wff-elemof wff-exists
          subiml-P3.40a suballv-P5 subexv-P5 cbvallv-P5 rcp-NDASM1of1
          subeql-P5 subimd-P3.40c subexinf-P5 suballinf-P5 bitrns-P3.33c.RC
          subiml2-P4.RC qgeximrv-P5 bimpf-P4.RC qgallimrv-P5
          qgallimlv-P5 qgeximlv-P5 )
        CGNZHNZOZPZGQZDNZJNRAFNZINRPPZPZHQZESZFQZDQZISZUSVCPGSZHQZESZFQZDQZISU
        THSZVCPZESZFQZDQZISZVIVOEQZVCP ZFQZDQZISZVTWAVCFQZPZDQZISZWEWAWFDQZPZI
        SZWIWAWJISZPWLAVBUQOZPZFQZHSZDQZWAWMMWRBWNPZFQZHSZEQWAWQXADEWPWTVAENOZ
        HWOWSXBFABWNXBKTUAUBUCXAVOEWTUTHWSUSFGBCWNURVBUPOZLXCVBUPUQXCUDUEUFUCU
        GUHUIUJWAWJIUKULWKWHIWAWFDUMUGULWHWDIWGWCDWAVCFUMUHUGULWDVSIWCVRDWBVQF
        VOVCEUNUHUHUGULVSVHIVRVGDVQVFFVPVEEUTVCHUOUGUHUHUGULVHVNIVGVMDVFVLFVEV
        KEVDVJHUSVCGUNUHUGUHUHUGUL
    $.
$}
$( End $[ bfol-ch5.mm $] $)
$( Begin $[ bfol-ch6.mm $] $)

$(
##############################################################################
  Chapter 6: Predicate Calculus (continued).
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Effective Non-Freeness.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  The "General For" Concept.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  If a WFF '`w_ph`' satisfies the formula of ~ax-L5 with regard to some
  variable '`x`', we say '`w_ph`' is *general for* '`x`'.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Positive.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)


${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    genallw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( The WFF `A. x w_ph` is General for '`x`' (weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    genallw-P6 $p |- ( A. x w_ph -> A. x A. x w_ph ) $=
        ( wff-forall ax-L5 cbvallv-P5 bisym-P3.33b.RC suballinf-P5
          subimd2-P4.RC )
        BDFZACFZLCFMCFLCGMLABCDEHIZLMCNJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    genexw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( The WFF `E. x w_ph` is General for '`x`' (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    genexw-P6 $p |- ( E. x w_ph -> A. x E. x w_ph ) $=
        ( wff-exists wff-forall ax-L5 cbvexv-P5 bisym-P3.33b.RC suballinf-P5
          subimd2-P4.RC )
        BDFZACFZMCGNCGMCHNMABCDEIJZMNCOKL
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Negated.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    gennallw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( The WFF '`-. A. x w_ph`' is General for '`x`' (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    gennallw-P6 $p |- ( -. A. x w_ph -> A. x -. A. x w_ph ) $=
        ( wff-neg wff-exists wff-forall term-obj wff-equals subneg-P3.39
          genexw-P6 exnegall-P5 suballinf-P5 subimd2-P4.RC )
        AFZCGZACHFZQCHRCHPBFCDABCIDIJEKLACMZQRCSNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    gennexw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( The WFF '`-. E. x w_ph`' is General for '`x`' (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    gennexw-P6 $p |- ( -. E. x w_ph -> A. x -. E. x w_ph ) $=
        ( wff-neg wff-forall wff-exists term-obj wff-equals subneg-P3.39
          genallw-P6 allnegex-P5 suballinf-P5 subimd2-P4.RC )
        AFZCGZACHFZQCGRCGPBFCDABCIDIJEKLACMZQRCSNO
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Dual.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    exgenallw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( Dual of ~genallw-P6 (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    exgenallw-P6 $p |- ( E. x A. x w_ph -> A. x w_ph ) $=
        ( wff-forall wff-exists wff-imp wff-neg gennallw-P6
          lemma-L5.01a bimpr-P4.RC )
        ACFZCGMHMIZNCFHABCDEJMCKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Define Effective Non-Freeness.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the effective non-freeness predicate
       '`F/`'. $)
    wff-enfree $a wff F/ x w_ph $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Definition of Effective Non-Freeness (ENF), '`F/`'.  Read as
       "is not (effectively) free in".

       When we say that '`x`' is not (effectively) free in '`w_ph`', we
       are saying (in semantic terms) that the truth value of '`w_ph`' does
       not depend on '`x`'.  It is easy to understand this definition if we
       interpret the WFF '`w_ph`' as a function with a binary output.  Then
       clearly '`w_ph`' does not depend on '`x`' if and only if one of the
       following holds...

       1. '`w_ph`' is true for all '`x`' (holding all other variables
          constant).

       2. '`w_ph` is false for all '`x`' (holding all other variables 
          constant).

       This definition states exactly this.  Unlike the regular textbook 
       definition of non-freeness, it does *not* state that '`x`' cannot
       occur free in '`w_ph`'. If we set '`w_ph := x = x`' then '`x`' is still
       *effectively* free in '`w_ph`' since '`x = x`' is a tautology in our
       system.  Effective non-freeness is thus slightly more general than the
       standard textbook definition, which we will call grammatical
       non-freeness (GNF).  We could also call effective non-freeness
       *logical* non-freenness because, unlike grammatical non-freeness, it is
       bound to logical equivalence (see ~enfrleq-P6 ). $)
    df-enfree-D6.1 $a |- ( F/ x w_ph <-> ( A. x w_ph \/ A. x -. w_ph ) ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Equivalencies.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  The theorems ~enfrgenw-P6 and ~genenfrw-P6 , show that *general for*
  and *effectively not free* are identical.
$)

${
    $( Alternate Definition of Effective Non-Freeness. $)
    dfenfreealt-P6 $p |- ( F/ x w_ph <-> ( E. x w_ph -> A. x w_ph ) ) $=
        ( wff-enfree wff-forall wff-neg wff-or wff-exists wff-imp
          df-enfree-D6.1 allnegex-P5 suborr-P3.43b.RC orcomm-P3.37
          imasor-P4.32a bisym-P3.33b.RC tbitrns-P4.17.RC )
        ABCABDZAEBDZFPABGZEZFSPFZRPHZABIQSPABJKPSLUATRPMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    enfrgenw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    enfrgenw-P6.2 $e |- F/ x w_ph $.

    $( ENF in `=>` General for (weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'.

       If '`x`' is effectively not free in '`w_ph`', then '`w_ph`' is
       general for '`x`'. $)
    enfrgenw-P6 $p |- ( w_ph -> A. x w_ph ) $=
        ( wff-exists wff-forall exiw-P5 wff-enfree wff-imp dfenfreealt-P6
          bimpf-P4.RC syl-P3.24.RC )
        AACGZACHZABCDEIACJOPKFACLMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    genenfrw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    genenfrw-P6.2 $e |- ( w_ph -> A. x w_ph ) $.

    $( General for `=>` ENF in (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'.

       If '`w_ph`' is general for '`x`', then '`x`' is effectively not free
       in '`w_ph`'. $)
    genenfrw-P6 $p |- F/ x w_ph $=
        ( wff-enfree wff-exists wff-forall wff-imp alloverimex-P5.RC.GEN
          exgenallw-P6 syl-P3.24.RC dfenfreealt-P6 bimpr-P4.RC )
        ACGACHZACIZJPQCHQAQCFKABCDELMACNO
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Relationship to Textbook Definition.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  We define grammatical non-freeness (GNF) as follows...

  First, let '`w_ph`' be a well formed formula.  We classify occurrences of
  the variable '`x`' in '`w_ph`' as either *bound* or *free*.  An
  occurrence of '`x`' is *bound* if it appears inside a subformula of '`w_ph`'
  that has the form '`A. x w_ps`' or '`E. x w_ps`'.  An occurrence of '`x`'
  is *free* if it is not bound.  A variable '`x`' is (grammatically) *free in*
  a formula, '`w_ph`', if it occurs free in '`w_ph`'.  Otherwise '`x`' is said
  to be *not free in* '`w_ph`'.  *Not free in* '`w_ph`' includes the case
  where '`x`' appears nowhere in '`w_ph`'.

  Using the properties below, we can prove that if '`x`' is gramatically
  not free (GNF) in '`w_ph`', then '`x`' is also effectively not free (ENF) in
  '`w_ph`'.  The converse is not always true though (consider the formula 
  '`x = x`').  This means effective non-freeness is more general than
  grammatical non-freeness.  Effective non-freeness is a more useful concept
  in the metamath language though, as it has the same meaning in all crucial
  cases and is defined logically rather than gramatically.

  We will now prove the statement...

  '`x` is GNF in `w_ph` `=>` `x` is ENF in `w_ph`',

  for the case where '`w_ph`' is primitive (i.e. contains only '`->`', '`-.`',
  and '`A.`').  For the general case to follow, we need to impose an extra
  constraint on definitions (see *).  

  ----------------------------------------------------------------------------

  Proof:

  Base Case:

  Assume '`w_ph`' is atomic.  Since an atomic formula cannot contain '`A. x`',
  if '`x`' occurs at all in '`w_ph`', it must occur free.  Therefore if '`x`'
  is GNF in '`w_ph`', then '`x`' does not occur at all in '`w_ph`'.
  Therefore by ~enfrv-P6 , '`x`' is ENF in '`w_ph`'.

  Induction:

  Now assume the statement '`x` is GNF in `w_ph` `=>` `x` is ENF in `w_ph`' is
  true for all WFFs of length less than 'n' and let '`w_ph`' be an arbitrary
  WFF of length 'n'.

  '`w_ph`' could have four possible forms...

  Case 1: '`w_ph := -. w_ps`'.

  Note that '`x`' occurs free in '`w_ph`' if and only if '`x`' occurs free in
  `w_ps`.  Therefore if '`x`' is GNF in '`w_ph`', then it is GNF in '`w_ps`'.
  Since '`w_ps`' has length 'n-1', we know '`x`' is ENF in '`w_ps`'.
  Therefore, by ~enfrneg-P6 , '`x`' is ENF in `-. w_ps`, i.e. '`x`' is ENF in
  '`w_ph`'.

  Case 2: '`w_ph := w_ps -> w_ch`'.

  Not that if '`x`' occurs free in either '`w_ps`' or '`w_ch`', then it occurs
  free in '`w_ph`'.  Therefore if '`x`' is GNF in '`w_ph`', then it is GNF in
  both '`w_ps`' and '`w_ch`'.  Since both '`w_ps`' and '`w_ch`' have a length
  that is less than 'n', we know '`x`' is ENF in both '`w_ps`' and '`w_ch`'.
  Therefore, by ~enfrim-P6 , '`x`' is ENF in `w_ps -> w_ch`, i.e. '`x`' is ENF
  in '`w_ph`'.

  Case 3: '`w_ph := A. x w_ps`'.

  In this case it is definite that '`x`' is GNF in '`w_ph`'.  By 
  ~enfrall1w-P6 , '`x`' is also ENF in '`w_ph`'.

  Case 4: '`w_ph := A. y w_ps` ('`y`' is different from '`x`').

  '`x`' occurs free in '`w_ph`' if and only if it occurs free in '`w_ps`'.
  Therefore if '`x`' is GNF in '`w_ph`', then it is GNF in `w_ps`.  Since
  '`w_ps`' has length 'n-1', we know '`x`' is ENF in '`w_ps`'  Therefore by
  ~enfrall2w-P6 , '`x`' is ENF in '`A. y w_ps`', i.e. '`x`' is ENF in
  '`w_ph`'

  By induction, we conclude that the statement...

  '`x` is GNF in `w_ph` `=>` `x` is ENF in `w_ph`',

  is true for '`w_ph`' of any length.

  QED

  ----------------------------------------------------------------------------

  * In order to forbid definitions from "hiding" free variable occurrences, we
  require that any free variable occurring in the definiens also occur in the
  definiendum.  As an example, we are not allowed to define '`T.`' as
  '`x = x`' since '`x`' occurs free in '`x = x`'.  Note that '`x`' is still
  *effectively* free in '`x = x`' (since we can easily prove
  '`x = x -> A. x x = x`'), thus the definition is still sound. If '`x`' were
  not effectively free OTOH, the definition would not even be sound.

  Given the constraints explained in the paragraph above, the exact same
  gramatically free variables that appear in a WFF containing definitions must
  also appear in the logically equivalent primitive form.  This means '`x`' is
  GNF in a WFF containing definitions if and only if it is GNF in the
  logically equivalent primitive form of the WFF.  ~enfrleq-P6 can be used to
  show similarly, that '`x`' is ENF in a WFF containing definitions if and
  only  if '`x`' is ENF in the logically equivalent primitive form of the WFF.
$)

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph x $.
    $d x x1 $.

    $( Does Not Occur in `=>` ENF in.

       If '`x`' does not occur in '`w_ph`', then '`x`' is effectively not
       free in '`w_ph`'. $)
    enfrv-P6 $p |- F/ x w_ph $=
        ( objvar-x1 wff-bi term-obj wff-equals biref-P3.33a rcp-NDIMP0addall
          ax-L5 genenfrw-P6 )
        AABCAADBECEFAGHABIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrleq-P6.1 $e |- ( w_ph <-> w_ps ) $.

    $( Effective Non-Freeness is Bound to Logical Equivalence . $)
    enfrleq-P6 $p |- ( F/ x w_ph <-> F/ x w_ps ) $=
        ( wff-enfree wff-forall wff-neg wff-or df-enfree-D6.1 suballinf-P5
          subneg-P3.39.RC subord-P3.43c.RC bisym-P3.33b.RC dbitrns-P4.16.RC )
        ACEACFZAGZCFZHBCFZBGZCFZHZBCEZACIORQTABCDJPSCABDKJLUBUABCIMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ENF Over Negation. $)
    enfrneg-P6 $p |- ( F/ x -. w_ph <-> F/ x w_ph ) $=
        ( wff-neg wff-enfree wff-forall wff-or df-enfree-D6.1 dnegeq-P4.10
          suballinf-P5 suborr-P3.43b.RC orcomm-P3.37 bisym-P3.33b.RC
          tbitrns-P4.17.RC )
        ACZBDNBEZNCZBEZFOABEZFROFZABDZNBGQROPABAHIJORKTSABGLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrim-P6.1 $e |- F/ x w_ph $.
    enfrim-P6.2 $e |- F/ x w_ps $.

    $( ENF Over Implication. $)
    enfrim-P6 $p |- F/ x ( w_ph -> w_ps ) $=
        ( wff-imp wff-enfree wff-exists wff-forall qimeqex-P5 rcp-NDBIER0
          dfenfreealt-P6 bimpf-P4.RC imsubd-P3.28c.RC qimeqallhalf-P5
          dsyl-P3.25.RC bimpr-P4.RC )
        ABFZCGRCHZRCIZFSACIZBCHZFZACHZBCIZFTUCSABCJKUDUAUBUEACGUDUAFDACLMBCGUB
        UEFEBCLMNABCOPRCLQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrand-P6.1 $e |- F/ x w_ph $.
    enfrand-P6.2 $e |- F/ x w_ps $.

    $( ENF Over Conjunction. $)
    enfrand-P6 $p |- F/ x ( w_ph /\ w_ps ) $=
        ( wff-and wff-enfree wff-neg wff-imp enfrneg-P6 bimpr-P4.RC enfrim-P6
          andasim-P3.46a enfrleq-P6 )
        ABFZCGABHZIZHZCGZSQCGAPCDPCGBCGEBCJKLQCJKORCABMNK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrbi-P6.1 $e |- F/ x w_ph $.
    enfrbi-P6.2 $e |- F/ x w_ps $.

    $( ENF Over Equivalency. $)
    enfrbi-P6 $p |- F/ x ( w_ph <-> w_ps ) $=
        ( wff-bi wff-enfree wff-imp wff-and enfrim-P6 enfrand-P6
          dfbi-P3.47 enfrleq-P6 bimpr-P4.RC )
        ABFZCGABHZBAHZIZCGPQCABCDEJBACEDJKORCABLMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    enfrall1w-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( ENF Over Universal Quantifier (same variable - weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    enfrall1w-P6 $p |- F/ x A. x w_ph $=
        ( wff-forall wff-bi term-obj wff-equals cbvallv-P5 rcp-NDIMP0addall
          genallw-P6 genenfrw-P6 )
        ACFZBDFZCDNOGCHDHIABCDEJKABCDELM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    enfrex1w-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.

    $( ENF Over Existential Quantifier (same variable - weakened form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    enfrex1w-P6 $p |- F/ x E. x w_ph $=
        ( wff-exists wff-bi term-obj wff-equals cbvexv-P5 rcp-NDIMP0addall
          genexw-P6 genenfrw-P6 )
        ACFZBDFZCDNOGCHDHIABCDEJKABCDELM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x y x1 $.

    enfrall2w-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    enfrall2w-P6.2 $e |- F/ x w_ph $.

    $( ENF Over Universal Quantifier (different variable - weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    enfrall2w-P6 $p |- F/ x A. y w_ph $=
        ( wff-forall term-obj wff-equals suballv-P5 enfrgenw-P6
          alloverim-P5.RC.GEN lemma-L5.04a syl-P3.24.RC genenfrw-P6 )
        AEHZBEHCDABCIDIJEFKQACHZEHQCHAREABCDFGLMABECDFNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x y x1 $.

    enfrex2w-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    enfrex2w-P6.2 $e |- F/ x w_ph $.

    $( ENF Over Existential Quantifier (different variable -
       weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    enfrex2w-P6 $p |- F/ x E. y w_ph $=
        ( wff-exists wff-neg wff-enfree term-obj wff-equals subexv-P5
          subneg-P3.39 wff-imp wff-forall lemma-L5.05a enfrneg-P6 bimpr-P4.RC
          enfrgenw-P6 lemma-L5.01a alloverimex-P5.RC.GEN syl-P3.24.RC
          bimpf-P4.RC genenfrw-P6 )
        AEHZIZCJUFCJUGBEHZICDUFUHCKDKLZABUIEFMNUFCHZUFOUGUGCPOUJACHZEHUFABCDEF
        QUKAEUKAOAIZULCPOULBICDABUIFNULCJACJGACRSTACUASUBUCUFCUAUDUEUFCRUD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  More Consequences of Effective Non-Freeness.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    enfrexgenw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    enfrexgenw-P6.2 $e |- F/ x w_ph $.

    $( Dual Form of ~enfrgenw-P6 (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    enfrexgenw-P6 $p |- ( E. x w_ph -> w_ph ) $=
        ( wff-exists wff-imp wff-neg wff-forall term-obj wff-equals
          subneg-P3.39 wff-enfree enfrneg-P6 bimpr-P4.RC enfrgenw-P6
          lemma-L5.01a )
        ACGAHAIZSCJHSBICDABCKDKLEMSCNACNFACOPQACRP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    exgenenfrw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    exgenenfrw-P6.2 $e |- ( E. x w_ph -> w_ph ) $.
    $( Dual Form of ~genenfrw-P6 (weakened form).

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    exgenenfrw-P6 $p |- F/ x w_ph $=
        ( wff-neg wff-enfree term-obj wff-equals subneg-P3.39 wff-exists
          wff-imp wff-forall lemma-L5.01a bimpf-P4.RC genenfrw-P6
          enfrneg-P6 )
        AGZCHACHSBGCDABCIDIJEKACLAMSSCNMFACOPQACRP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqalla-P6-L1.1 $e |- F/ x w_ph $.

    $( Lemma for ~qimeqalla-P6 . $)
    qimeqalla-P6-L1 $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp wff-enfree dfenfreealt-P6 bimpf-P4.RC
          rcp-NDIMP0addall ax-L4 syl-P3.24 )
        ACEZACFZBCFABGCFZNOGZPACHQDACIJKABCLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqalla-P6.1 $e |- F/ x w_ph $.

    $( Quantified Implication Equivalence Law ( ( E `->` U ) `<->` U )
       (non-freeness condition a). $)
    qimeqalla-P6 $p
        |- ( ( E. x w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallhalf-P5 qimeqalla-P6-L1
          rcp-NDBII0 )
        ACEBCFGABGCFABCHABCDIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqallb-P6-L1.1 $e |- F/ x w_ps $.

    $( Lemma for ~qimeqallb-P6 . $)
    qimeqallb-P6-L1 $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp alloverimex-P5.CL wff-enfree
          dfenfreealt-P6 bimpf-P4.RC rcp-NDIMP0addall syl-P3.24 )
        ACEBCEZBCFZABGCFZABCHNOGZPBCIQDBCJKLM
    $.
$}
$( ------------------------------------------------------------------------- $)

${
    qimeqallb-P6.1 $e |- F/ x w_ps $.

    $( Quantified Implication Equivalence Law ( ( E `->` U ) `<->` U )
       (non-freeness condition b). $)
    qimeqallb-P6 $p
        |- ( ( E. x w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallhalf-P5 qimeqallb-P6-L1
          rcp-NDBII0 )
        ACEBCFGABGCFABCHABCDIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    qremallw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    qremallw-P6.2 $e |- F/ x w_ph $.

    $( Universal Quantifier Removal (non-freeness condition - weakened
       form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    qremallw-P6 $p |- ( A. x w_ph <-> w_ph ) $=
        ( wff-forall specw-P5 enfrgenw-P6 rcp-NDBII0 ) ACGAABCDEHABCDEFIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x1 $. $d w_ph1 x $.
    $d x x1 $.

    qremexw-P6.1 $e |- ( x = x1 -> ( w_ph <-> w_ph1 ) ) $.
    qremexw-P6.2 $e |- F/ x w_ph $.

    $( Existential Quantifier Removal (non-freeness condition - weakened
       form). 

       Requires the existence of '`w_ph1 ( x1 )`' as a replacement for
       '`w_ph ( x )`'. $)
    qremexw-P6 $p |- ( E. x w_ph <-> w_ph ) $=
        ( wff-exists enfrexgenw-P6 exiw-P5 rcp-NDBII0 ) ACGAABCDEFHABCDEIJ
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Explicit Substitution.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Motivation.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d w_ps x1 $. $d w_ps1 x $.
    $d t_t x $.
    $d x x1 $.

    solvesub-P6a.1 $e |- ( x = x1 -> ( w_ps <-> w_ps1 ) ) $.
    solvesub-P6a.2 $e |- F/ x w_ps $.
    solvesub-P6a.3 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Solve for Substitution Formula ('`x`' does not occur in '`t_t`'). 

       Requires the existence of '`w_ps1 ( x1 )`' as a replacement for
       '`w_ps ( x )`'.  Also, '`x`' cannot occur in '`t_t`'.

       The idea here is that we replace all free occurences of '`x`' in
       '`w_ph`' with '`t_t`', first changing any bound variables that conflict
       with '`t_t`' with fresh variables.  The result of this process, which
       is guaranteed to exist, will be called '`w_ps`'.  So long as '`x`' does
       not appear in '`t_t`', '`x`' will not occur free in the result,
       '`w_ps`'. This fact is needed to prove this theorem..

       Using the process described above, the existence of a formula,
       '`w_ps`', that satisfies the hypotheses of this theorem can be proven
       through induction on formula length.  With the assumption that such a
       formula exists, the theorem then "solves" for a direct formula that is
       gauranteed to be logically equivalent to '`w_ps`' in every case.

       The only limitation of this direct formula is the rule that '`x`' is
       not allowed to occur in '`t_t`'.  An even more general formula where
       '`t_t`' is allowed to contain '`x`' can be produced by applying this
       substitution twice, recursively, with an intermediate dummy variable.
       This is shown in ~solvedsub-P6a . $)
    solvesub-P6a $p |- ( w_ps <-> A. x ( x = t_t -> w_ph ) ) $=
        ( term-obj wff-equals wff-imp wff-forall wff-exists wff-true wff-bi
          imoverbi-P4.30b bimpf-P4.RC suballinf-P5 qimeqallb-P6
          bisym-P3.33b.RC axL6ex-P5 thmeqtrue-P4.21a qremallw-P6
          subimd-P3.40c.RC trueie-P4.22a tbitrns-P4.17.RC )
        EJDKZALZEMZBUJUHBLZEMZUHENZBEMZLZOZBLBUIUKEUHABPLUIUKPIUHABQRSUOULUHBE
        HTUAUMUPUNBUMDEUBUCBCEFGHUDUEBUFUGUA
    $.
$}

${
    $d w_ps x1 $. $d t_t x1 $.
    $d w_ps x $. $d t_t x $.
    $d x x1 $.

    solvesub-P6a.VR.1 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Variable Restricted Form of ~solvesub-P6a .

       '`x`' cannot occur in either '`w_ps`' or '`t_t`'.

       If we know '`x`' does not occur in '`w_ps`' ahead of time, we can
       remove some of the hypotheses. $)
    solvesub-P6a.VR $p |- ( w_ps <-> A. x ( x = t_t -> w_ph ) ) $=
        ( objvar-x1 wff-bi term-obj wff-equals biref-P3.33a rcp-NDIMP0addall
          enfrv-P6 solvesub-P6a )
        ABBCDFBBGDHFHIBJKBDLEM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps b1 $. $d w_ps1 b $.
    $d a b b1 x y $.

    example-E6.01a.1 $e |- ( b = b1 -> ( w_ps <-> w_ps1 ) ) $.

    example-E6.01a.2 $e |- ( w_ph <-> A. x ( x e. b -> x e. a ) ) $.
    example-E6.01a.3 $e |- ( w_ps <-> A. y ( y e. x -> y e. a ) ) $.

    $( Eliminating Hypothesis to ~solvesub-P6a . 

       In this example we replace '`b`' in `w_ph` with '`x`'.  Because '`x`'
       is a bound variable in '`w_ph`', we use ~cbvallv-P5 to change the
       bound variable '`x`' to '`y`' so as not to conflict with the
       substituted '`x`'.  The WFF metavariables '`w_ph`' and '`w_ps`',
       defined as hypotheses, exist only to make this example easier to
       follow.  It is easy to locate the important steps, which are...

       '`F/ b w_ps`', 

       and '`( b = x -> ( w_ph <-> w_ps ) ) `'. $)
    example-E6.01a $p |- ( w_ps <-> A. b ( b = x -> w_ph ) ) $=
        ( term-obj wff-elemof wff-imp wff-forall wff-enfree enfrv-P6
          bisym-P3.33b.RC enfrleq-P6 bimpf-P4.RC wff-bi wff-equals
          subelofl-P5.CL subimd-P3.40c cbvallv-P5 rcp-NDIMP0addall
          subelofr-P5.CL subiml-P3.40a suballv-P5 bitrns-P3.33c
          subbid-P3.41c.RC subimr2-P4.RC solvesub-P6a )
        ABCDLZGHIELZUNMZUOFLZMZNZEOZGPBGPUTGQUTBGBUTKRZSTUNGLZMZUNUQMZNZDOZUTU
        AABUAVBUNUBZVFUOVBMZURNZEOZUTVGVFVJUAVGVEVIDEVCVHVDURUNUOUBUNUOVBUCUNU
        OUQUCUDUEUFVIUSVGEVHUPURVGVBUNUOUGUHUIUJVFAUTBAVFJRVAUKULUM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x1 $. $d w_ps1 x $.
    $d t_t x $.
    $d x x1 $.

    solvesub-P6b.1 $e |- ( x = x1 -> ( w_ps <-> w_ps1 ) ) $.
    solvesub-P6b.2 $e |- F/ x w_ps $.
    solvesub-P6b.3 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( ~solvesub-P6a with result substituted back into hypothesis.

       Requires the existence of '`w_ps1 ( x1 )`' as a replacement for
       '`w_ps ( x )`'.  Also, '`x`' cannot occur in '`t_t`'. $)
    solvesub-P6b $p |- ( x = t_t -> ( w_ph <-> A. x ( x = t_t -> w_ph ) ) ) $=
        ( wff-bi term-obj wff-equals wff-imp wff-forall solvesub-P6a
          subbir-P3.41b.RC subimr2-P4.RC )
        ABJAEKDLZAMENZJRIBSAABCDEFGHIOPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d t_t y $.
    $d x y $.

    eqmiddle-P6.1 $e |- ( w_ga -> x = t_t ) $.

    $( Introduce Intermediate Middle Variable from Equality.

       '`y`' cannot occur in either '`w_ga`' or '`t_t`'.  $)
    eqmiddle-P6 $p |- ( w_ga -> E. y ( x = y /\ y = t_t ) ) $=
        ( term-obj wff-equals wff-exists wff-and axL6ex-P5 rcp-NDIMP0addall
          rcp-NDIMP1add1 rcp-NDASM2of2 subeqr-P5 bimpr-P4 ndandi-P3.7
          rcp-NDIMI2 alloverimex-P5.GENV ndime-P3.6 )
        DFZBGZDHZCFZTGZUAIZDHAUBABDJKUAUEADUEAUAUDUAAUAIZUDUCBGZUFUGAUAELUFTBU
        CAUAMZNOUHPQRS
    $.
$}

${
    $d t_t y $.
    $d x y $.

    $( Closed Form of ~eqmiddle-P6 .

       '`y`' cannot occur in '`t_t`'.  $)
    eqmiddle-P6.CL $p |- ( x = t_t -> E. y ( x = y /\ y = t_t ) ) $=
        ( term-obj wff-equals rcp-NDASM1of1 eqmiddle-P6 ) BDAEZABCHFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ch y1 $. $d w_ch1 y $.

    $d w_ph y $. $d w_ph y1 $.
    $d t_t y $.
    
    $d x y y1 $.

    trnsvsubw-P6.1 $e |- F/ y w_ch $.
    trnsvsubw-P6.2 $e |- ( y = y1 -> ( w_ch <-> w_ch1 ) ) $.
    trnsvsubw-P6.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    trnsvsubw-P6.4 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( Transitive Dummy Variable Substitution (weakened form). 

       Requires the existence of '`w_ch1 ( y1 )`' as a replacement for
       '`w_ch ( y )`'.  Also, neither '`y`' nor '`y1`' can occur in '`w_ph`'
       and '`y`' cannot occur in '`t_t`'. $)
    trnsvsubw-P6 $p |- ( x = t_t -> ( w_ph <-> w_ch ) ) $=
        ( term-obj wff-equals wff-and wff-exists wff-bi eqmiddle-P6.CL
          joinimandres2-P4.RC bitrns-P3.33c.CL syl-P3.24.RC
          alloverimex-P5.RC.GEN subbir-P3.41b enfrv-P6 enfrbi-P6
          enfrexgenw-P6 dsyl-P3.25.RC )
        FMZENUHGMZNZUIENZOZGPACQZGPUMEFGRULUMGULABQZBCQZOUMUJUNUKUOKLSABCTUAUB
        UMADQGHCDAUIHMNJUCACGAGUDIUEUFUG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x1 $. $d w_ps1 x $. 
    $d w_ch y1 $. $d w_ch1 y $.
    
    $d t_t y $.
    $d x x1 y y1 $.

    solvedsub-P6a.1 $e |- ( x = x1 -> ( w_ps <-> w_ps1 ) ) $.
    solvedsub-P6a.2 $e |- F/ x w_ps $.
    solvedsub-P6a.3 $e |- ( y = y1 -> ( w_ch <-> w_ch1 ) ) $.
    solvedsub-P6a.4 $e |- F/ y w_ch $.
    solvedsub-P6a.5 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    solvedsub-P6a.6 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( Solve for Double Substitution Formula ('`x`' may occur in '`t_t`').

       Requires the existence of '`w_ps1 ( x1 )`' as a replacement for
       '`w_ps ( x )`' and '`w_ch1 ( y1 )`' as a replacement for
       '`w_ch ( y )`'.  Also, '`y`' cannot occur in '`t_t`'.

       The idea is the same as in ~solvesub-P6a , but we perform two
       substitutions in sequence.  We first replace all free occurences of 
       '`x`' in '`w_ph`' with a fresh variable '`y`' to get '`w_ps`'.  We
       then replace all free occurences of '`y`' in '`w_ps`' with '`t_t`'
       (remembering to change any conflicting bound variables) in order to
       obtain '`w_ch`'.

       The double substitution above is needed to allow '`x`' to occur in
       the term '`t_t`'.  Again, it can be proved inductively that the
       formulas '`w_ps`' and '`w_ch`', obtained by the double substitution
       described above, satisfy the hypotheses above of this theorem.  We
       can then "solve" for an equivalent direct formula. $)
    solvedsub-P6a $p
        |- ( w_ch <-> A. y ( y = t_t -> A. x ( x = y -> w_ph ) ) )
    $=
        ( term-obj wff-equals wff-imp wff-forall solvesub-P6a subimr-P3.40b.RC
          suballinf-P5 bitrns-P3.33c.RC )
        DIQZFRZBSZITUFGQUERASGTZSZITBDEFIJMNPUAUGUIIBUHUFABCUEGHKLOUAUBUCUD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps b1 $. $d w_ps1 b $. 
    $d w_ch c1 $. $d w_ch1 c $.

    $d a b b1 c c1 x y $.

    example-E6.02a.1 $e |- ( b = b1 -> ( w_ps <-> w_ps1 ) ) $.
    example-E6.02a.2 $e |- ( c = c1 -> ( w_ch <-> w_ch1 ) ) $.

    example-E6.02a.3 $e |- ( w_ph <-> E. x b = ( x x. a ) ) $.
    example-E6.02a.4 $e |- ( w_ps <-> E. x c = ( x x. a ) ) $.
    example-E6.02a.5 $e |- ( w_ch <-> E. y ( x x. b ) = ( y x. a ) ) $.

    $( Eliminating Hypothesis to ~solvedsub-P6a .

       In this example we replace '`b`' in `w_ph` with '`( x x. b )`'. Because
       '`b`' occurs in the term '`( x x. b )`', we first replace '`b`' with
       '`c`' to obtain '`w_ps`'.  Because '`x`' is a bound variable in
       '`w_ph`', we  again use ~cbvallv-P5 to change the bound variable '`x`'
       to '`y`' so as  not to conflict with the substituted term,
       '`( x x. b )`'.  The WFF metavariables '`w_ph`', '`w_ps`', and '`w_ch`'
       defined as hypotheses, exist only to make this example easier to
       follow.  It is easy to locate the important steps, which are...

       '`F/ b w_ps`',

       '`F/ c w_ch`,

       '`( b = c -> ( w_ph <-> w_ps ) ) `',

       and '`( c = ( x x. b ) ) -> ( w_ps <-> w_ch ) )`'. $)
    example-E6.02a $p
        |- ( w_ch <-> A. c ( c = ( x x. b ) -> A. b ( b = c -> w_ph ) ) )
    $=
        ( term-obj term-mult wff-equals wff-exists wff-enfree enfrv-P6
          bisym-P3.33b.RC enfrleq-P6 bimpf-P4.RC wff-bi subeql-P5.CL subexv-P5
          subbid-P3.41c.RC subimr2-P4.RC ax-L9-multl subeqr-P5 cbvexv-P5
          rcp-NDIMP0addall bitrns-P3.33c solvedsub-P6a )
        ABCDEFRZIRZSZIJKLMKRZURHRZSZTZFUAZIUBBIUBVEIUCVEBIBVEPUDZUEUFNUTGRZVBS
        ZTZGUAZKUBDKUBVJKUCVJDKDVJQUDZUEUFUSVCTZFUAZVEUGABUGUSVATZVLVDVNFUSVAV
        CUHUIVMAVEBAVMOUDVFUJUKVEVJUGBDUGVAUTTZVEVAVHTZGUAZVJVOVEVQUGVOVDVPFGU
        RVGTVCVHVAURVGVBULUMUNUOVPVIVOGVAUTVHUHUIUPVEBVJDVFVKUJUKUQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x1 $. $d w_ps1 x $.
    $d w_ch y1 $. $d w_ch1 y $.

    $d w_ph y $. $d w_ph y1 $.
    $d t_t y $.
    $d x x1 y y1 $.

    solvedsub-P6b.1 $e |- ( x = x1 -> ( w_ps <-> w_ps1 ) ) $.
    solvedsub-P6b.2 $e |- F/ x w_ps $.
    solvedsub-P6b.3 $e |- ( y = y1 -> ( w_ch <-> w_ch1 ) ) $.
    solvedsub-P6b.4 $e |- F/ y w_ch $.
    solvedsub-P6b.5 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    solvedsub-P6b.6 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( ~solvedsub-P6a with result substituted back into hypothesis.

       Requires the existence of '`w_ps1 ( x1 )`' as a replacement for
       '`w_ps ( x )`' and '`w_ch1 ( y1 )`' as a replacement for
       '`w_ch ( y )`'.  Also, neither '`y`' nor '`y1`' can occur in '`w_ph`'
       and '`y`' cannot occur in '`t_t`'.

       Note that ~trnsvsubw-P6 must be used to show that 
       '`( x = t_t -> ( w_ph <-> w_ch ) )`', and from there we can substitute
       the explicit formula from ~solvedsub-P6a for '`w_ch`'. $)
    solvedsub-P6b $p
        |- (
          x = t_t -> (
            w_ph <-> A. y ( y = t_t -> A. x ( x = y -> w_ph ) )
          )
        )
    $=
        ( wff-bi term-obj wff-equals wff-imp wff-forall trnsvsubw-P6
          solvedsub-P6a subbir-P3.41b.RC subimr2-P4.RC )
        ADQAIRZFSGRZUFSATGUATIUAZQUGFSABDEFGIJNMOPUBDUHAABCDEFGHIJKLMNOPUCUDUE
    $.
$}


$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Define Proper Substitution.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include proper substitution syntax,
       '`[ t_t / x ]`'. $)
    wff-psub $a wff [ t_t / x ] w_ph $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Justification Theorem.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph y $. $d w_ph z $.
    $d t_t y $. $d t_t z $.
    $d x y z $.

    $( Justification Theorem for ~df-psub-D6.2 . $)
    psubjust-P6 $p
        |- (
          A. y ( y = t_t -> A. x ( y = x -> w_ph ) ) <->
          A. z ( z = t_t -> A. x ( z = x -> w_ph ) )
        )
    $=
        ( term-obj wff-equals wff-imp wff-forall subeql-P5.CL subiml-P3.40a
          suballv-P5 subimd-P3.40c cbvallv-P5 )
        DFZBGZOCFZGZAHZCIZHEFZBGZUAQGZAHZCIZHDEPUBTUEOUAGZOUABJSUDUFCRUCAUFOUA
        QJKLMN
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Definition of Proper Substitution, '`[ t_t / x ] w_ph`'.  Read as 
       "The formula resulting from properly substituting '`t_t`' for '`x`' in
       '`w_ph`'". $)
    df-psub-D6.2 $a
        |- (
          [ t_t / x ] w_ph <-> A. y ( y = t_t -> A. x ( x = y -> w_ph ) )
        )
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Simplified Definition.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
   $d w_ph y $. $d t_t y $.
   $d t_t x $.
   $d x y $.

    $( Simplified Definition of Proper Substitution (restriction on '`t_t`').

       This form can be used whenever '`x`' does not occur in '`t_t`'. $)
    dfpsubv-P6 $p |- ( [ t_t / x ] w_ph <-> A. x ( x = t_t -> w_ph ) ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-imp wff-forall
          df-psub-D6.2 subeqr-P5.CL subiml-P3.40a suballv-P5 solvesub-P6a.VR
          bisym-P3.33b.RC bitrns-P3.33c.RC )
        ABCDEFZBGZCFZQGZAHZCIZHEIZSBGZAHZCIZABCEJUFUCUBUFBEUAUERCTUDARQBSKLMNO
        P
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Scheme Completion Axiom ax-L12.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

  Notice that ~ax-L12 is really just the result of ~solvesub-P6b ...

  '`( x = t_t -> ( w_ph <-> A. x ( x = t_t -> w_ph ) ) )`',

  with the only the forward direction of the biconditional stated.  Therefore
  you might expect that it will allow us to eliminate the hypotheses
  associated with this theorem.  Also, note that given an arbitrary WFF
 '`w_ph`', the existence of WFFs, '`w_ps`' and '`w_ps1`', satisfying all the
  hypotheses of ~solvesub-P6b , can be shown to exist using meta-theorems.
  Because of this, ~ax-L12 can also be proved as a meta-theorem.  This means
  ~ax-L12 logically follows from the FOL axioms ( L1 through L9 ) alone.
  Indeed, specific cases can always be proven within the metamath language,
  as shown by the hypothesis elimination examples.  However, within the 
  metamath language, general statements of the conclusion of ~solvesub-P6b ,
  i.e. ones containing WFF meta-variables, will require ~ax-L12 . 

  ~ax-L12 will also allow us to eliminate the hypothesis on the Law of
  Specialization ( ~specw-P5 ) and its dual ( ~exiw-P5 ).  We also state the
  traditional texbook forms of these two laws ( ~specpsub-P6 and
  ~exipsub-P6 ), based on proper substitution.  Note that these textbook forms
  do not require ~ax-L12 (or any meta-theorems).  This may lead one to think
  that ~ax-L12 is unnecessary.  The problem is, though logically equivalent to
  the standard definition, the explicit definition of proper substitution
  requires ~ax-L12 to be of any practical use.
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Existential Quantifier Introduction and Specialization Revisited.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Basic Forms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These forms require ~ax-L12 .
$)

${
    $d w_ph y $.
    $d x y $.

    $( Existential Quantifier Introduction Law. 

       See ~exiw-P5 for a version that requires only FOL axioms. $)
    exi-P6 $p |- ( w_ph -> E. x w_ph ) $=
        ( term-obj objvar-y wff-equals wff-exists wff-imp wff-forall ax-L12
          alloverimex-P5.CL rcp-NDIMP0addall syl-P3.24 axL6ex-P5 mae-P3.23
          eqsym-P5.CL.SYM subexinf-P5 bimpr-P4.RC exiav-P5.SH )
        BCZDCZEZAABFZGDAUABFZUBUAAUAAGBHZUCUBGZUAATBIUDUEGUAUAABJKLUCUATBMKNUA
        DFTSEZDFSDMUAUFDSTOPQR
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Law of Specialization.

       See ~specw-P5 for a version that requires only FOL axioms. $)
    spec-P6 $p |- ( A. x w_ph -> w_ph ) $=
        ( wff-neg wff-exists wff-forall exi-P6 trnsp-P3.31b.RC allasex-P5
          bisym-P3.33b.RC subiml2-P4.RC )
        ACZBDZCZABEZAALKBFGNMABHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Traditional Textbook Forms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These forms do not require ~ax-L12 .
$)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Existential Quantifier Introduction Law (proper substitution).

       This is the form most often seen in logic text books. $)
    exipsub-P6 $p |- ( [ t_t / x ] w_ph -> E. x w_ph ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-imp wff-forall wff-exists
          df-psub-D6.2 rcp-NDBIEF0 alloverimex-P5.CL axL6ex-P5 mae-P3.23.RC
          exiav-P5 dsyl-P3.25.RC )
        ABCDZEFZBGZCFSGZAHCIZHEIZUBEJZACJZRUCABCEKLUCTEJUDTUBEMBENOUBUEEUBUACJ
        UEUAACMSCNOPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Law of Specialization. (proper substitution).

       This is the form most often seen in logic text books. $)
    specpsub-P6 $p |- ( A. x w_ph -> [ t_t / x ] w_ph ) $=
        ( objvar-y term-obj wff-equals wff-imp wff-forall wff-psub
          axL1-P3.21.CL alloverim-P5.RC.GEN axL1-P3.21 allicv-P5 df-psub-D6.2
          bisym-P3.33b.RC subimr2-P4.RC )
        DEZBFZCEQFZAGZCHZGZDHZABCIZACHZUEUBDUARUEATCASJKLMUDUCABCDNOP
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened Quantifier Removal Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    qremall-P6.1 $e |- F/ x w_ph $.

    $( Universal Quantifier Removal (non-freeness condition). 

       See ~qremallw-P6 for a version that requires only FOL axioms. $)
    qremall-P6 $p |- ( A. x w_ph <-> w_ph ) $=
        ( wff-forall spec-P6 wff-exists exi-P6 wff-enfree wff-imp
          dfenfreealt-P6 bimpf-P4.RC syl-P3.24.RC rcp-NDBII0 )
        ABDZAABEAABFZNABGABHONICABJKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qremex-P6.1 $e |- F/ x w_ph $.

    $( Existential Quantifier Removal (non-freeness condition). 

       See ~qremexw-P6 for a version that requires only FOL axioms. $)
    qremex-P6 $p |- ( E. x w_ph <-> w_ph ) $=
        ( wff-exists wff-forall wff-enfree wff-imp dfenfreealt-P6 bimpf-P4.RC
         spec-P6 syl-P3.24.RC exi-P6 rcp-NDBII0 )
        ABDZANABEZAABFNOGCABHIABJKABLM
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Implicit / Explicit Substitution Conversion.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  The need for a proof of the statement, ~lemma-L6.01a , is was the main
  motivation for ~ax-L12 .
$)

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( This lemma is the result of ~solvesub-P6b with no hypothesis 
       required. 

       '`x`' cannot occur in '`t_t`'. $)
    lemma-L6.01a $p |- ( x = t_t -> ( w_ph <-> A. x ( x = t_t -> w_ph ) ) ) $=
        ( term-obj wff-equals wff-imp wff-forall ax-L12 spec-P6
          imcomm-P3.27.RC ndbii-P3.13 )
        ACDBEZAFZCGZLABCHNLAMCIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( Conversion From Explicit to Implicit Substitution (for when '`t_t`'
       does not contain '`x`').

       '`x`' cannot occur in '`t_t`'.

       The full form is proved later as ~psubtoisub-P6 . $)
    psubtoisubv-P6 $p |- ( x = t_t -> ( w_ph <-> [ t_t / x ] w_ph ) ) $=
        ( term-obj wff-equals wff-imp wff-forall wff-bi wff-psub lemma-L6.01a
          dfpsubv-P6 bisym-P3.33b.RC subbir-P3.41b.RC subimr2-P4.RC )
        ACDBEZAFCGZHAABCIZHOABCJPQAQPABCKLMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    lemma-L6.02a.1 $e |- F/ x w_ps $.
    lemma-L6.02a.2 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Simular to ~solvesub-P6a , but using ~ax-L12 . 

       '`x`' cannot occur in '`t_t`'. $)
    lemma-L6.02a $p |- ( A. x ( x = t_t -> w_ph ) <-> w_ps ) $=
        ( term-obj wff-equals wff-imp wff-forall wff-exists wff-true wff-bi
          imoverbi-P4.30b bimpf-P4.RC suballinf-P5 qimeqallb-P6
          bisym-P3.33b.RC axL6ex-P5 thmeqtrue-P4.21a qremall-P6
          subimd-P3.40c.RC trueie-P4.22a tbitrns-P4.17.RC )
         DGCHZAIZDJUEBIZDJZUEDKZBDJZIZLZBIBUFUGDUEABMIUFUGMFUEABNOPUKUHUEBDEQR
         UIULUJBUICDSTBDEUAUBBUCUD
     $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    isubtopsubv-P6.1 $e |- F/ x w_ps $.
    isubtopsubv-P6.2 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Conversion from Implicit to Explicit Substitution (restriction on
       '`t_t`').

       '`x`' cannot occur in '`t_t`'. $)
    isubtopsubv-P6 $p |- ( [ t_t / x ] w_ph <-> w_ps ) $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall dfpsubv-P6
          lemma-L6.02a bitrns-P3.33c.RC )
        ACDGDHCIAJDKBACDLABCDEFMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t y $.
    $d x y $.

    lemma-L6.03a.1 $e |- F/ x w_ps $.
    lemma-L6.03a.2 $e |- F/ y w_ch $.
    lemma-L6.03a.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    lemma-L6.03a.4 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( Similar to ~solvedsub-P6a but using ~ax-L12 . 

       '`y`' cannot occur in '`t_t`'. $)
    lemma-L6.03a $p
        |- ( A. y ( y = t_t -> A. x ( x = y -> w_ph ) ) <-> w_ch )
    $=
        ( term-obj wff-equals wff-imp wff-forall lemma-L6.02a subimr-P3.40b.RC
          suballinf-P5 bitrns-P3.33c.RC )
        FKZDLZEKSLAMENZMZFNTBMZFNCUBUCFUABTABSEGIOPQBCDFHJOR
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    isubtopsub-P6.1 $e |- F/ x w_ps $.
    isubtopsub-P6.2 $e |- F/ y w_ch $.
    isubtopsub-P6.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    isubtopsub-P6.4 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( Conversion from Implicit to Explicit Substitution with Intermediate
       Formula.

       '`y`' cannot occur in either '`w_ph`' or '`t_t`'.

       If '`y`' is a fresh variable that appears in the intermediate WFF
       '`w_ps`', then we can substitute '`t_t`' for '`x`' even when '`x`'
       occurs in '`t_t`'. $)
    isubtopsub-P6 $p |- ( [ t_t / x ] w_ph <-> w_ch ) $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall df-psub-D6.2
          lemma-L6.03a bitrns-P3.33c.RC )
        ADEKFLZDMELSMANEONFOCADEFPABCDEFGHIJQR
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Scheme Completion Axioms ax-L10 and ax-L11.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened "General For" Rules (first half).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These rules require ~ax-L10 but not ~ax-L12 .
$)

${
    $( The WFF '`-. A. x w_ph`' is General For '`x`'.

       If this result is stated as an axiom ( ~ax-L10 ), then all the other
       related "general for" rules will follow (though half will require
       ~ax-L12 as well). 

       See ~gennallw-P6 for a version that requires only FOL axioms. $)
    gennall-P6 $p |- ( -. A. x w_ph -> A. x -. A. x w_ph ) $=
        ( ax-L10 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( The WFF '`E. x w_ph`' is General For '`x`'. 

       See ~genexw-P6 for a version that requires only FOL axioms. $)
    genex-P6 $p |- ( E. x w_ph -> A. x E. x w_ph ) $=
        ( wff-neg wff-forall wff-imp wff-exists gennall-P6 df-exists-D5.1
          bisym-P3.33b.RC suballinf-P5 subimd-P3.40c.RC bimpf-P4.RC )
        ACZBDCZNBDZEABFZPBDZEMBGNPOQPNABHIZNPBRJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Dual of ~genall-P6 . 

       See ~exgenallw-P6 for a version that requires only FOL axioms. $)
    exgenall-P6 $p |- ( E. x A. x w_ph -> A. x w_ph ) $=
        ( wff-forall wff-exists wff-imp wff-neg gennall-P6
          lemma-L5.01a bimpr-P4.RC )
        ABCZBDJEJFZKBCEABGJBHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened "General For" / "Not Free" Conversion Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  The inference "`x` is ENF in `w_ph` `=>` `w_ph` is general for `x`" 
  requires ~ax-L12 but not ~ax-L10 .

  The inference "`w_ph` is general for `x` `=>` `x` is ENF in `w_ph`"
  requires ~ax-L10 but not ~ax-L12 .
$)

${
    enfrgen-P6.1 $e |- F/ x w_ph $.

    $( ENF in `=>` General for.

       If '`x`' is effectively not free in '`w_ph`', then '`w_ph`' is general
       for '`x`'. 

       See ~enfrgenw-P6 for a version that requires only FOL axioms. $)
    enfrgen-P6 $p |- ( w_ph -> A. x w_ph ) $=
        ( wff-exists wff-forall exi-P6 wff-enfree wff-imp dfenfreealt-P6
          bimpf-P4.RC syl-P3.24.RC )
        AABDZABEZABFABGLMHCABIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    genenfr-P6.1 $e |- ( w_ph -> A. x w_ph ) $.

    $( General for `=>` ENF in.

       If '`w_ph`' is general for '`x`', then '`x`' is effectively not free in
       '`w_ph`'. 

       See ~genenfrw-P6 for a version that requires only FOL axioms. $)
    genenfr-P6 $p |- F/ x w_ph $=
        ( wff-enfree wff-exists wff-forall wff-imp alloverimex-P5.RC.GEN
          exgenall-P6 syl-P3.24.RC dfenfreealt-P6 bimpr-P4.RC )
        ABDABEZABFZGMNBENANBCHABIJABKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrexgen-P6.1 $e |- F/ x w_ph $.

    $( Dual Form of ~enfrgen-P6 . 

       See ~enfrexgenw-P6 for a version that requires only FOL axioms. $)
    enfrexgen-P6 $p |- ( E. x w_ph -> w_ph ) $=
        ( wff-exists wff-imp wff-neg wff-forall wff-enfree enfrneg-P6
          bimpr-P4.RC enfrgen-P6 lemma-L5.01a )
        ABDAEAFZMBGEMBMBHABHCABIJKABLJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exgenenfr-P6.1 $e |- ( E. x w_ph -> w_ph ) $.

    $( Dual Form of ~genenfr-P6 . 

       See ~exgenenfrw-P6 for a version that requires only FOL axioms. $)
    exgenenfr-P6 $p |- F/ x w_ph $=
        ( wff-neg wff-enfree wff-exists wff-imp wff-forall lemma-L5.01a
          bimpf-P4.RC genenfr-P6 enfrneg-P6 )
        ADZBEABEMBABFAGMMBHGCABIJKABLJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened "General For" Rules (second half).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These rules require ~ax-L10 and ~ax-L12 .
$)

${
    $( The WFF '`A. x w_ph`' is General For '`x`'. 

       See ~genallw-P6 for a version that requires only FOL axioms. $)
    genall-P6 $p |- ( A. x w_ph -> A. x A. x w_ph ) $=
        ( wff-forall wff-neg wff-enfree gennall-P6 genenfr-P6 enfrneg-P6
          bimpf-P4.RC enfrgen-P6 )
        ABCZBKDZBEKBELBABFGKBHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( The WFF '`-. E. x w_ph`' is General For '`x`'. 

       See ~gennexw-P6 for a version that requires only FOL axioms. $)
    gennex-P6 $p |- ( -. E. x w_ph -> A. x -. E. x w_ph ) $=
        ( wff-neg wff-forall wff-exists genall-P6 allnegex-P5 suballinf-P5
          subimd2-P4.RC )
        ACZBDZABECZKBDLBDJBFABGZKLBMHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened Quantifier Commutivity Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These rules require ~ax-L11 .
$)

${
    $d x y $.

    $( Universal Quantifier Commutivity. 

       See ~allcommw-P5 for a version that requires only FOL axioms. $)
    allcomm-P6 $p |- ( A. x A. y w_ph <-> A. y A. x w_ph ) $=
        ( wff-forall ax-L11 rcp-NDBII0 ) ACDBDABDCDABCEACBEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    $( Existential Quantifier Commutivity.

       See ~excommw-P5 for a version that requires only FOL axioms. $)
    excomm-P6 $p |- ( E. x E. y w_ph <-> E. y E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall allcomm-P6 lemma-L5.03a subbid2-P4.RC
          negbicancel-P4.11.RC )
        ACDBDZABDCDZAEZCFBFKEMBFCFLEMBCGABCHACBHIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Strengthened Effective Non-Freeness Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  ~enfrex1-P6 and ~enfrex2-P6 require ~ax-L12 .
  
  ~enfrall1-P6 and ~enfrall2-P6 require ~ax-L10 and ~ax-L12 .  

  ~enfrall2-P6 and ~enfrex2-P6 require ~ax-L11 .
$)

${
    $( ENF Over Universal Quantifier (same variable).

       See ~enfrall1w-P6 for a version that requires only FOL axioms. $)
    enfrall1-P6 $p |- F/ x A. x w_ph $=
        ( wff-forall genall-P6 genenfr-P6 ) ABCBABDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ENF Over Existential Quantifier (same variable).

       See ~enfrex1w-P6 for a version that requires only FOL axioms. $)
    enfrex1-P6 $p |- F/ x E. x w_ph $=
        ( wff-exists genex-P6 genenfr-P6 ) ABCBABDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    enfrall2-P6.1 $e |- F/ x w_ph $.

    $( ENF Over Universal Quantifier (different variable). 

       See ~enfrall2w-P6 for a version that requires only FOL axioms. $)
    enfrall2-P6 $p |- F/ x A. y w_ph $=
        ( wff-forall enfrgen-P6 alloverim-P5.RC.GEN allcomm-P6 rcp-NDBIEF0
          syl-P3.24.RC genenfr-P6 )
        ACEZBLABEZCEZLBEZAMCABDFGNOACBHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    enfrex2-P6.1 $e |- F/ x w_ph $.

    $( ENF Over Existential Quantifier (different variable).

       See ~enfrex2w-P6 for a version that requires only FOL axioms. $)
    enfrex2-P6 $p |- F/ x E. y w_ph $=
        ( wff-exists excomm-P6 rcp-NDBIEF0 enfrexgen-P6
          alloverimex-P5.RC.GEN syl-P3.24.RC exgenenfr-P6 )
        ACEZBLBEZABEZCEZLMOABCFGNACABDHIJK
    $.
$}



$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Replacing Variable Restrictions with Non-Freeness Conditions.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Basic Quantifier Rules with Non-Freeness Conditions.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    allic-P6.1 $e |- F/ x w_ph $.
    allic-P6.2 $e |- ( w_ph -> w_ps ) $.

    $( Introduction of Universal Quantifier as Consequent (non-freeness
       condition). 

       This proposition is equivalent to the '`A.`' introduction rule in the
       natural deduction system. $)
    allic-P6 $p |- ( w_ph -> A. x w_ps ) $=
        ( wff-forall enfrgen-P6 alloverim-P5.RC.GEN syl-P3.24.RC )
        AACFBCFACDGABCEHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exia-P6.1 $e |- F/ x w_ps $.
    exia-P6.2 $e |- ( w_ph -> w_ps ) $.

    $( Introduction of Existential Quantifier as Antecedent (non-freeness
       condition).

       This proposition is equivalent to the '`E.`' elimination rule in the
       natural deduction system. $)
    exia-P6 $p |- ( E. x w_ph -> w_ps ) $=
        ( wff-exists alloverimex-P5.RC.GEN enfrexgen-P6 syl-P3.24.RC )
        ACFBCFBABCEGBCDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    alloverim-P5.GENF.1 $e |- F/ x w_ga $.
    alloverim-P5.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverim-P5 with Generalization (non-freeness condition). $)
    alloverim-P5.GENF $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp allic-P6 alloverim-P5 ) ABCDCABGDEFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    alloverimex-P5.GENF.1 $e |- F/ x w_ga $.
    alloverimex-P5.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverimex-P5 with Generalization (non-freeness condition). $)
    alloverimex-P5.GENF $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-imp allic-P6 alloverimex-P5 ) ABCDCABGDEFHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Change of Bound Variables Theorems with Non-Freeness Conditions.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d t_t x $.

    lemma-L6.04a.1 $e |- F/ x w_ps $.
    lemma-L6.04a.2 $e |- ( x = t_t -> ( w_ph -> w_ps ) ) $.

    $( Version of ~lemma-L5.02a with non-freeness condition. 

       '`x` cannot occur in '`t_t`'. $)
    lemma-L6.04a $p |- ( A. x w_ph -> w_ps ) $=
        ( wff-forall wff-exists term-obj wff-equals imcomm-P3.27.RC
          dalloverimex-P5.RC.GEN axL6ex-P5 mae-P3.23.RC enfrexgen-P6
          syl-P3.24.RC )
        ADGZBDHZBQDICJZDHRASBDSABFKLCDMNBDEOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvall-P6-L1.1 $e |- F/ x w_ps $.
    cbvall-P6-L1.2 $e |- F/ y w_ph $.
    cbvall-P6-L1.3 $e |- ( x = y -> ( w_ph -> w_ps ) ) $.

    $( Lemma for ~cbvall-P6 . $)
    cbvall-P6-L1 $p |- ( A. x w_ph -> A. y w_ps ) $=
        ( wff-forall enfrall2-P6 term-obj lemma-L6.04a allic-P6 )
        ACHBDADCFIABDJCEGKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvall-P6.1 $e |- F/ x w_ps $.
    cbvall-P6.2 $e |- F/ y w_ph $.
    cbvall-P6.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`A. x`' (non-freeness
       condition). $)
    cbvall-P6 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( wff-forall term-obj wff-equals ndbief-P3.14 cbvall-P6-L1 wff-imp
          ndbier-P3.15 eqsym-P5.CL.SYM subiml2-P4.RC rcp-NDBII0 )
        ACHBDHABCDEFABCIZDIZJZGKLBADCFETSRJBAMABTGNRSOPLQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvex-P6.1 $e |- F/ x w_ps $.
    cbvex-P6.2 $e |- F/ y w_ph $.
    cbvex-P6.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`E. x`' (non-freeness
       condition). $)
    cbvex-P6 $p |- ( E. x w_ph <-> E. y w_ps ) $=
        ( wff-exists wff-neg wff-forall df-exists-D5.1 wff-enfree enfrneg-P6
          bimpr-P4.RC term-obj wff-equals subneg-P3.39 cbvall-P6
          subneg-P3.39.RC bisym-P3.33b.RC dbitrns-P4.16.RC )
        ACHAIZCJZIBIZDJZIZBDHZACKUCUEUBUDCDUDCLBCLEBCMNUBDLADLFADMNABCODOPGQRS
        UGUFBDKTUA
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  (Implicit) Substitution Theorems with Non-Freeness Conditions.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    suball-P6.1 $e |- F/ x w_ga $.
    suball-P6.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`A. x`' (non-freeness condition). $)
    suball-P6 $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( wff-forall ndbief-P3.14 alloverim-P5.GENF ndbier-P3.15 ndbii-P3.13 )
        ADGBDGCABCDEABCFHIBACDEABCFJIK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subex-P6.1 $e |- F/ x w_ga $.
    subex-P6.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`E. x `'(non-freeness condition). $)
    subex-P6 $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( wff-exists ndbief-P3.14 alloverimex-P5.GENF ndbier-P3.15 ndbii-P3.13 )
        ADGBDGCABCDEABCFHIBACDEABCFJIK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subenfr.1 $e |- F/ x w_ga $.
    subenfr.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`F/ x`' Predicate. $)
    subenfr-P6 $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( wff-exists wff-forall wff-imp wff-enfree subex-P6 suball-P6
          subimd-P3.40c wff-bi dfenfreealt-P6 bisym-P3.33b.RC rcp-NDIMP0addall
          subbid2-P4 )
        ADGZADHZIZADJZBDGZBDHZIZBDJZCSUCTUDCABCDEFKABCDEFLMUAUBNCUBUAADOPQUEUF
        NCUFUEBDOPQR
    $.
$}

${
    $d w_ga x $.

    subenfr-P6.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Variable Restricted Form of ~subenfr-P6 . 

       '`x`' cannot occur in '`w_ga`'. $)
    subenfr-P6.VR $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( enfrv-P6 subenfr-P6 ) ABCDCDFEG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Grouping Laws with Non-Freeness Conditions.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    qgallimr-P6.1 $e |- F/ x w_ph $.

    $( Quantifier Grouping Law, Universal Quantifier Right on Implication
       (non-freeness condition). $)
    qgallimr-P6 $p
        |- ( ( w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqalla-P6 qremex-P6
          subiml-P3.40a.RC subbil2-P4.RC )
        ACEZBCFZGAMGABGCFABCDHLAMACDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qgeximr-P6.1 $e |- F/ x w_ph $.

    $( Quantifier Grouping Law, Existential Quantifier Right on Implication
       (non-freeness condition). $)
    qgeximr-P6 $p
        |- ( ( w_ph -> E. x w_ps ) <-> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-exists wff-imp qimeqex-P5 qremall-P6 subiml-P3.40a.RC
          subbil2-P4.RC )
        ACEZBCFZGAMGABGCFABCHLAMACDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qgalliml-P6.1 $e |- F/ x w_ps $.

    $( Quantifier Grouping Law, Universal Quantifier Left on Implication
       (non-freeness condition). $)
    qgalliml-P6 $p
        |- ( ( A. x w_ph -> w_ps ) <-> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-exists wff-imp qimeqex-P5 qremex-P6 subimr-P3.40b.RC
          subbil2-P4.RC )
        ACEZBCFZGLBGABGCFABCHMBLBCDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qgeximl-P6.1 $e |- F/ x w_ps $.

    $( Quantifier Grouping Law, Existential Quantifier Left on Implication
       (non-freeness condition). $)
    qgeximl-P6 $p
        |- ( ( E. x w_ph -> w_ps ) <-> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp qimeqallb-P6 qremall-P6
          subimr-P3.40b.RC subbil2-P4.RC )
        ACEZBCFZGLBGABGCFABCDHMBLBCDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qgexandr-P6.1 $e |- F/ x w_ph $.

    $( Quantifier Grouping Law, Existential Quantifier Right on Conjunction
       (non-freeness condition). $)
    qgexandr-P6 $p |- ( ( w_ph /\ E. x w_ps ) <-> E. x ( w_ph /\ w_ps ) ) $=
        ( wff-exists wff-and wff-neg wff-imp andasim-P3.46a wff-forall
          subexinf-P5 exnegall-P5 qgallimr-P6 bisym-P3.33b.RC allnegex-P5
          subimr-P3.40b.RC bitrns-P3.33c.RC subneg-P3.39.RC dbitrns-P4.16.RC )
        ABCEZFATGZHZGZABFZCEZATIUEUCUEABGZHZGZCEUGCJZGUCUDUHCABIKUGCLUIUBUIAUF
        CJZHZUBUKUIAUFCDMNUJUAABCOPQRSNQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qgexandl-P6.1 $e |- F/ x w_ps $.
    $( Quantifier Grouping Law, Existential Quantifier Left on Conjunction
      (non-freeness condition). $)
    qgexandl-P6 $p |- ( ( E. x w_ph /\ w_ps ) <-> E. x ( w_ph /\ w_ps ) ) $=
        ( wff-exists wff-and wff-neg wff-imp andasim-P3.46a wff-forall
          subexinf-P5 exnegall-P5 wff-enfree enfrneg-P6 bimpr-P4.RC qgeximl-P6
          bisym-P3.33b.RC subneg-P3.39.RC dbitrns-P4.16.RC bitrns-P3.33c.RC )
        ACEZBFUABGZHZGZABFZCEZUABIUFUDUFAUBHZGZCEUGCJZGUDUEUHCABIKUGCLUIUCUCUI
        AUBCUBCMBCMDBCNOPQRSQT
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  More on Proper Substitution.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Explicit to Implicit Substitution Conversion.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  We will now prove the more general formulation of ~psubtoisubv-P6 .
$)

${
    $d t_t y $.
    $d x y $.

    trnsvsub-P6.1 $e |- F/ y w_ph $.
    trnsvsub-P6.2 $e |- F/ y w_ch $.
    trnsvsub-P6.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.
    trnsvsub-P6.4 $e |- ( y = t_t -> ( w_ps <-> w_ch ) ) $.

    $( Strengthened Form of ~trnsvsubw-P6 .

       '`y`' cannot occur in '`t_t`'. $)
    trnsvsub-P6 $p |- ( x = t_t -> ( w_ph <-> w_ch ) ) $=
        ( term-obj wff-equals wff-and wff-exists wff-bi eqmiddle-P6.CL
          joinimandres2-P4.RC bitrns-P3.33c.CL syl-P3.24.RC
          alloverimex-P5.RC.GEN enfrbi-P6 enfrexgen-P6 dsyl-P3.25.RC )
        EKZDLUDFKZLZUEDLZMZFNACOZFNUIDEFPUHUIFUHABOZBCOZMUIUFUJUGUKIJQABCRSTUI
        FACFGHUAUBUC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t y $.
    $d x y $.

    lemma-L6.05a.1 $e |- F/ y w_ph $.

    $( This lemma is the result of ~solvedsub-P6b with no hypothesis
       required. 

       '`y`' cannot occur in '`t_t`'. $)
    lemma-L6.05a $p
        |- (
          x = t_t -> (
            w_ph <-> A. y ( y = t_t -> A. x ( x = y -> w_ph ) )
          )
        )
    $=
        ( term-obj wff-equals wff-imp wff-forall enfrall1-P6 lemma-L6.01a
          trnsvsub-P6 )
        ACFDFZGAHCIZMBGNHZDIBCDEODJAMCKNBDKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Conversion from Explicit to Implicit Substitution.

       This theorem holds even when '`t_t`' contains '`x`'. $)
    psubtoisub-P6 $p |- ( x = t_t -> ( w_ph <-> [ t_t / x ] w_ph ) ) $=
        ( objvar-y term-obj wff-equals wff-imp wff-forall wff-bi wff-psub
          enfrv-P6 lemma-L6.05a df-psub-D6.2 bisym-P3.33b.RC subbir-P3.41b.RC
          subimr2-P4.RC )
        ADEZBFCEZQFAGCHGDHZIAABCJZIRBFABCDADKLSTATSABCDMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( Effective Non-Freeness Over Proper Substitution (restriction on 
       '`t_t`'). 

       Note this only holds when '`t_t`' does not contain '`x`'. $)
    lemma-L6.06a $p |- F/ x [ t_t / x ] w_ph $=
        ( wff-psub wff-enfree term-obj wff-equals wff-imp wff-forall
          enfrall1-P6 dfpsubv-P6 enfrleq-P6 bimpr-P4.RC )
        ABCDZCECFBGAHZCIZCEOCJNPCABCKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Composition of Proper Substitutions.

       This can be taken as a definition of proper substitution for when '`x`'
       occurs in '`t_t`', given the definition where '`x`' does not occur in
       '`t_t`'. 

       '`y`' cannot occur in either '`w_ph`' or '`t_t`'. $)
    psubcomp-P6 $p |- ( [ t_t / x ] w_ph <-> [ t_t / y ] [ y / x ] w_ph ) $=
        ( term-obj wff-psub lemma-L6.06a psubtoisub-P6 isubtopsub-P6 )
        AADEZCFZKBDFBCDAJCGKBDGAJCHKBDHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Change of Bound Variable Using Proper Substitution.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    cbvallpsub-P6.1 $e |- F/ y w_ph $.

    $( Change of Bound Variable for '`A. x`' with Proper Substitution. $)
    cbvallpsub-P6 $p |- ( A. x w_ph <-> A. y [ y / x ] w_ph ) $=
        ( term-obj wff-psub lemma-L6.06a psubtoisub-P6 cbvall-P6 )
        AACEZBFBCAJBGDAJBHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvexpsub-P6.1 $e |- F/ y w_ph $.

    $( Change of Bound Variable for '`E. x`' with Proper Substitution. $)
    cbvexpsub-P6 $p |- ( E. x w_ph <-> E. y [ y / x ] w_ph ) $=
        ( term-obj wff-psub lemma-L6.06a psubtoisub-P6 cbvex-P6 )
        AACEZBFBCAJBGDAJBHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  An Alternate Definition of Proper Substitution.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d t_t x $.

    $( Lemma for ~lemma-L6.06a . $)
    lemma-L6.07a-L1 $p
        |- ( E. x ( x = t_t /\ w_ph ) -> A. x ( x = t_t -> w_ph ) )
    $=
        ( term-obj wff-equals wff-imp wff-forall wff-exists wff-and
          lemma-L6.01a ndbief-P3.14 import-P3.34a.RC alloverimex-P5.RC.GEN
          enfrall1-P6 qremex-P6 subimr2-P4.RC )
        CDBEZAFZCGZCHSQAIZCHTSCQASASQABCJKLMSCRCNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( Lemma for ~lemma-L6.06a . $)
    lemma-L6.07a-L2 $p
        |- ( A. x ( x = t_t -> w_ph ) -> E. x ( x = t_t /\ w_ph ) )
    $=
        ( term-obj wff-equals wff-exists wff-imp wff-forall wff-and
          rcp-NDASM1of2 lemma-L6.01a ndbier-P3.15 import-P3.34a.RC ndandi-P3.7
          alloverimex-P5.RC.GEN enfrall1-P6 qgexandl-P6 bisym-P3.33b.RC
          subiml2-P4.RC axL6ex-P5 idandthml-P4.23a )
        CDBEZCFZUBAGZCHZIZUEUBAIZCFZUBUEIZCFZUFUHUIUGCUBAUIUBUEJUBUEAAUEUBABCK
        LMNOUFUJUBUECUDCPQRSUCUEBCTUAS
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( This lemma is used to construct an alternate definition of proper
       substitution. 

       '`x`' cannot occur in '`t_t`'. $)
    lemma-L6.07a $p
        |- ( A. x ( x = t_t -> w_ph ) <-> E. x ( x = t_t /\ w_ph ) )
    $=
        ( term-obj wff-equals wff-imp wff-forall wff-and wff-exists
          lemma-L6.07a-L2 lemma-L6.07a-L1 rcp-NDBII0 )
        CDBEZAFCGMAHCIABCJABCKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t y $.
    $d x y $.

    $( Equivalency of definitions lemma. 

       '`y`' cannot occur in '`t_t`'. $)
    lemma-L6.08a $p
        |- (
          A. y ( y = t_t -> A. x ( x = y -> w_ph ) ) <->
          E. y ( y = t_t /\ E. x ( x = y /\ w_ph ) )
        )
    $=
        ( term-obj wff-equals wff-imp wff-forall wff-and wff-exists
          lemma-L6.07a subimr-P3.40b.RC suballinf-P5 bitrns-P3.33c.RC )
        DEZBFZCEOFZAGCHZGZDHPQAICJZGZDHPTIDJSUADRTPAOCKLMTBDKN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Alternate Definition of Proper Substitution.

       '`y`' cannot occur in either '`w_ph`' or `t_t`'. $)
    dfpsubalt-P6 $p
        |- (
          [ t_t / x ] w_ph <-> E. y ( y = t_t /\ E. x ( x = y /\ w_ph ) )
        )
    $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall wff-and wff-exists
          df-psub-D6.2 lemma-L6.08a bitrns-P3.33c.RC )
        ABCEDFZBGZCFOGZAHCIHDIPQAJCKJDKABCDLABCDMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Separating Atomic WFF Terms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Split Equality.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t a $.
    $d t_u a $.

    $( Lemma for ~spliteq-P6-L1 . $)
    spliteq-P6-L1 $p
        |- ( a = t_t -> ( t_t = t_u <-> E. a ( a = t_t /\ a = t_u ) ) )
    $=
        ( wff-equals term-obj wff-and wff-exists rcp-NDASM1of2 eqtrns-P5.CL
          ndandi-P3.7 exi-P6 syl-P3.24.RC rcp-NDIMI2 wff-imp eqsym-P5
          rcp-NDASM2of2 eqtrns-P5 exiav-P5 rcp-NDIMP0addall ndbii-P3.13 )
        ABDZCEZADZUBBDZFZCGZUCUFUCUAUCUAFZUEUFUCUDUGUCUAHUBABIJUECKLMUFUANUCUE
        UACUEAUBBUEUBAUCUDHOUCUDPQRST
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t a $.
    $d t_u a $.

    $( Split Equality Into Left and Right Halves. 

       '`a`' is distinct from all other variables. $)
    spliteq-P6 $p |- ( t_t = t_u <-> E. a ( a = t_t /\ a = t_u ) ) $=
        ( term-obj wff-equals wff-exists wff-and wff-bi axL6ex-P5 enfrv-P6
          enfrex1-P6 enfrbi-P6 spliteq-P6-L1 exia-P6 rcp-NDIME0 )
        CDZAEZCFABEZQPBEGZCFZHZACIQUACRTCRCJSCKLABCMNO
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Split Primitive Predicate.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t a $. $d t_u a $.
    $d t_t b $. $d t_u b $.
    $d a b $.

    $( Lemma for ~splitelof-P6 . $)
    splitelof-P6-L1 $p
        |- (
          ( a = t_t /\ b = t_u ) -> 
          ( t_t e. t_u <-> E. a E. b ( ( a = t_t /\ b = t_u ) /\ a e. b ) )
        )
    $=
        ( wff-elemof term-obj wff-equals wff-and wff-exists rcp-NDASM1of2
          subelofd-P5.CL ndbier-P3.15 import-P3.34a.RC ndandi-P3.7 exi-P6
          dsyl-P3.25.RC rcp-NDIMI2 wff-imp ndbief-P3.14 exiav-P5
          rcp-NDIMP0addall ndbii-P3.13 )
        ABEZCFZAGDFZBGHZUDUEEZHZDIZCIZUFUJUFUCUFUCHZUHUIUJUFUGUKUFUCJUFUCUGUGU
        CUFUDAUEBKZLMNUHDOUICOPQUJUCRUFUIUCCUHUCDUFUGUCUGUCUFULSMTTUAUB
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t a $. $d t_u a $.
    $d t_t b $. $d t_u b $.
    $d a b $.

    $( Split "Element Of" Predicate Into Left and Right Halves. 
 
       '`a`' and '`b`' are distinct from all other variables. $)
    splitelof-P6 $p
        |- ( t_t e. t_u <-> E. a E. b ( ( a = t_t /\ b = t_u ) /\ a e. b ) )
    $=
        ( term-obj wff-equals wff-exists wff-elemof wff-and wff-bi axL6ex-P5
          enfrv-P6 enfrex1-P6 enfrex2-P6 enfrbi-P6 wff-imp enfrim-P6
          splitelof-P6-L1 rcp-NDIMI2 exia-P6 rcp-NDIME0 )
        DEZBFZDGABHZCEZAFZUCIUEUBHIZDGZCGZJZBDKUCUJDUDUIDUDDLUHDCUGDMNOUFCGUCU
        JPZACKUFUKCUCUJCUCCLUDUICUDCLU HCMOQUJUFUCABCDRSTUATUA
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Effective Non-Freeness Over Terms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t a $. $d t_t b $.
    $d x a b $.

    enfrterm-P6.1 $e |- F/ x a = t_t $.

    $( Changing the dummy variable doesn't change the ENF state.

       '`a`' and '`b`' are distinct from all other variables. $)
    enfrterm-P6 $p |- F/ x b = t_t $=
        ( term-obj wff-equals wff-enfree wff-forall ax-GEN subeql-P5.CL
          subenfr-P6.VR cbvallv-P5 bimpf-P4.RC spec-P6 rcp-NDIME0 )
        DFZAGZBHZDIZSCFZAGZBHZCITUCCEJUCSCDUBRUAQGBUAQAKLMNSDOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
   $d t_t b $.
   $d t_t a $.
   $d a b x $.

    enfrsucc-P6.1 $e |- F/ x a = t_t $.
    $( If '`x`' is ENF a term '`t_t`', then '`x`' is also ENF in its successor
       's&lsquo;`t_t`'.

       '`a`' is distinct from all other variables. $)
    enfrsucc-P6 $p |- F/ x a = s` t_t $=
        ( objvar-b term-obj wff-equals term_succ wff-enfree enfrv-P6
          rcp-NDIMP0addall enfrterm-P6 ax-L9-succ subeqr-P5 subenfr-P6
          bimpf-P4 axL6ex-P5 exiav-P5.SH )
        EFZAGZCFZAHZGZBIZEUASHZGZBIZUDTUGTUFBJKUFUCTBABCEDLTUEUBUASAMNOPAEQR
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 b $. $d t_t2 b $. 
    $d t_t1 c $. $d t_t2 c $.

    $d t_t1 a $. $d t_t2 a $.
    $d a b c x $.

    enfradd-P6.1 $e |- F/ x a = t_t1 $.
    enfradd-P6.2 $e |- F/ x a = t_t2 $.
    $( If '`x`' is ENF in the terms '`t_t1`' and '`t_t2`', then '`x`' is ENF
       in the sum term '`( t_t1 + t_t2 )`'.

       '`a`' is distinct from all other variables. $)
    enfradd-P6 $p |- F/ x a = ( t_t1 + t_t2 ) $=
        ( objvar-c term-obj wff-equals term-add wff-enfree objvar-b wff-imp
          wff-and enfrv-P6 rcp-NDIMP0addall enfrterm-P6 enfrand-P6
          subaddd-P5.CL subeqr-P5 subenfr-P6 bimpf-P4 rcp-NDIMI2 axL6ex-P5
          exiav-P5.SH )
        GHZBIZDHZABJZIZCKZGLHZAIZUGUKMLUKUMUGUHULUFJZIZCKZUKUMUGNZUPUQUOCOPUOU
        JUQCUMUGCACDLEQBCDGFQRUQUNUIUH ULAUFBSTUAUBUCALUDUEBGUDUE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 b $. $d t_t2 b $.
    $d t_t1 c $. $d t_t2 c $.

    $d t_t1 a $. $d t_t2 a $.
    $d a b c x $.

    enfrmult-P6.1 $e |- F/ x a = t_t1 $.
    enfrmult-P6.2 $e |- F/ x a = t_t2 $.
    $( If '`x`' is ENF in the terms '`t_t1`' and '`t_t2`', then '`x`' is ENF
       in the product term '`( t_t1 x. t_t2 )`'.

       '`a`' is distinct from all other variables. $)
    enfrmult-P6 $p |- F/ x a = ( t_t1 x. t_t2 ) $=
        ( objvar-c term-obj wff-equals term-mult wff-enfree objvar-b wff-imp
          wff-and enfrv-P6 rcp-NDIMP0addall enfrterm-P6 enfrand-P6
          submultd-P5.CL subeqr-P5 subenfr-P6 bimpf-P4 rcp-NDIMI2 axL6ex-P5
          exiav-P5.SH )
        GHZBIZDHZABJZIZCKZGLHZAIZUGUKMLUKUMUGUHULUFJZIZCKZUKUMUGNZUPUQUOCOPUOU
        JUQCUMUGCACDLEQBCDGFQRUQUNUIUHULAUFBSTUAUBUCALUDUEBGUDUE
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Relationship to Textbook Definition.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  Let '`w_ph`' be a well formed formula, '`t_t`' be a term, and '`x`' be an
  object variable.  Now read '`( t_t / x ) w_ph`' as "the formula with '`x`'
  properly replaced by '`t_t`'".  If '`w_ph`' is in primitive form, we define
  grammatical proper substitution using the following recursive rules...

  Case 1: '`w_ph`' is an atomic formula.

  '`( t_t / x ) w_ph` `:=` `w_ph`*',

  where '`w_ph`*' is just '`w_ph`' with every occurence of '`x`' replaced with
  '`t_t`'.

  case 2: '`w_ph` `:=` `-. w_ps`'.

  '`( t_t / x ) w_ph` `:=` `-. ( t_t / x ) w_ps`'.

  Case 3: '`w_ph` `:=` `( w_ps -> w_ch )`'.

  '`( t_t / x ) w_ph` `:=` `( ( t_t / x ) w_ps -> ( t_t / x ) w_ch )`'.

  Case 4: '`w_ph` `:=` `A. x w_ps`'.

  '`( t_t / x ) w_ph` `:=` `w_ph`'.

  Case 5: '`w_ph` `:=` `A. y w_ps`' ('`y`' is different from '`x`').

  '`( t_t / x ) w_ph` `:=` `A. z ( t_t / x ) ( z / y ) w_ps`',

  where '`z`' is a fresh variable that does not occur in '`t_t`' or '`w_ph`'.

  We will call '`[ t_t / x ] w_ph`' (as defined earlier) *effective* proper
  substitution as opposed to *grammatical* proper substitution (as defined
  above.)  We will now prove that
  '`( [ t_t / x ] w_ph <-> ( t_t / x ) w_ph` )' in the case where '`w_ph`' is
  primitive (i.e. contains only '`->`', '`-.`', and '`A.`').  For the general
  case to follow, we need to impose the same constraint on definitions as
  discussed in the note regarding effective non-freeness.

  ----------------------------------------------------------------------------

  Proof:

  We first consider the atomic formula (i.e. case 1).  ~psubspliteq-P6 shows
  that applying effective proper substitution to each side of an equality and
  then combining the two sides via the given formula is the same as applying
  effective proper substitution to the entire formula.  ~psubsplitelof-P6
  shows that the same splitting and combining property applies to predicate
  formulas.  Actually, the same technique will work for any predicate that
  takes individual terms as arguments, including ones that have an arity other
  than 2.  Since effective proper substitution can only be applied to full
  formulas, we use ~psubspliteq-P6 or ~psubsplitelof-P6 to assign a fresh
  variable to the left of each term.
  
  We now use induction on term length to show that the form '`a = t_t`',
  where '`a`' is a distinct object variable, is preserved under effective
  proper substitution, and that the effect of applying effective proper
  substitution is the same as that of applying grammatical proper
  substitution.  That is...

  '`( w_ph <-> a = t_t )` `=>` `( [ t_w / x ] w_ph <-> a = t_t`* `)`'

  where we have used the syntax '`t_t`*' to indicate '`t_t`' with all
  occurrences of '`x`' replaced with '`t_w`'.  For simplicity, we first prove
  the result above for the case where '`x`' does not occur in '`t_t`'.  We can
  later generalize to the case where '`x`' can occur in '`t_w`'.

  Now for the induction. First, let 'n' be the length of the term '`t_t`'
  When 'n `=` 1' (i.e. no functions) we one of the following...

  '`w_ph := a = x`', or

  '`w_ph := a = y`' ('`y`' different from '`x`'), or

  '`w_ph := a = 0`'.

  Now, from ~psubvar1-P6 we have ...

  '`( [ t_w / x ] a = x <-> a = t_w )`',

  from ~psubvar2-P6 we have ...

  '`( [ t_w / x ] a = y <-> a = y )`', and

  from ~psubconst-P6 we have ...

  '`( [ t_w / x ] a = 0 <-> a = 0 )`'.

  Since we expenct '`( x )`*` := t_w`', '`( y )`*` := y`', and
  '`( 0 )`*` := 0`', in all three cases the equivalency is exactly as desired.
  Now consider a term '`t_t`' (not containing '`x`') of length 'n', where for
  every term '`t_s`' (not containing '`x`') of length less than 'n'...

  '`( [ t_w / x ] a = t_s <-> a = t_s`*`)`'.

  For '0 < n' the term '`t_t`' will have the form...

  '`t_t := `s&lsquo;`t_t1`', or 

  '`t_t := ( t_t1 + t_t2 )`', or

  '`t_t := ( t_t1 x. t_t2 )`',

  where '`t_t1`' and '`t_t2`' have length less than 'n'.  Since '`t_w`' does
  not contain '`x`', we can use ~psubsuccv-P6 .  Using '`t_t1`*' for '`t_u1`',
  ~psubsuccv-P6 says that if...

  '`[ t_w / x ] a = t_t1 <-> a = t_t1`*`)`', then

  '`[ t_w / x ] b = `s&lsquo;`t_t1 <-> b = `s&lsquo;`( t_t1`*` ) =
  ( `s&lsquo;`t_t1 )`*'.

  For addition case, we use ~psubaddv-P6 .  Using '`t_t1`*' for '`t_u1`'
  and '`t_t2`*' for '`t_u2`', ~psubaddv-P6 says that if...

  '`[ t_w / x ] a = t_t1 <-> a = t_t1`*`)`' and

  '`[ t_w / x ] b = t_t2 <-> b = t_t2`*`)`', then


  '`[ t_w / x ] c = ( t_t1 + t_t2 ) <-> c = ( t_t1`*`+ t_t2`*`) =
  ( t_t1 x. t_t2 )`*'.

  Similarly, inspecting ~psubmultv-P6 shows that if...

  '`[ t_w / x ] a = t_t1 <-> a = t_t1`*`)`' and

  '`[ t_w / x ] b = t_t2 <-> b = t_t2`*`)`', then


  '`[ t_w / x ] c = ( t_t1 x. t_t2 ) <-> c = ( t_t1`*`x. t_t2`*`) =
   ( t_t1 x. t_t2 )`*'.

  Since '`t_t1`' and '`t_t2`' have length less than 'n', the hypotheses are
  fulfilled.  Therefore, if for every term (not containing '`x`'), '`t_s`', of
  length less than 'n'...

  '`( [ t_w / x ] a = t_s <-> a = t_s`*`)`',

  then for any term (not containing '`x`') of length 'n'...

  '`( [ t_w / x ] b = t_t <-> b = t_t`*`)`'.

  By the induction principle, '`( [ t_w / x ] a = t_t <-> a = t_t`*`)`' holds
  for every term '`t_t`' (so long as it doesn't contain '`x`').

  To deal with terms that are allowed to contain '`x`', we can use
  ~psubcomp-P6 .  ~psubcomp-P6 says that a single substitution for a term
  containing '`x`' is the same as two substitutions with an intermediate dummy
  variable.  Since the intermediate dummy variable is required to be distinct,
  we have two substitutions for which we can apply the previous argument.
  It's trivial to see that if a single substitution leads to the desired
  equivalency, then so will two substitutions applied in succession.
 
  We are now finished with case 1.

  Note that the proofs of ~psubsuccv-P6 , ~psubaddv-P6 , and ~psubmultv-P6 only
  rely on the substitution axioms for functions ( ax-L9 ) which apply to any
  kind of function.  They have nothing to do with any non-logical axioms or
  definitions used to describe the exact nature of the functions appearing in
  the lemmas.  Therefore any arbitrary type of function will have its own
  lemma similar to ~psubaddv-P6 , which when inspected will show that
  equivalence to the desired form is preserved while combining terms as
  function arguments.

  Now that we have dealt with case 1, cases 2 through 5 are fairly trivial.
  Case 2 follows from ~psubneg-P6 , case 3 follows from ~psubim-P6 , case 4
  follows from ~psuball1-P6 , and case 5 follows from ~psuball2-P6 .

  This concludes the proof that '`( [ t_w / x ] w_ph <-> ( t_w / x ) w_ph )`'
  for any WFF.

  QED
$)

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps y $. $d t_t y $.
    $d x y $.

    psubleq-P6.1 $e |- ( w_ph <-> w_ps ) $.

    $( Proper Substitution is Bound to Logical Equivalence. $)
    psubleq-P6 $p |- ( [ t_t / x ] w_ph <-> [ t_t / x ] w_ps ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-imp wff-forall
          df-psub-D6.2 subimr-P3.40b.RC suballinf-P5 bisym-P3.33b.RC
          dbitrns-P4.16.RC )
        ACDFGHZCIZDHQIZAJZDKZJZGKRSBJZDKZJZGKZBCDFZACDGLUBUEGUAUDRTUCDABSEMNMN
        UGUFBCDGLOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    psubenfr-P6.1 $e |- F/ x w_ph $.
    $( Proper Substitution Applied to ENF Variable.

       If '`x`' is effectively not free in '`w_ph`', then replacing '`x`' with
       some '`t_t`' through proper substitution has no effect on '`w_ph`'. $)
    psubenfr-P6 $p |- ( [ t_t / x ] w_ph <-> w_ph ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-imp wff-forall
          df-psub-D6.2 wff-exists wff-true qimeqallb-P6 bisym-P3.33b.RC
          axL6ex-P5 thmeqtrue-P4.21a qremall-P6 subimd-P3.40c.RC trueie-P4.22a
          dbitrns-P4.16.RC subimr-P3.40b.RC suballinf-P5 qimeqallbv-P5
          qremallv-P5 )
        ABCEFGZBHZCGUFHZAICJZIZFJUGAIZFJZAABCFKUJUKFUIAUGUIUHCLZACJZIZMZAIZAUO
        UIUHACDNOUMUPUNAUMUFCPQACDRSATZUAUBUCULUGFLZAFJZIZUQAVAULUGAFUDOUSUPUT
        AUSBFPQAFUESURUAUA
    $.
$}

${
    $d w_ph x $.

    $( Variable Restricted Form of ~psubenfr-P6 . $)
    psubenfr-P6.VR $p |- ( [ t_t / x ] w_ph <-> w_ph ) $=
        ( enfrv-P6 psubenfr-P6 ) ABCACDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    psubthm-P6.1 $e |- w_ph $.

    $( Proper Substitution Applied to a Theorem. $)
    psubthm-P6 $p |- [ t_t / x ] w_ph $=
        ( wff-psub objvar-y term-obj wff-equals wff-imp wff-forall
          rcp-NDIMP0addall ax-GEN df-psub-D6.2 bimpr-P4.RC )
        ABCEFGZBHZCGOHZAIZCJZIZFJTFSPRCAQDKLKLABCFMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~psubneg-P6 . $)
    psubneg-P6-L1 $p
        |- ( A. x ( x = t_t -> -. w_ph ) <-> -. E. x ( x = t_t /\ w_ph ) )
    $=
        ( term-obj wff-equals wff-neg wff-imp wff-forall wff-exists wff-and
          allasex-P5 andasim-P3.46a bisym-P3.33b.RC subexinf-P5
          subneg-P3.39.RC bitrns-P3.33c.RC )
        CDBEZAFGZCHRFZCIZFQAJZCIZFRCKTUBSUACUASQALMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Proper Substitution Over Negation. $)
    psubneg-P6 $p |- ( [ t_t / x ] -. w_ph <-> -. [ t_t / x ] w_ph ) $=
        ( wff-neg wff-psub objvar-y term-obj wff-equals wff-imp wff-forall
          wff-and wff-exists df-psub-D6.2 psubneg-P6-L1 subimr-P3.40b.RC
          suballinf-P5 bitrns-P3.33c.RC dfpsubalt-P6 bisym-P3.33b.RC
          subneg-P3.39.RC dbitrns-P4.16.RC )
        ADZBCEFGZBHZCGUCHZUBICJZIZFJZUDUEAKCLZKFLZDZABCEZDUBBCFMUHUDUIDZIZFJUK
        UGUNFUFUMUDAUCCNOPUIBFNQUJULULUJABCFRSTUA
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps y $. $d t_t y $.
    $d x y $.

    $( Lemma for ~psubim-P6 . $)
    psubim-P6-L1 $p
        |- (
          [ t_t / x ] ( w_ph -> w_ps ) ->
          ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps )
        )
    $=
        ( objvar-y term-obj wff-equals wff-imp wff-forall wff-psub
          axL2-P3.22.CL dalloverim-P5.RC.GEN imsubr-P3.28b.RC axL2-P3.22
          df-psub-D6.2 bisym-P3.33b.RC subiml2-P4.RC subimd-P3.40c.RC
          subimr2-P4.RC )
        EFZCGZDFTGZAHZDIZHZEIZUAUBBHZDIZHZEIZHZACDJZBCDJZHZABHZCDJZUAUBUOHZDIZ
        HZEIZUPUKUSUEUIEUAUDUHUSURUDUHHUAUQUCUGDUBABKLMNLUPUTUOCDEOPQUNUKULUFU
        MUJACDEOBCDEORPS
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~psubim-P6 . $)
    psubim-P6-L2 $p
        |- (
          ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) ->
          [ t_t / x ] ( w_ph -> w_ps )
        )
    $=
        ( wff-psub wff-neg wff-or wff-imp impoe-P4.4a.CL psubthm-P6
          psubim-P6-L1 rcp-NDIME0 psubneg-P6 subiml2-P4.RC axL1-P3.21.CL
          joinimandinc3-P4.RC imasor-P4.32a bisym-P3.33b.RC )
        ACDEZFZBCDEZGZSUAHZABHZCDEZTUEUAAFZCDEZTUEUFUDHZCDEUGUEHUHCDABIJUFUDCD
        KLACDMNBUDHZCDEUAUEHUICDBAOJBUDCDKLPUCUBSUAQRN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Proper Substitution Over Implication. $)
    psubim-P6 $p
        |- (
          [ t_t / x ] ( w_ph -> w_ps ) <->
          ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps )
        )
    $=
        ( wff-imp wff-psub psubim-P6-L1 psubim-P6-L2 rcp-NDBII0 )
        ABECDFACDFBCDFEABCDGABCDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Proper Substitution Over Conjunction. $)
    psuband-P6 $p
        |- (
          [ t_t / x ] ( w_ph /\ w_ps ) <->
          ( [ t_t / x ] w_ph /\ [ t_t / x ] w_ps )
        )
    $=
        ( wff-and wff-psub wff-neg wff-imp andasim-P3.46a psubleq-P6
          psubneg-P6 psubim-P6 subimr-P3.40b.RC bitrns-P3.33c.RC
          subneg-P3.39.RC dbitrns-P4.16.RC bisym-P3.33b.RC )
        ABEZCDFZACDFZBCDFZGZHZGZTUAEZSABGZHZGZCDFUGCDFZGUDRUHCDABIJUGCDKUIUCUI
        TUFCDFZHUCAUFCDLUJUBTBCDKMNOPUEUDTUAIQN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Proper Substitution Over Universal Quantifier (same variable). $)
    psuball1-P6 $p |- ( [ t_t / x ] A. x w_ph <-> A. x w_ph ) $=
        ( wff-forall enfrall1-P6 psubenfr-P6 ) ACDBCACEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Proper Substitution Over Existential Quantifier (same variable). $)
    psubex1-P6 $p |- ( [ t_t / x ] E. x w_ph <-> E. x w_ph ) $=
        ( wff-exists enfrex1-P6 psubenfr-P6 ) ACDBCACEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $. $d t_t y $.
    $d x y $.

    $( Lemma for ~psuball2v-P6 . $)
    psuball2v-P6-L1 $p
        |- ( [ t_t / x ] A. y w_ph <-> A. y [ t_t / x ] w_ph )
    $=
        ( wff-forall wff-psub lemma-L6.06a enfrall2-P6 term-obj wff-equals
          psubtoisub-P6 suballv-P5 isubtopsubv-P6 )
        ADEABCFZDEBCNCDABCGHANCIBJDABCKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph z $. $d t_t z $.
    $d t_t y $.
    $d x y z $.

    $( Proper Substitution Over Universal Quantifier (different variable -
       restriction on '`t_t`'). 

       '`y`' cannot occur in '`t_t`'. $)
    psuball2v-P6 $p |- ( [ t_t / x ] A. y w_ph <-> A. y [ t_t / x ] w_ph ) $=
        ( wff-forall wff-psub objvar-z term-obj psubcomp-P6 psuball2v-P6-L1
          psubleq-P6 bisym-P3.33b.RC suballinf-P5 tbitrns-P4.17.RC )
        ADEZBCFOGHZCFZBGFAPCFZDEZBGFRBGFZDEABCFZDEOBCGIQSBGAPCDJKRBGDJTUADUATA
        BCGILMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t y $.
    $d x y $.

    $( Proper Substitution Over Existential Quantifier (different variable -
       restriction on '`t_t`'). 

       '`y`' cannot occur in '`t_t`'. $)
    psubex2v-P6 $p |- ( [ t_t / x ] E. y w_ph <-> E. y [ t_t / x ] w_ph ) $=
        ( wff-exists wff-psub wff-neg wff-forall df-exists-D5.1 psubleq-P6
          psubneg-P6 psuball2v-P6 suballinf-P5 bitrns-P3.33c.RC
          subneg-P3.39.RC bisym-P3.33b.RC tbitrns-P4.17.RC )
        ADEZBCFAGZDHZGZBCFTBCFZGABCFZGZDHZGZUCDEZRUABCADIJTBCKUBUEUBSBCFZDHUES
        BCDLUHUDDABCKMNOUGUFUCDIPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t z $.
    $d x y z $.

    psuball2-P6.1 $e |- F/ z w_ph $.

    $( Proper Substitution Over Universal Quantifier (different variable -
       non-freeness condition). 

       '`z`' cannot occur in '`t_t`'. $)
    psuball2-P6 $p
        |- ( [ t_t / x ] A. y w_ph <-> A. z [ t_t / x ] [ z / y ] w_ph )
    $=
        ( wff-forall wff-psub term-obj cbvallpsub-P6 psubleq-P6 psuball2v-P6
          bitrns-P3.33c.RC )
        ADGZBCHAEIDHZEGZBCHOBCHEGNPBCADEFJKOBCELM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t z $.
    $d x y z $.

    psubex2-P6.1 $e |- F/ z w_ph $.

    $( Proper Substitution Over Existential Quantifier (different variable -
       non-freeness condition).
    
       '`z`' cannot occur in '`t_t`'. $)
    psubex2-P6 $p
        |- ( [ t_t / x ] E. y w_ph <-> E. z [ t_t / x ] [ z / y ] w_ph )
    $=
        ( wff-exists wff-psub term-obj cbvexpsub-P6 psubleq-P6 psubex2v-P6
          bitrns-P3.33c.RC )
        ADGZBCHAEIDHZEGZBCHOBCHEGNPBCADEFJKOBCELM
    $.
$}


$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Proper Substitution Applied to Atomic Formulae.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t a $. $d t_u a $. $d t_w a $.
    $d a x $.

    $( Apply Proper Substitution to Split Equlity.

       '`a`' is distinct from all other variables. $)
    psubspliteq-P6 $p
        |- (
          [ t_w / x ] t_t = t_u <->
          E. a ( [ t_w / x ] a = t_t /\ [ t_w / x ] a = t_u )
        )
    $=
        ( wff-equals wff-psub term-obj wff-and wff-exists spliteq-P6
          psubleq-P6 psubex2v-P6 psuband-P6 subexinf-P5 dbitrns-P4.16.RC )
        ABFZCDGEHZAFZRBFZIZEJZCDGUACDGZEJSCDGTCDGIZEJQUBCDABEKLUACDEMUCUDESTCD
        NOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t a $. $d t_u a $. $d t_w a $.
    $d t_t b $. $d t_u b $. $d t_w b $.
    $d a b x $.

    $( Apply Proper Substitution to Split "Element Of" Predicate.

       '`a`' and '`b`' are distinct form all other variables. $)
    psubsplitelof-P6 $p
        |- (
          [ t_w / x ] t_t e. t_u <->
          E. a E. b (
            ( [ t_w / x ] a = t_t /\ [ t_w / x ] b = t_u ) /\ a e. b
          )
        )
    $=
        ( wff-elemof wff-psub term-obj wff-equals wff-and wff-exists
          splitelof-P6 psubleq-P6 psubex2v-P6 subexinf-P5 psuband-P6
          psubenfr-P6.VR subandd-P3.42c.RC bitrns-P3.33c.RC tbitrns-P4.17.RC )
        ABGZCDHEIZAJZFIZBJZKZUCUEGZKZFLZELZCDHUJCDHZELUICDHZFLZELUDCDHUFCDHKZU
        HKZFLZELUBUKCDABEFMNUJCDEOULUNEUICDFOPUNUQEUMUPFUMUGCDHZUHCDHZKUPUGUHC
        DQURUOUSUHUDUFCDQUHCDRSTPPUA $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Proper Substitution Applied to Atomic Terms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t y $.
    $d t_t a $.
    $d a x y $.

    $( Proper Substitution Applied to Atomic Term (same variable).

       '`a`' is distinct from all other variables. $)
    psubvar1-P6 $p |- ( [ t_t / x ] a = x <-> a = t_t ) $=
        ( term-obj wff-equals objvar-y enfrv-P6 subeqr-P5.CL isubtopsub-P6 )
        CDZBDZEJFDZEZJAEZABFMBGNFGKLJHLAJHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t a $.
    $d a x y $.

    $( Proper Substitution Applied to Atomic Term (different variable).

       '`a`' is distinct from all other variables. $)
    psubvar2-P6 $p |- ( [ t_t / x ] a = y <-> a = y ) $=
        ( term-obj wff-equals psubenfr-P6.VR ) DECEFABG
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    $d t_t a $.
    $d a x $.

    $( Proper Substitution Applied to Atomic Term (constant).

    '`a`' is distinct from all other variables. $)
    psubconst-P6 $p |- ( [ t_t / x ] a = 0 <-> a = 0 ) $=
        ( term-obj term_zero wff-equals psubenfr-P6.VR ) CDEFABG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Proper Substitution Applied to Terms with Functions.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t a $. $d t_u a $. $d t_w a $.
    $d t_t b $. $d t_u b $. $d t_w b $.
    $d a b x $.

    psubsuccv-P6-L1.1 $e |- ( [ t_w / x ] a = t_t <-> a = t_u ) $.

    $( Lemma for ~psubsuccv-P6 . $)
    psubsuccv-P6-L1 $p |- ( x = t_w -> ( b = s` t_t <-> b = s` t_u ) ) $=
        ( term-obj wff-equals term_succ wff-bi wff-imp wff-and rcp-NDASM1of2
          eqsym-P5 wff-psub psubtoisub-P6 rcp-NDIMP0addall bitrns-P3.33c
          import-P3.34a.RC bimpf-P4 eqtrns-P5 subsucc-P5 subeqr-P5 rcp-NDIMI2
          axL6ex-P5 exiav-P5.SH )
        EHZAIZDHCIZFHZAJZIUKBJZIKZLEUNUIUJUIUJMZULUMUKUOABUOAUHBUOUHAUIUJNZOUI
        UHBIZUOUPUIUJUIUQKZUJURLUIUIUICDPZUQUJUICDQUSUQKUJGRSRTUAUBUCUDUEAEUFU
        G
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t a $. $d t_u a $. $d t_w a $.
    $d t_t b $. $d t_u b $. $d t_w b $.
    $d t_w x $.
    $d a b x $.

    psubsuccv-P6.1 $e |- ( [ t_w / x ] a = t_t <-> a = t_u ) $.
    $( Proper Substitution Over Successor Function (variable restriction).

       '`a`' and '`b`' are distinct from all other variables and '`x`' cannot
       occur in '`t_w`'. $)
    psubsuccv-P6 $p |- ( [ t_w / x ] b = s` t_t <-> b = s` t_u ) $=
        ( term-obj term_succ wff-equals wff-psub wff-enfree lemma-L6.06a
          enfrleq-P6 bimpf-P4.RC enfrterm-P6 enfrsucc-P6 psubsuccv-P6-L1
          isubtopsubv-P6 )
        FHZAIJTBIJCDBDFBDEFEHZAJZCDKZDLUABJZDLUBCDMUCUDDGNOPQABCDEFGRS
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 a $. $d t_t2 a $. $d t_u1 a $. $d t_u2 a $. $d t_w a $.
    $d t_t1 b $. $d t_t2 b $. $d t_u1 b $. $d t_u2 b $. $d t_w b $.
    $d t_t1 c $. $d t_t2 b $. $d t_u1 c $. $d t_u2 c $. $d t_w c $.
    $d a b c x $.

    psubaddv-P6-L1.1 $e |- ( [ t_w / x ] a = t_t1 <-> a = t_u1 ) $.
    psubaddv-P6-L1.2 $e |- ( [ t_w / x ] b = t_t2 <-> b = t_u2 ) $.

    $( Lemma for ~psubaddv-P6 . $)
    psubaddv-P6-L1 $p
        |- ( x = t_w -> ( c = ( t_t1 + t_t2 ) <-> c = ( t_u1 + t_u2 ) ) )
    $=
        ( term-obj wff-equals term-add wff-bi wff-imp wff-rcp-AND3
          rcp-NDASM1of3 eqsym-P5 wff-and wff-psub psubtoisub-P6
          rcp-NDIMP0addall bitrns-P3.33c rcp-IMPIME2 bimpf-P4 eqtrns-P5
          rcp-NDASM2of3 subaddd-P5 subeqr-P5 rcp-NDIMI3 rcp-NDIMI2 axL6ex-P5
          exiav-P5.SH )
        HLZBMZFLEMZILZABNZMURCDNZMOZPZHGLZAMZUPVBPGVBVDUPVAVDUPUQVDUPUQQZUSUTU
        RVEACBDVEAVCCVEVCAVDUPUQRZSVDVCCMZVEVFUQVDVGOZVDUPUQVHPVDUPTZVDVDEFUAZ
        VGUQVDEFUB VJVGOUQJUCUDUCUEUFUGVEBUODVEUOBVDUPUQUHZSUPUODMZVEVKUQUPVLO
        ZVDUPUQVMPVIUPUPEFUAZVLUQUPEFUBVNVLOUQKUCUDUCUEUFUGUIUJUKULAGUMUNBHUMU
        N
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 a $. $d t_t2 a $. $d t_u1 a $. $d t_u2 a $. $d t_w a $.
    $d t_t1 b $. $d t_t2 b $. $d t_u1 b $. $d t_u2 b $. $d t_w b $.
    $d t_t1 c $. $d t_t2 c $. $d t_u1 c $. $d t_u2 c $. $d t_w c $.
    $d t_w x $.
    $d a b c x $.

    psubaddv-P6.1 $e |- ( [ t_w / x ] a = t_t1 <-> a = t_u1 ) $.
    psubaddv-P6.2 $e |- ( [ t_w / x ] b = t_t2 <-> b = t_u2 ) $.

    $( Proper Substitution Over Addition (variable restriction). 

       '`a`', '`b`', and '`c`' are distinct from all other variables and '`x`'
       cannot occur in '`t_w`'. $)
    psubaddv-P6 $p
        |- ( [ t_w / x ] c = ( t_t1 + t_t2 ) <-> c = ( t_u1 + t_u2 ) )
    $=
        ( term-obj term-add wff-equals wff-psub wff-enfree lemma-L6.06a
          enfrleq-P6 bimpf-P4.RC enfrterm-P6 enfradd-P6 psubaddv-P6-L1
          isubtopsubv-P6 )
        ILZABMNUDCDMNEFCDFICFGIGLZANZEFOZFPUECNZFPUFEFQUGUHFJRSTDFHIHLZBNZEFOZ
        FPUIDNZFPUJEFQUKULFKRSTUAABCDEFGHIJKUBUC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 a $. $d t_t2 a $. $d t_u1 a $. $d t_u2 a $. $d t_w a $.
    $d t_t1 b $. $d t_t2 b $. $d t_u1 b $. $d t_u2 b $. $d t_w b $.
    $d t_t1 c $. $d t_t2 b $. $d t_u1 c $. $d t_u2 c $. $d t_w c $.
    $d a b c x $.

    psubmultv-P6-L1.1 $e |- ( [ t_w / x ] a = t_t1 <-> a = t_u1 ) $.
    psubmultv-P6-L1.2 $e |- ( [ t_w / x ] b = t_t2 <-> b = t_u2 ) $.

    $( Lemma for ~psubmultv-P6 . $)
    psubmultv-P6-L1 $p
        |- ( x = t_w -> ( c = ( t_t1 x. t_t2 ) <-> c = ( t_u1 x. t_u2 ) ) )
    $=
        ( term-obj wff-equals term-mult wff-bi wff-imp wff-rcp-AND3
          rcp-NDASM1of3 eqsym-P5 wff-and wff-psub psubtoisub-P6
          rcp-NDIMP0addall bitrns-P3.33c rcp-IMPIME2 bimpf-P4 eqtrns-P5
          rcp-NDASM2of3 submultd-P5 subeqr-P5 rcp-NDIMI3 rcp-NDIMI2 axL6ex-P5
          exiav-P5.SH )
        HLZBMZFLEMZILZABNZMURCDNZMOZPZHGLZAMZUPVBPGVBVDUPVAVDUPUQVDUPUQQZUSUTU
        RVEACBDVEAVCCVEVCAVDUPUQRZSVDVCCMZVEVFUQVDVGOZVDUPUQVHPVDUPTZVDVDEFUAZ
        VGUQVDEFUBVJVGOUQJUCUDUCUEUFUGVEBUODVEUOBVDUPUQUHZSUPUODMZVEVKUQUPVLOZ
        VDUPUQVMPVIUPUPEFUAZVLUQUPEFUBVNVLOUQKUCUDUCUEUFUGUIUJUKULAGUMUNBHUMUN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 a $. $d t_t2 a $. $d t_u1 a $. $d t_u2 a $. $d t_w a $.
    $d t_t1 b $. $d t_t2 b $. $d t_u1 b $. $d t_u2 b $. $d t_w b $.
    $d t_t1 c $. $d t_t2 c $. $d t_u1 c $. $d t_u2 c $. $d t_w c $.
    $d t_w x $.
    $d a b c x $.

    psubmultv-P6.1 $e |- ( [ t_w / x ] a = t_t1 <-> a = t_u1 ) $.
    psubmultv-P6.2 $e |- ( [ t_w / x ] b = t_t2 <-> b = t_u2 ) $.

    $( Proper Substitution Over Multiplication (variable restriction). 

       '`a`', '`b`', and '`c`' are distinct from all other variables and '`x`'
       cannot occur in '`t_w`'. $)
    psubmultv-P6 $p
        |- ( [ t_w / x ] c = ( t_t1 x. t_t2 ) <-> c = ( t_u1 x. t_u2 ) )
    $=
        ( term-obj term-mult wff-equals wff-psub wff-enfree lemma-L6.06a
          enfrleq-P6 bimpf-P4.RC enfrterm-P6 enfrmult-P6 psubmultv-P6-L1
          isubtopsubv-P6 )
        ILZABMNUDCDMNEFCDFICFGIGLZANZEFOZFPUECNZFPUFEFQUGUHFJRSTDFHIHLZBNZEFOZ
        FPUIDNZFPUJEFQUKULFKRSTUAABCDEFGHIJKUBUC
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Deductive Forms.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Some Lemmas.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Closed Form of ~enfrgen-P6 . $)
    enfrgencl-L6 $p |- ( F/ x w_ph -> ( w_ph -> A. x w_ph ) ) $=
        ( wff-exists wff-forall wff-enfree wff-imp exi-P6 rcp-NDIMP0addall
          dfenfreealt-P6 rcp-NDBIEF0 syl-P3.24 )
        AABCZABDZABEZALFNABGHNLMFABIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~genenfr-P6 . $)
    genenfrcl-L6 $p |- ( A. x ( w_ph -> A. x w_ph ) -> F/ x w_ph ) $=
        ( wff-exists wff-forall wff-imp wff-enfree alloverimex-P5.CL
          exgenall-P6 rcp-NDIMP0addall syl-P3.24 dfenfreealt-P6
          bisym-P3.33b.RC subimr2-P4.RC )
        ABCZABDZEZABFZAOEBDZNOBCZORAOBGSOERABHIJQPABKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~enfrexgen-P6 . $)
    enfrexgencl-L6 $p |- ( F/ x w_ph -> ( E. x w_ph -> w_ph ) ) $=
        ( wff-neg wff-enfree wff-forall wff-imp wff-exists enfrgencl-L6
          trnsp-P3.31b enfrneg-P6 df-exists-D5.1 bisym-P3.33b.RC
          subiml-P3.40a.RC subimd2-P4.RC )
        ACZBDZABDOBEZCZAFABGZAFAQPOBHIABJRSASRABKLMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~exgenenfr-P6 . $)
    exgenenfrcl-L6 $p |- ( A. x ( E. x w_ph -> w_ph ) -> F/ x w_ph ) $=
        ( wff-neg wff-enfree wff-exists wff-imp wff-forall lemma-L5.01a
          rcp-NDBIEF0 alloverim-P5.RC.GEN genenfrcl-L6 syl-P3.24.RC enfrneg-P6
          subimr2-P4.RC )
        ACZBDZABDABEAFZBGZROOBGFZBGPQSBQSABHIJOBKLABMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Effective Non-Freeness.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    enfrimd-P6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    enfrimd-P6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( ENF Over Implication (deductive form). $)
    enfrimd-P6 $p |- ( w_ga -> F/ x ( w_ph -> w_ps ) ) $=
        ( wff-imp wff-exists wff-forall wff-enfree qimeqex-P5 rcp-NDBIER0
          rcp-NDIMP0addall dfenfreealt-P6 subimr2-P4.RC imsubd-P3.28c
          qimeqallhalf-P5 dsyl-P3.25 bisym-P3.33b.RC )
        ABGZDHZTDIZGZTDJZCUAADIZBDHZGZADHZBDIZGZUBCUAUGGCUGUAABDKLMUHUEUFUICAD
        JUHUEGCEADNOBDJUFUIGCFBDNOPUJUBGCABDQMRUDUCTDNSO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrandd-P6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    enfrandd-P6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( ENF Over Conjunction (deductive form). $)
    enfrandd-P6 $p |- ( w_ga -> F/ x ( w_ph /\ w_ps ) ) $=
        ( wff-neg wff-imp wff-enfree wff-and enfrneg-P6 bisym-P3.33b.RC
          subimr2-P4.RC enfrimd-P6 andasim-P3.46a enfrleq-P6 )
        ABGZHZGZDIZABJZDIZCRDIZTCAQCDEBDIZQDIZCFUEUDBDKLMNTUCRDKLMUBTUASDABOPL
        M
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrord-P6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    enfrord-P6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( ENF Over Disjunction (deductive form). $)
    enfrord-P6 $p |- ( w_ga -> F/ x ( w_ph \/ w_ps ) ) $=
        ( wff-neg wff-imp wff-enfree wff-or enfrneg-P6 bisym-P3.33b.RC
          subimr2-P4.RC enfrimd-P6 orasim-P3.48a enfrleq-P6 )
        AGZBHZDIZABJZDIZCQBCDADIZQDIZCEUCUBADKLMFNUASTRDABOPLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    enfrbid-P6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    enfrbid-P6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( ENF Over Biconditional (deductive form). $)
    enfrbid-P6 $p |- ( w_ga -> F/ x ( w_ph <-> w_ps ) ) $=
        ( wff-imp wff-and wff-enfree wff-bi enfrimd-P6 enfrandd-P6 dfbi-P3.47
          enfrleq-P6 bisym-P3.33b.RC subimr2-P4.RC )
        ABGZBAGZHZDIZABJZDIZCQRCDABCDEFKBACDFEKLUBTUASDABMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    enfrall2d-P6.1 $e |- F/ x w_ga $.
    enfrall2d-P6.2 $e |- F/ y w_ga $.
    enfrall2d-P6.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ENF Over Universal Quantifier (different variable - deductive form). $)
    enfrall2d-P6 $p |- ( w_ga -> F/ x A. y w_ph ) $=
        ( wff-forall wff-imp wff-enfree enfrgencl-L6 syl-P3.24.RC
          alloverim-P5.GENF allcomm-P6 subimr-P3.40b.RC subimr2-P4.RC allic-P6
          genenfrcl-L6 )
        BADHZSCHZIZCHSCJBUACESACHZDHZIUABAUBBDFBACJAUBIGACKLMUCTSADCNOPQSCRL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    enfrex2d-P6.1 $e |- F/ x w_ga $.
    enfrex2d-P6.2 $e |- F/ y w_ga $.
    enfrex2d-P6.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ENF Over Existential Quantifier (different variable - deductive
       form). $)
    enfrex2d-P6 $p |- ( w_ga -> F/ x E. y w_ph ) $=
        ( wff-exists wff-imp wff-forall wff-enfree enfrexgencl-L6 syl-P3.24.RC
          alloverimex-P5.GENF excomm-P6 subiml-P3.40a.RC subimr2-P4.RC
          allic-P6 exgenenfrcl-L6 )
        BADHZCHZTIZCJTCKBUBCEACHZDHZTIUBBUCABDFBACKUCAIGACLMNUDUATADCOPQRTCSM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( ENF Over ENF Predicate.

       Interpreted semantically, this says that the effective non-freeness
       predicate does not depend on the value assigned to the indicated
       variable, '`x`'.  This means effective non-freeness is a property of a
       WFF that will either be true for every '`x`' assignment or false for
       every '`x`' assignment.  We expect this since ENF is a property
       that we should be able to determine grammatically. $)
    enfrenfr-P6 $p |- F/ x F/ x w_ph $=
        ( wff-enfree wff-exists wff-forall wff-imp enfrex1-P6 enfrall1-P6
          enfrim-P6 dfenfreealt-P6 enfrleq-P6 bimpr-P4.RC )
        ABCZBCABDZABEZFZBCNOBABGABHIMPBABJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Universal Quantifier Introduction.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    ndalli-P6.1 $e |- F/ y w_ga $.
    ndalli-P6.2 $e |- F/ y w_ph $.
    ndalli-P6.3 $e |- ( w_ga -> [ y / x ] w_ph ) $.

    $( Natural Deduction Form of Universal Quantifier Introduction. $)
    ndalli-P6 $p |- ( w_ga -> A. x w_ph ) $=
        ( term-obj wff-psub wff-forall allic-P6 cbvallpsub-P6 bisym-P3.33b.RC
          subimr2-P4.RC )
        ADHCIZDJZACJZBBODEGKQPACDFLMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Exestential Quantifier Elimination.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    qremexd-P6.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Existential Quantifier Removal Theorem (deductive form). $)
    qremexd-P6 $p |- ( w_ga -> ( E. x w_ph <-> w_ph ) ) $=
        ( wff-exists wff-forall wff-enfree wff-imp dfenfreealt-P6
          subimr2-P4.RC spec-P6 rcp-NDIMP0addall syl-P3.24 exi-P6 ndbii-P3.13 )
        ACEZABPACFZABACGPQHBDACIJQAHBACKLMAPHBACNLO
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    exiad-P6.1 $e |- F/ x w_ga $.
    exiad-P6.2 $e |- ( w_ga -> F/ x w_ps ) $.
    exiad-P6.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Introduction of Existential Quantifier as Antecedent (deductive
      form). $)
    exiad-P6 $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( wff-exists alloverimex-P5.GENF qremexd-P6 ndbief-P3.14 syl-P3.24 )
        ADHBDHZBCABCDEGIMBCBCDFJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndexe-P6.1 $e |- F/ y w_ga $.
    ndexe-P6.2 $e |- F/ y w_ph $.
    ndexe-P6.3 $e |- ( w_ga -> F/ y w_ps ) $.
    ndexe-P6.4 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexe-P6.5 $e |- ( w_ga -> E. x w_ph ) $.

    $( Natural Deduction Form of Existential Quantifier Elimination. $)
    ndexe-P6 $p |- ( w_ga -> w_ps ) $=
        ( term-obj wff-psub wff-exists wff-imp cbvexpsub-P6 subimr-P3.40b.RC
          bimpf-P4.RC exiad-P6 ndime-P3.6 )
        AEKDLZEMZBCCADMZNCUANJUBUACADEGOPQTBCEFHIRS
    $.
$}
$( End $[ bfol-ch6.mm $] $)
$( Begin $[ bfol-ch7.mm $] $)

$(
##############################################################################
  Chapter 7: Predicate Calculus (Natural Deduction)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Natural Deduction for Predicate Calculus.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Fundamental Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Effective Non-Freeness Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  The contextless (obtained by replacing `w_ga` with `T.` ) forms of rules 1
  through 10 define *grammatical* non-freeness (the typical textbook
  definition).  This type of non-freeness is always decidable and can be
  determined from syntax alone for any WFF not containing term or WFF
  metabariables.

  *Effective* non-freeness can be defined by adding the contextless form of 
  rule 11 to rules 1 through 10.  This generates an extension of grammatical
  non-freeness that is conserved through logical equivalence.  In the
  classical semantic case, '`x`' is *effectively* not free in '`w_ph`' if and
  only if every object assignment applied to the variable '`x`' produces the
  same truth value in '`w_ph`'.

  To be able to make our natural deduction system not just logically
  equivalent, but *scheme* equivalent to the original Hilbert system, some of
  the effective non-freeness rules need to be extended to also apply in the
  *conditional* case.  Since it is not always possible to deduce
  '`F/ x w_ph`', given '`( w_ga -> F/ x w_ph )`', *conditional* effective
  non-freeness is a weaker notion of non-freeness that depends on the given
  context '`w_ga`'.

  The deductive forms of ~ndenfrall2-P7.9 and ~ndenfrex2-P7.10 are definitely
  needed to recover ~ax-L11 .  It also appears that the additional axiom,
  ~ndenfrenfr-P7.12 , is needed to recover some closed forms that are
  deducible in the Hilbert system.
$)

${
    $d w_ph x $.

    $( Natural Deduction:  Effective Non-Freeness Rule 1. 

       If '`x`' does not occur in '`w_ph`', then '`x`' is effectively not
       free in '`w_ph`'. $)
    ndenfrv-P7.1 $p |- F/ x w_ph $=
        ( enfrv-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrneg-P7.2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 2.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is (conditionally) effectively not free in '`-. w_ph`'. $)
    ndenfrneg-P7.2 $p |- ( w_ga -> F/ x -. w_ph ) $=
        ( wff-enfree wff-imp wff-neg enfrneg-P6 rcp-NDBIER0 imsubr-P3.28b.RC
          rcp-NDIME0 )
        BACEZFBAGCEZFDLMBMLACHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrim-P7.3.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndenfrim-P7.3.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 3.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph -> w_ps )`'. $)
    ndenfrim-P7.3 $p |- ( w_ga -> F/ x ( w_ph -> w_ps ) ) $=
        ( enfrimd-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrand-P7.4.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndenfrand-P7.4.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 4.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph /\ w_ps )`'. $)
    ndenfrand-P7.4 $p |- ( w_ga -> F/ x ( w_ph /\ w_ps ) ) $=
        ( enfrandd-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfror-P7.5.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndenfror-P7.5.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 5.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph \/ w_ps )`'. $)
    ndenfror-P7.5 $p |- ( w_ga -> F/ x ( w_ph \/ w_ps ) ) $=
        ( enfrord-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrbi-P7.6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndenfrbi-P7.6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 6.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph <-> w_ps )`'. $)
    ndenfrbi-P7.6 $p |- ( w_ga -> F/ x ( w_ph <-> w_ps ) ) $=
        ( enfrbid-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Natural Deduction: Effective Non-Freeness Rule 7.

       '`x`' is effectively not free in '`A. x w_ph`' (since any '`x`'
       appearing '`w_ph`' will be bound). $)
    ndenfrall1-P7.7 $p |- F/ x A. x w_ph $=
        ( enfrall1-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Natural Deduction: Effective Non-Freeness Rule 8. 

       '`x`' is effectively not free in '`E. x w_ph`' (since any '`x`'
       appearing '`w_ph`' will be bound). $)
    ndenfrex1-P7.8 $p |- F/ x E. x w_ph $=
        ( enfrex1-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndenfrall2-P7.9.1 $e |- F/ x w_ga $.
    ndenfrall2-P7.9.2 $e |- F/ y w_ga $.
    ndenfrall2-P7.9.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 9.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is also (conditionally) effectively not free in '`A. y w_ph`',
       where '`y`' is different from '`x`' and neither '`x`' nor '`y`' are
       effectively free in the context, '`w_ga`'.  $)
    ndenfrall2-P7.9 $p |- ( w_ga -> F/ x A. y w_ph ) $=
        ( enfrall2d-P6 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndenfrex2-P7.10.1 $e |- F/ x w_ga $.
    ndenfrex2-P7.10.2 $e |- F/ y w_ga $.
    ndenfrex2-P7.10.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 10.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is also (conditionally) effectively not free in '`E. y w_ph`',
       where '`y`' is different from '`x`' and neither '`x`' nor '`y`' are
       effectively free in the context, '`w_ga`'.  $)
    ndenfrex2-P7.10 $p |- ( w_ga -> F/ x E. y w_ph ) $=
        ( enfrex2d-P6 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrleq-P7.11.1 $e |- F/ x w_ga $.
    ndenfrleq-P7.11.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 11. 

       If '`x`' is not effectively free in the context '`w_ga`', then the
       (conditional) effective non-freeness of '`x`' is conserved between
       (conditionally) logically equivalent WFFs. $)
    ndenfrleq-P7.11 $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( subenfr-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
   $( Natural Deduction: Effective Non-Freeness Rule 12.

      The effective non-freeness predicate is itself is effectively not free.
      In semantic terms, this means that the effective non-freeness of the
      object variable '`x`' does not depend on it's value assignment. $)
    ndenfrenfr-P7.12 $p |- F/ x F/ x w_ph $=
        ( enfrenfr-P6 ) ABC
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Proper Substitution Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

   These four rules define define all cases where '`t_t`' properly replaces
   '`x`' in '`w_ph`'.  The first three rules define proper substitution of
   '`t_t`' for '`x`' when '`x`' does not occur in '`t_t`'.  The first rule
   describes the sufficient condition ("if" part), while the second and third
   rules together describe the necessary condition ("only if" part).  The
   fourth rule expands the definition of proper substitutioin to include cases
   where '`x`' may occur in '`t_t`'.
$)

${
    $d t_t x $.

    ndpsub1-P7.13.1 $e |- F/ x w_ps $.
    ndpsub1-P7.13.2 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( Natural Deduction: Proper Substitution Rule 1. 

       '`x`' cannot occur in '`t_t`'. $)
    ndpsub1-P7.13 $p |- ( [ t_t / x ] w_ph <-> w_ps ) $=
        ( isubtopsubv-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( Natural Deduction: Proper Substitution Rule 2.

       '`x`' cannot occur in '`t_t`'. $)
    ndpsub2-P7.14 $p |- ( x = t_t -> ( w_ph <-> [ t_t / x ] w_ph ) ) $=
        ( psubtoisubv-P6 ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    $( Natural Deduction: Proper Substitution Rule 3.

       '`x`' cannot occur in '`t_t`'. $)
    ndpsub3-P7.15 $p |- F/ x [ t_t / x ] w_ph $=
        ( lemma-L6.06a ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( Natural Deduction: Proper Substitution Rule 4.

       '`x`' can occur in '`t_t`', but '`y`' cannot occur in either '`w_ph`'
       or '`t_t`'. $)
    ndpsub4-P7.16 $p |- ( [ t_t / x ] w_ph <-> [ t_t / y ] [ y / x ] w_ph ) $=
        ( psubcomp-P6 ) ABCDE
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Quantifier Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These are the classic introduction and elimination rules for '`A.`' and
  '`E.`'.  Effective non-freeness and proper substitution needed to be defined
  precisely with the previous 12 rules in order to be able to state these next
  4 rules.
$)

${
    $d x y $.

    ndalli-P7.17.1 $e |- F/ y w_ga $.
    ndalli-P7.17.2 $e |- F/ y w_ph $.
    ndalli-P7.17.3 $e |- ( w_ga -> [ y / x ] w_ph ) $.

    $( Natural Deduction: '`A.`' Introduction Rule.

       In the traditional textbook presentation '`[ y / x ] w_ph`' and
       '`w_ph`' are written as '`w_ph ( y )`' and '`w_ph ( x )`',
       respectively. The rule is then stated as...

       '`|- ( w_ga -> w_ph ( y ) )`
       &ensp; `=>` &ensp;
       `|- ( w_ga -> A. x w_ph ( x ) )`',
 
       where '`y`' cannot occur free in '`w_ga`' (that '`y`' does not occur
       free in '`w_ph ( x )`' is implied by the notation). 

       The English interpetation of this rule is as follows -- if we can
       duduce '`w_ph ( y )`' for a specific, but *arbitrary*, '`y`', then we
       can deduce that '`w_ph ( x )`' for *any* '`x`'.  To guarantee that
       '`y`' is *arbitrary*, '`y`' must not occur free in '`w_ga`' (the list
       of assumptions from which '`w_ph ( y )`' was deduced).  Within a proof,
       the invocation of this rule is often indicated by the use of the phrase
       "without loss of generality".   $)
    ndalli-P7.17 $p |- ( w_ga -> A. x w_ph ) $=
        ( ndalli-P6 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndalle-P7.18.1 $e |- ( w_ga -> A. x w_ph ) $.

    $( Natural Deduction: '`A.`' Elimination Rule. 

       In the traditional textbook presentation '`w_ph`' and 
       '`[ t_t / x ] w_ph`' are written as '`w_ph ( x )`' and
       '`w_ph ( t_t )`', respectively.  The rule is then stated as...

       '`|- ( w_ga -> A. x w_ph ( x ) )`
       &ensp; `=>` &ensp;
       `|- ( w_ga -> w_ph ( t_t ) )`'.

       The English interpretation of this rule is as follows -- since
       '`w_ph ( x )`' is true for *any* '`x`', *in particular*, it is true for
       '`t_t`', thus we can deduce '`w_ph ( t_t )`'.  Within a proof, the
       phrase "in particular" is a good clue that this rule is being used. $)
    ndalle-P7.18 $p |- ( w_ga -> [ t_t / x ] w_ph ) $=
        ( wff-forall wff-psub specpsub-P6 syl-P3.24.RC ) BADFACDGEACDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndexi-P7.19.1 $e |- ( w_ga -> [ t_t / x ] w_ph ) $.

    $( Natural Deduction: '`E.`' Introduction Rule. 

       In the traditional textbook presentation, '`[ t_t / x ] w_ph`' and
       '`w_ph`' are written as '`w_ph ( t_t )`' and '`w_ph ( x )`',
       respectively.  The rule is then stated as...

       '`|- ( w_ga -> w_ph ( t_t ) )`
       &ensp; `=>` &ensp;
       `|- ( w_ga -> E. x w_ph ( x ) )`'.

       Within a proof, this rule is used to replace a specific constant or
       functional term with an abstract variable.  The use of this rule is
       indicated by the phrase "therefore there exists". $)
    ndexi-P7.19 $p |- ( w_ga -> E. x w_ph ) $=
        ( wff-psub wff-exists exipsub-P6 syl-P3.24.RC ) BACDFADGEACDHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndexe-P7.20.1 $e |- F/ y w_ga $.
    ndexe-P7.20.2 $e |- F/ y w_ph $.
    ndexe-P7.20.3 $e |- ( w_ga -> F/ y w_ps ) $.
    ndexe-P7.20.4 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexe-P7.20.5 $e |- ( w_ga -> E. x w_ph ) $.

    $( Natural Deduction: '`E.`' Elimination Rule.

       In the traditional textbook presentation '`[ y / x ] w_ph`' and
       '`w_ph`' are written as '`w_ph ( y )`' and '`w_ph ( x )`',
       respectively.  The rule is then stated as...

       '`|- ( w_ga -> ( w_ph ( y ) -> w_ps ) )`
       &ensp; `&` &ensp;
       `|- ( w_ga -> E. x w_ph ( x ) )`
       &ensp; `=>` &ensp;
       `|- ( w_ga -> w_ps )`',

       where '`y`' cannot occur free in either '`w_ga`' or '`w_ps`' (that
       '`y`' does not occur free in '`w_ph ( x )`' is implied by the
       notation). 

       The English interpretation of this rule is not as straighforward as the
       previous rules.  In a typical proof, one will encounter a statement
       "let '`y`' be a something such that '`w_ph ( y )`'" and then go on to
       deduce '`w_ps`' over several lines as a sub-proof.  To be rigorous, the
       Deduction Theorem needs to be used to obtain
       '`( w_ph ( y ) -> w_ps )`'.  However, in most informal proofs the
       statement '`( w_ph ( y ) -> w_ps )`' is omitted.  Instead, the
       sub-proof is immediately preceeded by the statement that an '`x`' such
       that '`w_ph ( x )`' has been shown to exist, invoking the second
       hypothesis.  '`w_ps`' is then stated as the conclusion, immediately
       after the subproof.  Typically, a sub-proof beginning with "let" is an
       indication that this rule will be used (at the conclusion of the
       sub-proof).

       As for the non-freeness condition, that '`y`' should not occur free in
       the context, '`w_ga`', is clear from the fact that '`y`' is declared
       using the word "let", which indicates that '`y`' is a new variable.
       That '`y`' should not occur free in the conclusion '`w_ps`' is clear
       from the fact that this rule is used to discharch any statement
       referencing the temporary variable '`y`'.

       In metamath, to avoid using the Deduction Theorem, the assumptions
       necessary for the sub-proof are simply added to the context (list of
       assumptions on the left side of the sequent indicated by '`w_ga`').
       This is where temporary variables normally associated with a "let"
       statement will appear.  Such temporary variables are later discharged
       by invoking this rule.

       One thing slightly different here is the the third non-freeness
       hypothesis.  Only *conditional* (where '`w_ga`' is the condition),
       effective non-freeness of '`y`' in '`w_ch`' is necessary.  This
       makes the rule slightly stronger than if we required the stronger
       hypothesis that '`F/ y w_ps`'.  This slight strengthing seems to be
       necessary to  derive the closed form
       '`( F/ x -> ( w_ph -> A. x w_ph ) )`'.  The weaker form,  given by
       ~ndexew-P7 is more typically used.  $)

    ndexe-P7.20 $p |- ( w_ga -> w_ps ) $=
        ( ndexe-P6 ) ABCDEFGHIJK
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Equality Introduction Axiom.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  The '`=`' introduction rule serves a similar role as ~ax-L6 in the Hilbert
  system.
$)

${
    $( Natural Deduction: '`=`' Introduction Axiom. $)
    ndeqi-P7.21 $p |- t_t = t_t $=
        ( eqref-P5 ) AB
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Substitution Rules (Equality Elimination).
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  In classical texts, all of these rules are often combined into one
  "substitution" rule that states that if '`x = t_t`' then '`x`' can be
  properly replaced with '`t_t`' any place it occurs free.  It's impossible
  to state this general of a scheme in metamath, so we replace it with finite
  set of rules that covers every predicate (indluding equality) and every
  primitive function in the language.  These rules can be combined with
  other derived substitution rules to obtain the same results.
$)

${
   ndsubeql-P7.22a.1 $e |- ( w_ga -> t_t = t_u ) $.

   $( Natural Deduction: Equality Substitution Rule (left). $)
   ndsubeql-P7.22a $p |- ( w_ga -> ( t_t = t_w <-> t_u = t_w ) ) $=
       ( subeql-P5 ) ABCDEF
   $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubeqr-P7.22b.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Equality Substitution Rule (right). $)
    ndsubeqr-P7.22b $p |- ( w_ga -> ( t_w = t_t <-> t_w = t_u ) ) $=
      ( subeqr-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubelofl-P7.23a.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Predicate Substitution Rule ('`e.`' left). $)
    ndsubelofl-P7.23a $p |- ( w_ga -> ( t_t e. t_w <-> t_u e. t_w ) ) $=
        ( subelofl-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubelofr-P7.23b.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Predicate Substitution Rule ('`e.`' right). $)
    ndsubelofr-P7.23b $p |- ( w_ga -> ( t_w e. t_t <-> t_w e. t_u ) ) $=
        ( subelofr-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubsucc-P7.24a.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Function Substitution Rule ('s&lsquo;'). $)
    ndsubsucc-P7.24a $p |- ( w_ga -> s` t_t = s` t_u ) $=
        ( subsucc-P5 ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubaddl-P7.24b.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Function Substitution Rule ('`+`' left). $)
    ndsubaddl-P7.24b $p |- ( w_ga -> ( t_t + t_w ) = ( t_u + t_w ) ) $=
        ( subaddl-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubaddr-P7.24c.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Function Substitution Rule ('`+`' right). $)
    ndsubaddr-P7.24c $p |- ( w_ga -> ( t_w + t_t ) = ( t_w + t_u ) ) $=
        ( subaddr-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubmultl-P7.24d.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Function Substitution Rule ('`x.`' left). $)
    ndsubmultl-P7.24d $p |- ( w_ga -> ( t_t x. t_w ) = ( t_u x. t_w ) ) $=
        ( submultl-P5 ) ABCDEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubmultr-P7.24e.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Natural Deduction: Function Substitution Rule ('`x.`' right). $)
    ndsubmultr-P7.24e $p |- ( w_ga -> ( t_w x. t_t ) = ( t_w x. t_u ) ) $=
        ( submultr-P5 ) ABCDEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Derived Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  From here on we will treat P3.1 - P3.20, P7.1 - P7.24, and recipes NDSEP and
  NDJOIN as the new set of axioms.  We will no longer refer to any results
  from chapters 1, 2, 5, or 6 (except indirectly through the axioms stated
  above).

  This will allow us to track the us of ~ndexclmid-P3.16 . By avoiding the Law
  of Excluded Middle, it is possible to develop an intuitionist logical
  framework alongside the standard classical case.

  From here on, all theorems derived without reference to the Law of Excluded
  Middle ( ~ndexclmid-P3.16 ) will have a `t.` in the comment.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Restricted Variable Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ga x $. $d w_ga y $.
    $d x y $.

    ndenfrall2-P7.9.VR12of2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ~ndenfrall2-P7.9 with 2 variable restrictions. `t.`

       Neither '`x`' nor '`y`' can occur in '`w_ga`'. $)
    ndenfrall2-P7.9.VR12of2 $p |- ( w_ga -> F/ x A. y w_ph ) $=
        ( ndenfrv-P7.1 ndenfrall2-P7.9 ) ABCDBCFBDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x y $.

    ndenfrex2-P7.10.VR12of2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ~ndenfrex2-P7.10 with 2 variable restrictions. `t.` 

       Neither '`x`' nor '`y`' can occur in '`w_ga`'. $)
    ndenfrex2-P7.10.VR12of2 $p |- ( w_ga -> F/ x E. y w_ph ) $=
        ( ndenfrv-P7.1 ndenfrex2-P7.10 ) ABCDBCFBDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x $.

    ndenfrleq-P7.11.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( ~ndenfrleq-P7.11 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    ndenfrleq-P7.11.VR $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( ndenfrv-P7.1 ndenfrleq-P7.11 ) ABCDCDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $. $d t_t x $.

    ndpsub1-P7.13.VR.1 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( ~ndpsub1-P7.13 with extra variable restriction. `t.`

       '`x`' cannot occur in either '`t_t`' or '`w_ps`'. $)
    ndpsub1-P7.13.VR $p |- ( [ t_t / x ] w_ph <-> w_ps ) $=
        ( ndenfrv-P7.1 ndpsub1-P7.13 ) ABCDBDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $.
    $d x y $.

    ndalli-P7.17.VR1of2.1 $e |- F/ y w_ph $.
    ndalli-P7.17.VR1of2.2 $e |- ( w_ga -> [ y / x ] w_ph ) $.

    $( ~ndalli-P7.17 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ga`'. $)
    ndalli-P7.17.VR1of2 $p |- ( w_ga -> A. x w_ph ) $=
        ( ndenfrv-P7.1 ndalli-P7.17 ) ABCDBDGEFH
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    ndalli-P7.17.VR2of2.1 $e |- F/ y w_ga $.
    ndalli-P7.17.VR2of2.2 $e |- ( w_ga -> [ y / x ] w_ph ) $.

    $( ~ndalli-P7.17 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    ndalli-P7.17.VR2of2 $p |- ( w_ga -> A. x w_ph ) $=
        ( ndenfrv-P7.1 ndalli-P7.17 ) ABCDEADGFH
    $.
$}

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    ndalli-P7.17.VR12of2.1 $e |- ( w_ga -> [ y / x ] w_ph ) $.
    $( ~ndalli-P7.17 with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ga`' or '`w_ph`'. $)
    ndalli-P7.17.VR12of2 $p |- ( w_ga -> A. x w_ph ) $=
        ( ndenfrv-P7.1 ndalli-P7.17 ) ABCDBDFADFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndexew-P7.1 $e |- F/ y w_ga $.
    ndexew-P7.2 $e |- F/ y w_ph $.
    ndexew-P7.3 $e |- F/ y w_ps $.
    ndexew-P7.4 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.5 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexe-P7.20 with '`y`' ENF in '`w_ps`'. `t.`

       In the original '`E.`' Elimination Law, '`y`' need only be
       *conditionally* ENF, i.e. '`( w_ga -> F/ y w_ps )`'. $)
    ndexew-P7 $p |- ( w_ga -> w_ps ) $=
        ( wff-enfree rcp-NDIMP0addall ndexe-P7.20 ) ABCDEFGBEKCHLIJM
    $.
$}

${
    $d w_ga y $.
    $d x y $.

    ndexew-P7.VR1of3.1 $e |- F/ y w_ph $.
    ndexew-P7.VR1of3.2 $e |- F/ y w_ps $.
    ndexew-P7.VR1of3.3 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR1of3.4 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ga`'. $)
    ndexew-P7.VR1of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDECEJFGHIK
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    ndexew-P7.VR2of3.1 $e |- F/ y w_ga $.
    ndexew-P7.VR2of3.3 $e |- F/ y w_ps $.
    ndexew-P7.VR2of3.4 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR2of3.5 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'.  $)
    ndexew-P7.VR2of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDEFAEJGHIK
    $.
$}

${
    $d w_ps y $.
    $d x y $.

    ndexew-P7.VR3of3.1 $e |- F/ y w_ga $.
    ndexew-P7.VR3of3.2 $e |- F/ y w_ph $.
    ndexew-P7.VR3of3.3 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR3of3.4 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ps`' $)
    ndexew-P7.VR3of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDEFGBEJHIK
    $.
$}

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    ndexew-P7.VR12of3.1 $e |- F/ y w_ps $.
    ndexew-P7.VR12of3.2 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR12of3.3 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ga`' or '`w_ph`'. $)
    ndexew-P7.VR12of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDECEIAEIFGHJ
    $.
$}

${
    $d w_ga y $. $d w_ps y $.
    $d x y $.

    ndexew-P7.VR13of3.1 $e |- F/ y w_ph $.
    ndexew-P7.VR13of3.2 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR13of3.3 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ga`' or '`w_ps`'. $)
    ndexew-P7.VR13of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDECEIFBEIGHJ
    $.
$}

${
    $d w_ph y $. $d w_ps y $.
    $d x y $.

    ndexew-P7.VR23of3.1 $e |- F/ y w_ga $.
    ndexew-P7.VR23of3.2 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR23of3.3 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ph`' or '`w_ps`'. $)
    ndexew-P7.VR23of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDEFAEIBEIGHJ
    $.
$}

${
    $d w_ga y $. $d w_ph y $. $d w_ps y $.
    $d x y $.

    ndexew-P7.VR123of3.1 $e |- ( w_ga -> ( [ y / x ] w_ph -> w_ps ) ) $.
    ndexew-P7.VR123of3.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~ndexew-P7 with three variable restrictions. `t.`

       '`y`' cannot occur in '`w_ga`', '`w_ph`', or '`w_ps`'. $)
    ndexew-P7.VR123of3 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 ndexew-P7 ) ABCDECEHAEHBEHFGI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Inference Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    ndenfrneg-P7.2.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndenfrneg-P7.2 . $)
    ndenfrneg-P7.2.RC $p |- F/ x -. w_ph $=
        ( wff-neg wff-enfree wff-true ndtruei-P3.17 ndenfrneg-P7.2
          ndtruee-P3.18 )
        ADBEAFBABECGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrim-P7.3.RC.1 $e |- F/ x w_ph $.
    ndenfrim-P7.3.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndenfrim-P7.3 . `t.` $)
    ndenfrim-P7.3.RC $p |- F/ x ( w_ph -> w_ps ) $=
        ( wff-imp wff-enfree wff-true ndtruei-P3.17 ndenfrim-P7.3
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrand-P7.4.RC.1 $e |- F/ x w_ph $.
    ndenfrand-P7.4.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndenfrand-P7.4 . `t.` $)
    ndenfrand-P7.4.RC $p |- F/ x ( w_ph /\ w_ps ) $=
        ( wff-and wff-enfree wff-true ndtruei-P3.17 ndenfrand-P7.4
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfror-P7.5.RC.1 $e |- F/ x w_ph $.
    ndenfror-P7.5.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndenfror-P7.5 . `t.` $)
    ndenfror-P7.5.RC $p |- F/ x ( w_ph \/ w_ps ) $=
        ( wff-or wff-enfree wff-true ndtruei-P3.17 ndenfror-P7.5
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrbi-P7.6.RC.1 $e |- F/ x w_ph $.
    ndenfrbi-P7.6.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndenfrbi-P7.6 . $)
    ndenfrbi-P7.6.RC $p |- F/ x ( w_ph <-> w_ps ) $=
        ( wff-bi wff-enfree wff-true ndtruei-P3.17 ndenfrbi-P7.6
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndenfrall2-P7.9.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndenfrall2-P7.9 . $)
    ndenfrall2-P7.9.RC $p |- F/ x A. y w_ph $=
        ( wff-forall wff-enfree wff-true ndtruei-P3.17 ndenfrall2-P7.9.VR12of2
          ndtruee-P3.18 )
        ACEBFAGBCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndenfrex2-P7.10.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndenfrex2-P7.10 . $)
    ndenfrex2-P7.10.RC $p |- F/ x E. y w_ph $=
        ( wff-exists wff-enfree wff-true ndtruei-P3.17 ndenfrex2-P7.10.VR12of2
          ndtruee-P3.18 )
        ACEBFAGBCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndenfrleq-P7.11.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~ndenfrleq-P7.11 . `t.` $)

    ndenfrleq-P7.11.RC $p |- ( F/ x w_ph <-> F/ x w_ps ) $=
        ( wff-enfree wff-bi wff-true ndtruei-P3.17 ndenfrleq-P7.11.VR
          ndtruee-P3.18 )
        ACEBCEFABGCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndalli-P7.17.RC.1 $e |- F/ y w_ph $.
    ndalli-P7.17.RC.2 $e |- [ y / x ] w_ph $.

    $( Inference form of ~ndalli-P7.17 . `t.` $)
    ndalli-P7.17.RC $p |- A. x w_ph $=
        ( wff-forall wff-true term-obj wff-psub rcp-NDIMP0addall
          ndalli-P7.17.VR1of2 ndtruee-P3.18 )
        ABFAGZBCDACHBIMEJKL
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    ndalli-P7.17.RC.VR.1 $e |- [ y / x ] w_ph $.

    $( ~ndalli-P7.17.RC with variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    ndalli-P7.17.RC.VR $p |- A. x w_ph $=
        ( ndenfrv-P7.1 ndalli-P7.17.RC ) ABCACEDF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndalle-P7.18.RC.1 $e |- A. x w_ph $.

    $( Inference Form of ~ndalle-P7.18 . `t.` $)
    ndalle-P7.18.RC $p |- [ t_t / x ] w_ph $=
        ( wff-psub wff-true wff-forall ndtruei-P3.17 ndalle-P7.18
          ndtruee-P3.18 )
        ABCEAFBCACGDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndexi-P7.19.RC.1 $e |- [ t_t / x ] w_ph $.

    $( Inference Form of ~ndexi-P7.19 . `t.` $)
    ndexi-P7.19.RC $p |- E. x w_ph $=
        ( wff-exists wff-true wff-psub ndtruei-P3.17 ndexi-P7.19
          ndtruee-P3.18 )
        ACEAFBCABCGDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndexew-P7.RC.1 $e |- F/ y w_ph $.
    ndexew-P7.RC.2 $e |- F/ y w_ps $.
    ndexew-P7.RC.3 $e |- ( [ y / x ] w_ph -> w_ps ) $.
    ndexew-P7.RC.4 $e |- E. x w_ph $.

    $( Inference Form of ~ndexew-P7 . `t.` $)
    ndexew-P7.RC $p |- w_ps $=
        ( wff-true term-obj wff-psub wff-imp ndtruei-P3.17 wff-exists
          ndexew-P7.VR1of3 ndtruee-P3.18 )
        BABICDEFADJCKBLGMACNHMOP
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    ndexew-P7.RC.VR1of2.1 $e |- F/ y w_ps $.
    ndexew-P7.RC.VR1of2.2 $e |- ( [ y / x ] w_ph -> w_ps ) $.
    ndexew-P7.RC.VR1of2.3 $e |- E. x w_ph $.

    $( ~ndexew-P7.RC with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    ndexew-P7.RC.VR1of2 $p |- w_ps $=
        ( ndenfrv-P7.1 ndexew-P7.RC ) ABCDADHEFGI
    $.
$}

${
    $d w_ps y $.
    $d x y $.

    ndexew-P7.RC.VR2of2.1 $e |- F/ y w_ph $.
    ndexew-P7.RC.VR2of2.2 $e |- ( [ y / x ] w_ph -> w_ps ) $.
    ndexew-P7.RC.VR2of2.3 $e |- E. x w_ph $.

    $( ~ndexew-P7.RC with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ps`'. $)
    ndexew-P7.RC.VR2of2 $p |- w_ps $=
        ( ndenfrv-P7.1 ndexew-P7.RC ) ABCDEBDHFGI
    $.
$}

${
    $d w_ph y $. $d w_ps y $.
    $d x y $.

    ndexew-P7.RC.VR12of2.1 $e |- ( [ y / x ] w_ph -> w_ps ) $.
    ndexew-P7.RC.VR12of2.2 $e |- E. x w_ph $.

    $( ~ndexew-P7.RC with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ph`' or '`w_ps`'. $)
    ndexew-P7.RC.VR12of2 $p |- w_ps $=
        ( ndenfrv-P7.1 ndexew-P7.RC ) ABCDADGBDGEFH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubeql-P7.22a.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubeql-P7.22a . `t.` $)
    ndsubeql-P7.22a.RC $p |- ( t_t = t_w <-> t_u = t_w ) $=
        ( wff-equals wff-bi wff-true ndtruei-P3.17 ndsubeql-P7.22a
          ndtruee-P3.18 )
        ACEBCEFGABCABEDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubeqr-P7.22b.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubeqr-P7.22b . `t.` $)
    ndsubeqr-P7.22b.RC $p |- ( t_w = t_t <-> t_w = t_u ) $=
        ( wff-equals wff-bi wff-true ndtruei-P3.17 ndsubeqr-P7.22b
          ndtruee-P3.18 )
        CAECBEFGABCABEDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubelofl-P7.23a.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubelofl-P7.23a . `t.` $)
    ndsubelofl-P7.23a.RC $p |- ( t_t e. t_w <-> t_u e. t_w ) $=
        ( wff-elemof wff-bi wff-true wff-equals ndtruei-P3.17
          ndsubelofl-P7.23a ndtruee-P3.18 )
        ACEBCEFGABCABHDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubelofr-P7.23b.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubelofr-P7.23b . `t.` $)
    ndsubelofr-P7.23b.RC $p |- ( t_w e. t_t <-> t_w e. t_u ) $=
        ( wff-elemof wff-bi wff-true wff-equals ndtruei-P3.17
          ndsubelofr-P7.23b ndtruee-P3.18 )
        CAECBEFGABCABHDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubsucc-P7.24a.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubsucc-P7.24a . `t.` $)
    ndsubsucc-P7.24a.RC $p |- s` t_t = s` t_u $=
        ( term_succ wff-equals wff-true ndtruei-P3.17 subsucc-P5
          ndtruee-P3.18 )
        ADBDEFABABECGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubaddl-P7.24b.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubaddl-P7.24b . `t.` $)
    ndsubaddl-P7.24b.RC $p |- ( t_t + t_w ) = ( t_u + t_w ) $=
        ( term-add wff-equals wff-true ndtruei-P3.17 ndsubaddl-P7.24b
          ndtruee-P3.18 )
        ACEBCEFGABCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubaddr-P7.24c.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubaddr-P7.24c . `t.` $)
    ndsubaddr-P7.24c.RC $p |- ( t_w + t_t ) = ( t_w + t_u ) $=
        ( term-add wff-equals wff-true ndtruei-P3.17 ndsubaddr-P7.24c
          ndtruee-P3.18 )
        CAECBEFGABCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubmultl-P7.24d.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubmultl-P7.24d . `t.` $)
    ndsubmultl-P7.24d.RC $p |- ( t_t x. t_w ) = ( t_u x. t_w ) $=
        ( term-mult wff-equals wff-true ndtruei-P3.17 ndsubmultl-P7.24d
          ndtruee-P3.18 )
        ACEBCEFGABCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubmultr-P7.24e.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~ndsubmultr-P7.24e . `t.` $)
    ndsubmultr-P7.24e.RC $p |- ( t_w x. t_t ) = ( t_w x. t_u ) $=
        ( term-mult wff-equals wff-true ndtruei-P3.17 ndsubmultr-P7.24e
          ndtruee-P3.18 )
        CAECBEFGABCABFDHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Closed Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Closed Form of ~ndenfrneg-P7.2 . `t.` $)
    ndenfrneg-P7.2.CL $p |- ( F/ x w_ph -> F/ x -. w_ph ) $=
        ( wff-enfree rcp-NDASM1of1 ndenfrneg-P7.2 )
        AABCZBFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndenfrim-P7.3 . `t.` $)
    ndenfrim-P7.3.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph -> w_ps ) )
    $=
        ( wff-enfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndenfrim-P7.3 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndenfrand-P7.4 . `t.` $)
    ndenfrand-P7.4.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph /\ w_ps ) )
    $=
        ( wff-enfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndenfrand-P7.4 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndenfror-P7.5 . `t.` $)
    ndenfror-P7.5.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph \/ w_ps ) )
    $=
        ( wff-enfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndenfror-P7.5 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndenfrbi-P7.6 . `t.` $)
    ndenfrbi-P7.6.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph <-> w_ps ) )
    $=
        ( wff-enfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndenfrbi-P7.6 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndalle-P7.18 . `t.` $)
    ndalle-P7.18.CL $p |- ( A. x w_ph -> [ t_t / x ] w_ph ) $=
        ( wff-forall rcp-NDASM1of1 ndalle-P7.18 ) AACDZBCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndexi-P7.19 . `t.` $)
    ndexi-P7.19.CL $p |- ( [ t_t / x ] w_ph -> E. x w_ph ) $=
        ( wff-psub rcp-NDASM1of1 ndexi-P7.19 ) AABCDZBCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubeql-P7.22a . `t.` $)
    ndsubeql-P7.22a.CL $p |- ( t_t = t_u -> ( t_t = t_w <-> t_u = t_w ) ) $=
        ( wff-equals rcp-NDASM1of1 ndsubeql-P7.22a ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubeqr-P7.22b . `t.` $)
    ndsubeqr-P7.22b.CL $p |- ( t_t = t_u -> ( t_w = t_t <-> t_w = t_u ) ) $=
        ( wff-equals rcp-NDASM1of1 ndsubeqr-P7.22b ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubelofl-P7.23a . `t.` $)
    ndsubelofl-P7.23a.CL $p
        |- ( t_t = t_u -> ( t_t e. t_w <-> t_u e. t_w ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubelofl-P7.23a ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubelofr-P7.23b . `t.` $)
    ndsubelofr-P7.23b.CL $p
        |- ( t_t = t_u -> ( t_w e. t_t <-> t_w e. t_u ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubelofr-P7.23b ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubsucc-P7.24a . `t.` $)
    ndsubsucc-P7.24a.CL $p |- ( t_t = t_u -> s` t_t = s` t_u ) $=
        ( wff-equals rcp-NDASM1of1 ndsubsucc-P7.24a ) ABCZABFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubaddl-P7.24b . `t.` $)
    ndsubaddl-P7.24b.CL $p
        |- ( t_t = t_u -> ( t_t + t_w ) = ( t_u + t_w ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubaddl-P7.24b ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubaddr-P7.24c . `t.` $)
    ndsubaddr-P7.24c.CL $p
        |- ( t_t = t_u -> ( t_w + t_t ) = ( t_w + t_u ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubaddr-P7.24c ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubmultl-P7.24d . `t.` $)
    ndsubmultl-P7.24d.CL $p
        |- ( t_t = t_u -> ( t_t x. t_w ) = ( t_u x. t_w ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubmultl-P7.24d ) ABDZABCGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubmultr-P7.24e . `t.` $)
    ndsubmultr-P7.24e.CL $p
        |- ( t_t = t_u -> ( t_w x. t_t ) = ( t_w x. t_u ) )
    $=
        ( wff-equals rcp-NDASM1of1 ndsubmultr-P7.24e ) ABDZABCGEF
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Recovering Hilbert Axioms and Definitions.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Axiom L6 (Existential Form).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d t_t x $.
    $d t_u x $.

    $( Proper Substitution Over Equality Lemma. `t.`

       '`x`' cannot occur in '`t_t`' or '`t_u`'. $)
    lemma-L7.01a $p |- ( [ t_t / x ] x = t_u <-> t_t = t_u ) $=
        ( term-obj wff-equals ndsubeql-P7.22a.CL ndpsub1-P7.13.VR )
        CDZBEABEACHABFG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L6 (Existential Form).
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t x $.
    $( Existential Form of ~ax-L6 , Derived from Natural Deduction Rules.
       `t.`

       '`x`' cannot occur in '`t_t`'. $)
    axL6ex-P7 $p |- E. x x = t_t $=
        ( term-obj wff-equals wff-psub ndeqi-P7.21 lemma-L7.01a bimpr-P4.RC
          ndexi-P7.19.RC )
        BCADZABJABEAADAFAABGHI
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Generalization Rule and Axiom L5.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    enfrthm-P7.1 $e |- w_ph $.
    $( Every Variable is ENF in a Theorem. `t.` $)
    enfrthm-P7 $p |- F/ x w_ph $=
        ( wff-enfree wff-true ndenfrv-P7.1 thmeqtrue-P4.21a ndenfrleq-P7.11.RC
          bimpr-P4.RC )
        ABDEZBDJBFAJBACGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d t_t x $.
    $d x y $.

    lemma-L7.02a.1 $e |- F/ x w_ga $.
    lemma-L7.02a.2 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Proper Substitution Applied To ENF Variable Lemma. `t.`

       '`x`' cannot occur in '`t_t`'. $)
    lemma-L7.02a $p |- ( w_ga -> ( [ t_t / x ] w_ph <-> w_ph ) ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-bi ndenfrv-P7.1
          wff-enfree ndpsub3-P7.15 rcp-NDIMP0addall ndenfrbi-P7.6 wff-imp
          ndpsub2-P7.14 lemma-L7.01a bisym-P3.33b.RC subiml2-P4.RC wff-exists
          axL6ex-P7 ndexe-P7.20 bisym-P3.33b )
        AACDGZBHICJZAUFKZBHDEUGDLAUFBDFUFDMBACDNOPUGDIZHGZUHQBUICJZUJUHACDRUJU
        KUICHSTUAOUGHUBBCHUCOUDUE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t x $.

    psubenfrv-P7.1 $e |- F/ x w_ph $.

    $( Proper Substitution Applied To ENF Variable (variable restriction).
       `t.`

       '`x`' cannot occur in '`t_t`'. $)
    psubenfrv-P7 $p |- ( [ t_t / x ] w_ph <-> w_ph ) $=
        ( wff-psub wff-bi wff-true ndenfrv-P7.1 wff-enfree ndtruei-P3.17
          lemma-L7.02a ndtruee-P3.18 )
        ABCEAFAGZBCMCHACIDJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    enfrgen-P7.1 $e |- F/ x w_ph $.
    enfrgen-P7.2 $e |- ( w_ga -> w_ph ) $.

    $( ENF In `=>` General For. `t.` $)
    enfrgen-P7 $p |- ( w_ga -> A. x w_ph ) $=
        ( objvar-y term-obj wff-psub psubenfrv-P7 bisym-P3.33b.RC
          subimr2-P4.RC ndalli-P7.17.VR12of2 )
        ABCFAAFGZCHZBENAAMCDIJKL
    $.
$}

${
    enfrgen-P7.RC.1 $e |- F/ x w_ph $.
    enfrgen-P7.RC.2 $e |- w_ph $.

    $( Inference Form of ~enfrgen-P7 . `t.` $)
    enfrgen-P7.RC $p |- A. x w_ph $=
        ( wff-forall wff-true ndtruei-P3.17 enfrgen-P7 ndtruee-P3.18 )
        ABEAFBCADGHI
    $.
$}

${
    enfrgen-P7.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~enfrgen-P7 . `t.` $)
    enfrgen-P7.CL $p |- ( w_ph -> A. x w_ph ) $=
        ( rcp-NDASM1of1 enfrgen-P7 ) AABCADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    enfrexgen-P7.1 $e |- F/ x w_ph $.
    enfrexgen-P7.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( Dual Form of ~enfrgen-P7 . `t.` $)
    enfrexgen-P7 $p |- ( w_ga -> w_ph ) $=
        ( objvar-y term-obj wff-psub wff-imp psubenfrv-P7 rcp-NDBIEF0
          rcp-NDIMP0addall ndexew-P7.VR123of3 )
        AABCFAFGZCHZAIBOAANCDJKLEM
    $.
$}

${
    enfrexgen-P7.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~enfrexgen-P7 . `t.` $)
    enfrexgen-P7.CL $p |- ( E. x w_ph -> w_ph ) $=
        ( wff-exists rcp-NDASM1of1 enfrexgen-P7 ) AABDZBCGEF
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Generalization Rule.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    axGEN-P7.1 $e |- w_ph $.

    $( Generalization Rule ( ~ax-GEN ), Derived from Natural Deduction Rules.
       `t.` $)
    axGEN-P7 $p |- A. x w_ph $=
        ( enfrthm-P7 enfrgen-P7.RC ) ABABCDCE
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L5.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph x $.

    $( ~ax-L5 Derived from Natural Deduction Rules. `t.` $)
    axL5-P7 $p |- ( w_ph -> A. x w_ph ) $=
        ( ndenfrv-P7.1 enfrgen-P7.CL ) ABABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    $( Existential Form of ~axL5-P7 . `t.` $)
    axL5ex-P7 $p |- ( E. x w_ph -> w_ph ) $=
        ( ndenfrv-P7.1 enfrexgen-P7.CL ) ABABCD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Axiom L4.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    eqsym-P7.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Equivalence Property: '`=`' Symmetry. `t.` $)
    eqsym-P7 $p |- ( w_ga -> t_u = t_t ) $=
        ( wff-equals ndeqi-P7.21 rcp-NDIMP0addall ndsubeql-P7.22a bimpf-P4 )
        BBEZCBEAJABFGABCBDHI
    $.
$}

${
    $( Closed Form of ~eqsym-P7 . `t.` $)
    eqsym-P7.CL $p |- ( t_t = t_u -> t_u = t_t ) $=
        ( wff-equals rcp-NDASM1of1 eqsym-P7 ) ABCZABFDE
    $.
$}

${
    $( Closed Symmetric Form of ~eqsym-P7 . `t.` $)
    eqsym-P7.CL.SYM $p |- ( t_t = t_u <-> t_u = t_t ) $=
        ( wff-equals eqsym-P7.CL rcp-NDBII0 ) ABCBACABDBADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph z $.
    $d x y z $.

    psubinv-P7.1 $e |- F/ y w_ph $.

    $( Proper Substitution Inverse Property. `t.` $)
    psubinv-P7 $p |- ( [ x / y ] [ y / x ] w_ph <-> w_ph ) $=
        ( term-obj wff-psub objvar-z wff-equals wff-bi ndpsub3-P7.15
          ndenfrbi-P7.6.RC ndpsub2-P7.14 eqsym-P7.CL.SYM subiml2-P4.RC
          bitrns-P3.33c lemma-L7.01a bisym-P3.33b.RC axL6ex-P7
          ndexew-P7.RC.VR1of2 )
        AACEZBFZBEZCFZGEUBHZAUCIZGCAUCCDUAUBCJKTUBHZUDTGFZUEAUAUCUFUBTHUFAUAIA
        TBLUBTMNUAUBCLOUGUFTUBGPQNUBGRSQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $.
    $d x y $.

    $( Proper Substitution Identity Property. `t.` $)
    psubid-P7 $p |- ( [ x / x ] w_ph <-> w_ph ) $=
        ( term-obj wff-psub objvar-y ndpsub4-P7.16 ndenfrv-P7.1 psubinv-P7
          bitrns-P3.33c.RC )
        ABCZBDAECBDJEDAAJBEFABEAEGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    alle-P7.1 $e |- ( w_ga -> A. x w_ph ) $.

    $( Simplified '`A.`' Elimination Law. `t.`

       This is also known as the Specialization Law.  For the original form,
       using explicit substitution, see ~ndalle-P7.18 . $)
    alle-P7 $p |- ( w_ga -> w_ph ) $=
        ( term-obj wff-psub ndalle-P7.18 psubid-P7 subimr2-P4.RC )
        ACEZCFABABJCDGACHI
    $.
$}

${
    $( Closed Form of ~alle-P7 . `t.` $)
    alle-P7.CL $p |- ( A. x w_ph -> w_ph ) $=
        ( wff-forall rcp-NDASM1of1 alle-P7 ) AABCZBFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps y $. $d t_t y $.
    $d t_t x $.
    $d x y $.

    lemma-L7.03a-L1.1 $e |- F/ x w_ga $.
    lemma-L7.03a-L1.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Lemma for ~lemma-L7.03a . `t.` $)
    lemma-L7.03a-L1 $p
        |- ( w_ga -> ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) )
    $=
        ( objvar-y term-obj wff-equals wff-psub wff-imp ndpsub3-P7.15
          ndenfrim-P7.3.RC wff-and ndpsub2-P7.14 ndbier-P3.15 rcp-NDIMP0addall
          import-P3.34a.RC rcp-NDIMP1add1 ndbief-P3.14 dsyl-P3.25 lemma-L7.01a
          bisym-P3.33b.RC subandr-P3.42b.RC subiml2-P4.RC rcp-NDIMI2
          wff-exists axL6ex-P7 ndexew-P7.VR2of3 )
        HIDJZADEKZBDEKZLZCHEFULUMEADEMBDEMNUNCUKEIZHKZCUODJZOZCUPOUNULABUMURCU
        QULALZUQUSLCAULUQADEPQRSABLCUQGTCUQBUMLZUQUTLCBUMUQBDEPUARSUBUQUPCUPUQ
        UODHUCUDUEUFUGUKHUHCDHUIRUJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d w_ph y $. $d w_ps y $. $d t_t y $.
    $d x y $.

    lemma-L7.03a.1 $e |- F/ x w_ga $.
    lemma-L7.03a.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Proper Substitution Over Implication Lemma. `t.` $)
    lemma-L7.03a $p
        |- ( w_ga -> ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) )
    $=
        ( wff-psub objvar-y term-obj wff-imp ndpsub4-P7.16 rcp-NDBIEF0
          rcp-NDIMP0addall ndenfrv-P7.1 lemma-L7.03a-L1 rcp-NDBIER0
          dsyl-P3.25 )
        ADEHZAIJZEHZDIHZBTEHZDIHZBDEHZCSUBKCSUBADEILMNUAUCCDICIOABCTEFGPPUDUEK
        CUEUDBDEILQNR
    $.
$}

${
    lemma-L7.03a.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~lemma-L7.03a . `t.` $)
    lemma-L7.03a.RC $p |- ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) $=
        ( wff-psub wff-imp wff-true ndenfrv-P7.1 ndtruei-P3.17 lemma-L7.03a
          ndtruee-P3.18 )
        ACDFBCDFGABHZCDMDIABGEJKL
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L4.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph y $. $d w_ps y $.
    $d x y $.

    $( ~ax-L4 Derived from Natural Deduction Rules. `t.` $)
    axL4-P7 $p |- ( A. x ( w_ph -> w_ps ) -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-forall wff-imp wff-and objvar-y term-obj wff-psub
          ndalle-P7.18.CL rcp-NDIMP0addall ndenfrall1-P7.7 alle-P7.CL
          lemma-L7.03a syl-P3.24 import-P3.34a.RC ndalli-P7.17.VR12of2
          rcp-NDIMI2 )
        BCDABEZCDZACDZBTUAFCGTUABGHZCIZUAAUBCIZUCTUAUDETAUBCJKABTUBCSCLSCMNOPQ
        R
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d w_ps y $.
    $d x y $.

    $( Existential Form of ~axL4-P7 . `t.` $)
    axL4ex-P7 $p |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-exists wff-imp wff-forall wff-and objvar-y term-obj wff-psub
          ndenfrall1-P7.7 alle-P7.CL lemma-L7.03a ndexi-P7.19.CL
          rcp-NDIMP0addall syl-P3.24 rcp-NDIMP1add1 rcp-NDASM2of2
          ndexew-P7.VR123of3 rcp-NDIMI2 )
        BCDZABEZCFZACDZAUAUCUDGCHAHIZCJZUAEUCUDUFBUECJZUAUCABUCUECUBCKUBCLMUGU
        AEUCBUECNOPQUCUDRST
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Existential Quantifier
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alli-P7.1 $e |- F/ x w_ga $.
    alli-P7.2 $e |- ( w_ga -> w_ph ) $.

    $( Simplified '`A.`' Introduction Law. `t.`

       For the original form, using explicit substitution, see
       ~ndalli-P7.17 .  The inference form is ~axGEN-P7 . $)
    alli-P7 $p |- ( w_ga -> A. x w_ph ) $=
        ( wff-forall enfrgen-P7.CL wff-imp axGEN-P7 axL4-P7 rcp-NDIME0
          syl-P3.24.RC )
        BBCFZACFZBCDGBAHZCFMNHOCEIBACJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    alloverimex-P7.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.
    $( Alternate version of ~alloverim-P7 that produces existential
       quantifiers. `t.` $)
    alloverimex-P7 $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-imp wff-forall wff-exists axL4ex-P7 syl-P3.24.RC )
        CABFDGADHBDHFEABDIJ
    $.
$}

${
    alloverimex-P7.GENF.1 $e |- F/ x w_ga $.
    alloverimex-P7.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverimex-P7 with generalization augmentation (non-freeness
       condition). `t.` $)
    alloverimex-P7.GENF $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-imp alli-P7 alloverimex-P7 ) ABCDABGCDEFHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exi-P7.1 $e |- ( w_ga -> w_ph ) $.

    $( Simplified '`E.`' Introduction Law. `t.`

       For the original form, using explicit substitution, see
      ~ndalli-P7.17 . $)
    exi-P7 $p |- ( w_ga -> E. x w_ph ) $=
        ( term-obj wff-psub psubid-P7 bisym-P3.33b.RC subimr2-P4.RC
          ndexi-P7.19 )
        ABCEZCAAKCFZBDLAACGHIJ
    $.
$}

${
    $( Closed Form of ~exi-P7 . `t.` $)
    exi-P7.CL $p |- ( w_ph -> E. x w_ph ) $=
        ( rcp-NDASM1of1 exi-P7 ) AABACD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exia-P7.1 $e |- F/ x w_ga $.
    exia-P7.2 $e |- F/ x w_ps $.
    exia-P7.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Introduce Existential Quantifier as Antecedent. `t.` $)
    exia-P7 $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( wff-exists alloverimex-P7.GENF wff-imp enfrexgen-P7.CL
          rcp-NDIMP0addall syl-P3.24 )
        ADHBDHZBCABCDEGINBJCBDFKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exe-P7.1 $e |- F/ x w_ga $.
    exe-P7.2 $e |- F/ x w_ps $.
    exe-P7.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    exe-P7.4 $e |- ( w_ga -> E. x w_ph ) $.

    $( Simplified '`E.`' Elimination Law. `t.`

       For the original form, using explicit substitution, see
       ~ndexe-P7.20 . $)
    exe-P7 $p |- ( w_ga -> w_ps ) $=
        ( wff-exists exia-P7 ndime-P3.6 ) ADIBCHABCDEFGJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~allnegex-P7 . `t.` $)
    allnegex-P7-L1 $p |- ( A. x -. w_ph -> -. E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall wff-false wff-and ndenfrall1-P7.7
          ndenfrex1-P7.8 ndenfrand-P7.4.RC ndenfrv-P7.1 alle-P7.CL
          rcp-NDIMP1add1 impoe-P4.4a rcp-NDASM2of2 exe-P7 falsenegi-P4.18 )
        ABCZADZBEZAFZTRGZBTRBSBHABIJUABKAUAUBSTRSBLMNTROPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~allnegex-P7 . `t.` $)
    allnegex-P7-L2 $p |- ( -. E. x w_ph -> A. x -. w_ph ) $=
        ( wff-neg wff-exists ndenfrex1-P7.8 ndenfrneg-P7.2.RC exi-P7.CL
          trnsp-P3.31c.RC alli-P7 )
        ACABDZCBJBABEFAJABGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "For all not" is Equivalent to "Does not exist". `t.`

       This statement is deducible with intuitionist logic.  It's dual, given
       by ~exnegall-P7 , is not. $)
    allnegex-P7 $p |- ( A. x -. w_ph <-> -. E. x w_ph ) $=
        ( wff-neg wff-forall wff-exists allnegex-P7-L1 allnegex-P7-L2
          rcp-NDBII0 )
        ACBDABECABFABGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Existential Quantifier Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ~df-exists-D5.1 Derived from Natural Deduction Rules. 

       Note that this definition is not deducible with intuitionist logic. $)
    dfexists-P7 $p |- ( E. x w_ph <-> -. A. x -. w_ph ) $=
        ( wff-exists wff-neg wff-forall allnegex-P7 subneg-P3.39.RC
          bisym-P3.33b.RC dnegeq-P4.10 subbil2-P4.RC )
        ABCZDZDZKADBEZDZOMNLABFGHKIJ
    $.
$}

${
    $( One Direction of Existential Quantifier Definition.

       Only this direction is deducible with intuitionist logic. `t.` $)
    dfexistsint-P7 $p |- ( E. x w_ph -> -. A. x -. w_ph ) $=
        ( wff-exists wff-neg wff-forall dnegi-P3.29.CL allnegex-P7
          subneg-P3.39.RC rcp-NDBIER0 syl-P3.24.RC )
        ABCZKDZDZADBEZDZKFOMNLABGHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L6 (Original Form).
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t x $.

    $( ~ax-L6 Derived From Natural Deduction Rules. `t.`

       '`x`' cannot occur in '`t_t`'. $)
    axL6-P7 $p |- -. A. x -. x = t_t $=
        ( term-obj wff-equals wff-exists wff-neg wff-forall axL6ex-P7
          dfexistsint-P7 rcp-NDIME0 )
        BCADZBEKFBGFABHKBIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Effective Non-Freeness.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( General for `=>` ENF in (closed form). `t.` $)
    genenfrcl-P7 $p |- ( A. x ( w_ph -> A. x w_ph ) -> F/ x w_ph ) $=
        ( wff-forall wff-enfree wff-imp ndenfrall1-P7.7 rcp-NDIMP0addall
          alle-P7.CL ndbii-P3.13 ndenfrleq-P7.11 bimpf-P4 )
        ABCZBDZABDALEZBCZMOABFGLAOBNBFLAOLAEOABHGNBHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "If" Part of Alternate ENF Definition. `t.` $)
    dfenfreealtif-P7 $p |- ( ( E. x w_ph -> A. x w_ph ) -> F/ x w_ph ) $=
        ( wff-exists wff-forall wff-imp wff-enfree ndenfrex1-P7.8
          ndenfrall1-P7.7 ndenfrim-P7.3.RC exi-P7.CL imsubl-P3.28a.RC alli-P7
          genenfrcl-P7 syl-P3.24.RC )
        ABCZABDZEZAPEZBDABFRQBOPBABGABHIAOPABJKLABMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $.
    $d x y $.

    $( ENF In `=>` General For (closed form). `t.` $)
    enfrgencl-P7 $p |- ( F/ x w_ph -> ( w_ph -> A. x w_ph ) ) $=
        ( wff-forall wff-enfree wff-and objvar-y term-obj wff-psub
          ndenfrenfr-P7.12 rcp-NDASM1of1 lemma-L7.02a ndbier-P3.15
          import-P3.34a.RC ndalli-P7.17.VR12of2 rcp-NDIMI2 )
        ABCABDZAAPAEBFPAAFGZBHZRAPAPQBABIPJKLMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "Only If" Part of Alternate ENF Definition . `t.` $)
    dfenfreealtonlyif-P7 $p |- ( F/ x w_ph -> ( E. x w_ph -> A. x w_ph ) ) $=
        ( wff-forall wff-enfree ndenfrenfr-P7.12 ndenfrall1-P7.7 enfrgencl-P7
          exia-P7 )
        AABCABDBABEABFABGH
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Alternate ENF Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ~dfenfreealt-P6 Derived from Natural Deduction Rules. `t.` $)
    dfenfreealt-P7 $p |- ( F/ x w_ph <-> ( E. x w_ph -> A. x w_ph ) ) $=
        ( wff-enfree wff-exists wff-forall wff-imp dfenfreealtonlyif-P7
          dfenfreealtif-P7 rcp-NDBII0 )
        ABCABDABEFABGABHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered ENF Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ~df-enfree-D6.1 Derived From Natural Deduction Rules.

    This definition is not valid with intuitionist logic. $)
    dfenfree-P7 $p |- ( F/ x w_ph <-> ( A. x w_ph \/ A. x -. w_ph ) ) $=
        ( wff-enfree wff-exists wff-forall wff-imp wff-neg wff-or
          dfenfreealt-P7 imasor-P4.32a allnegex-P7 bisym-P3.33b.RC
          suborl-P3.43a.RC orcomm-P3.37 tbitrns-P4.17.RC )
        ABCABDZABEZFPGZQHAGBEZQHQSHABIPQJRSQSRABKLMSQNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "If" Part of ~df-enfree-D6.1 Derived From Natural Deduction Rules. `t.`

       Only this direction is deducible with intuitionist logic. $)
    dfenfreeint-P7 $p |- ( ( A. x w_ph \/ A. x -. w_ph ) -> F/ x w_ph ) $=
        ( wff-forall wff-neg wff-or wff-exists wff-imp wff-enfree orcomm-P3.37
          allnegex-P7 suborl-P3.43a.RC bitrns-P3.33c.RC rcp-NDBIEF0
          imasorint-P4.32b dfenfreealtif-P7 dsyl-P3.25.RC )
        ABCZADBCZEZABFZDZQEZTQGABHSUBSRQEUBQRIRUAQABJKLMTQNABOP
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Proper Substitution.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alloverim-P7.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.

    $( '`A.`' Distributes Over '`->`'. `t.` $)
    alloverim-P7 $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp wff-forall axL4-P7 syl-P3.24.RC ) CABFDGADGBDGFEABDHI
    $.
$}

${
    alloverim-P7.GENF.1 $e |- F/ x w_ga $.
    alloverim-P7.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverim-P7 with generalization augmentation (non-freeness
       condition). `t.` $)
    alloverim-P7.GENF $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp alli-P7 alloverim-P7 ) ABCDABGCDEFHI
    $.
$}

${
    alloverim-P7.GENF.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverim-P7.GENF . `t.` $)
    alloverim-P7.GENF.RC $p |- ( A. x w_ph -> A. x w_ps ) $=
        ( wff-forall wff-imp wff-true ndenfrv-P7.1 ndtruei-P3.17
          alloverim-P7.GENF ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suball-P7.1 $e |- F/ x w_ga $.
    suball-P7.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`A. x`' (non-freeness condition). `t.` $)
    suball-P7 $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( wff-forall ndbief-P3.14 alloverim-P7.GENF ndbier-P3.15 ndbii-P3.13 )
        ADGBDGCABCDEABCFHIBACDEABCFJIK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    suball-P7.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suball-P7.RC . `t.` $)
    suball-P7.RC $p |- ( A. x w_ph <-> A. x w_ps ) $=
        ( wff-forall wff-bi wff-true ndenfrv-P7.1 ndtruei-P3.17 suball-P7
          ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqallintb-P7.1 $e |- F/ x w_ps $.

    $( Quantified Implication Equivalence Law  ( U `->` ( E `->` U ) )
       (intuitionist version - non-freeness condition b). `t.`

       Only this direction is deducible with intuitionist logic. $)
    qimeqallintb-P7 $p
        |- ( A. x ( w_ph -> w_ps ) -> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-exists wff-forall wff-imp axL4ex-P7 wff-enfree dfenfreealt-P7
          bimpf-P4.RC rcp-NDIMP0addall syl-P3.24 )
        ACEBCEZBCFZABGCFZABCHNOGZPBCIQDBCJKLM
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Simplified Proper Substitution Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t x $.

    $( ~dfpsubv-P6 , Derived from Natural Deduction Rules (restriction on
       '`t_t`'). `t.`

       This form can be used whenever '`x`' does not occur in '`t_t`'. $)
    dfpsubv-P7 $p |- ( [ t_t / x ] w_ph <-> A. x ( x = t_t -> w_ph ) ) $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall ndpsub3-P7.15
          ndpsub2-P7.14 ndbier-P3.15 imcomm-P3.27.RC alli-P7 ndbief-P3.14
          axL2-P3.22.RC alloverim-P7.GENF.RC wff-exists qimeqallintb-P7
          axL6ex-P7 mae-P3.23.RC alle-P7.CL dsyl-P3.25.RC rcp-NDBII0 )
        ABCDZCEBFZAGZCHZUFUDCABCIZUEUDAAUDUEABCJZKLMUGUEUDGZCHZUDCHZUDUFUJCUEA
        UDAUDUEUINOPUKUECQULUEUDCUHRBCSTUDCUAUBUC
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Full Proper Substitution Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ph y $. $d t_t y $.
    $d x y $.

    $( ~df-psub-D6.2 , Derived from Natural Deduction Rules. `t.` $)
    dfpsub-P7 $p
        |- (
          [ t_t / x ] w_ph <-> A. y ( y = t_t -> A. x ( x = y -> w_ph ) )
        )
    $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall ndpsub4-P7.16
          dfpsubv-P7 subimr-P3.40b.RC suball-P7.RC dbitrns-P4.16.RC )
        ABCEADFZCEZBDEOBGZPHZDIQCFOGAHCIZHZDIABCDJPBDKRTDPSQAOCKLMN
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Scheme Completion Axioms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L10.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( ~ax-L10 Derived from Natural Deduction Rules. `t.` $)
    axL10-P7 $p |- ( -. A. x w_ph -> A. x -. A. x w_ph ) $=
        ( wff-forall wff-neg ndenfrall1-P7.7 ndenfrneg-P7.2.RC enfrgen-P7.CL )
        ABCZDBHBABEFG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L11.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d x y $.

    $( ~ax-L11 Derived from Natural Deduction Rules. `t.` $)
    axL11-P7 $p |- ( A. x A. y w_ph -> A. y A. x w_ph ) $=
        ( wff-forall ndenfrall1-P7.7 ndenfrall2-P7.9.RC alle-P7.CL
          alloverim-P7.GENF.RC alli-P7 )
        ABDACDZBDCJCBACEFJABACGHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered Axiom L12.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t x $.

    $( ~ax-L12 Derived from Natural Deduction Rules. `t.`

       '`x`' cannot occur in '`t_t`'. $)
    axL12-P7 $p |- ( x = t_t -> ( w_ph -> A. x ( x = t_t -> w_ph ) ) ) $=
        ( term-obj wff-equals wff-psub wff-imp wff-forall ndpsub2-P7.14
          ndbief-P3.14 dfpsubv-P7 subimr-P3.40b.RC bimpf-P4.RC )
        CDBEZAABCFZGZGNANAGCHZGZGAONABCIJPRNOQAABCKLLM
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Revisiting Chapters 5 & 6.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Simplified Quantifier Introduction / Elimination Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alli-P7r.1 $e |- F/ x w_ga $.
    alli-P7r.2 $e |- ( w_ga -> w_ph ) $.

    $( Simplified '`A.`' Introduction Law. `t.`

       For the original form, using explicit substitution, see ~ndalli-P7.17 .
       The inference form is ~axGEN-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alli-P7 instead.  $)
    alli-P7r $p |- ( w_ga -> A. x w_ph ) $=
        ( alli-P7 ) ABCDEF
    $.
$}

${
    $d w_ga x $.

    alli-P7r.VR.1 $e |- ( w_ga -> w_ph ) $.

    $( ~alli-P7r with variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    alli-P7r.VR $p |- ( w_ga -> A. x w_ph ) $=
        ( ndenfrv-P7.1 alli-P7 ) ABCBCEDF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    alle-P7r.1 $e |- ( w_ga -> A. x w_ph ) $.

    $( Simplified '`A.`' Elimination Law. `t.`

       This is also known as the Specialization Law.  For the original form,
       using explicit substitution, see ~ndalle-P7.18 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alle-P7 instead. $)
    alle-P7r $p |- ( w_ga -> w_ph ) $=
        ( alle-P7 ) ABCDE
    $.
$}

${
    alle-P7r.RC.1 $e |- A. x w_ph $.

    $( Inference Form of ~alle-P7r . `t.` $)
    alle-P7r.RC $p |- w_ph $=
        ( wff-true wff-forall ndtruei-P3.17 alle-P7 ndtruee-P3.18 )
        AADBABECFGH
    $.
$}

${
    $( Closed Form of ~alle-P7r . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alle-P7.CL instead. $)
    alle-P7r.CL $p |- ( A. x w_ph -> w_ph ) $=
        ( alle-P7.CL ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exi-P7r.1 $e |- ( w_ga -> w_ph ) $.

    $( Simplified '`E.`' Introduction Law. `t.`

       For the original form, using explicit substitution, see
       ~ndexi-P7.19 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~exi-P7 instead. $)
    exi-P7r $p |- ( w_ga -> E. x w_ph ) $=
        ( exi-P7 ) ABCDE
    $.
$}

${
    alli-P7r.RC.1 $e |- w_ph $.

    $( Inference Form of ~exi-P7r . `t.` $)
    alli-P7r.RC $p |- E. x w_ph $=
        ( wff-exists wff-true ndtruei-P3.17 exi-P7 ndtruee-P3.18 )
        ABDAEBACFGH
    $.
$}

${
    $( Closed Form of ~exi-P7r . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~exi-P7.CL instead. $)
    exi-P7r.CL $p |- ( w_ph -> E. x w_ph ) $=
        ( exi-P7.CL ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exe-P7r.1 $e |- F/ x w_ga $.
    exe-P7r.2 $e |- F/ x w_ps $.
    exe-P7r.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    exe-P7r.4 $e |- ( w_ga -> E. x w_ph ) $.

    $( Simplified '`E.`' Elimination Law. `t.`

       For the original form, using explicit substitution, see ~ndexe-P7.20
       and ~ndexew-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~exe-P7 instead. $)
    exe-P7r $p |- ( w_ga -> w_ps ) $=
        ( exe-P7 ) ABCDEFGHI
    $.
$}

${
    $d w_ga x $.

    exe-P7r.VR1of2.1 $e |- F/ x w_ps $.
    exe-P7r.VR1of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    exe-P7r.VR1of2.3 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~exe-P7r with one variable restriction. `t.`

      '`x`' cannot occur in '`w_ga`'. $)
    exe-P7r.VR1of2 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 exe-P7 ) ABCDCDHEFGI
    $.
$}

${
    $d w_ps x $.

    exe-P7r.VR2of2.1 $e |- F/ x w_ga $.
    exe-P7r.VR2of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    exe-P7r.VR2of2.3 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~exe-P7r with one variable restriction.

       '`x`' cannot occur in '`w_ps`'. $)
    exe-P7r.VR2of2 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 exe-P7 ) ABCDEBDHFGI
    $.
$}

${
    $d w_ps x $.
    $d w_ga x $.

    exe-P7r.VR12of2.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    exe-P7r.VR12of2.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~exe-P7r with two variable restrictions. `t.`

       '`x`' cannot occur in either '`w_ga`' or '`w_ps`'. $)
    exe-P7r.VR12of2 $p |- ( w_ga -> w_ps ) $=
        ( ndenfrv-P7.1 exe-P7 ) ABCDCDGBDGEFH
    $.
$}

${
    exe-P7r.RC.1 $e |- F/ x w_ps $.
    exe-P7r.RC.2 $e |- ( w_ph -> w_ps ) $.
    exe-P7r.RC.3 $e |- E. x w_ph $.

    $( Inference Form of ~exe-P7r . `t.` $)
    exe-P7r.RC $p |- w_ps $=
        ( wff-true ndenfrv-P7.1 wff-imp ndtruei-P3.17 wff-exists exe-P7
          ndtruee-P3.18 )
        BABGZCNCHDABIEJACKFJLM
    $.
$}

${
    $d w_ps x $.

    exe-P7r.RC.VR.1 $e |- ( w_ph -> w_ps ) $.
    exe-P7r.RC.VR.2 $e |- E. x w_ph $.

    $( ~exe-P7r.RC with variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    exe-P7r.RC.VR $p |- w_ps $=
        ( ndenfrv-P7.1 exe-P7r.RC ) ABCBCFDEG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Distributive Laws Producing Universal Quantifiers.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alloverim-P7r.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.

    $( '`A. x`' Distributes Over '`->`'. `t.`

       The closed form is ~axL4-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverim-P7 instead. $)
    alloverim-P7r $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( alloverim-P7 ) ABCDEF
    $.
$}

${
    alloverim-P7r.RC.1 $e |- A. x ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverim-P7r . `t.` $)
    alloverim-P7r.RC $p |- ( A. x w_ph -> A. x w_ps ) $=
        ( wff-forall wff-imp wff-true ndtruei-P3.17 alloverim-P7
          ndtruee-P3.18 )
    ACEBCEFABGCABFCEDHIJ $.
$}

${
    alloverim-P7r.GENF.1 $e |- F/ x w_ga $.
    alloverim-P7r.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverim-P7r with generalization augmentation (non-freeness
       condition). `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverim-P7.GENF instead. $)
    alloverim-P7r.GENF $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( alloverim-P7.GENF ) ABCDEFG
    $.
$}

${
    $d w_ga x $.

    alloverim-P7r.GENV.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverim-P7r with generalization augmentation (variable restriction).
       `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    alloverim-P7r.GENV $p |- ( w_ga -> ( A. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp alli-P7r.VR alloverim-P7 ) ABCDABFCDEGH
    $.
$}

${
    alloverim-P7r.GENF.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverim-P7r.GENF . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverim-P7.GENF.RC instead. $)
    alloverim-P7r.GENF.RC $p |- ( A. x w_ph -> A. x w_ps ) $=
        ( alloverim-P7.GENF.RC ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dalloverim-P7.1 $e |- ( w_ga -> A. x ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Double '`A. x`' Distribution Over '`->`'. `t.` $)
    dalloverim-P7 $p
        |- ( w_ga -> ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) )
    $=
        ( wff-forall wff-imp wff-and alloverim-P7 import-P3.34a.RC
          rcp-NDIMI2 )
        BEGCEGHDAEGZBCDMIEDMBCHZEGANDEFJKJL
    $.
$}

${
    dalloverim-P7.RC.1 $e |- A. x ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverim-P7 . `t.` $)
    dalloverim-P7.RC $p |- ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) $=
        ( wff-forall wff-imp wff-true ndtruei-P3.17 dalloverim-P7
          ndtruee-P3.18 )
        ADFBDFCDFGGABCHDABCGGDFEIJK
    $.
$}

${
    $( Closed Form of ~dalloverim-P7 . `t.` $)
    dalloverim-P7.CL $p
        |- (
          A. x ( w_ph -> ( w_ps -> w_ch ) ) ->
          ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) )
        )
    $=
        ( wff-imp wff-forall rcp-NDASM1of1 dalloverim-P7 ) ABCABCEEDFZDIGH
    $.
$}

${
    dalloverim-P7.GENF.1 $e |- F/ x w_ga $.
    dalloverim-P7.GENF.2 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( ~dalloverim-P7 with generalization augmentation (non-freeness
       condition). `t.` $)
    dalloverim-P7.GENF $p
        |- ( w_ga -> ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) )
    $=
        ( wff-imp alli-P7 dalloverim-P7 ) ABCDEABCHHDEFGIJ
    $.
$}

${
    $d w_ga x $.

    dalloverim-P7.GENV.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( ~dalloverim-P7 with generalization augmentation (variable restriction).
       `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    dalloverim-P7.GENV $p
        |- ( w_ga -> ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) ) )
    $=
        ( wff-imp alli-P7r.VR dalloverim-P7 ) ABCDEABCGGDEFHI
    $.
$}

${
    dalloverim-P7.GENF.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference form of ~dalloverim-P7.GENF . `t.` $)
    dalloverim-P7.GENF.RC $p
        |- ( A. x w_ph -> ( A. x w_ps -> A. x w_ch ) )
    $=
        ( wff-forall wff-imp wff-true ndenfrv-P7.1 ndtruei-P3.17
          dalloverim-P7.GENF ndtruee-P3.18 )
        ADFBDFCDFGGABCHZDMDIABCGGEJKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Distributive Laws Producing Existential Quantifiers.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    alloverimex-P7r.1 $e |- ( w_ga -> A. x ( w_ph -> w_ps ) ) $.

    $( Alternate version of ~alloverim-P7r that produces existential
       quantifiers. `t.`

       The closed form is ~axL4ex-P7 .

       This is a restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverimex-P7 instead. $)
    alloverimex-P7r $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( alloverimex-P7 ) ABCDEF
    $.
$}

${
    alloverimex-P7r.RC.1 $e |- A. x ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverimex-P7 . `t.` $)
    alloverimex-P7r.RC $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( wff-exists wff-imp wff-true wff-forall ndtruei-P3.17 alloverimex-P7
          ndtruee-P3.18 )
        ACEBCEFABGCABFCHDIJK
    $.
$}

${
    alloverimex-P7r.GENF.1 $e |- F/ x w_ga $.
    alloverimex-P7r.GENF.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~alloverimex-P7r with generalization augmentation (non-freeness
       condition). `t.`

       This is a restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverimex-P7.GENF instead. $)
    alloverimex-P7r.GENF $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( alloverimex-P7.GENF ) ABCDEFG
    $.
$}

${
    $d w_ga x $.

    alloverimex-P7r.GENV.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.
    $( ~alloverimex-P7r with generalization augmentation (variable
       restriction). `t.` 

       '`x`' cannot occur in '`w_ga`'. $)
    alloverimex-P7r.GENV $p |- ( w_ga -> ( E. x w_ph -> E. x w_ps ) ) $=
        ( wff-imp alli-P7r.VR alloverimex-P7 ) ABCDABFCDEGH
    $.
$}

${
    alloverimex-P7r.GENF.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverimex-P7r.GENF . `t.` $)
    alloverimex-P7r.GENF.RC $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( wff-exists wff-imp wff-true ndenfrv-P7.1 ndtruei-P3.17
          alloverimex-P7r.GENF ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    dalloverimex-P7.2 $e |- ( w_ga -> A. x ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( Alternate version of ~dalloverim-P7 that produces existential
       quantifiers. `t.` $)
    dalloverimex-P7 $p
        |- ( w_ga -> ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) )
    $=
        ( wff-exists wff-imp wff-forall wff-and alloverim-P7 import-P3.34a.RC
          alloverimex-P7 rcp-NDIMI2 )
        BEGCEGHDAEIZBCDOJEDOBCHZEIAPDEFKLMN
    $.
$}

${
    dalloverimex-P7.RC.1 $e |- A. x ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverimex-P7 . `t.` $)
    dalloverimex-P7.RC $p |- ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) $=
        ( wff-forall wff-exists wff-imp wff-true ndtruei-P3.17 dalloverimex-P7
          ndtruee-P3.18 )
        ADFBDGCDGHHABCIDABCHHDFEJKL
    $.
$}

${
    $( Closed Form of ~dalloverimex-P7 . `t.` $)

    dalloverimex-P7.CL $p
        |- (
          A. x ( w_ph -> ( w_ps -> w_ch ) ) ->
          ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) )
        )
    $=
        ( wff-imp wff-forall rcp-NDASM1of1 dalloverimex-P7 )
        ABCABCEEDFZDIGH
    $.
$}

${
    dalloverimex-P7.GENF.1 $e |- F/ x w_ga $.
    dalloverimex-P7.GENF.2 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( ~dalloverimex-P7 with generalization augmentation (non-freeness
       condition. `t.` $)
    dalloverimex-P7.GENF $p
        |- ( w_ga -> ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) )
    $=
        ( wff-imp alli-P7 dalloverimex-P7 ) ABCDEABCHHDEFGIJ
    $.
$}

${
    $d w_ga x $.

    dalloverimex-P7.GENV.1 $e |- ( w_ga -> ( w_ph -> ( w_ps -> w_ch ) ) ) $.

    $( ~dalloverimex-P7 with generalization augmentation (variable
        restriction). `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    dalloverimex-P7.GENV $p
        |- ( w_ga -> ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) ) )
    $=
        ( wff-imp alli-P7r.VR dalloverimex-P7 ) ABCDEABCGGDEFHI
    $.
$}

${
    dalloverimex-P7.GENF.RC.1 $e |- ( w_ph -> ( w_ps -> w_ch ) ) $.

    $( Inference Form of ~dalloverimex-P7.GENF . `t.` $)
    dalloverimex-P7.GENF.RC $p
        |- ( A. x w_ph -> ( E. x w_ps -> E. x w_ch ) )
    $=
        ( wff-forall wff-exists wff-imp wff-true ndenfrv-P7.1 ndtruei-P3.17
          dalloverimex-P7.GENF ndtruee-P3.18 )
        ADFBDGCDGHHABCIZDNDJABCHHEKLM
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Substitution Theorems.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    suball-P7r.1 $e |- F/ x w_ga $.
    suball-P7r.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`A. x`' (non-freeness condition). `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~suball-P7 instead. $)
    suball-P7r $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( suball-P7 ) ABCDEFG
    $.
$}

${
    $d w_ga x $.

    suball-P7r.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`A. x`' (variable restriction). `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    suball-P7r.VR $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( ndenfrv-P7.1 suball-P7 ) ABCDCDFEG
    $.
$}

${
    suball-P7r.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~suball-P7r . `t.` 

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~suball-P7.RC instead. $)
    suball-P7r.RC $p |- ( A. x w_ph <-> A. x w_ps ) $=
        ( suball-P7.RC ) ABCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    subex-P7.1 $e |- F/ x w_ga $.

    subex-P7.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`E. x`' (non-freeness condition). `t.` $)
    subex-P7 $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( wff-exists ndbief-P3.14 alloverimex-P7.GENF ndbier-P3.15
          ndbii-P3.13 )
        ADGBDGCABCDEABCFHIBACDEABCFJIK
    $.
$}

${
    $d w_ga x $.

    subex-P7.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Theorem for '`E. x`' (variable restriction). `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    subex-P7.VR $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( ndenfrv-P7.1 subex-P7 ) ABCDCDFEG
    $.
$}

${
    subex-P7.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subex-P7 . `t.` $)
    subex-P7.RC $p |- ( E. x w_ph <-> E. x w_ps ) $=
        ( wff-exists wff-bi wff-true ndenfrv-P7.1 ndtruei-P3.17 subex-P7
          ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Dual Properties of Universal / Existential Quantification.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( "For all not" is Equivalent to "Does not exist". `t.`

       This statement is deducible with intuitionist logic.

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~allnegex-P7 instead. $)
    allnegex-P7r $p |- ( A. x -. w_ph <-> -. E. x w_ph ) $=
        ( allnegex-P7 ) ABC
    $.
$}


$( ------------------------------------------------------------------------- $)

${
    $( "There exists a negative" is Equivalent to "Not for all".

       This statement is not deducible with intuitionist logic. $)
    exnegall-P7 $p |- ( E. x -. w_ph <-> -. A. x w_ph ) $=
        ( wff-neg wff-exists wff-forall dfexists-P7 dnegeq-P4.10 suball-P7.RC
          subneg-P3.39.RC bitrns-P3.33c.RC )
        ACZBDKCZBEZCABEZCKBFMNLABAGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( "There exists a negative" Implies "Not for all". `t.`

       This direction is deducible with intuitionist logic.  $)
    exnegallint-P7 $p |- ( E. x -. w_ph -> -. A. x w_ph ) $=
        ( wff-forall wff-neg wff-exists wff-false wff-and ndenfrex1-P7.8
          ndenfrall1-P7.7 ndenfrand-P7.4.RC ndenfrv-P7.1 rcp-NDASM2of2 alle-P7
          nimpoe-P4.4b rcp-NDASM1of2 exe-P7 falsenegi-P4.18 )
        ABCZADZBEZSFZTRGZBTRBSBHABIJUABKAUAUBAUBBTRLMNTROPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Dual of ~dfexists-P7 .

       This statement is not deducible with intuitionist logic. $)
    allasex-P7 $p |- ( A. x w_ph <-> -. E. x -. w_ph ) $=
        ( wff-neg wff-exists wff-forall exnegall-P7 subneg-P3.39.RC
          dnegeq-P4.10 bitrns-P3.33c.RC bisym-P3.33b.RC )
        ACBDZCZABEZLMCZCMKNABFGMHIJ
    $.
$}
$( End $[ bfol-ch7.mm $] $)
$( Begin $[ bfol-typeset.mm $] $)

$( ! 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Typesetting

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
$)

$( $t

/* Custom CSS for Unicode fonts */
htmlcss '<link rel="stylesheet" \n' + 
    'media="screen" \n' +
    'href="https://fontlibrary.org/en/face/xits-math" \n' +
    'type="text/css"/> \n' +
    '<STYLE TYPE="text/css"> \n' +
    '<!--\n' +
    '  .wff { color: blue; } \n' +
    '  .objvar { color: red; } \n' +
    '  .term { color: green; } \n' +
    '  .class { color: #CC33CC; } \n' +
    '  .typecode { color: gray; } \n' +
    '  .math { font-family: XITSRegular; } \n' +
    '-->\n' +
    '</STYLE>\n';

/* Tag(s) for the main SPAN surrounding all Unicode math */
htmlfont 'CLASS=math';

/* Page title, home page link */
htmltitle 'bfol.mm Proof Explorer';

/* Variable color key at the bottom of each proof table */
htmlvarcolor '<SPAN CLASS=typecode STYLE="color:blue;font-style:normal">' +
    'wff</SPAN> ' +
    '<SPAN CLASS=typecode STYLE="color:red;font-style:normal">' +
    'objvar</SPAN> ' +
    '<SPAN CLASS=typecode STYLE="color:green;font-style:normal">' +
    'term</SPAN> ' +
    '<SPAN CLASS=typecode STYLE="color:#CC33CC;font-style:normal">' +
    'class</SPAN>';

/* ######################################################################### */
/* Chapter 0                                                                 */
/* ######################################################################### */

/* ************************************************************************* */
/* Constant Symbols */

/* ========================================================================= */
/* Type Codes */

althtmldef "wff" as "<SPAN CLASS=typecode>wff </SPAN>";
latexdef "wff" as "\mathrm{wff}";

althtmldef "term" as "<SPAN CLASS=typecode>term </SPAN>";
latexdef "term" as "\mathrm{term}";

althtmldef "objvar" as "<SPAN CLASS=typecode>objvar </SPAN>";
latexdef "objvar" as "\mathrm{objvar}";

althtmldef "class" as "<SPAN CLASS=typecode>class </SPAN>";
latexdef "class" as "\mathrm{class}";

althtmldef "|-" as "<SPAN CLASS=typecode>&vdash; </SPAN>";
latexdef "|-" as "\vdash";

/* ========================================================================= */
/* Primitive Syntax */

althtmldef "(" as "(";
latexdef "(" as "(";

althtmldef ")" as ")";
latexdef ")" as ")";

althtmldef "->" as " &rarr; ";
latexdef "->" as "\rightarrow";

althtmldef "-." as "&not; ";
latexdef "-." as "\lnot";

althtmldef "A." as "&forall;";
latexdef "A." as "\forall";

althtmldef "=" as " = ";
latexdef "=" as "=";

althtmldef "e." as " &isin; ";
latexdef "e." as "\in";

althtmldef "0" as "0";
latexdef "0" as "0";

althtmldef "s`" as "s&lsquo;";
latexdef "s`" as "s`"; 

althtmldef "+" as " + ";
latexdef "+" as "+";

althtmldef "x." as " &sdot; ";
latexdef "x." as "\cdot_p";

/* ========================================================================= */
/* Typesetting Constants */

althtmldef "&" as " &amp; ";
latexdef "&" as "\mathrel{\&}";

althtmldef "=>" as " &rArr; ";
latexdef "=>" as "\Rightarrow";

althtmldef "<=>" as " &hArr; ";
latexdef "<=>" as "\Leftrightarrow";

althtmldef ":=" as " &coloneq; ";
latexdef ":=" as ":=";

althtmldef "t." as " &dagger; ";
latexdef "t." as "\dag";

/* ************************************************************************* */
/* Variables */

/* ========================================================================= */
/* WFF Variables */

althtmldef "w_ph" as "<SPAN CLASS=wff>&#x1D711;</SPAN>";
latexdef "w_ph" as "\varphi";

althtmldef "w_ph1" as "<SPAN CLASS=wff>&#x1D711;&#x2081;</SPAN>";
latexdef "w_ph1" as "\varphi_1";

althtmldef "w_ph2" as "<SPAN CLASS=wff>&#x1D711;&#x2082;</SPAN>";
latexdef "w_ph2" as "\varphi_2";

althtmldef "w_ph3" as "<SPAN CLASS=wff>&#x1D711;&#x2083;</SPAN>";
latexdef "w_ph3" as "\varphi_3";

althtmldef "w_ph4" as "<SPAN CLASS=wff>&#x1D711;&#x2084;</SPAN>";
latexdef "w_ph4" as "\varphi_4";

althtmldef "w_ph5" as "<SPAN CLASS=wff>&#x1D711;&#x2085;</SPAN>";
latexdef "w_ph5" as "\varphi_5";

althtmldef "w_ps" as "<SPAN CLASS=wff>&#x1D713;</SPAN>";
latexdef "w_ps" as "\psi";

althtmldef "w_ps1" as "<SPAN CLASS=wff>&#x1D713;&#x2081;</SPAN>";
latexdef "w_ps1" as "\psi_1";

althtmldef "w_ch" as "<SPAN CLASS=wff>&#x1D712;</SPAN>";
latexdef "w_ch" as "\chi";

althtmldef "w_ch1" as "<SPAN CLASS=wff>&#x1D712;&#x2081;</SPAN>";
latexdef "w_ch1" as "\chi_1";

althtmldef "w_th" as "<SPAN CLASS=wff>&#x1D717;</SPAN>";
latexdef "w_th" as "\vartheta";

althtmldef "w_ta" as "<SPAN CLASS=wff>&#x1D70F;</SPAN>";
latexdef "w_ta" as "\tau";

althtmldef "w_ga" as "<SPAN CLASS=wff>&#x1D6FE;</SPAN>";
latexdef "w_ga" as "\gamma";

althtmldef "w_ga1" as "<SPAN CLASS=wff>&#x1D6FE;&#x2081;</SPAN>";
latexdef "w_ga1" as "\gamma_1";

althtmldef "w_ga2" as "<SPAN CLASS=wff>&#x1D6FE;&#x2082;</SPAN>";
latexdef "w_ga2" as "\gamma_2";

althtmldef "w_ga3" as "<SPAN CLASS=wff>&#x1D6FE;&#x2083;</SPAN>";
latexdef "w_ga3" as "\gamma_3";

althtmldef "w_ga4" as "<SPAN CLASS=wff>&#x1D6FE;&#x2084;</SPAN>";
latexdef "w_ga4" as "\gamma_4";

althtmldef "w_ga5" as "<SPAN CLASS=wff>&#x1D6FE;&#x2085;</SPAN>";
latexdef "w_ga5" as "\gamma_5";

/* ========================================================================= */
/* Term Variables */

althtmldef "t_s" as "<SPAN CLASS=term>&#x1D460;</SPAN>";
latexdef "t_s" as "s";

althtmldef "t_t" as "<SPAN CLASS=term>&#x1D461;</SPAN>";
latexdef "t_t" as "t";

althtmldef "t_t1" as "<SPAN CLASS=term>&#x1D461;&#x2081;</SPAN>";
latexdef "t_t1" as "t_1";

althtmldef "t_t2" as "<SPAN CLASS=term>&#x1D461;&#x2082;</SPAN>";
latexdef "t_t2" as "t_2";

althtmldef "t_u" as "<SPAN CLASS=term>&#x1D462;</SPAN>";
latexdef "t_u" as "u";

althtmldef "t_u1" as "<SPAN CLASS=term>&#x1D462;&#x2081;</SPAN>";
latexdef "t_u1" as "u_1";

althtmldef "t_u2" as "<SPAN CLASS=term>&#x1D462;&#x2082;</SPAN>";
latexdef "t_u2" as "u_2";

althtmldef "t_v" as "<SPAN CLASS=term>&#x1D463;</SPAN>";
latexdef "t_v" as "v";

althtmldef "t_v1" as "<SPAN CLASS=term>&#x1D463;&#x2081;</SPAN>";
latexdef "t_v1" as "v_1";

althtmldef "t_v2" as "<SPAN CLASS=term>&#x1D463;&#x2082;</SPAN>";
latexdef "t_v2" as "v_2";

althtmldef "t_w" as "<SPAN CLASS=term>&#x1D464;</SPAN>";
latexdef "t_w" as "w";

/* ========================================================================= */
/* Object Variables */

althtmldef "x" as "<SPAN CLASS=objvar>&#x1D465;</SPAN>";
latexdef "x" as "x";

althtmldef "x1" as "<SPAN CLASS=objvar>&#x1D465;&#x2081;</SPAN>";
latexdef "x1" as "x_1";

althtmldef "y" as "<SPAN CLASS=objvar>&#x1D466;</SPAN>";
latexdef "y" as "y";

althtmldef "y1" as "<SPAN CLASS=objvar>&#x1D466;&#x2081;</SPAN>";
latexdef "y1" as "y_1";

althtmldef "z" as "<SPAN CLASS=objvar>&#x1D467;</SPAN>";
latexdef "z" as "z";

althtmldef "z1" as "<SPAN CLASS=objvar>&#x1D467;&#x2081;</SPAN>";
latexdef "z1" as "z_1";

althtmldef "a" as "<SPAN CLASS=objvar>&#x1D44E;</SPAN>";
latexdef "a" as "a";

althtmldef "a1" as "<SPAN CLASS=objvar>&#x1D44E;&#x2081;</SPAN>";
latexdef "a1" as "a_1";

althtmldef "b" as "<SPAN CLASS=objvar>&#x1D44F;</SPAN>";
latexdef "b" as "b";

althtmldef "b1" as "<SPAN CLASS=objvar>&#x1D44F;&#x2081;</SPAN>";
latexdef "b1" as "b_1";

althtmldef "c" as "<SPAN CLASS=objvar>&#x1D450;</SPAN>";
latexdef "c" as "c";

althtmldef "c1" as "<SPAN CLASS=objvar>&#x1D450;&#x2081;</SPAN>";
latexdef "c1" as "c_1";

althtmldef "d" as "<SPAN CLASS=objvar>&#x1D451;</SPAN>";
latexdef "d" as "d";

/* ######################################################################### */
/* Chapter 2                                                                 */
/* ######################################################################### */

/* ************************************************************************* */
/* Defined Syntax */

althtmldef "<->" as " &harr; ";
latexdef "<->" as "\leftrightarrow";

althtmldef "/\" as " &wedge; ";
latexdef "/\" as "\land";

althtmldef "\/" as " &vee; ";
latexdef "\/" as "\lor";

althtmldef "T." as " &top; ";
latexdef "T." as "\top";

althtmldef "F." as " &perp; ";
latexdef "F." as "\bot";  

/* ######################################################################### */
/* Chapter 5                                                                 */
/* ######################################################################### */

/* ************************************************************************* */
/* Defined Syntax */

althtmldef "E." as "&exist;";
latexdef "E." as "\exists";

/* ######################################################################### */
/* Chapter 6                                                                 */
/* ######################################################################### */

/* ************************************************************************* */
/* Defined Syntax */

althtmldef "F/" as "&#8498;";
latexdef "F/" as "\Finv";

althtmldef "[" as "[";
latexdef "[" as "[";

althtmldef "]" as "]";
latexdef "]" as "]";

althtmldef "/" as " / ";
latexdef "/" as "/";

$)
$( End $[ bfol-typeset.mm $] $)
