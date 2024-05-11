
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
