
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
    $( Sufficient Conditon for (i.e. "If" part of) ~df-bi-D2.1 . $)
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
    $( Necessary Condition for (i.e. "Only If" part of) ~df-bi-D2.1 . $)
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

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Substitution Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

  These laws can be chained together to produce a countably infinite set of
  rules of the form...

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
    $( Substitution Law for '`-.`'. $)
    subneg-P2.7 $p |- ( ( w_ph <-> w_ps ) -> ( -. w_ph <-> -. w_ps ) ) $= 
        ( wff-neg wff-bi birev-P2.5b trnsp-P1.15c.AC.SH bifwd-P2.5a
          bicmb-P2.5c.AC.2SH )
        ACBCABDZBAIABEFABIABGFH 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Left Substitution Law for '`->`'. $)
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
    $( Right Substitution Law for '`->`'. $)
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
  
  Taken together, the properties ~simpl-P2.9a , ~simpr-P2.9b , and
  ~cmb-P2.9c completely define logical conjunction.
$)

${
    $( '`/\`' Left Simplification. $)
    simpl-P2.9a $p |- ( ( w_ph /\ w_ps ) -> w_ph ) $= 
        ( wff-and wff-neg wff-imp df-and-D2.2 bifwd-P2.5a.SH simpl-L2.2a
          syl-P1.2 ) 
        ABCZABDEDZAJKABFGABHI 
    $.
$}

${
    simpl-P2.9a.AC.SH.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.
    
    $( Deductive Form of ~simpl-P2.9a . $)
    simpl-P2.9a.AC.SH $p |- ( w_ga -> w_ph ) $= 
        ( wff-and wff-imp simpl-P2.9a axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCAFDKACKAFCABGHIJ 
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Right Simplification. $)
    simpr-P2.9b $p |- ( ( w_ph /\ w_ps ) -> w_ps ) $= 
        ( wff-and wff-neg wff-imp df-and-D2.2 bifwd-P2.5a.SH simpr-L2.2b
          syl-P1.2 ) 
        ABCZABDEDZBJKABFGABHI 
    $.
$}

${
    simpr-P2.9b.AC.SH.1 $e |- ( w_ga -> ( w_ph /\ w_ps ) ) $.
    
    $( Deductive Form of ~simpr-P2.9b . $)
    simpr-P2.9b.AC.SH $p |- ( w_ga -> w_ps ) $= 
        ( wff-and wff-imp simpr-P2.9b axL1.SH rcp-FR1.SH ax-MP )
        CABEZFCBFDKBCKBFCABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Introduction by Combination. $)
    cmb-P2.9c $p |- ( w_ph -> ( w_ps -> ( w_ph /\ w_ps ) ) ) $= 
        ( wff-neg wff-imp wff-and cmb-L2.3 df-and-D2.2 subimr-P2.8b.SH
          birev-P2.5b.SH ax-MP )
        ABABCDCZDZDZABABEZDZDZABFPMOLANKBABGHHIJ 
    $.
$}

${
    cmb-P2.9c.AC.2SH.1 $e |- ( w_ga -> w_ph ) $.
    cmb-P2.9c.AC.2SH.2 $e |- ( w_ga -> w_ps ) $.

    $( Deductive Form of ~cmb-P2.9c . $)
    cmb-P2.9c.AC.2SH $p |- ( w_ga -> ( w_ph /\ w_ps ) ) $= 
        ( wff-imp wff-and cmb-P2.9c axL1.SH rcp-FR1.SH ax-MP ) 
        CBFCABGZFEBLCCAFCBLFZFDAMCAMFCABHIJKJK 
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Importation and Exportation Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( '`/\`' Importation Law. $)
    import-P2.10a $p
        |- ( ( w_ph -> ( w_ps -> w_ch ) ) -> ( ( w_ph /\ w_ps ) -> w_ch ) )
    $=
        ( wff-imp wff-and simpr-P2.9b axL1.SH simpl-P2.9a ax-L1
          mpt-P1.8.2AC.2SH )
        BCABCDZDZABEZMBDLABFGAKLMMADLABHGLMIJJ
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
    $( '`/\`' Exportation Law. $)
    export-P2.10b $p
        |- ( ( ( w_ph /\ w_ps ) -> w_ch ) -> ( w_ph -> ( w_ps -> w_ch ) ) )
    $=
        ( wff-and wff-imp cmb-P2.9c axL1.SH ax-L1 axL1.AC.SH
          mpt-P1.8.3AC.2SH )
        ABDZCKCEZABABKEELABFGBLEALLBHIJ
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
  
  Taken together, the properties ~orintl-P2.11a , ~orintr-P2.11b , and
  ~orelim-P2.11c completely define logical disjunction.
$)

$( ------------------------------------------------------------------------- $)

${
    $( Left Introduction Rule for '`\/`'. $)
    orintl-P2.11a $p |- ( w_ph -> ( w_ps \/ w_ph ) ) $=
        ( wff-neg wff-imp wff-or poe-P1.11b trnsp-P1.15b df-or-D2.3
          birev-P2.5b.SH dsyl-P1.3 )
        AACBDBCADZBAEZABFABGLKBAHIJ
    $.
$}

${
    orintl-P2.11a.AC.SH.1 $e |- ( w_ga -> w_ph ) $.

    $( Deductive Form of ~orintl-P2.11a . $)
    orintl-P2.11a.AC.SH $p |- ( w_ga -> ( w_ps \/ w_ph ) ) $=
        ( wff-imp wff-or orintl-P2.11a axL1.SH rcp-FR1.SH ax-MP )
        CAECBAFZEDAKCAKECABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Right Introduction Rule for '`\/`'. $)
    orintr-P2.11b $p |- ( w_ph -> ( w_ph \/ w_ps ) ) $=
        ( wff-neg wff-imp wff-or poe-P1.11b df-or-D2.3 birev-P2.5b.SH
         syl-P1.2 )
        AACBDZABEZABFKJABGHI
    $.
$}

${
    orintr-P2.11b.AC.SH.1 $e |- ( w_ga -> w_ph ) $.

    $( Deductive Form of ~orintr-P2.11b . $)
    orintr-P2.11b.AC.SH $p |- ( w_ga -> ( w_ph \/ w_ps ) ) $=
        ( wff-imp wff-or orintr-P2.11b axL1.SH rcp-FR1.SH ax-MP )
        CAECABFZEDAKCAKECABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( '`/\`' Elimination Law.

       This is also known as the "Proof by Cases" law.  $)
    orelim-P2.11c $p
        |- (
          ( w_ph -> w_ch ) ->
          ( ( w_ps -> w_ch ) ->
          ( ( w_ph \/ w_ps ) -> w_ch ) )
        )
    $=
        ( wff-imp wff-or wff-and simpl-P2.9a simpl-P2.9a.AC.SH wff-neg
          simpr-P2.9b df-or-D2.3 bifwd-P2.5a.SH syl-P1.2 simpr-P2.9b.AC.SH
          sylt-P1.9.AC.2SH pfbycase-P1.17.AC.2SH export-P2.10b.SH )
        ACDZBCDZABEZCDRSFZTCACUATFZRSUBUATGZHAIZBCUBUBTUDBDZUATJTUEABKLMRSUBUC
        NOPQQ
    $.
$}

${
    orelim-P2.11c.AC.3SH.1 $e |- ( w_ga -> ( w_ph -> w_ch ) ) $.
    orelim-P2.11c.AC.3SH.2 $e |- ( w_ga -> ( w_ps -> w_ch ) ) $.
    orelim-P2.11c.AC.3SH.3 $e |- ( w_ga -> ( w_ph \/ w_ps ) ) $.

    $( Deductive Form of ~orelim-P2.11c . $)
    orelim-P2.11c.AC.3SH $p |- ( w_ga -> w_ch ) $=
        ( wff-or wff-imp orelim-P2.11c axL1.SH rcp-FR1.SH ax-MP axL2.SH )
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
    exclmid-P2.12 $p |- ( w_ph \/ -. w_ph ) $=
        ( wff-neg wff-or orintr-P2.11b orintl-P2.11a pfbycase-P1.17.2SH )
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
    truejust-P2.13 $p
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
    true-P2.14 $p |- T. $=
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
    false-P2.15 $p |- -. F. $=
        ( wff-true wff-false wff-neg true-P2.14 df-false-D2.5 bifwd-P2.5a.SH
          trnsp-P1.15a.SH ax-MP )
        AZBZCDJIJICEFGH
    $.
$}
