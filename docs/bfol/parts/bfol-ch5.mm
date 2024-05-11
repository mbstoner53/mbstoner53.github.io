
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
