
$(
##############################################################################
  Chapter 8: Predicate Calculus (Continued)
##############################################################################
$)

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  Revisiting Chapter 6.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  "General For" / "Not Free" Conversion.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Standard Forms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    nfrgen-P8.1 $e |- F/ x w_ph $.
    nfrgen-P8.2 $e |- ( w_ga -> w_ph ) $.

    $( ENF `=>` General For. `t.`

       The inference form is ~axGEN-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~nfrgen-P7 instead. $)
    nfrgen-P8 $p |- ( w_ga -> A. x w_ph ) $=
        ( nfrgen-P7 ) ABCDEF
    $.
$}

${
    $d w_ph x $.

    nfrgen-P8.VR.1 $e |- ( w_ga -> w_ph ) $.

    $( ~nfrgen-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    nfrgen-P7.VR $p |- ( w_ga -> A. x w_ph ) $=
        ( ndnfrv-P7.1 nfrgen-P7 ) ABCACEDF
    $.
$}

${
    nfrgen-P8.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~nfrgen-P8 . `t.`

       The variable restricted form is ~axL5-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~nfrgen-P7.CL instead. $)
    nfrgen-P8.CL $p |- ( w_ph -> A. x w_ph ) $=
        ( nfrgen-P7.CL ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    gennfr-P8.1 $e |- ( w_ph -> A. x w_ph ) $.

    $( General For `=>` ENF. `t.` $)
    gennfr-P8 $p |- F/ x w_ph $=
        ( wff-forall wff-nfree ndnfrall1-P7.7 alle-P7.CL rcp-NDBII0
          ndnfrleq-P7.11.RC bimpf-P4.RC )
        ABDZBEABEABFKABKAABGCHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Dual Forms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    nfrexgen-P8.1 $e |- F/ x w_ph $.
    nfrexgen-P8.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( Dual Form of ~nfrgen-P8 . `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~nfrexgen-P7 instead. $)
    nfrexgen-P8 $p |- ( w_ga -> w_ph ) $=
        ( nfrexgen-P7 ) ABCDEF
    $.
$}

${
    $d w_ph x $.

    nfrexgen-P8.VR.1 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~nfrexgen-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    nfrexgen-P8.VR $p |- ( w_ga -> w_ph ) $=
        ( ndnfrv-P7.1 nfrexgen-P7 ) ABCACEDF
    $.
$}

${
    nfrexgen-P8.RC.1 $e |- F/ x w_ph $.
    nfrexgen-P8.RC.2 $e |- E. x w_ph $.

    $( Inference Form of ~nfrexgen-P8 . `t.` $)
    nfrexgen-P8.RC $p |- w_ph $=
        ( wff-true wff-exists ndtruei-P3.17 nfrexgen-P7 ndtruee-P3.18 )
        AAEBCABFDGHI
    $.
$}

${
    $d w_ph x $.

    nfrexgen-P8.RC.VR.1 $e |- E. x w_ph $.

    $( ~nfrexgen-P8.RC with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`' $)
    nfrexgen-P8.RC.VR $p |- w_ph $=
        ( ndnfrv-P7.1 nfrexgen-P8.RC ) ABABDCE
    $.
$}

${
    nfrexgen-P8.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~nfrexgen-P8 . `t.`

       The variable restricted form is ~axL5ex-P7 .

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~nfrexgen-P7.CL instead. $)
    nfrexgen-P8.CL $p |- ( E. x w_ph -> w_ph ) $=
        ( nfrexgen-P7.CL ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exgennfr-P8.1 $e |- ( E. x w_ph -> w_ph ) $.

    $( Dual Form of ~gennfr-P8 . `t.` $)
    exgennfr-P8 $p |- F/ x w_ph $=
        ( wff-exists wff-nfree ndnfrex1-P7.8 exi-P7.CL rcp-NDBII0
          ndnfrleq-P7.11.RC bimpf-P4.RC )
        ABDZBEABEABFKABKACABGHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Combined Forms.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    nfrexall-P8.1 $e |- F/ x w_ph $.
    nfrexall-P8.2 $e |- ( w_ga -> E. x w_ph ) $.

    $( Combining of ~nfrgen-P8 and ~nfrexgen-P8 . `t.` $)
    nfrexall-P8 $p |- ( w_ga -> A. x w_ph ) $=
        ( wff-exists wff-forall nfrexgen-P7.CL nfrgen-P7.CL dsyl-P3.25.RC )
        BACFAACGEACDHACDIJ
    $.
$}

${
    $d w_ph x $.

    nfrexall-P8.VR.1 $e |- ( w_ga -> E. x w_ph ) $.

    $( ~nfrexall-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    nfrexall-P8.VR $p |- ( w_ga -> A. x w_ph ) $=
        ( ndnfrv-P7.1 nfrexall-P8 ) ABCACEDF
    $.
$}

${
    nfrexall-P8.RC.1 $e |- F/ x w_ph $.
    nfrexall-P8.RC.2 $e |- E. x w_ph $.

    $( Inference form of ~nfrexall-P8 . `t.` $)
    nfrexall-P8.RC $p |- A. x w_ph $=
        ( wff-forall wff-true wff-exists ndtruei-P3.17 nfrexall-P8
          ndtruee-P3.18 )
        ABEAFBCABGDHIJ
    $.
$}

${
    $d w_ph x $.

    nfrexall-P8.RC.VR.1 $e |- E. x w_ph $.
    $( ~nfrexall-P8.RC with variable restriction . `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    nfrexall-P8.RC.VR $p |- A. x w_ph $=
        ( ndnfrv-P7.1 nfrexall-P8.RC ) ABABDCE
    $.
$}

${
    nfrexall-P8.CL.1 $e |- F/ x w_ph $.

    $( Closed Form of ~nfrexall-P8 . `t.` $)
    nfrexall-P8.CL $p |- ( E. x w_ph -> A. x w_ph ) $=
        ( wff-exists rcp-NDASM1of1 nfrexall-P8 ) AABDZBCGEF
    $.
$}

${
    $d w_ph x $.

    $( ~nfrexall-P8.CL with variable restriction . `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    nfrexall-P8.CL.VR $p |- ( E. x w_ph -> A. x w_ph ) $=
        ( ndnfrv-P7.1 nfrexall-P8.CL ) ABABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    exallnfr-P8.1 $e |- ( E. x w_ph -> A. x w_ph ) $.

    $( Converse of ~nfrexall-P8.CL . `t.` $)
    exallnfr-P8 $p |- F/ x w_ph $=
        ( wff-exists wff-forall exi-P7.CL syl-P3.24.RC gennfr-P8 )
        ABAABDABEABFCGH
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Nested Quantifier Idempotency Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $( Idempotency Law for '`A. x`'. `t.` $)
    idempotall-P8 $p |- ( A. x A. x w_ph <-> A. x w_ph ) $=
        ( wff-forall alle-P7.CL ndnfrall1-P7.7 nfrgen-P7.CL rcp-NDBII0 )
        ABCZBCHHBDHBABEFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`E. x`'. `t.` $)
    idempotex-P8 $p |- ( E. x E. x w_ph <-> E. x w_ph ) $=
        ( wff-exists ndnfrex1-P7.8 nfrexgen-P7.CL exi-P7.CL rcp-NDBII0 )
        ABCZBCHHBABDEHBFG
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`A. x`' over '`E. x`'. `t.` $)
    idempotallex-P8 $p |- ( A. x E. x w_ph <-> E. x w_ph ) $=
        ( wff-exists wff-forall alle-P7.CL ndnfrex1-P7.8 nfrgen-P7.CL
          rcp-NDBII0 )
        ABCZBDIIBEIBABFGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`E. x`' over '`A. x`'. `t.` $)
    idempotexall-P8 $p |- ( E. x A. x w_ph <-> A. x w_ph ) $=
        ( wff-forall wff-exists ndnfrall1-P7.7 nfrexgen-P7.CL exi-P7.CL
          rcp-NDBII0 )
        ABCZBDIIBABEFIBGH
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`A. x`' over '`-. A. x`'. `t.` $)
    idempotallnall-P8 $p |- ( A. x -. A. x w_ph <-> -. A. x w_ph ) $=
        ( wff-forall wff-neg alle-P7.CL ndnfrall1-P7.7 ndnfrneg-P7.2.RC
          nfrgen-P7.CL rcp-NDBII0 )
        ABCZDZBCKKBEKBJBABFGHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`E. x`' over '`-. E. x`'. `t.` $)
    idempotexnex-P8 $p |- ( E. x -. E. x w_ph <-> -. E. x w_ph ) $=
        ( wff-exists wff-neg ndnfrex1-P7.8 ndnfrneg-P7.2.RC nfrexgen-P7.CL
          exi-P7.CL rcp-NDBII0 )
        ABCZDZBCKKBJBABEFGKBHI
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`A. x`' over '`-. E. x`'. `t.` $)
    idempotallnex-P8 $p |- ( A. x -. E. x w_ph <-> -. E. x w_ph ) $=
        ( wff-exists wff-neg wff-forall alle-P7.CL ndnfrex1-P7.8
          ndnfrneg-P7.2.RC nfrgen-P7.CL rcp-NDBII0 )
        ABCZDZBELLBFLBKBABGHIJ
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Idempotency Law for '`E. x`' over '`-. A. x`'. `t.` $)
    idempotexnall-P8 $p |- ( E. x -. A. x w_ph <-> -. A. x w_ph ) $=
        ( wff-forall wff-neg wff-exists ndnfrall1-P7.7 ndnfrneg-P7.2.RC
          nfrexgen-P7.CL exi-P7.CL rcp-NDBII0 )
        ABCZDZBELLBKBABFGHLBIJ
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Removal / Swapping Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    qremall-P8.1 $e |- F/ x w_ph $.

    $( Universal Quantifier Removal (non-freeness condition). `t.` $)
    qremall-P8 $p |- ( A. x w_ph <-> w_ph ) $=
        ( wff-forall alle-P7.CL nfrgen-P7.CL rcp-NDBII0 ) ABDAABEABCFG
    $.
$}

${
    $d w_ph x $.

    $( ~qremall-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    qremall-P8.VR $p |- ( A. x w_ph <-> w_ph ) $=
        ( ndnfrv-P7.1 qremall-P8 ) ABABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qremex-P8.1 $e |- F/ x w_ph $.

    $( Existential Quantifier Removal (non-freeness condition). `t.` $)
    qremex-P8 $p |- ( E. x w_ph <-> w_ph ) $=
        ( wff-exists nfrexgen-P7.CL exi-P7.CL rcp-NDBII0 ) ABDAABCEABFG
    $.
$}

${
    $d w_ph x $.

    $( ~qremex-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`' $)
    qremex-P8.VR $p |- ( E. x w_ph <-> w_ph ) $=
        ( ndnfrv-P7.1 qremex-P8 ) ABABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qswap-P8.1 $e |- F/ x w_ph $.

    $( Swap Quantifiers (non-freeness condition). `t.` $)
    qswap-P8 $p |- ( E. x w_ph <-> A. x w_ph ) $=
        ( wff-exists wff-forall nfrexall-P8.CL alleexi-P7.CL rcp-NDBII0 )
        ABDABEABCFABGH
    $.
$}

${
    $d w_ph x $.

    $( ~qswap-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ph`'. $)
    qswap-P8.VR $p |- ( E. x w_ph <-> A. x w_ph ) $=
        ( ndnfrv-P7.1 qswap-P8 ) ABABCD
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Other Effective Non-Freeness Properties.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    nfrthm-P8.1 $e |- w_ph $.

    $( Every Variable is ENF in a Theorem. `t.`

       This is the restatement of a previously proven result.  Do not use in
       proofs.  Use ~nfrthm-P7 instead. $)
    nfrthm-P8 $p |- F/ x w_ph $=
        ( nfrthm-P7 ) ABCD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nfrcond-P8.1 $e |- F/ x w_ga $.
    nfrcond-P8.2 $e |- ( w_ga -> w_ph ) $.

    $( ENF in Antecedent `=>` Conditionally Not Free in Consequent. `t.`

       This is actually a generalization of ~nfrthm-P8 . $)
    nfrcond-P8 $p |- ( w_ga -> F/ x w_ph ) $=
        ( wff-forall wff-imp wff-nfree alli-P7 axL1-P3.21 gennfrcl-P7
          syl-P3.24.RC )
        BAACFZGZCFACHNBCDMABABCDEIJIACKL
    $.
$}

${
    $d w_ga x $.

    nfrcond-P8.VR.1 $e |- ( w_ga -> w_ph ) $.

    $( ~nfrcond-P8 with variable restriction. `t.`

       '`x`' cannot occur in '`w_ga`'. $)
    nfrcond-P8.VR $p |- ( w_ga -> F/ x w_ph ) $=
        ( ndnfrv-P7.1 nfrcond-P8 ) ABCBCEDF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    nfrnegconv-P8.1 $e |- ( w_ga -> F/ x -. w_ph ) $.

    $( Converse of ~ndnfrneg-P7.2 .

       This statement is not deducible with intuitionist logic. $)
    nfrnegconv-P8 $p |- ( w_ga -> F/ x w_ph ) $=
        ( wff-neg wff-nfree wff-exists wff-forall wff-imp exnegall-P7
          rcp-NDBIER0 rcp-NDIMP0addall dfnfreealtonlyif-P7 allnegex-P7
          rcp-NDBIEF0 dsyl-P3.25 trnsp-P3.31d dfnfreealtif-P7 dsyl-P3.25.RC )
        BAEZCFZACGZACHZIACFDUCUBUAUCEZTCGZTCHZUBEZUAUDUEIUAUEUDACJKLTCMUFUGIUA
        UFUGACNOLPQACRS
    $.
$}

${
    nfrnegconv-P8.RC.1 $e |- F/ x -. w_ph $.

    $( Inference Form of ~nfrnegconv-P8 .

       This statement is not deducible with intuitionist logic. $)
    nfrnegconv-P8.RC $p |- F/ x w_ph $=
        ( wff-nfree wff-true wff-neg ndtruei-P3.17 nfrnegconv-P8
          ndtruee-P3.18 )
    ABDAEBAFBDCGHI $.
$}

${
    $( Closed Form of ~nfrnegconv-P8 .

       This statement is not deducible with intuitionist logic. $)
    nfrnegconv-P8.CL $p |- ( F/ x -. w_ph -> F/ x w_ph ) $=
        ( wff-neg wff-nfree rcp-NDASM1of1 nfrnegconv-P8 ) AACBDZBGEF
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $( Biconditional Combining ~ndnfrneg-P7.2 and ~nfrnegconv-P8 .

       This statement is not deducible with intuitionist logic. $)
    nfrnegbi-P8 $p |- ( F/ x -. w_ph <-> F/ x w_ph ) $=
        ( wff-neg wff-nfree nfrnegconv-P8.CL ndnfrneg-P7.2.CL rcp-NDBII0 )
        ACBDABDABEABFG
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Define Effective Non-Freeness Within a Term.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Syntax Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $( Extend WFF definition to include the effective non-freeness in a term
       predicate '`F/t x`. $)
    wff-nfreet $a wff F/t x t_t $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Justification Theorem.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t y $. $d t_t z $.
    $d x y z $.

    $( Justification Theorem for ~df-nfreet-D8.1 . `t.`

       '`y`' and '`z`' are distinct from all other variables. $)
    nfreetjust-P8 $p
        |- ( A. y F/ x y = t_t <-> A. z F/ x z = t_t )
    $=
        ( term-obj wff-equals wff-nfree ndsubeql-P7.22a.CL ndnfrleq-P7.11.VR
          cbvall-P7.VR12of2 )
        CEZAFZBGDEZAFZBGCDLNKMFBKMAHIJ
    $.
$}

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Formal Definition.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    $d t_t y $.
    $d x y $.

    $( Definition of Effictive Non-Freeness in a Term, '`F/t x` `t_t`'.

       '`y`' is distinct from all other variables. $)
    df-nfreet-D8.1 $a |- ( F/t x t_t <-> A. y F/ x y = t_t ) $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Effective Non-Freeness Over Atomic Terms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d x y $.

    $( Any variable '`x`' is ENF in a constant term. `t.` $)
    nfrzero-P8 $p |- F/t x 0 $=
        ( term_zero wff-nfreet objvar-y term-obj wff-equals wff-nfree
          wff-forall ndnfrv-P7.1 axGEN-P7 df-nfreet-D8.1 bimpr-P4.RC )
        BZACDEMFZAGZDHODNAIJMADKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d x y z $.

    $( Any variable '`x`' is ENF in term consisting of some variable, '`y`',
       that is different from '`x`'. `t.` $)
    nfrvar-P8 $p |- F/t x y $=
        ( term-obj wff-nfreet objvar-z wff-equals wff-nfree wff-forall
          ndnfrv-P7.1 axGEN-P7 df-nfreet-D8.1 bimpr-P4.RC )
        BCZADECMFZAGZEHOENAIJMAEKL
    $.
$}

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Effective Non-Freeness Over Functional Terms.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

${
    $d t_t y $.
    $d t_t z $.
    $d x y z $.

    nfrsucc-P8.1 $e |- F/t x t_t $.

    $( If '`x`' is ENF in a term '`t_t`', then '`x`' is also ENF in its
       successor, 's&lsquo;`t_t`'. `t.` $)
    nfrsucc-P8 $p |- F/t x s` t_t $=
        ( term_succ wff-nfreet objvar-y term-obj wff-equals wff-nfree
          wff-forall objvar-z ndnfrv-P7.1 rcp-NDIMP0addall df-nfreet-D8.1
          bimpf-P4.RC alle-P7r.RC ndsubsucc-P7.24a.CL ndsubeqr-P7.22b
          ndnfrleq-P7.11 bimpf-P4 axL6ex-P7 exe-P7r.RC.VR axGEN-P7
          bimpr-P4.RC )
        ADZBEFGZUEHZBIZFJUHFKGZAHZUHKUFUIDZHZBIZUHUJUMUJULBLMULUGUJBUJBIZKABEU
        NKJCABKNOPUJUKUEUFUIAQRSTAKUAUBUCUEBFNUD
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 y $. $d t_t2 y $.
    $d t_t1 z1 $. $d t_t2 z1 $.
    $d t_t1 z2 $. $d t_t2 z2 $.
    $d x y z1 z2 $.

    nfradd-P8.1 $e |- F/t x t_t1 $.
    nfradd-P8.2 $e |- F/t x t_t2 $.

    $( If '`x`' is ENF in the terms '`t_t1`' and '`t_t2`', then '`x`' is ENF
       in the sum term, '`( t_t1 + t_t2 )`'. `t.` $)
    nfradd-P8 $p |- F/t x ( t_t1 + t_t2 ) $=
        ( term-add wff-nfreet objvar-y term-obj wff-equals wff-nfree
          wff-forall objvar-z2 objvar-z1 wff-imp wff-and ndnfrv-P7.1
          rcp-NDIMP0addall df-nfreet-D8.1 bimpf-P4.RC alle-P7r.RC
          ndnfrand-P7.4.RC ndsubaddd-P7.CL ndsubeqr-P7.22b ndnfrleq-P7.11
          bimpf-P4 rcp-NDIMI2 axL6ex-P7 exe-P7r.RC.VR axGEN-P7 bimpr-P4.RC )
        ABFZCGHIZULJZCKZHLUOHMIZBJZUOMNIZAJZUQUOONUOUSUQUMURUPFZJZCKZUOUSUQPZV
        BVCVACQRVAUNVCCUSUQCUSCKZNACGVDNLDACNSTUAUQCKZMBCGVEMLEBCMSTUAUBVCUTUL
        UMURAUPBUCUDUEUFUGANUHUIBMUHUIUJULCHSUK
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    $d t_t1 y $. $d t_t2 y $.
    $d t_t1 z1 $. $d t_t2 z1 $.
    $d t_t1 z2 $. $d t_t2 z2 $.
    $d x y z1 z2 $.

    nfrmult-P8.1 $e |- F/t x t_t1 $.
    nfrmult-P8.2 $e |- F/t x t_t2 $.

    $( If '`x`' is ENF in the terms '`t_t1`' and '`t_t2`', then '`x`' is ENF
       in the product term, '`( t_t1 x. t_t2 )`'. `t.` $)
    nfrmult-P8 $p |- F/t x ( t_t1 x. t_t2 ) $=
        ( term-mult wff-nfreet objvar-y term-obj wff-equals wff-nfree
          wff-forall objvar-z2 objvar-z1 wff-imp wff-and ndnfrv-P7.1
          rcp-NDIMP0addall df-nfreet-D8.1 bimpf-P4.RC alle-P7r.RC
          ndnfrand-P7.4.RC ndsubmultd-P7.CL ndsubeqr-P7.22b ndnfrleq-P7.11
          bimpf-P4 rcp-NDIMI2 axL6ex-P7 exe-P7r.RC.VR axGEN-P7 bimpr-P4.RC )
        ABFZCGHIZULJZCKZHLUOHMIZBJZUOMNIZAJZUQUOONUOUSUQUMURUPFZJZCKZUOUSUQPZV
        BVCVACQRVAUNVCCUSUQCUSCKZNACGVDNLDACNSTUAUQCKZMBCGVEMLEBCMSTUAUBVCUTUL
        UMURAUPBUCUDUEUFUGANUHUIBMUHUIUJULCHSUK
    $.
$}

$(
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
  More Quantifier Laws.
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
$)

$(
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Quantifier Collection Laws.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
$)

$(
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
  Implication.
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
$)

${
    qcallimr-P8.1 $e |- F/ x w_ph $.
    $( Quantifier Collection Law: Universal Quantifier Right on Implication.
       `t.` $)
    qcallimr-P8 $p |- ( ( w_ph -> A. x w_ps ) <-> A. x ( w_ph -> w_ps ) ) $=
        ( wff-exists wff-forall wff-imp qimeqalla-P7 bisym-P3.33b.RC qremex-P8
          subiml-P3.40a.RC subbil2-P4.RC )
        ACEZBCFZGZANGABGCFZPOABCDHIMANACDJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qceximr-P8.1 $e |- F/ x w_ph $.

    $( Quantifier Collection Law: Existential Quantifier Right on
       Implication. $)
    qceximr-P8 $p |- ( ( w_ph -> E. x w_ps ) <-> E. x ( w_ph -> w_ps ) ) $=
        ( wff-forall wff-exists wff-imp qimeqex-P7 bisym-P3.33b.RC qremall-P8
          subiml-P3.40a.RC subbil2-P4.RC )
        ACEZBCFZGZANGABGCFZPOABCHIMANACDJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qcalliml-P8.1 $e |- F/ x w_ps $.

    $( Quantifier Collection Law: Universal Quantifier Left on
       Implication. $)
    qcalliml-P8 $p |- ( ( A. x w_ph -> w_ps ) <-> E. x ( w_ph -> w_ps ) ) $=
        ( wff-forall wff-exists wff-imp qimeqex-P7 bisym-P3.33b.RC qremex-P8
          subimr-P3.40b.RC subbil2-P4.RC )
        ACEZBCFZGZMBGABGCFZPOABCHINBMBCDJKL
    $.
$}

$( ------------------------------------------------------------------------- $)

${
    qceximl-P8.1 $e |- F/ x w_ps $.

    $( Quantifier Collection Law: Existential Quantifier Left on Implication.
       `t.` $)
    qceximl-P8 $p |- ( ( E. x w_ph -> w_ps ) <-> A. x ( w_ph -> w_ps ) ) $=
        ( wff-exists wff-forall wff-imp qimeqallb-P7 bisym-P3.33b.RC
          qremall-P8 subimr-P3.40b.RC subbil2-P4.RC )
        ACEZBCFZGZMBGABGCFZPOABCDHINBMBCDJKL
    $.
$}

$( ------------------------------------------------------------------------- $)



$( ------------------------------------------------------------------------- $)



$( ------------------------------------------------------------------------- $)


