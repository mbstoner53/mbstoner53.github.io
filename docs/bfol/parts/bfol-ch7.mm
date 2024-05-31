
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
  Axiomatic Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Effective Non-Freeness Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  The contextless (obtained by replacing '`w_ga`' with '`T.`' ) forms of rules
  1 through 10 define *grammatical* non-freeness (the typical textbook
  definition).  This type of non-freeness is always decidable and can be
  determined from syntax alone for any WFF not containing term or WFF
  metavariables.

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
  '`F/ x w_ph`', given '`( w_ga -> F/ x w_ph )`', *conditional* non-freeness
  is an even weaker notion of non-freeness that depends on the given context
  '`w_ga`'.

  As an example consider '`w_ga`'&nbsp;`:=`&nbsp;'`y = 0`' and 
  '`w_ph`'&nbsp;`:=`&nbsp;'`( x x. y ) = 0`'. Then it is true that
  '`( w_ga -> F/ x w_ph )`' but '`F/ x w_ph`' is not true in general. In other
  words, '`x`' is *conditionally* not free in '`w_ph`' with respect to
  '`w_ga`', but '`x`' is still effectively free in '`w_ph`' (in the absolute
  sense). The worked out version of this example is given as ~example-E7.1a
  and ~example-E7.1b .

  It also appears that one additional axiom, ~ndnfrnfr-P7.12 , is needed to
  recover the closed form definition of effective non-freeness given in the
  Hilbert system. 
$)

${
    $d w_ph x $.

    $( Natural Deduction:  Effective Non-Freeness Rule 1. 

       If '`x`' does not occur in '`w_ph`', then '`x`' is effectively not
       free in '`w_ph`'. $)
    ndnfrv-P7.1 $p |- F/ x w_ph $=
        ( nfrv-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrneg-P7.2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 2.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is (conditionally) effectively not free in '`-. w_ph`'. $)
    ndnfrneg-P7.2 $p |- ( w_ga -> F/ x -. w_ph ) $=
        ( wff-nfree wff-imp wff-neg nfrneg-P6 rcp-NDBIER0 imsubr-P3.28b.RC
          rcp-NDIME0 )
        BACEZFBAGCEZFDLMBMLACHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrim-P7.3.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndnfrim-P7.3.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 3.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph -> w_ps )`'. $)
    ndnfrim-P7.3 $p |- ( w_ga -> F/ x ( w_ph -> w_ps ) ) $=
        ( nfrimd-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrand-P7.4.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndnfrand-P7.4.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 4.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph /\ w_ps )`'. $)
    ndnfrand-P7.4 $p |- ( w_ga -> F/ x ( w_ph /\ w_ps ) ) $=
        ( nfrandd-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfror-P7.5.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndnfror-P7.5.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 5.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph \/ w_ps )`'. $)
    ndnfror-P7.5 $p |- ( w_ga -> F/ x ( w_ph \/ w_ps ) ) $=
        ( nfrord-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrbi-P7.6.1 $e |- ( w_ga -> F/ x w_ph ) $.
    ndnfrbi-P7.6.2 $e |- ( w_ga -> F/ x w_ps ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 6.

       If '`x`' is (conditionally) effectively not free in both '`w_ph`' and
       '`w_ps`', then '`x`' is (conditionally) effectively not free in
       '`( w_ph <-> w_ps )`'. $)
    ndnfrbi-P7.6 $p |- ( w_ga -> F/ x ( w_ph <-> w_ps ) ) $=
        ( nfrbid-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Natural Deduction: Effective Non-Freeness Rule 7.

       '`x`' is effectively not free in '`A. x w_ph`' (since any '`x`'
       appearing '`w_ph`' will be bound). $)
    ndnfrall1-P7.7 $p |- F/ x A. x w_ph $=
        ( nfrall1-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Natural Deduction: Effective Non-Freeness Rule 8. 

       '`x`' is effectively not free in '`E. x w_ph`' (since any '`x`'
       appearing '`w_ph`' will be bound). $)
    ndnfrex1-P7.8 $p |- F/ x E. x w_ph $=
        ( nfrex1-P6 ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndnfrall2-P7.9.1 $e |- F/ x w_ga $.
    ndnfrall2-P7.9.2 $e |- F/ y w_ga $.
    ndnfrall2-P7.9.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 9.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is also (conditionally) effectively not free in '`A. y w_ph`',
       where '`y`' is different from '`x`' and neither '`x`' nor '`y`' are
       effectively free in the context, '`w_ga`'.  $)
    ndnfrall2-P7.9 $p |- ( w_ga -> F/ x A. y w_ph ) $=
        ( nfrall2d-P6 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndnfrex2-P7.10.1 $e |- F/ x w_ga $.
    ndnfrex2-P7.10.2 $e |- F/ y w_ga $.
    ndnfrex2-P7.10.3 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 10.

       If '`x`' is (conditionally) effectively not free in '`w_ph`', then
       '`x`' is also (conditionally) effectively not free in '`E. y w_ph`',
       where '`y`' is different from '`x`' and neither '`x`' nor '`y`' are
       effectively free in the context, '`w_ga`'.  $)
    ndnfrex2-P7.10 $p |- ( w_ga -> F/ x E. y w_ph ) $=
        ( nfrex2d-P6 ) ABCDEFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrleq-P7.11.1 $e |- F/ x w_ga $.
    ndnfrleq-P7.11.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Natural Deduction: Effective Non-Freeness Rule 11. 

       If '`x`' is not effectively free in the context '`w_ga`', then the
       (conditional) effective non-freeness of '`x`' is conserved between
       (conditionally) logically equivalent WFFs. $)
    ndnfrleq-P7.11 $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( subnfr-P6 ) ABCDEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
   $( Natural Deduction: Effective Non-Freeness Rule 12.

      The effective non-freeness predicate is itself is effectively not free.
      In semantic terms, this means that the effective non-freeness of the
      object variable '`x`' does not depend on it's value assignment. $)
    ndnfrnfr-P7.12 $p |- F/ x F/ x w_ph $=
        ( nfrnfr-P6 ) ABC
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
       hypothesis.  Only *conditional* non-freeness of '`y`' in '`w_ch`',
       where '`w_ga`' is the condition, is necessary.  This makes the rule
       slightly stronger than if we required the stronger hypothesis,
       '`|- F/ y w_ps`'.  This slight strengthing seems to be necessary to
       deduce the closed form '`( F/ x -> ( w_ph -> A. x w_ph ) )`'.  The
       weaker form, given by ~ndexew-P7 , is more typically used however. $)
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
  set of rules that, taken together, cover every predicate (indluding
  equality) and every primitive function in the language.  These rules can be
  combined with other derived substitution laws to obtain the same results.
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
  Derived Utility Rules.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  From here on we will treat P3.1 - P3.20 and P7.1 - P7.24 as the new set of
  axioms.  We will no longer refer to any results from chapters 1, 2, 5, or 6
  (except indirectly through the axioms stated above).

  This will allow us to track the us of ~ndexclmid-P3.16 . By avoiding the Law
  of Excluded Middle, it is possible to develop an intuitionist logical
  framework alongside the standard classical case.

  From here on, all theorems derived without reference to the Law of Excluded
  Middle ( ~ndexclmid-P3.16 ) will have a `t.` in the comment.
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Dual Substitution Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    ndsubeqd-P7.1 $e |- ( w_ga -> t_s = t_t ) $.
    ndsubeqd-P7.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Natural Deduction: Equality Substitution Rule (dual). `t.` $)
    ndsubeqd-P7 $p |- ( w_ga -> ( t_s = t_u <-> t_t = t_w ) ) $=
        ( wff-equals ndsubeql-P7.22a ndsubeqr-P7.22b bitrns-P3.33c )
        BDHCDHCEHAABCDFIADECGJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubelofd-P7.1 $e |- ( w_ga -> t_s = t_t ) $.
    ndsubelofd-P7.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Natural Deduction: Predicate Substitution Rule ('`e.`' dual). `t.` $)
    ndsubelofd-P7 $p |- ( w_ga -> ( t_s e. t_u <-> t_t e. t_w ) ) $=
        ( wff-elemof ndsubelofl-P7.23a ndsubelofr-P7.23b bitrns-P3.33c )
        BDHCDHCEHAABCDFIADECGJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubaddd-P7.1 $e |- ( w_ga -> t_s = t_t ) $.
    ndsubaddd-P7.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Natural Deduction: Function Substitution Rule ('`+`' dual). `t.` $)
    ndsubaddd-P7 $p |- ( w_ga -> ( t_s + t_u ) = ( t_t + t_w ) ) $=
        ( term-add wff-equals ndsubaddl-P7.24b ndsubaddr-P7.24c
          ndsubeqr-P7.22b bimpf-P4 )
        BDHZCDHZINCEHZIAABCDFJAOPNADECGKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndsubmultd-P7.1 $e |- ( w_ga -> t_s = t_t ) $.
    ndsubmultd-P7.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Natural Deduction: Function Substitution Rule ('`x.`' dual). `t.` $)
    ndsubmultd-P7 $p |- ( w_ga -> ( t_s x. t_u ) = ( t_t x. t_w ) ) $=
        ( term-mult wff-equals ndsubmultl-P7.24d ndsubmultr-P7.24e
          ndsubeqr-P7.22b bimpf-P4 )
        BDHZCDHZINCEHZIAABCDFJAOPNADECGKLM
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Restricted Variable Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d w_ga x $. $d w_ga y $.
    $d x y $.

    ndnfrall2-P7.9.VR12of2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ~ndnfrall2-P7.9 with 2 variable restrictions. `t.`

       Neither '`x`' nor '`y`' can occur in '`w_ga`'. $)
    ndnfrall2-P7.9.VR12of2 $p |- ( w_ga -> F/ x A. y w_ph ) $=
        ( ndnfrv-P7.1 ndnfrall2-P7.9 ) ABCDBCFBDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x y $.

    ndnfrex2-P7.10.VR12of2.1 $e |- ( w_ga -> F/ x w_ph ) $.

    $( ~ndnfrex2-P7.10 with 2 variable restrictions. `t.` 

       Neither '`x`' nor '`y`' can occur in '`w_ga`'. $)
    ndnfrex2-P7.10.VR12of2 $p |- ( w_ga -> F/ x E. y w_ph ) $=
        ( ndnfrv-P7.1 ndnfrex2-P7.10 ) ABCDBCFBDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga x $.

    ndnfrleq-P7.11.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( ~ndnfrleq-P7.11 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    ndnfrleq-P7.11.VR $p |- ( w_ga -> ( F/ x w_ph <-> F/ x w_ps ) ) $=
        ( ndnfrv-P7.1 ndnfrleq-P7.11 ) ABCDCDFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ps x $. $d t_t x $.

    ndpsub1-P7.13.VR.1 $e |- ( x = t_t -> ( w_ph <-> w_ps ) ) $.

    $( ~ndpsub1-P7.13 with extra variable restriction. `t.`

       '`x`' cannot occur in either '`t_t`' or '`w_ps`'. $)
    ndpsub1-P7.13.VR $p |- ( [ t_t / x ] w_ph <-> w_ps ) $=
        ( ndnfrv-P7.1 ndpsub1-P7.13 ) ABCDBDFEG
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
        ( ndnfrv-P7.1 ndalli-P7.17 ) ABCDBDGEFH
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
        ( ndnfrv-P7.1 ndalli-P7.17 ) ABCDEADGFH
    $.
$}

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    ndalli-P7.17.VR12of2.1 $e |- ( w_ga -> [ y / x ] w_ph ) $.
    $( ~ndalli-P7.17 with two variable restrictions. `t.`

       '`y`' cannot occur in either '`w_ga`' or '`w_ph`'. $)
    ndalli-P7.17.VR12of2 $p |- ( w_ga -> A. x w_ph ) $=
        ( ndnfrv-P7.1 ndalli-P7.17 ) ABCDBDFADFEG
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
        ( wff-nfree rcp-NDIMP0addall ndexe-P7.20 ) ABCDEFGBEKCHLIJM
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDECEJFGHIK
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDEFAEJGHIK
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDEFGBEJHIK
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDECEIAEIFGHJ
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDECEIFBEIGHJ
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDEFAEIBEIGHJ
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
        ( ndnfrv-P7.1 ndexew-P7 ) ABCDECEHAEHBEHFGI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Inference Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    ndnfrneg-P7.2.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndnfrneg-P7.2 . $)
    ndnfrneg-P7.2.RC $p |- F/ x -. w_ph $=
        ( wff-neg wff-nfree wff-true ndtruei-P3.17 ndnfrneg-P7.2
          ndtruee-P3.18 )
        ADBEAFBABECGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrim-P7.3.RC.1 $e |- F/ x w_ph $.
    ndnfrim-P7.3.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndnfrim-P7.3 . `t.` $)
    ndnfrim-P7.3.RC $p |- F/ x ( w_ph -> w_ps ) $=
        ( wff-imp wff-nfree wff-true ndtruei-P3.17 ndnfrim-P7.3
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrand-P7.4.RC.1 $e |- F/ x w_ph $.
    ndnfrand-P7.4.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndnfrand-P7.4 . `t.` $)
    ndnfrand-P7.4.RC $p |- F/ x ( w_ph /\ w_ps ) $=
        ( wff-and wff-nfree wff-true ndtruei-P3.17 ndnfrand-P7.4
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfror-P7.5.RC.1 $e |- F/ x w_ph $.
    ndnfror-P7.5.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndnfror-P7.5 . `t.` $)
    ndnfror-P7.5.RC $p |- F/ x ( w_ph \/ w_ps ) $=
        ( wff-or wff-nfree wff-true ndtruei-P3.17 ndnfror-P7.5
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrbi-P7.6.RC.1 $e |- F/ x w_ph $.
    ndnfrbi-P7.6.RC.2 $e |- F/ x w_ps $.

    $( Inference Form of ~ndnfrbi-P7.6 . $)
    ndnfrbi-P7.6.RC $p |- F/ x ( w_ph <-> w_ps ) $=
        ( wff-bi wff-nfree wff-true ndtruei-P3.17 ndnfrbi-P7.6
          ndtruee-P3.18 )
        ABFCGABHCACGDIBCGEIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndnfrall2-P7.9.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndnfrall2-P7.9 . $)
    ndnfrall2-P7.9.RC $p |- F/ x A. y w_ph $=
        ( wff-forall wff-nfree wff-true ndtruei-P3.17 ndnfrall2-P7.9.VR12of2
          ndtruee-P3.18 )
        ACEBFAGBCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    ndnfrex2-P7.10.RC.1 $e |- F/ x w_ph $.

    $( Inference Form of ~ndnfrex2-P7.10 . $)
    ndnfrex2-P7.10.RC $p |- F/ x E. y w_ph $=
        ( wff-exists wff-nfree wff-true ndtruei-P3.17 ndnfrex2-P7.10.VR12of2
          ndtruee-P3.18 )
        ACEBFAGBCABFDHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    ndnfrleq-P7.11.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~ndnfrleq-P7.11 . `t.` $)

    ndnfrleq-P7.11.RC $p |- ( F/ x w_ph <-> F/ x w_ps ) $=
        ( wff-nfree wff-bi wff-true ndtruei-P3.17 ndnfrleq-P7.11.VR
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
        ( ndnfrv-P7.1 ndalli-P7.17.RC ) ABCACEDF
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
        ( ndnfrv-P7.1 ndexew-P7.RC ) ABCDADHEFGI
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
        ( ndnfrv-P7.1 ndexew-P7.RC ) ABCDEBDHFGI
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
        ( ndnfrv-P7.1 ndexew-P7.RC ) ABCDADGBDGEFH
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
    ndsubeqd-P7.RC.1 $e |- t_s = t_t $.
    ndsubeqd-P7.RC.2 $e |- t_u = t_w $.

    $( Inference Form of ~ndsubeqd-P7 . `t.` $)
    ndsubeqd-P7.RC $p |- ( t_s = t_u <-> t_t = t_w ) $=
        ( wff-equals wff-bi wff-true ndtruei-P3.17 ndsubeqd-P7 ndtruee-P3.18 )
        ACGBDGHIABCDABGEJCDGFJKL
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
    ndsubelofd-P7.RC.1 $e |- t_s = t_t $.
    ndsubelofd-P7.RC.2 $e |- t_u = t_w $.

    $( Inference Form of ~ndsubelofd-P7 . `t.` $)
    ndsubelofd-P7.RC $p |- ( t_s e. t_u <-> t_t e. t_w ) $=
        ( wff-elemof wff-bi wff-true wff-equals ndtruei-P3.17 ndsubelofd-P7
          ndtruee-P3.18 )
        ACGBDGHIABCDABJEKCDJFKLM
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
    ndsubaddd-P7.RC.1 $e |- t_s = t_t $.
    ndsubaddd-P7.RC.2 $e |- t_u = t_w $.

    $( Inference Form of ~ndsubaddd-P7 . `t.` $)
    ndsubaddd-P7.RC $p |- ( t_s + t_u ) = ( t_t + t_w ) $=
        ( term-add wff-equals wff-true ndtruei-P3.17 ndsubaddd-P7
          ndtruee-P3.18 )
        ACGBDGHIABCDABHEJCDHFJKL
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

$( ------------------------------------------------------------------------- $)

${
    ndsubmultd-P7.RC.1 $e |- t_s = t_t $.
    ndsubmultd-P7.RC.2 $e |- t_u = t_w $.

    $( Inference Form of ~ndsubmultd-P7 . `t.` $)
    ndsubmultd-P7.RC $p |- ( t_s x. t_u ) = ( t_t x. t_w ) $=
        ( term-mult wff-equals wff-true ndtruei-P3.17 ndsubmultd-P7
          ndtruee-P3.18 )
        ACGBDGHIABCDABHEJCDHFJKL
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Closed Forms of Natural Deduction Rules.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Closed Form of ~ndnfrneg-P7.2 . `t.` $)
    ndnfrneg-P7.2.CL $p |- ( F/ x w_ph -> F/ x -. w_ph ) $=
        ( wff-nfree rcp-NDASM1of1 ndnfrneg-P7.2 )
        AABCZBFDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndnfrim-P7.3 . `t.` $)
    ndnfrim-P7.3.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph -> w_ps ) )
    $=
        ( wff-nfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndnfrim-P7.3 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndnfrand-P7.4 . `t.` $)
    ndnfrand-P7.4.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph /\ w_ps ) )
    $=
        ( wff-nfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndnfrand-P7.4 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndnfror-P7.5 . `t.` $)
    ndnfror-P7.5.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph \/ w_ps ) )
    $=
        ( wff-nfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndnfror-P7.5 )
        ABACDZBCDZECIJFIJGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndnfrbi-P7.6 . `t.` $)
    ndnfrbi-P7.6.CL $p
        |- ( ( F/ x w_ph /\ F/ x w_ps ) -> F/ x ( w_ph <-> w_ps ) )
    $=
        ( wff-nfree wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndnfrbi-P7.6 )
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
    $( Closed Form of ~ndsubeqd-P7 . `t.` $)
    ndsubeqd-P7.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s = t_u <-> t_t = t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndsubeqd-P7 )
        ABEZCDEZFABCDJKGJKHI
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
    $( Closed Form of ~ndsubelofd-P7 . `t.` $)
    ndsubelofd-P7.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s e. t_u <-> t_t e. t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndsubelofd-P7 )
        ABEZCDEZFABCDJKGJKHI
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
    $( Closed Form of ~ndsubaddd-P7 . `t.` $)
    ndsubaddd-P7.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s + t_u ) = ( t_t + t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndsubaddd-P7 )
        ABEZCDEZFABCDJKGJKHI
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

$( ------------------------------------------------------------------------- $)

${
    $( Closed Form of ~ndsubmultd-P7 . `t.` $)
    ndsubmultd-P7.CL $p
        |- ( ( t_s = t_t /\ t_u = t_w ) -> ( t_s x. t_u ) = ( t_t x. t_w ) )
    $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 ndsubmultd-P7 )
        ABEZCDEZFABCDJKGJKHI
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
    nfrthm-P7.1 $e |- w_ph $.
    $( Every Variable is ENF in a Theorem. `t.` $)
    nfrthm-P7 $p |- F/ x w_ph $=
        ( wff-nfree wff-true ndnfrv-P7.1 thmeqtrue-P4.21a ndnfrleq-P7.11.RC
          bimpr-P4.RC )
        ABDEZBDJBFAJBACGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $. $d t_t y $.
    $d t_t x $.
    $d x y $.

    psubnfrv-P7.1 $e |- F/ x w_ph $.

    $( Proper Substitution Applied To ENF Variable (variable restriction).
       `t.`

       '`x`' cannot occur in '`t_t`'. $)
    psubnfrv-P7 $p |- ( [ t_t / x ] w_ph <-> w_ph ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-bi ndpsub3-P7.15
          ndnfrbi-P7.6.RC ndpsub2-P7.14 lemma-L7.01a bisym-P3.33b.RC
          subiml2-P4.RC axL6ex-P7 ndexew-P7.RC.VR1of2 )
        AABCEZFGBHZARIZFCARCDABCJKCGZBHZSUAFEZTABCLUCUBUABFMNOBFPQN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    nfrgen-P7.1 $e |- F/ x w_ph $.
    nfrgen-P7.2 $e |- ( w_ga -> w_ph ) $.

    $( ENF In `=>` General For. `t.` $)
    nfrgen-P7 $p |- ( w_ga -> A. x w_ph ) $=
        ( objvar-y term-obj wff-psub psubnfrv-P7 bisym-P3.33b.RC
          subimr2-P4.RC ndalli-P7.17.VR12of2 )
        ABCFAAFGZCHZBENAAMCDIJKL
    $.
$}

${
    nfrgen-P7.RC.1 $e |- F/ x w_ph $.
    nfrgen-P7.RC.2 $e |- w_ph $.

    $( Inference Form of ~nfrgen-P7 . `t.` $)
    nfrgen-P7.RC $p |- A. x w_ph $=
        ( wff-forall wff-true ndtruei-P3.17 nfrgen-P7 ndtruee-P3.18 )
        ABEAFBCADGHI
    $.
$}

${
    nfrgen-P7.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~nfrgen-P7 . `t.` $)
    nfrgen-P7.CL $p |- ( w_ph -> A. x w_ph ) $=
        ( rcp-NDASM1of1 nfrgen-P7 ) AABCADE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ga y $. $d w_ph y $.
    $d x y $.

    nfrexgen-P7.1 $e |- F/ x w_ph $.
    nfrexgen-P7.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( Dual Form of ~nfrgen-P7 . `t.` $)
    nfrexgen-P7 $p |- ( w_ga -> w_ph ) $=
        ( objvar-y term-obj wff-psub wff-imp psubnfrv-P7 rcp-NDBIEF0
          rcp-NDIMP0addall ndexew-P7.VR123of3 )
        AABCFAFGZCHZAIBOAANCDJKLEM
    $.
$}

${
    nfrexgen-P7.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~nfrexgen-P7 . `t.` $)
    nfrexgen-P7.CL $p |- ( E. x w_ph -> w_ph ) $=
        ( wff-exists rcp-NDASM1of1 nfrexgen-P7 ) AABDZBCGEF
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
        ( nfrthm-P7 nfrgen-P7.RC ) ABABCDCE
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
        ( ndnfrv-P7.1 nfrgen-P7.CL ) ABABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph x $.

    $( Existential Form of ~axL5-P7 . `t.` $)
    axL5ex-P7 $p |- ( E. x w_ph -> w_ph ) $=
        ( ndnfrv-P7.1 nfrexgen-P7.CL ) ABABCD
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
          ndnfrbi-P7.6.RC ndpsub2-P7.14 eqsym-P7.CL.SYM subiml2-P4.RC
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
        ( term-obj wff-psub objvar-y ndpsub4-P7.16 ndnfrv-P7.1 psubinv-P7
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

    lemma-L7.02a-L1.1 $e |- F/ x w_ga $.
    lemma-L7.02a-L1.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Lemma for ~lemma-L7.02a . `t.` $)
    lemma-L7.02a-L1 $p
        |- ( w_ga -> ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) )
    $=
        ( objvar-y term-obj wff-equals wff-psub wff-imp ndpsub3-P7.15
          ndnfrim-P7.3.RC wff-and ndpsub2-P7.14 ndbier-P3.15 rcp-NDIMP0addall
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

    lemma-L7.02a.1 $e |- F/ x w_ga $.
    lemma-L7.02a.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Proper Substitution Over Implication Lemma. `t.` $)
    lemma-L7.02a $p
        |- ( w_ga -> ( [ t_t / x ] w_ph -> [ t_t / x ] w_ps ) )
    $=
        ( wff-psub objvar-y term-obj wff-imp ndpsub4-P7.16 rcp-NDBIEF0
          rcp-NDIMP0addall ndnfrv-P7.1 lemma-L7.02a-L1 rcp-NDBIER0
          dsyl-P3.25 )
        ADEHZAIJZEHZDIHZBTEHZDIHZBDEHZCSUBKCSUBADEILMNUAUCCDICIOABCTEFGPPUDUEK
        CUEUDBDEILQNR
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
          ndalle-P7.18.CL rcp-NDIMP0addall ndnfrall1-P7.7 alle-P7.CL
          lemma-L7.02a syl-P3.24 import-P3.34a.RC ndalli-P7.17.VR12of2
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
          ndnfrall1-P7.7 alle-P7.CL lemma-L7.02a ndexi-P7.19.CL
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
        ( wff-forall nfrgen-P7.CL wff-imp axGEN-P7 axL4-P7 rcp-NDIME0
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

${
    alloverimex-P7.GENF.RC.1 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~alloverimex-P7.GENF . `t.` $)
    alloverimex-P7.GENF.RC $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( wff-exists wff-imp wff-true ndnfrv-P7.1 ndtruei-P3.17
          alloverimex-P7.GENF ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
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
        ( wff-exists alloverimex-P7.GENF wff-imp nfrexgen-P7.CL
          rcp-NDIMP0addall syl-P3.24 )
        ADHBDHZBCABCDEGINBJCBDFKLM
    $.
$}

${
    exia-P7.RC.1 $e |- F/ x w_ps $.
    exia-P7.RC.2 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~exia-P7 . `t.` $)
    exia-P7.RC $p |- ( E. x w_ph -> w_ps ) $=
        ( wff-exists wff-imp wff-true ndnfrv-P7.1 ndtruei-P3.17 exia-P7
          ndtruee-P3.18 )
        ACFBGABHZCMCIDABGEJKL
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
        ( wff-exists wff-neg wff-forall wff-false wff-and ndnfrall1-P7.7
          ndnfrex1-P7.8 ndnfrand-P7.4.RC ndnfrv-P7.1 alle-P7.CL
          rcp-NDIMP1add1 impoe-P4.4a rcp-NDASM2of2 exe-P7 falsenegi-P4.18 )
        ABCZADZBEZAFZTRGZBTRBSBHABIJUABKAUAUBSTRSBLMNTROPQ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~allnegex-P7 . `t.` $)
    allnegex-P7-L2 $p |- ( -. E. x w_ph -> A. x -. w_ph ) $=
        ( wff-neg wff-exists ndnfrex1-P7.8 ndnfrneg-P7.2.RC exi-P7.CL
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

  In intuitionist logic, existential quantification is a stronger notion
  than in the classical case as we have '`( E. x w_ph -> -. A. x -. w_ph )`',
  but not '`( -. A. x -. w_ph -> E. x w_ph )`'.  Also, unlike in the classical
  case, there is also no closed formula for existential quantification in
  terms of other the other primitive symbols.
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
    $( Necessary Condition for (i.e. "If" part of) Existential Quantifier
       Definition.

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

  In intuitionist logic, the original form of Axiom L6, given here as
  ~axL6-P7 , is weaker than the form involving existential quantification,
  deduced earlier as ~axL6ex-P7 .
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
    $d w_ph y $. $d t_t y $.
    $d t_t x $.
    $d x y $.

    lemma-L7.03.1 $e |- F/ x w_ga $.
    lemma-L7.03.2 $e |- ( w_ga -> F/ x w_ph ) $.

    $( Proper Substitution Applied To ENF Variable Lemma. `t.`

       '`x`' cannot occur in '`t_t`'. $)
    lemma-L7.03 $p |- ( w_ga -> ( [ t_t / x ] w_ph <-> w_ph ) ) $=
        ( wff-psub objvar-y term-obj wff-equals wff-bi ndnfrv-P7.1
          wff-nfree ndpsub3-P7.15 rcp-NDIMP0addall ndnfrbi-P7.6 wff-imp
          ndpsub2-P7.14 lemma-L7.01a bisym-P3.33b.RC subiml2-P4.RC wff-exists
          axL6ex-P7 ndexe-P7.20 bisym-P3.33b )
        AACDGZBHICJZAUFKZBHDEUGDLAUFBDFUFDMBACDNOPUGDIZHGZUHQBUICJZUJUHACDRUJU
        KUICHSTUAOUGHUBBCHUCOUDUE
    $.
$}

$( ------------------------------------------------------------------------- $)


${
    $( General for `=>` ENF in (closed form). `t.` $)
    gennfrcl-P7 $p |- ( A. x ( w_ph -> A. x w_ph ) -> F/ x w_ph ) $=
        ( wff-forall wff-nfree wff-imp ndnfrall1-P7.7 rcp-NDIMP0addall
          alle-P7.CL ndbii-P3.13 ndnfrleq-P7.11 bimpf-P4 )
        ABCZBDZABDALEZBCZMOABFGLAOBNBFLAOLAEOABHGNBHIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Necessary Condition for (i.e. "If" part of) Alternate ENF Definition.
       `t.` $)
    dfnfreealtif-P7 $p |- ( ( E. x w_ph -> A. x w_ph ) -> F/ x w_ph ) $=
        ( wff-exists wff-forall wff-imp wff-nfree ndnfrex1-P7.8
          ndnfrall1-P7.7 ndnfrim-P7.3.RC exi-P7.CL imsubl-P3.28a.RC alli-P7
          gennfrcl-P7 syl-P3.24.RC )
        ABCZABDZEZAPEZBDABFRQBOPBABGABHIAOPABJKLABMN
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d w_ph y $.
    $d x y $.

    $( ENF In `=>` General For (closed form). `t.` $)
    nfrgencl-P7 $p |- ( F/ x w_ph -> ( w_ph -> A. x w_ph ) ) $=
        ( wff-forall wff-nfree wff-and objvar-y term-obj wff-psub
          ndnfrnfr-P7.12 rcp-NDASM1of1 lemma-L7.03 ndbier-P3.15
          import-P3.34a.RC ndalli-P7.17.VR12of2 rcp-NDIMI2 )
        ABCABDZAAPAEBFPAAFGZBHZRAPAPQBABIPJKLMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Sufficient Condition for (i.e. "Only If" part of) Alternate ENF
       Definition . `t.` $)
    dfnfreealtonlyif-P7 $p |- ( F/ x w_ph -> ( E. x w_ph -> A. x w_ph ) ) $=
        ( wff-forall wff-nfree ndnfrnfr-P7.12 ndnfrall1-P7.7 nfrgencl-P7
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
    $( ~dfnfreealt-P6 Derived from Natural Deduction Rules. `t.` $)
    dfnfreealt-P7 $p |- ( F/ x w_ph <-> ( E. x w_ph -> A. x w_ph ) ) $=
        ( wff-nfree wff-exists wff-forall wff-imp dfnfreealtonlyif-P7
          dfnfreealtif-P7 rcp-NDBII0 )
        ABCABDABEFABGABHI
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Recovered ENF Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  In intuitionist logic, we see that ~dfnfreealt-P6 is the closed formula
  for effective non-freeness, and the notion defined by ~dfnfree-P7 is too
  strong.
$)

${
    $( ~df-nfree-D6.1 Derived From Natural Deduction Rules.

    This definition is not valid with intuitionist logic. $)
    dfnfree-P7 $p |- ( F/ x w_ph <-> ( A. x w_ph \/ A. x -. w_ph ) ) $=
        ( wff-nfree wff-exists wff-forall wff-imp wff-neg wff-or
          dfnfreealt-P7 imasor-P4.32a allnegex-P7 bisym-P3.33b.RC
          suborl-P3.43a.RC orcomm-P3.37 tbitrns-P4.17.RC )
        ABCABDZABEZFPGZQHAGBEZQHQSHABIPQJRSQSRABKLMSQNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Necessary Condition for (i.e. "If" part of) ~df-nfree-D6.1 Derived From
       Natural Deduction Rules. `t.`

       Only this direction is deducible with intuitionist logic. $)
    dfnfreeint-P7 $p |- ( ( A. x w_ph \/ A. x -. w_ph ) -> F/ x w_ph ) $=
        ( wff-forall wff-neg wff-or wff-exists wff-imp wff-nfree orcomm-P3.37
          allnegex-P7 suborl-P3.43a.RC bitrns-P3.33c.RC rcp-NDBIEF0
          imasorint-P4.32b dfnfreealtif-P7 dsyl-P3.25.RC )
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
        ( wff-forall wff-imp wff-true ndnfrv-P7.1 ndtruei-P3.17
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
        ( wff-forall wff-bi wff-true ndnfrv-P7.1 ndtruei-P3.17 suball-P7
          ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Partial Quantified Implication Equivalence Law ( ( E `->` U ) `->` U ).
       `t.`

       The reverse implication is also true if '`x`' is ENF in either '`w_ph`'
       (see ~qimeqalla-P7 ) or '`w_ps`' (see ~qimeqallb-P7r ). $)
    qimeqallhalf-P7 $p
        |- ( ( E. x w_ph -> A. x w_ps ) -> A. x ( w_ph -> w_ps ) )
    $=
        ( wff-imp wff-exists wff-forall ndnfrex1-P7.8 ndnfrall1-P7.7
          ndnfrim-P7.3.RC exi-P7.CL alle-P7.CL imsubd-P3.28c.RC alli-P7 )
        ABDACEZBCFZDCNOCACGBCHIANOBACJBCKLM
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqallb-P7.1 $e |- F/ x w_ps $.

    $( Quantified Implication Equivalence Law ( U `<->` ( E `->` U ) )
       (non-freeness condition b). `t.` $)
    qimeqallb-P7 $p
        |- ( A. x ( w_ph -> w_ps ) <-> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( wff-imp wff-forall wff-exists axL4ex-P7 nfrexgen-P7.CL nfrgen-P7.CL
          syl-P3.24.RC rcp-NDIMP0addall syl-P3.24 qimeqallhalf-P7 rcp-NDBII0 )
        ABECFZACGZBCFZEQBCGZRPABCHSREPSBRBCDIBCDJKLMABCNO
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

       This form can be used whenever '`x`' does not occur in '`t_t`'.  $)
    dfpsubv-P7 $p |- ( [ t_t / x ] w_ph <-> A. x ( x = t_t -> w_ph ) ) $=
        ( wff-psub term-obj wff-equals wff-imp wff-forall ndpsub3-P7.15
          ndpsub2-P7.14 ndbier-P3.15 imcomm-P3.27.RC alli-P7 ndbief-P3.14
          axL2-P3.22.RC alloverim-P7.GENF.RC wff-exists qimeqallb-P7
          rcp-NDBIEF0 axL6ex-P7 mae-P3.23.RC alle-P7.CL dsyl-P3.25.RC
          rcp-NDBII0 )
        ABCDZCEBFZAGZCHZUGUECABCIZUFUEAAUEUFABCJZKLMUHUFUEGZCHZUECHZUEUGUKCUFA
        UEAUEUFUJNOPULUFCQZUMULUNUMGUFUECUIRSBCTUAUECUBUCUD
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
        ( wff-forall wff-neg ndnfrall1-P7.7 ndnfrneg-P7.2.RC nfrgen-P7.CL )
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
        ( wff-forall ndnfrall1-P7.7 ndnfrall2-P7.9.RC alle-P7.CL
          alloverim-P7.GENF.RC alli-P7 )
        ABDACDZBDCJCBACEFJABACGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    $( Existential Form of ~axL11-P7 . `t.` $)
    axL11ex-P7 $p |- ( E. x E. y w_ph -> E. y E. x w_ph ) $=
        ( wff-exists ndnfrex1-P7.8 ndnfrex2-P7.10.RC exi-P7.CL
          alloverimex-P7.GENF.RC exia-P7.RC )
        ACDABDZCDBJBCABEFAJCABGHI
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
  Revisiting Chapter 5.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Equivalence Properties of Equality Predicate.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  Show that '`=`' is an equivalence relation.  Reflexivity is given by
  ~ndeqi-P7.21 .
$)

${
    eqsym-P7r.1 $e |- ( w_ga -> t_t = t_u ) $.

    $( Equivalence Property: '`=`' Symmetry. `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~eqsym-P7 instead. $)
    eqsym-P7r $p |- ( w_ga -> t_u = t_t ) $=
        ( eqsym-P7 ) ABCDE
    $.
$}

${
    eqsym-P7r.RC.1 $e |- t_t = t_u $.

    $( Inference Form of ~eqsym-P7r . `t.` $)
    eqsym-P7r.RC $p |- t_u = t_t $=
        ( wff-equals wff-true ndtruei-P3.17 eqsym-P7 ndtruee-P3.18 )
        BADEABABDCFGH
    $.
$}

${
    $( Closed Form of ~eqsym-P7r . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~eqsym-P7 instead. $)
    eqsym-P7r.CL $p |- ( t_t = t_u -> t_u = t_t ) $=
        ( eqsym-P7.CL ) ABC
    $.
$}

${
    $( Closed Symmetric Form of ~eqsym-P7r . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~eqsym-P7 instead. $)
    eqsym-P7r.CL.SYM $p |- ( t_t = t_u <-> t_u = t_t ) $=
        ( eqsym-P7.CL.SYM ) ABC
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    eqtrns-P7.1 $e |- ( w_ga -> t_t = t_u ) $.
    eqtrns-P7.2 $e |- ( w_ga -> t_u = t_w ) $.

    $( Equivalence Property: '`=`' Transitivity. `t.` $)
    eqtrns-P7 $p |- ( w_ga -> t_t = t_w ) $=
        ( wff-equals ndsubeqr-P7.22b bimpf-P4 ) BCGBDGAEACDBFHI
    $.
$}

${
    eqtrns-P7.RC.1 $e |- t_t = t_u $.
    eqtrns-P7.RC.2 $e |- t_u = t_w $.

    $( Inference Form of ~eqtrns-P7 . `t.` $)
    eqtrns-P7.RC $p |- t_t = t_w $=
        ( wff-equals wff-true ndtruei-P3.17 eqtrns-P7 ndtruee-P3.18 )
        ACFGABCABFDHBCFEHIJ
    $.
$}

${
    $( Closed Form of ~eqtrns-P7 . `t.` $)
    eqtrns-P7.CL $p |- ( ( t_t = t_u /\ t_u = t_w ) -> t_t = t_w ) $=
        ( wff-equals wff-and rcp-NDASM1of2 rcp-NDASM2of2 eqtrns-P7 )
        ABDZBCDZEABCIJFIJGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Simplified Quantifier Introduction / Elimination Rules.
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
        ( ndnfrv-P7.1 alli-P7 ) ABCBCEDF
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
    exi-P7r.RC.1 $e |- w_ph $.

    $( Inference Form of ~exi-P7r . `t.` $)
    exi-P7r.RC $p |- E. x w_ph $=
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
        ( ndnfrv-P7.1 exe-P7 ) ABCDCDHEFGI
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
        ( ndnfrv-P7.1 exe-P7 ) ABCDEBDHFGI
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
        ( ndnfrv-P7.1 exe-P7 ) ABCDCDGBDGEFH
    $.
$}

${
    exe-P7r.RC.1 $e |- F/ x w_ps $.
    exe-P7r.RC.2 $e |- ( w_ph -> w_ps ) $.
    exe-P7r.RC.3 $e |- E. x w_ph $.

    $( Inference Form of ~exe-P7r . `t.` $)
    exe-P7r.RC $p |- w_ps $=
        ( wff-true ndnfrv-P7.1 wff-imp ndtruei-P3.17 wff-exists exe-P7
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
        ( ndnfrv-P7.1 exe-P7r.RC ) ABCBCFDEG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  alle-P7 and exi-P7 Combined.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    alleexi-P7.1 $e |- ( w_ga -> A. x w_ph ) $.

    $( '`A.`' Elimination and '`E.`' Introduction Combined. `t.` $)
    alleexi-P7 $p |- ( w_ga -> E. x w_ph ) $=
        ( alle-P7 exi-P7 ) ABCABCDEF
    $.
$}

${
    alleexi-P7.RC.1 $e |- A. x w_ph $.

    $( Inference Form of ~alleexi-P7 . `t.` $)
    alleexi-P7.RC $p |- E. x w_ph $=
        ( wff-exists wff-true wff-forall ndtruei-P3.17 alleexi-P7
          ndtruee-P3.18 )
        ABDAEBABFCGHI
    $.
$}

${
    $( Closed Form of ~alleexi-P7 . `t.` $)
    alleexi-P7.CL $p |- ( A. x w_ph -> E. x w_ph ) $=
        ( wff-forall rcp-NDASM1of1 alleexi-P7 ) AABCZBFDE
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Variants of alli-P7 and exe-P7.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    allic-P7.1 $e |- F/ x w_ga $.
    allic-P7.2 $e |- F/ x w_ph $.
    allic-P7.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Introduce Universal Quantifier as Consequent. `t.`

       The inference form is ~alli-P7r . $)
    allic-P7 $p |- ( w_ga -> ( w_ph -> A. x w_ps ) ) $=
        ( wff-forall wff-and ndnfrand-P7.4.RC import-P3.34a.RC alli-P7
          rcp-NDIMI2 )
        BDHCABCAIDCADEFJCABGKLM
    $.
$}

${
    $d w_ga x $.

    allic-P7.VR1of2.1 $e |- F/ x w_ph $.
    allic-P7.VR1of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~allic-P7 with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    allic-P7.VR1of2 $p |- ( w_ga -> ( w_ph -> A. x w_ps ) ) $=
        ( ndnfrv-P7.1 allic-P7 ) ABCDCDGEFH
    $.
$}

${
    $d w_ph x $.

    allic-P7.VR2of2.1 $e |- F/ x w_ga $.
    allic-P7.VR2of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~allic-P7 with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    allic-P7.VR2of2 $p |- ( w_ga -> ( w_ph -> A. x w_ps ) ) $=
        ( ndnfrv-P7.1 allic-P7 ) ABCDEADGFH
    $.
$}

${
    $d w_ga x $. $d w_ph x $.

    allic-P7.VR12of2.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~allic-P7 with two variable restrictions. `t.`

       '`x`' cannot occur in either '`w_ga`' or '`w_ph`'. $)
    allic-P7.VR12of2 $p |- ( w_ga -> ( w_ph -> A. x w_ps ) ) $=
        ( ndnfrv-P7.1 allic-P7 ) ABCDCDFADFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exia-P7r.1 $e |- F/ x w_ga $.
    exia-P7r.2 $e |- F/ x w_ps $.
    exia-P7r.3 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( Introduce Existential Quantifier as Antecedent. `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~exia-P7 instead. $)
    exia-P7r $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( exia-P7 ) ABCDEFGH
    $.
$}

${
    $d w_ga x $.

    exia-P7r.VR1of2.1 $e |- F/ x w_ps $.
    exia-P7r.VR1of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~exia-P7r with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    exia-P7r.VR1of2 $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( ndnfrv-P7.1 exia-P7 ) ABCDCDGEFH
    $.
$}

${
    $d w_ps x $.

    exia-P7r.VR2of2.1 $e |- F/ x w_ga $.
    exia-P7r.VR2of2.2 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~exia-P7r with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    exia-P7r.VR2of2 $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( ndnfrv-P7.1 exia-P7 ) ABCDEBDGFH
    $.
$}

${
    $d w_ps x $.
    $d w_ga x $.

    exia-P7r.VR12of2.1 $e |- ( w_ga -> ( w_ph -> w_ps ) ) $.

    $( ~exia-P7r with two variable restrictions. `t.`

    '`x`' cannot occur in either '`w_ga`' or '`w_ps`'. $)
    exia-P7r.VR12of2 $p |- ( w_ga -> ( E. x w_ph -> w_ps ) ) $=
        ( ndnfrv-P7.1 exia-P7 ) ABCDCDFBDFEG
    $.
$}

${
    exia-P7r.RC.1 $e |- F/ x w_ps $.
    exia-P7r.RC.2 $e |- ( w_ph -> w_ps ) $.

    $( Inference Form of ~exia-P7r . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~exia-P7 instead. $)
    exia-P7r.RC $p |- ( E. x w_ph -> w_ps ) $=
        ( exia-P7.RC ) ABCDEF
    $.
$}

${
    $d w_ps x $.

    exia-P7r.RC.VR.1 $e |- ( w_ph -> w_ps ) $.

    $( ~exia-P7r.RC with variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    exia-P7r.RC.VR $p |- ( E. x w_ph -> w_ps ) $=
        ( ndnfrv-P7.1 exia-P7r.RC ) ABCBCEDF
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
        ( wff-forall wff-imp wff-true ndnfrv-P7.1 ndtruei-P3.17
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

    $( Inference Form of ~alloverimex-P7r.GENF . `t.` 

       This is a restatement of a previously proven result.  Do not use in
       proofs.  Use ~alloverimex-P7.GENF.RC instead. $)
    alloverimex-P7r.GENF.RC $p |- ( E. x w_ph -> E. x w_ps ) $=
        ( alloverimex-P7.GENF.RC ) ABCDE
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
       condition). `t.` $)
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
        ( wff-forall wff-exists wff-imp wff-true ndnfrv-P7.1 ndtruei-P3.17
          dalloverimex-P7.GENF ndtruee-P3.18 )
        ADFBDGCDGHHABCIZDNDJABCHHEKLM
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Substitution Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    suball-P7r.1 $e |- F/ x w_ga $.
    suball-P7r.2 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Law for '`A. x`' (non-freeness condition). `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~suball-P7 instead. $)
    suball-P7r $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( suball-P7 ) ABCDEFG
    $.
$}

${
    $d w_ga x $.

    suball-P7r.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Law for '`A. x`' (variable restriction). `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    suball-P7r.VR $p |- ( w_ga -> ( A. x w_ph <-> A. x w_ps ) ) $=
        ( ndnfrv-P7.1 suball-P7 ) ABCDCDFEG
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

    $( Substitution Law for '`E. x`' (non-freeness condition). `t.` $)
    subex-P7 $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( wff-exists ndbief-P3.14 alloverimex-P7.GENF ndbier-P3.15
          ndbii-P3.13 )
        ADGBDGCABCDEABCFHIBACDEABCFJIK
    $.
$}

${
    $d w_ga x $.

    subex-P7.VR.1 $e |- ( w_ga -> ( w_ph <-> w_ps ) ) $.

    $( Substitution Law for '`E. x`' (variable restriction). `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    subex-P7.VR $p |- ( w_ga -> ( E. x w_ph <-> E. x w_ps ) ) $=
        ( ndnfrv-P7.1 subex-P7 ) ABCDCDFEG
    $.
$}

${
    subex-P7.RC.1 $e |- ( w_ph <-> w_ps ) $.

    $( Inference Form of ~subex-P7 . `t.` $)
    subex-P7.RC $p |- ( E. x w_ph <-> E. x w_ps ) $=
        ( wff-exists wff-bi wff-true ndnfrv-P7.1 ndtruei-P3.17 subex-P7
          ndtruee-P3.18 )
        ACEBCEFABGZCLCHABFDIJK
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Dual Properties of Universal / Existential Quantification.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  '`( E. x w_ph <-> -. A. -. w_ph )`' is ~dfexists-P7 .
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
        ( wff-forall wff-neg wff-exists wff-false wff-and ndnfrex1-P7.8
          ndnfrall1-P7.7 ndnfrand-P7.4.RC ndnfrv-P7.1 rcp-NDASM2of2 alle-P7
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

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantified Implication Equivalence Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Partial Quantified Implication Equivalence Law ( ( E `->` U ) `->` U ).
       `t.`

       The reverse implication is also true if '`x`' is ENF in either '`w_ph`'
       (see ~qimeqalla-P7 ) or '`w_ps`' (see ~qimeqallb-P7r ).


       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~qimeqallhalf-P7 instead. $)
    qimeqallhalf-P7r $p
        |- ( ( E. x w_ph -> A. x w_ps ) -> A. x ( w_ph -> w_ps ) )
    $=
        ( qimeqallhalf-P7 ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqalla-P7.1 $e |- F/ x w_ph $.

    $( Quantified Implication Equivalence Law ( U `<->` ( E `->` U ) )
       (non-freeness condition a).  `t.` $)
    qimeqalla-P7 $p |- ( A. x ( w_ph -> w_ps ) <-> ( E. x w_ph -> A. x w_ps ) ) $=
        ( wff-imp wff-forall wff-exists nfrexgen-P7.CL nfrgen-P7.CL
          syl-P3.24.RC rcp-NDIMP0addall axL4-P7 syl-P3.24 qimeqallhalf-P7
          rcp-NDBII0 )
        ABECFZACGZBCFZEQACFZRPQSEPQASACDHACDIJKABCLMABCNO
    $.
$}

${
    $d w_ph x $.

    $( ~qimeqalla-P7 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    qimeqalla-P7.VR $p
        |- ( A. x ( w_ph -> w_ps ) <-> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( ndnfrv-P7.1 qimeqalla-P7 ) ABCACDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qimeqallb-P7r.1 $e |- F/ x w_ps $.
    $( Quantified Implication Equivalence Law ( U `<->` ( E `->` U ) )
       (non-freeness condition b). `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~qimeqallb-P7 instead. $)
    qimeqallb-P7r $p
        |- ( A. x ( w_ph -> w_ps ) <-> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( qimeqallb-P7 ) ABCDE
    $.
$}

${
    $d w_ps x $.

    $( ~qimeqallb-P7r with variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    qimeqallb-P7r.VR $p
        |- ( A. x ( w_ph -> w_ps ) <-> ( E. x w_ph -> A. x w_ps ) )
    $=
        ( ndnfrv-P7.1 qimeqallb-P7 ) ABCBCDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~qimeqex-P7 . $)
    qimeqex-P7-L1 $p
        |- ( ( A. x w_ph -> E. x w_ps ) -> E. x ( w_ph -> w_ps ) )
    $=
        ( wff-forall wff-neg wff-imp wff-exists wff-and ndnfrall1-P7.7
          ndnfrex1-P7.8 ndnfrim-P7.3.RC ndnfrand-P7.4.RC rcp-NDASM2of2
          axL1-P3.21 exi-P7 rcp-NDIMI2 rcp-NDIMP1add1 rcp-NDASM1of1
          import-P3.34a.RC exe-P7 ndnfrneg-P7.2.RC trnsp-P3.31d exnegall-P7
          bisym-P3.33b.RC subimr2-P4.RC ndexclmid-P3.16.AC rcp-NDORE2 )
        ACDZUHEZABFZCGZUHBCGZFZBUKUMUHHCUMUHCUHULCACIZBCJKZUNLUJCJZBUKFUMUHUKU
        MBUJUMBHZCBAUQUMBMNOPQUMUHULUM RSTAEZUKUMUIHZCUMUICUOUHCUNUALUPURUKFUM
        UIUKUMURUJUMURHZCBAUTURBEUTUMURMNUBOPQUIURCGZUSUMUIMVAUIACUCUDUETUHUMU
        FUG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Lemma for ~qimeqex-P7 . `t.` $)
    qimeqex-P7-L2 $p
        |- ( E. x ( w_ph -> w_ps ) -> ( A. x w_ph -> E. x w_ps ) )
    $=
        ( wff-exists wff-imp wff-forall wff-and ndnfrex1-P7.8 ndnfrall1-P7.7
          ndnfrand-P7.4.RC wff-rcp-AND3 rcp-NDASM2of3 alle-P7 rcp-NDASM3of3
          ndime-P3.6 exi-P7 rcp-NDIMI3 rcp-NDASM1of2 exe-P7 rcp-NDIMI2 )
        BCDZABEZCDZACFZUBUAUCUDGCUCUDCUBCHACIJBCHUAUCUDUBBUCUDUBKZCABUEAUECUCU
        DUBLMUCUDUBNOPQUCUDRST
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Quantified Implication Equivalence Law ( E `<->` ( U `->` E ) ).

       This statement is not deducible with intuitionist logic. $)
    qimeqex-P7 $p
        |- ( E. x ( w_ph -> w_ps ) <-> ( A. x w_ph -> E. x w_ps ) )
    $=
        ( wff-imp wff-exists wff-forall qimeqex-P7-L2 qimeqex-P7-L1
          rcp-NDBII0 )
        ABDCEACFBCEDABCGABCHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( One Direction of Quantified Implication Equivalence Law
       ( E `->` ( U `->` E ) ). `t.`

       This direction is deducible with intuitionist logic. $)
    qimeqexint-P7 $p
        |- ( E. x ( w_ph -> w_ps ) -> ( A. x w_ph -> E. x w_ps ) )
    $=
        ( qimeqex-P7-L2 ) ABCD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Commutivity Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    $( Universal Quantifier Commutivity. `t.` $)
    allcomm-P7 $p |- ( A. x A. y w_ph <-> A. y A. x w_ph ) $=
        ( wff-forall axL11-P7 rcp-NDBII0 ) ACDBDABDCDABCEACBEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    $( Existential Quantifier Commutivity. `t.` $)
    excomm-P7 $p |- ( E. x E. y w_ph <-> E. y E. x w_ph ) $=
        ( wff-exists axL11ex-P7 rcp-NDBII0 ) ACDBDABDCDABCEACBEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Change of Bound Variable Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    cbvall-P7-L1.1 $e |- F/ x w_ps $.
    cbvall-P7-L1.2 $e |- F/ y w_ph $.
    cbvall-P7-L1.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Lemma for ~cbvall-P7 . `t.` $)
    cbvall-P7-L1 $p |- ( A. x w_ph -> A. y w_ps ) $=
        ( wff-forall ndnfrall2-P7.9.RC term-obj wff-psub ndalle-P7.18.CL
          ndpsub1-P7.13 rcp-NDBIEF0 syl-P3.24.RC alli-P7 )
        BACHZDADCFIQADJZCKZBARCLSBABRCEGMNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvall-P7.1 $e |- F/ x w_ps $.
    cbvall-P7.2 $e |- F/ y w_ph $.
    cbvall-P7.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`A. x`'. `t.` $)
    cbvall-P7 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( wff-forall cbvall-P7-L1 term-obj wff-equals wff-bi bisym-P3.33b
          eqsym-P7.CL.SYM subiml2-P4.RC rcp-NDBII0 )
        ACHBDHABCDEFGIBADCFECJZDJZKZRQKBALABSGMQRNOIP
    $.
$}

${
    $d w_ps x $.
    $d x y $.

    cbvall-P7.VR1of2.1 $e |- F/ y w_ph $.
    cbvall-P7.VR1of2.2 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvall-P7 with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    cbvall-P7.VR1of2 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( ndnfrv-P7.1 cbvall-P7 ) ABCDBCGEFH
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    cbvall-P7.VR2of2.1 $e |- F/ x w_ps $.
    cbvall-P7.VR2of2.2 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvall-P7 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    cbvall-P7.VR2of2 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( ndnfrv-P7.1 cbvall-P7 ) ABCDEADGFH
    $.
$}

${
    $d w_ph y $.
    $d w_ps x $.
    $d x y $.

    cbvall-P7.VR12of2.1 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvall-P7 with two variable restrictions. `t.`

       '`x`' cannot occur in '`w_ps`' and '`y`' cannot occur in '`w_ph`'. $)
    cbvall-P7.VR12of2 $p |- ( A. x w_ph <-> A. y w_ps ) $=
        ( ndnfrv-P7.1 cbvall-P7 ) ABCDBCFADFEG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvex-P7-L1.1 $e |- F/ x w_ps $.
    cbvex-P7-L1.2 $e |- F/ y w_ph $.
    cbvex-P7-L1.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Lemma for ~cbvex-P7 . `t.` $)
    cbvex-P7-L1 $p |- ( E. y w_ps -> E. x w_ph ) $=
        ( wff-exists ndnfrex2-P7.10.RC term-obj wff-psub ndpsub1-P7.13
          rcp-NDBIER0 ndexi-P7.19.CL syl-P3.24.RC exia-P7.RC )
        BACHZDADCFIBADJZCKZQSBABRCEGLMARCNOP
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvex-P7.1 $e |- F/ x w_ps $.
    cbvex-P7.2 $e |- F/ y w_ph $.
    cbvex-P7.3 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( Change of Bound Variable Theorem for '`E. x`'. `t.` $)
    cbvex-P7 $p |- ( E. x w_ph <-> E. y w_ps ) $=
        ( wff-exists term-obj wff-equals wff-bi bisym-P3.33b eqsym-P7.CL.SYM
          subiml2-P4.RC cbvex-P7-L1 rcp-NDBII0 )
        ACHBDHBADCFECIZDIZJZRQJBAKABSGLQRMNOABCDEFGOP
    $.
$}

${
    $d w_ps x $.
    $d x y $.

    cbvex-P7.VR1of2.1 $e |- F/ y w_ph $.
    cbvex-P7.VR1of2.2 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvex-P7 with one variable restriction. `t.`

       '`x`' cannot occur in '`w_ps`'. $)
    cbvex-P7.VR1of2 $p |- ( E. x w_ph <-> E. y w_ps ) $=
        ( ndnfrv-P7.1 cbvex-P7 ) ABCDBCGEFH
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    cbvex-P7.VR2of2.1 $e |- F/ x w_ps $.
    cbvex-P7.VR2of2.2 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvex-P7 with one variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    cbvex-P7.VR2of2 $p |- ( E. x w_ph <-> E. y w_ps ) $=
       ( ndnfrv-P7.1 cbvex-P7 ) ABCDEADGFH
    $.
$}

${
    $d w_ph y $.
    $d w_ps x $.
    $d x y $.

    cbvex-P7.VR12of2.1 $e |- ( x = y -> ( w_ph <-> w_ps ) ) $.

    $( ~cbvex-P7 with two variable restrictions. `t.`

       '`x`' cannot occur in '`w_ps`' and '`y`' cannot occur in '`w_ph`'. $)
    cbvex-P7.VR12of2 $p |- ( E. x w_ph <-> E. y w_ps ) $=
        ( ndnfrv-P7.1 cbvex-P7 ) ABCDBCFADFEG
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Proper Substitution Variants of cbvall-P7 and cbvex-P7.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d x y $.

    cbvallpsub-P7.1 $e |- F/ y w_ph $.

    $( Change of Bound Variable for '`A. x`' with Proper Substitution. `t.` $)
    cbvallpsub-P7 $p |- ( A. x w_ph <-> A. y [ y / x ] w_ph ) $=
        ( term-obj wff-psub ndpsub3-P7.15 ndpsub2-P7.14 cbvall-P7 )
        AACEZBFBCAJBGDAJBHI
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    $( ~cbvallpsub-P7 with variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    cbvallpsub-P7.VR $p |- ( A. x w_ph <-> A. y [ y / x ] w_ph ) $=
        ( ndnfrv-P7.1 cbvallpsub-P7 ) ABCACDE
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    cbvexpsub-P7.1 $e |- F/ y w_ph $.

    $( Change of Bound Variable for '`E. x`' with Proper Substitution. `t.` $)
    cbvexpsub-P7 $p |- ( E. x w_ph <-> E. y [ y / x ] w_ph ) $=
        ( term-obj wff-psub ndpsub3-P7.15 ndpsub2-P7.14 cbvex-P7 )
        AACEZBFBCAJBGDAJBHI
    $.
$}

${
    $d w_ph y $.
    $d x y $.

    $( ~cbvexpsub-P7 with variable restriction. `t.`

       '`y`' cannot occur in '`w_ph`'. $)
    cbvexpsub-P7.VR $p |- ( E. x w_ph <-> E. y [ y / x ] w_ph ) $=
        ( ndnfrv-P7.1 cbvexpsub-P7 ) ABCACDE
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Examples.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Conditional Non-Freeness Does Not Always Imply Effective Non-Freeness.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    example-E7.1a.1 $e |- ( x x. 0 ) = 0 $.

    $( '`x`' is conditionally not free in the statement '`( x x. y ) = 0`'
       when '`y = 0`'. `t.`

       Since no arithmetic axioms have been introduced, we state
       '`( x x. 0 ) = 0`' as a hypothesis. $)
    example-E7.1a $p |- ( y = 0 -> F/ x ( x x. y ) = 0 ) $=
        ( term-obj term-mult term_zero wff-equals wff-nfree ndnfrv-P7.1
          rcp-NDIMP0addall ndsubmultr-P7.24e.CL eqtrns-P7 ndsubeql-P7.22a
          ndnfrleq-P7.11.VR bimpr-P4 )
        ADZBDZEZFZGZAHSSGZAHZQSGZUBUCUAAIJTUAUCAUCRSSUCRPSEZSQSPKUDSGUCCJLMNO
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y $.

    example-E7.1b.1 $e |- ( 0 x. y ) = 0 $.
    example-E7.1b.2 $e |- -. A. x A. y ( x x. y ) = 0 $.

    $( '`x`' is effectively free in the statement '`( x x. y = 0 )`'. `t.`

       Note that if we could show '`|- F/ x ( x x. y ) = 0`', then we would
       also be able to show that '`|- A. y F/ x ( x x. y ) = 0`', which would
       contradict the conclusion of this example.  This means that, without
       any extra hypotheses, '`x`' is effectively free (and thus also
       grammatically free, obviously) in the WFF '`( x x. y ) = 0`'.  However,
       adding the open hypothesis '`y = 0`', either as a theorem hypothesis or
       as an antecedent, causes '`x`' to become effectively not free in
       '`( x x. y ) = 0`'.  This is why we say that '`x`' is *conditionally*
       not free in '`w_ph`' when we can deduce '`F/ x w_ph`' with the addition
       of one or more hypotheses, but cannot do so working strictly from
       axioms.

       Since no arithmetic axioms have been introduced, we state
       '`( 0 x. y ) = 0`' as a hypothesis.  We also state
       '`-. A. x A. y ( x x. y ) = 0`' as a hypothesis.  With the Peano
       Axioms, we will define '1'.  The second hypothesis then follows from
       the case '`-. (`1`x.`1`) = 0`'. $)
    example-E7.1b $p |- -. A. y F/ x ( x x. y ) = 0 $=
        ( term-obj term-mult term_zero wff-equals wff-forall wff-nfree
          wff-exists dfnfreealtonlyif-P7 dalloverim-P7.GENF.RC axL6ex-P7
          ndsubmultl-P7.24d.CL rcp-NDIMP0addall eqtrns-P7
          alloverimex-P7.GENF.RC rcp-NDIME0 axGEN-P7 mae-P3.23.RC allcomm-P7
          subimr2-P4.RC wff-neg rcp-NDNEGI1 )
        AEZBEZFZGZHZBIAIZUJAJZBIZUJAIZBIZUKUMUMUJAKZBIUOULUPUNBUJALMUPBUFUIHZA
        KUPUIANUQUJAUQUHUIUGFZUIUFUIUGOURUIHUQCPQRSTUAUJBAUBUCUKUDUMDPUE
    $.
$}

