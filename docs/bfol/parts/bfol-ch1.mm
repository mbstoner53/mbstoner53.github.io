
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
