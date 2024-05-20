
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

/* ######################################################################### */
/* Chapter 7                                                                 */
/* ######################################################################### */

/* ************************************************************************* */
/* Defined Syntax */

althtmldef "F/t" as "&#8498;<sub>t</sub>";
latexdef "F/t" as "\Finv_t";

$)
