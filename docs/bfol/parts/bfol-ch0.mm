
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
$( Defined Syntax: Chapter 8 $)

  $( Is (effectively) Not Free in a Term. $)
  $c F/t $.

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

    $v x x1 x2 $.
    objvar-x $f objvar x $.
    objvar-x1 $f objvar x1 $.
    objvar-x2 $f objvar x2 $.

    $v y y1 y2 $.
    objvar-y $f objvar y $.
    objvar-y1 $f objvar y1 $.
    objvar-y2 $f objvar y2 $.

    $v z z1 z2 $.
    objvar-z $f objvar z $.
    objvar-z1 $f objvar z1 $.
    objvar-z2 $f objvar z2 $.

    $v a a1 a2 $.
    objvar-a $f objvar a $.
    objvar-a1 $f objvar a1 $.
    objvar-a2 $f objvar a2 $.

    $v b b1 b2 $.
    objvar-b $f objvar b $.
    objvar-b1 $f objvar b1 $.
    objvar-b2 $f objvar b2 $.

    $v c c1 c2 $.
    objvar-c $f objvar c $.
    objvar-c1 $f objvar c1 $.
    objvar-c2 $f objvar c2 $.

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
