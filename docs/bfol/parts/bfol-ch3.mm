
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
  needed for longer sequents.  These rules merely add more convenient syntax.
  They do not extend the logic at all.
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Axiomatic Rules.
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
  Separate Front Supposition (Syntactic Axioms).
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
  Join Front Supposition (Syntactic Axioms).
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

  For the rest of the chapter we will treat P3.1 - P3.20 as a new set of
  axioms.  From here on out, we will not rely on any results from chapters 1
  or 2 (except indirectly through the new set of axioms).  

  This will allow us to track the use of ~ndexclmid-P3.16 .  By avoiding the
  Law of Excluded Middle, it is possible to develop an intuitionist logical
  framework alongside the standard classical case.

  From here on, all theorems derived without reference to the Law of Excluded
  Middle ( ~ndexclmid-P3.16 ) will have a `t.` in the comment. 
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Derived Rules for Stating / Re-Stating Assumptions.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.

  These derived rules may be used in place of ~ndasm-P3.1 .
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
  Other Implication Laws.
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
  Double Negation Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    dnegi-P3.29.1 $e |- ( w_ga -> w_ph ) $.

    $( Double Negation Introduction. `t.`

       This statement does not require ~ndexclmid-P3.16 , and is thus
       deducible with intuitionist logic. $)
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

       This statement is equivalent to ~ndexclmid-P3.16 , thus it is not
       deducible with intuitionist logic. $)
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
  Transposition Laws (including Axiom L3).
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    trnsp-P3.31a.1 $e |- ( w_ga -> ( w_ph -> -. w_ps ) ) $.

    $( Transposition Variant A (negation introduction). `t.`

       This statement is the deductive form of ~trnsp-P1.15a .  It does not
       require the Law of Excluded Middle, and is thus deducible with
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
       equivalent to Axiom L3 and requires the Law of Excluded Middle.  It is
       thus not deducible with intuitionist logic. $)
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
       require the  Law of Excluded Middle, and is thus deducible with
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

       This statement is the deductive form of ~trnsp-P1.15d (and Axiom L3).
       It requires the Law of Excluded Middle and is thus not deducible
       with intuitionist logic. $)
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
    $( Closed Form of ~trnsp-P3.31d . 

       This is a restatement of Axiom L3, deduced via natural deduction. $)
    trnsp-P3.31d.CL $p |- ( ( -. w_ph -> -. w_ps ) -> ( w_ps -> w_ph ) ) $=
        ( wff-neg wff-imp rcp-NDASM1of1 trnsp-P3.31d ) ABACBCDZGEF
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Other Laws Involving Negation.
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
       Law of Excluded Middle and is thus not deducible with intuitionist
       logic.  $)
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
  Importation and Exportation Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These two laws can be thought of as justification theorems for treating
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

    $( '`/\`' Importation Law. `t.` $)
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

    $( '`/\`' Exportation Law. `t.` $)
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
  Substitution Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These laws can be chained together to produce a countably infinite set of
  rules of the form...

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
    $( Substitution Law for '`-.`'. `t.`

       Note that the proof of this theorem uses ~trnsp-P3.31c , which does 
       not rely on the Law of Excluded Middle.  This means this law is
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

    $( Left Substitution Law for '`->`'. `t.` $)
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

    $( Dual Substitution Law for '`->`'. `t.` $)
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

    $( Left Substitution Law for '`<->`'. `t.` $)
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

    $( Right Substitution Law for '`<->`'. `t.` $)
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

    $( Dual Substitution Law for '`<->`'. `t.` $)
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

    $( Left Substitution Law for '`/\`'. `t.` $)
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

    $( Right Substitution Law for '`/\`'. `t.` $)
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

    $( Dual Substitution Law for '`/\`'. `t.` $)
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

    $( Right Substitution Law for '`\/`' . `t.` $)
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
