
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
