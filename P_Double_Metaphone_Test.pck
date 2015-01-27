create or replace package p_double_metaphone_test is
  --------------------------------
  procedure t_is_slavo_germanic_w;
  procedure t_is_slavo_germanic_witz;
  procedure t_is_slavo_germanic_cz;
  procedure t_is_slavo_germanic_k;
  -----------------------------
  procedure t_is_silent_start_gz;
  procedure t_is_silent_start_kn_pn;
  -------------------------------
  procedure t_split_2_table_3;
  procedure t_split_2_table;
  procedure t_split_2_table_2;
  -----------------------------
  procedure t_is_contain;
  procedure t_is_contain_4;
  procedure t_is_contain_5;
  -----------------------------
  procedure t_char_at;
  ----------------------------
  procedure t_is_vowel;
  procedure t_is_vowel_2;
  procedure t_is_vowel_3;
  ----------------------------
  procedure t_c_condition_1;
  procedure t_c_condition_1_2;
  procedure t_c_condition_1_3;
  procedure t_c_condition_1_4;
  procedure t_c_condition_1_5;
  procedure t_c_condition_1_6;
  -----------------------------
  procedure t_ch_condition_1;
  procedure t_ch_condition_1_2;
  procedure t_ch_condition_1_3;
  procedure t_ch_condition_1_4;
  procedure t_ch_condition_1_5;
  --------------------------------
  procedure t_ch_condition_2;
  procedure t_ch_condition_2_2;
  procedure t_ch_condition_2_3;
  procedure t_ch_condition_2_4;
  procedure t_ch_condition_2_5;
  procedure t_ch_condition_2_6;
  procedure t_ch_condition_2_7;
  -----------------------------------
  procedure t_l_condition;
  procedure t_l_condition_2;
  procedure t_l_condition_3;
  -------------------------------------
  procedure t_m_condition;
  procedure t_m_condition_2;
  procedure t_m_condition_3;
  -----------------------------
  procedure t_handle_aeiyou;
  procedure t_handle_aeiyou_2;
  procedure t_handle_aeiyou_3;
  -----------------------------
  procedure t_handle_b;
  procedure t_handle_b_2;
  ----------------------------
  procedure t_handle_c_wth_cecil;
  ---------------------------
  procedure t_handle_c;
  procedure t_handle_c_2;
  procedure t_handle_c_3;
  procedure t_handle_c_4;
  procedure t_handle_c_5;
  procedure t_handle_c_6;
  procedure t_handle_c_7;
  procedure t_handle_c_8;
  procedure t_handle_c_9;
  -----------------------------
  procedure t_handle_ch;
  procedure t_handle_ch_2;
  procedure t_handle_ch_3;
  procedure t_handle_ch_4;
  procedure t_handle_ch_5;
  procedure t_handle_ch_6;
  ------------------------------
  procedure t_handle_cc;
  procedure t_handle_cc_1;
  procedure t_handle_cc_2;
  procedure t_handle_cc_3;
  ------------------------------
  procedure t_handle_d;
  procedure t_handle_d_2;
  procedure t_handle_d_3;
  procedure t_handle_d_4;
  procedure t_handle_d_5;
  ------------------------------
  procedure t_handle_gh;
  procedure t_handle_gh_2;
  procedure t_handle_gh_3;
  procedure t_handle_gh_4;
  procedure t_handle_gh_5;
  ------------------------------
  procedure t_handle_h;
  procedure t_handle_h_2;
  procedure t_handle_h_3;
  --------------------------------
  procedure t_handle_j;
  procedure t_handle_j_2;
  procedure t_handle_j_3;
  procedure t_handle_j_4;
  procedure t_handle_j_5;
  procedure t_handle_j_6;
  procedure t_handle_j_7;
  ----------------------------------
  procedure t_handle_l;
  procedure t_handle_l_2;
  --------------------------------
  procedure t_handle_r;
  ----------------------------------
  procedure t_handle_s;
  procedure t_handle_s_2;
  procedure t_handle_s_3;
  procedure t_handle_s_4;
  procedure t_handle_s_5;
  procedure t_handle_s_6;
  procedure t_handle_s_7;
  procedure t_handle_s_8;
  procedure t_handle_s_9;
  procedure t_handle_s_10;
  procedure t_handle_s_11;
  --------------------------------
  procedure t_handle_sc;
  procedure t_handle_sc_2;
  procedure t_handle_sc_3;
  ---------------------------------
  procedure t_handle_t;
  procedure t_handle_t_2;
  procedure t_handle_t_3;
  procedure t_handle_t_4;
  procedure t_handle_t_5;
  -----------------------------------
  procedure t_handle_w;
  procedure t_handle_w_2;
  procedure t_handle_w_3;
  procedure t_handle_w_4;
  procedure t_handle_w_5;
  -----------------------------------
  procedure t_handle_x;
  procedure t_handle_x_2;
  procedure t_handle_x_3;
  ----------------------------------
  procedure t_handle_z;
  procedure t_handle_z_2;
end;
/
create or replace package body p_double_metaphone_test is

  procedure t_is_slavo_germanic_w is
    --Word contains 'W' should return true
  begin
    plunit.assert_true(p_double_metaphone.is_slavo_germanic('AWESOME'));
  end;

  procedure t_is_slavo_germanic_witz is
    --word contains 'WITZ' should return true
  begin
    plunit.assert_true(p_double_metaphone.is_slavo_germanic('WITZGENSTEIN'));
  end;

  procedure t_is_slavo_germanic_cz is
    --word contains c should return true 
  begin
    plunit.assert_true(p_double_metaphone.is_slavo_germanic('CZECH REPUB'));
  end;

  procedure t_is_slavo_germanic_k is
    --word contains 'K' should return true
  begin
    plunit.assert_true(p_double_metaphone.is_slavo_germanic('OKEY'));
  end;
  --------------------------------t_is_silent_start--------------------------------

  procedure t_is_silent_start_gz is
    --word starts with 'GN' should return true
  begin
    plunit.assert_true(p_double_metaphone.is_silent_start('GNERGEN'));
  end;

  procedure t_is_silent_start_kn_pn is
    ---word starts with KN or PN should return true
  begin
    plunit.assert_true(p_double_metaphone.is_silent_start('KNUTH'));
    plunit.assert_true(p_double_metaphone.is_silent_start('PNYGONGANG'));
  end;
  ---------------------------------------SPLIT_2_TABLE---------------------------------------
  procedure t_split_2_table is
    --Function should return not null array
    v_str_array apex_application_global.vc_arr2;
  begin
    v_str_array := p_double_metaphone.split_2_table('CSV,VSC');
    plunit.assert_true(v_str_array.count > 0);
  end;

  procedure t_split_2_table_2 is
    --Function should return string_array with splitted string
    v_str_array apex_application_global.vc_arr2;
  begin
    v_str_array := p_double_metaphone.split_2_table('CSV,VSC');
    plunit.assert_equals('CSV', v_str_array(1));
    plunit.assert_equals('VSC', v_str_array(2));
  end;

  procedure t_split_2_table_3 is
    --Function should throw null exception -60 with null input
  begin
    plunit.assert_raises_exception('declare
                                   result apex_application_global.vc_arr2;
                                   begin
                                   result := p_double_metaphone.split_2_table(null); 
                                   end;',
                                   -60);
  end;

  -------------------is_contain----------------------
  procedure t_is_contain is
    --Function should return true str_target: AHOY str_search: AHOY
  begin
    plunit.assert_true(p_double_metaphone.is_contain('AHOY', 'AHOY'));
  end;

  /*  procedure t_is_contain_2 is
    --Function should throw exception -60 with null str_target
  begin
    plunit.assert_raises_exception('declare
                                    result boolean;
                                    begin
                                    result := p_double_metaphone.is_contain(null,
                                            ''AHOY'');
                                    end;'
                                  ,-60);
  end;*/

  --Requirements are changed!
  /*procedure t_is_contain_3 is
    --Function should throw exception -60 with null str_search
  begin
    plunit.assert_raises_exception('declare
                                    result boolean;
                                    begin
                                    result := p_double_metaphone.is_contain(''AHOY'',
                                            null);
                                    end;'
                                  ,-60);
  end;*/

  procedure t_is_contain_4 is
    --Function should return when str_target contains one of string in delimited form of str_search
  begin
    plunit.assert_true(p_double_metaphone.is_contain('WITZGENSTEIN',
                                                     'DUMB,STUPID,OMFG,WITZ'));
  
  end;

  procedure t_is_contain_5 is
    --Function should return false when str_target doesn't contain one of string in delimited form of str_search
  begin
    plunit.assert_false(p_double_metaphone.is_contain('GALAXYNOTE4',
                                                      'AMF,MFS,ZAD'));
  end;

  procedure t_char_at is
    --Function should return 'Z' With parameter 'AZEROTH'
  begin
    plunit.assert_equals('Z', p_double_metaphone.char_at('AZEROTH', 2));
  end;

  -----------------------------------------t_is_vowel-------------------------------

  procedure t_is_vowel is
    --Function should return true for AEIOYU
    v_vowels varchar(10) := 'AEIOUY';
  begin
    for i in 1 .. length(v_vowels) loop
      plunit.assert_true(p_double_metaphone.is_vowel(substr(v_vowels, i, 1)));
    end loop;
  end;

  procedure t_is_vowel_2 is
    --Function should return false for 'M'
  begin
    plunit.assert_false(p_double_metaphone.is_vowel('M'));
  end;

  procedure t_is_vowel_3 is
  begin
    plunit.assert_raises_exception('declare
                                   result boolean;
                                   begin
                                   result := p_double_metaphone.is_vowel(ch =>''AA'');
                                   end;',
                                   -60);
  end;
  ------------------------------------HANDLE_AEIYOU------------------
  procedure t_handle_aeiyou is
    --should return index+1 and letter 'A' appended to result when ch_index 0 and result ''(empty);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_result    := 'AR';
    v_alternate := 'AR';
    ch_index    := p_double_metaphone.handle_aeiyou(v_result,
                                                    v_alternate,
                                                    1);
    plunit.assert_equals('ARA', v_result);
    plunit.assert_equals(2, ch_index);
  end;

  procedure t_handle_aeiyou_2 is
    --should return index+1 and letter 'A' appended to result 'MM' when char index 0 and result 'MM'
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    ch_index := 1;
    v_result := 'MM';
    ch_index := p_double_metaphone.handle_aeiyou(v_result,
                                                 v_alternate,
                                                 ch_index);
  
    plunit.assert_equals('MMA', v_result);
    plunit.assert_equals(2, ch_index);
  
  end;

  procedure t_handle_aeiyou_3 is
    --should return same result and index+1 when char index >0
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    ch_index := 1;
    v_result := 'AM';
    ch_index := p_double_metaphone.handle_aeiyou(v_result,v_alternate, ch_index);
    plunit.assert_equals('AMA', v_result);
    plunit.assert_equals(2, ch_index);
  end;
  --------------------------------------------------------------------------------------------
  procedure t_handle_b is
    --should return result appended 'P' and index+2 when charAt index+1 is 'B'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    ch_index := 2;
    v_value  := 'ABBA';
    v_result := 'A';
  
    ch_index := p_double_metaphone.handle_b(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals('AP', v_result);
    plunit.assert_equals(4, ch_index);
  end;

  procedure t_handle_b_2 is
    --should return result appended 'P' and index+1 when charAt index+1 is not 'B'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    ch_index := 2;
    v_value  := 'ABF';
    v_result := 'A';
  
    ch_index := p_double_metaphone.handle_b(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals('AP', v_result);
    plunit.assert_equals(3, ch_index);
  end;
  -----------------------------------------------------------------------------------------------------
  procedure t_handle_c_wth_cecil is
    --should return result appended 'S' and index+1 when value is 'Ç'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    ch_index := 2;
    v_value  := 'AÇAROV';
    v_result := 'A';
  
    ch_index := p_double_metaphone.handle_c_with_cedilla(v_value,v_alternate,
                                                         v_result,
                                                         ch_index);
  
    plunit.assert_equals('AS', v_result);
    plunit.assert_equals(3, ch_index);
  end;
  ---------------------------------------------------------------------------------
  procedure t_c_condition_1 is
    ---Should return true when string between index and index+4 is 'CHIA'
    v_value     varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHAWCHIAORAH'; --ahahahha
    ch_index := 5;
    plunit.assert_true(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;

  procedure t_c_condition_1_2 is
    --Should return false when index is equal or less than 1 and string between index and index+4 is NOT 'CHIA'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MCEHOV';
    ch_index := 2;
    plunit.assert_false(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;

  procedure t_c_condition_1_3 is
    --Should return false when string between index-1 to index+2 is not equal 'ACH'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'YACABETH';
    ch_index := 3;
    plunit.assert_false(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;

  procedure t_c_condition_1_4 is
    --Should return true when char index+2 is NOT equal 'I' or 'E' OR string between index-2 to index+6 is not equal 'BACHER' or 'MACHER'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MACHTUNG';
    ch_index := 3;
    plunit.assert_true(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;

  procedure t_c_condition_1_5 is
    --Should return false when char index+2 is I or E and string between index-2 to index-6 is not equal BACHER or MACHER
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MACHET';
    ch_index := 3;
    plunit.assert_false(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;

  procedure t_c_condition_1_6 is
    --Should return false when string between index-2 and index+4 is equal to BACHER or MACHER
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'VONBACHER';
    ch_index := 6;
    plunit.assert_true(p_double_metaphone.c_condition_1(v_value, ch_index));
  end;
  --------------------------------------------------t_ch_condition_1----------------------------------------------------------------------------
  procedure t_ch_condition_1 is
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    --should return false when ch_index equal to 0
    ch_index := 2;
    v_value  := 'CHAHAOFADSFHS';
    plunit.assert_false(p_double_metaphone.ch_condition_1(v_value,
                                                          ch_index));
  end;

  procedure t_ch_condition_1_2 is
    --Should return true when string between index+1 and index+6 is 'HARAC' or 'HARIS'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHARACTER';
    ch_index := 1;
    plunit.assert_true(p_double_metaphone.ch_condition_1(v_value, ch_index));
  end;

  procedure t_ch_condition_1_3 is
    --Should return true when when string between index+1 and index+4 is 'HOR' 'HYM' 'HIA' or 'HEM'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHYMERA';
    ch_index := 1;
    plunit.assert_true(p_double_metaphone.ch_condition_1(v_value, ch_index));
  end;

  procedure t_ch_condition_1_4 is
    --Should return false when string between index and index+5 is 'CHORE'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHOREANCE';
    ch_index := 1;
    plunit.assert_false(p_double_metaphone.ch_condition_1(v_value,
                                                          ch_index));
  end;
  procedure t_ch_condition_1_5 is
    --Should return false when index equals 0 and string between index+1 and index+4 is NOT 'HOR','HYM','HIA' and 'HEM' and string between index+1 and index+5 is NOT 'HARAC' or 'HARIS'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CJUCKE';
    ch_index := 1;
    plunit.assert_false(p_double_metaphone.ch_condition_1(v_value,
                                                          ch_index));
  end;

  ---------------------------------------------------------------------------------------------------------------------------
  procedure t_ch_condition_2 is
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    --Should return true when string  between 0 and 4 equals to 'VAN ' or 'VON '
    v_value  := 'VON CHAROVSKY';
    ch_index := 5;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value, ch_index));
  end;

  procedure t_ch_condition_2_2 is
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    --Should return true when string  between 0 and 4 equals to 'VAN ' or 'VON '
    v_value  := 'SCHWANSTEIN';
    ch_index := 2;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value, ch_index));
  end;

  procedure t_ch_condition_2_3 is
    --Should return true when string between index-2 and index+4 is equal to 'ORCHES','ARCHIT','ORCHID'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ARCHITOM';
    ch_index := 3;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value, ch_index));
  end;

  procedure t_ch_condition_2_4 is
    --Should retrun true if char at index+2 is 'T' or 'S'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ARACHTAL';
    ch_index := 4;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value,ch_index));
  end;

  procedure t_ch_condition_2_5 is
    --Should return true 
    --when char at index-1 is 'A' or 'O' or 'U' or 'E' 
    -- and char at index+2 is L_R_N_M_B_H_F_V_W_SPACE
    v_value     varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ARACOLOPHOBIA';
    ch_index := 4;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value, ch_index),
                       'ARACOLOPHIA');
    v_value  := 'IRULACELAN';
    ch_index := 6;
    plunit.assert_true(p_double_metaphone.ch_condition_2(v_value, ch_index),
                       'IRULACELAN');
  
  end;

  procedure t_ch_condition_2_6 is
    --Should return true 
    --When word at length equals index+1
    --and char at index-1 is 'A' or 'O' or 'U' or 'E' or index=1
  begin
    plunit.assert_true(p_double_metaphone.ch_condition_2('DUACH', 4));
  end;

  procedure t_ch_condition_2_7 is
    --Should return false when input is meaningless.
  begin
    plunit.assert_false(p_double_metaphone.ch_condition_2('OMFGHCHEERS', 6));
  end;

  --------------------------------------------------------------------
  procedure t_l_condition is
    --Should return true when index equal to lenght-3 
    --and string between index-1 to index+3 is 'ALLE', 'ILLO','ILLA'
  begin
    plunit.assert_true(p_double_metaphone.l_condition_1('BALLER', 3));
  end;

  procedure t_l_condition_2 is
    --should return true when string ends with 'AS','OS' 
    --and string between index-1 and index+3 is 'ALLE'
  begin
    plunit.assert_true(p_double_metaphone.l_condition_1('BALLEROS', 3));
  end;

  procedure t_l_condition_3 is
    --should return true when string ends with 'A' or 'O'
    --and string between index-1 and index+3 is ALLE
  begin
    plunit.assert_true(p_double_metaphone.l_condition_1('BALLERO', 3));
  end;

  ----------------------------------------------------------------------------------
  procedure t_m_condition is
    --should return true when character at index+1 is M
  begin
    plunit.assert_true(p_double_metaphone.m_condition_1('EMMA', 2));
  end;

  procedure t_m_condition_2 is
    --Should return true when string between index-1 and index+2 is UMB
    --and index+1 equal to length-1
  begin
    plunit.assert_true(p_double_metaphone.m_condition_1('MAKUMBE', 5));
  end;

  procedure t_m_condition_3 is
    --Should return true when string between index-1 and index+2 is UMB
    --and String between index+2 and index+4 is equal to ER
  begin
    plunit.assert_true(p_double_metaphone.m_condition_1('UMBERTO', 2));
  end;
  -------------------------------------------------------------------------------
  procedure t_handle_c is
    --Check for condition_c_1, if it'select true result should be* appended 'K' and 
    --index should be* index+2
    --PS: I used the example of t_c_condition_1
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHAWCHIAORAH';
    v_result := 'M';
    ch_index := 5;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
  
    plunit.assert_equals(7, ch_index);
    plunit.assert_equals('MK', v_result);
  
  end;

  procedure t_handle_c_2 is
    --return result appended 'S' and index+2 
    --when index equal to zero 
    --and string from 0 to 6 is 'CEASER'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CEASERIOUS';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_c(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_c_3 is
    --should handled by hanldCH function
    --when string between index and index+2 is 'CH'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MICHAEL';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_c(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_c_4 is
    --return result appended 'S'(alternative X) and index+2
    --when string between index and index+2 is 'CZ'
    --and string between index-2 and index+2 is not WICZ
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CZERNY';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_c_5 is
    --return result appended 'X'and index+3
    --when string between index+1 and index+4 is 'CIA'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'FOCACCIA';
    v_result := 'M';
    ch_index := 5;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(8, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_c_6 is
    --Should be* handled by handle_cc 
    --when string between index and index+2 is CC
    --and not starts with MC
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ACCIDENT';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MKS', v_result);
  end;

  procedure t_handle_c_7 is
    --Should return result appended 'K' and index+2
    --when String between index and index+2 is 'CK' or 'CG' or 'CQ'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ACKNOWLEDGE';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_c_8 is
    --Should return result appended 'S'(Alternative X) and index+2
    --When String between index and index+2 is 'CI' or 'CI' or 'CY'
    --and String between index and index+2 is 'CIO','CIE'or'CIA'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ACIAMORO';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_c(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_c_9 is
    --Should return result appended 'K' and index+3
    --When str_value is Mac Caffrey
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MAC CAFFREY';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_c(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(6, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  --------------------------------------------------------------------------

  procedure t_handle_ch is
    --Should return result appended K(Alternative X) and index+2
    --When index bigger than 0 
    --and string between index and index+4 is equal to 'CHAE'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MICHAEL';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MK', v_result);
  
  end;

  procedure t_handle_ch_2 is
    --Should return result appended K and return index+2
    --When ch_condition_1 is true (CHEMISTRY)
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CHEMISTRY';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_ch_3 is
    --Should return result appended K and return index+2
    --When ch_condition_2 is true
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SCHWANSTEIN';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_ch_4 is
    --Should return result X appended and index+2
    --when index=1
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CECILLA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_ch_5 is
    --Should return result Kappended and index+2
    --When First two letter is 'MC'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MCCALLEN';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_ch_6 is
    --Should return result appended 'X'(Alternate K) and index+2 
    --when first two letter is NOT 'MC'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'PCPLLEN';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_ch(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  -------------------------------------------------------------------
  procedure t_handle_cc is
    --Should return result 'KS' appended and index+3
    --When char_at index+2 is I,E,H
    --and strin between index+2 and index+4 is NOT 'HU'
    --and index=1
    --and word starts with 'A'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ACCIDENT';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_cc(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MKS', v_result);
  end;

  procedure t_handle_cc_1 is
    --Should return result 'KS' appended and index+3
    --When char_at index+2 is I,E,H
    --and String between index+2 and index+4 is NOT 'HU'
    --and String between index-1 index+4 is UCCEE or UCCES
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SUCCEED';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_cc(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(6, ch_index);
    plunit.assert_equals('MKS', v_result);
  end;

  procedure t_handle_cc_2 is
    --Should return result 'X' appended and index+3
    --When char_at index+2 is I,E,H
    --and String between index+2 and index+4 is NOT 'HU'
    --and String between index-1 index+4 is NOT UCCEE or UCCES
    --and index=1 and word starts with 'A'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'BERTUCCI';
    v_result := 'M';
    ch_index := 6;
    ch_index := p_double_metaphone.handle_cc(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(9, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_cc_3 is
    --Should return result 'K' appended and index+2
    --and String between index+2 and index+4 is 'HU'
  
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ACIHUCK';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_cc(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  -------------------------------------------------------------------------------
  procedure t_handle_d is
    --Should return result 'J' appended and index+3
    --When String between index and index+2 is DG (EDGE)
    --and char at index+2 is in 'I','E','Y'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'EDGE';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_d(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_d_2 is
    --Should return result 'J' appended and index+3
    --When String between index and index+2 is DG (EDGE)
    --and char at index+2 is in 'I','E','Y'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'EDGAR';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_d(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MTK', v_result);
  end;

  procedure t_handle_d_3 is
    --Should return result 'TK' appended and index+2
    --When String between index and index+2 is DG (EDGE)
    --and char at index+2 is NOT IN 'I','E','Y'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'EDGAR';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_d(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MTK', v_result);
  end;

  procedure t_handle_d_4 is
    --Should return result appended 'T' and index+2
    --When string between index and index+2 is 'DT' or 'DD'(EDDINGBURG)
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'EDDINGBURG';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_d(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MT', v_result);
  end;

  procedure t_handle_d_5 is
    --Should return result appended 'T' and index+2
    --When input is ADAGIO
    --this is else section
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ADAGIO';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_d(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MT', v_result);
  end;
  ------------------------------------------------------------------
  procedure t_handle_gh is
    --Should return result appended K and index+2
    --When index>1 and char at index-1 not wovel!
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MERMAGHMET';
    v_result := 'M';
    ch_index := 6;
    ch_index := p_double_metaphone.handle_gh(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(8, ch_index);
    plunit.assert_equals('MK', v_result);
  end;
  ---------------------------------------------------------------
  procedure t_handle_gh_2 is
    --Should return result appended J and index+2
    --When index=1 and char at index+2 is I
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'GHIROP';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_gh(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_gh_3 is
    --Should return index+2 if input is HUGH
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'HUGH';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_gh(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('M', v_result);
  end;

  procedure t_handle_gh_4 is
    --Should return result appended 'F' and index+2 (MCLAUGHLIN,COUGH,GOUGH,ROUGH)
    --When index>3 
    --and char_at index-1 is 'U'
    --and index-3 is in 'C','G','L','R','T'
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'COUGH';
    v_result := 'M';
    ch_index := 4;
    ch_index := p_double_metaphone.handle_gh(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(6, ch_index);
    plunit.assert_equals('MF', v_result);
  end;

  procedure t_handle_gh_5 is
    --Should return appended 'K' and index+2
    --when index >1 and char at index-1 is NOT 'I'
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MOGOGH';
    v_result := 'M';
    ch_index := 5;
    ch_index := p_double_metaphone.handle_gh(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(7, ch_index);
    plunit.assert_equals('MK', v_result);
  end;

  procedure t_handle_h is
    --Should return result appended H and index+2
    --when index=0 and index+1 is vowel(HOHA)
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'HOHA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_h(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MH', v_result);
  end;

  procedure t_handle_h_2 is
    --Should return result appended H and index+2
    -- when index+1 and index-1 is vowel(...AHA...)
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MOHA';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_h(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MH', v_result);
  end;

  procedure t_handle_h_3 is
    --Should return result itself without appending and index+1
    --No if condition satisfied
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'BUPHA';
    v_result := 'M';
    ch_index := 4;
    ch_index := p_double_metaphone.handle_h(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('M', v_result);
  end;

  procedure t_handle_j is
    --Should return result H appended and index+1
    --When (string between index and index+4 is JOSE or SAN)
    --and(
    --index=1 and index+4 is blank(JOSE )
    --or length is 4(JOSE)
    --or string between 0 4 is 'SAN '
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'JOSE MUA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MH', v_result);
  end;

  procedure t_handle_j_2 is
    --Should return result H appended and index+1
    --When (string between index and index+4 is JOSE or SAN)
    --and(
    --index=1 and index+4 is blank(JOSE )
    --or length is 4(JOSE)
    --or string between 0 4 is 'SAN '
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SAN SIRO';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MH', v_result);
  end;

  procedure t_handle_j_3 is
    --Should return result appended J and index+1
    --when it contains JOSE, and index<>0 (AJOSE,ORJOSE,etc..)
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'AJOSESANESSERO';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_j_4 is
    --Should return result appenden J (alternative A) and index+1
    --When first letter is J but not JOSE (JOSHUA) 
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'JOSHUA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MJ', v_result);
  
  end;

  procedure t_handle_j_5 is
    --Should return result appended J alternative(H) 
    --When char at index-1 is vowel
    --and not SlavoGermanic
    --and charAt index+1 A or O
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'OJARRO';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_j_6 is
    --Should return result appended J (alternative ' ') and index +1
    --when index equal to length of value-1
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'MAJA';
    v_result := 'M';
    ch_index := 3;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;
  procedure t_handle_j_7 is
    --Should return result appended J (alternative ' ') and index+1
    --when index+1 doesnt contains LTKSNMBZ and index-1 doesnt contains SKL
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'HJAR';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_j(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_l is
    --Should return result appended from and index+2
    --when index+1 char_at is L(double LL)
    --and conditionL0 is true (if true only append primary, if false append both)
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'BALLER';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_l(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('ML', v_result);
  end;

  procedure t_handle_l_2 is
    --Should return result appended from and index+2
    --when single L 
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ALOHOMORA';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_l(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('ML', v_result);
  end;

  procedure t_handle_r is
    --Should return R and index+2
    --when double R (RR)
    --return index+1 when single R
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ARRAJA';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_r(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MR', v_result);
  end;

  procedure t_handle_s is
    --Should return index+1 (CARLISLE,CARLYSLE,ISLE,ISLAND)
    --when string between index-1 and index+2 ISL YSL ()
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'CARLISLE';
    v_result := 'M';
    ch_index := 6;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(7, ch_index);
    plunit.assert_equals('M', v_result);
  end;

  procedure t_handle_s_2 is
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    --Should return result x appended (alternatively S) and index+1
    v_value  := 'SUGAROVSKÝ';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_s_3 is
    --Should result appended S and index+2
    --When index+1 is H(SH)
    --and string between index+1 and index+5 is HEIM,HOEK,HOLM,HOLZ
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ASHEIM';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_s_4 is
    --Should result appended X and index+2
    --When index+1 is H(SH)
    --and string between index+1 and index+5 is NOT (HEIM,HOEK,HOLM,HOLZ)
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ASHOKE';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MX', v_result);
  end;
  ---SIO SIA
  procedure t_handle_s_5 is
    --Should result appended X and index+2
    --When index+1 is H(SH)
    --and string between index+1 and index+5 is NOT (HEIM,HOEK,HOLM,HOLZ)
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ASHOKE';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_s_6 is
    --Should return result 'S' appended and index+3
    --when string from index to index+3 is SIO or SIA
    --and slavogermanic is true
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'WITZGENSION';
    v_result := 'M';
    ch_index := 8;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(11, ch_index);
    plunit.assert_equals('MS', v_result);
  end;
  procedure t_handle_s_7 is
    --Should return result 'S'(alternative X) appended and index+3
    --when string from index to index+3 is SIO or SIA
    --and slavogermanic is false
    v_value     varchar2(20);
    v_result    varchar2(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'WITZGENSIONATION';
    v_result := 'M';
    ch_index := 8;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            true);
    plunit.assert_equals(11, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_s_8 is
    --Should return result appended 'S' and index +1
    --when ch_index 0 and index+1 is 'M' 'L' 'W' 'N' (SWORD) (ALTERNATIVE X)
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SMITH';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_s_9 is
    --Should return result appended 'S' and index +2
    --when ch_index 0 and index+1 is Z (SZERZA) (ALTERNATIVE X)
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SZERZA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_s_10 is
    --RETURN BACK HERE
    --Should handled by handleSC
    --when string from index to index+2 is SC
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'SZERZA';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  /*procedure t_handle_s_11 is
    --Shouuld return ALTERNATIVE result appended 'S' and index+2
    --when index equal to length-1
    --and string between index-2 to index is 'AI''OI'
  begin
    null
    --This procedure not implemented yet because we don't use double metaphone
  end;*/

  procedure t_handle_s_11 is
    ---Should return result appended select and index+2
    ---when it doesn't fit any other if cases and index+1 is 'S' or 'Z'
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'NSZMKPMO';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_s(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_sc is
    --Should return result appended X (ALTERNATIVE SK) nd index+3
    --When index+2 is H
    ---and String from index+3 to index+5 is NOT in 'OO' 'ER' 'EN' UY' 'ED' 'EM'
    --and index+3 is 'ER' and 'EN'
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SCHERMERHORN';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_sc(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MX', v_result);
  
  end;

  procedure t_handle_sc_2 is
    ---Should return result appended X ('S' ALTERNATIVE) and index+3
    ---When index+2 is H
    ---and String from index+3 to index+5 is NOT in 'OO' 'ER' 'EN' UY' 'ED' 'EM'
    --and index=0 and char_at 3 is not vowel
    --and charAt 3 is not W
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SCHEER';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_sc(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_sc_3 is
    --Should return result appended 'S' and index+3
    --when char at index+2 is in I E Y
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'SCENE';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_sc(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_t is
    --Should return result appended X and index+3
    --When string from index to index+4 is TION
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ATIONA';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_t(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_t_2 is
    --Should return result appended X and index+3
    --When string from index to index+3 is in 'TIA', 'TCH'
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ATCHATION';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_t(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(5, ch_index);
    plunit.assert_equals('MX', v_result);
  end;

  procedure t_handle_t_3 is
    --Should return result appended T and index+2
    --When string from index to index+2 is 'TH' or TTH
    --and String from index+2 to index 4 is OM AM
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ATHOM';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_t(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MT', v_result);
  end;

  procedure t_handle_t_4 is
    --Should return result appended 0 and index+2 (yeah ZERO)(ALTERNATIVE T)
    --When string from index to index+2 is 'TH' or TTH
    --and String from index+2 to index 4 is NOT 'OM','AM'
    --and String from 0 to 4 is not 'VAN ', 'VON ' <---((ATTENTION WHITESPACE NEAR VON/VAN))
    --and String from 0 3 is not SCH
    v_value     varchar2(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'ATHASTI';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_t(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('M0', v_result);
  end;

  procedure t_handle_t_5 is
    --Should return result appended T and index+2
    --When it fails all if clause and index+1 is T
    v_value     varchar2(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'ATDLÇC';
    v_result := 'M';
    ch_index := 2;
    ch_index := p_double_metaphone.handle_t(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(4, ch_index);
    plunit.assert_equals('MT', v_result);
  end;

  procedure t_handle_w is
    --Should return result appended R and index+2
    ---when chars between index and index+2 is 'WR'
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'WRANGLER';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_w(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MR', v_result);
  end;

  procedure t_handle_w_2 is
    --Should return result appended 'A' and index+1
    --when index=0 
    --and (charat index+1 is vowel or char at index+1 is H
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'WHALE';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_w(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MA', v_result);
  end;

  procedure t_handle_w_3 is
    --Should return result appended 'A' and index+1(ALTERNATIVE A F)
    --when index=0 
    --and (charat index+1 is vowel or char at index+1 is H
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'WASSERMAN';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_w(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MA', v_result);
  end;

  procedure t_handle_w_4 is
    --Should return ch_index+1 only (ALTERNATIVE F)
    --when index=length and chartAt-1 is vowel!
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'ABOW';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_w(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('M', v_result);
  end;

  procedure t_handle_w_5 is
    --Should return index+4 and result appended TS (ALTERNATIVE FX)
    --When chars between index and index+4 is WICZ or WITZ
    v_value     varchar(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'AHOWITZGENSTEINHOLM';
    v_result := 'M';
    ch_index := 4;
    ch_index := p_double_metaphone.handle_w(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(8, ch_index);
    plunit.assert_equals('MTS', v_result);
  end;

  procedure t_handle_x is
    --Should return result appended 'S' and index+1
    --When index is 0
    v_value     varchar(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'XAVIER';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_x(v_value, v_result, v_alternate,ch_index);
    plunit.assert_equals(2, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

  procedure t_handle_x_2 is
    --Should return result appended 'KS' and index++
    --When chars between index-2 and index is in AU or OU
    v_value     varchar(20);
    v_result    varchar(20);
    v_alternate varchar2(20);
    ch_index    int;
  begin
    v_value  := 'BREAUX';
    v_result := 'M';
    ch_index := 6;
    ch_index := p_double_metaphone.handle_x(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(7, ch_index);
    plunit.assert_equals('MKS', v_result);
  end;
  procedure t_handle_x_3 is
    --Should return result appended 'KS' and index+2
    --When chars between index-2 and index is in AU or OU
    --and index+1 is in C or X
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'BREAUXX';
    v_result := 'M';
    ch_index := 6;
    ch_index := p_double_metaphone.handle_x(v_value, v_result,v_alternate, ch_index);
    plunit.assert_equals(8, ch_index);
    plunit.assert_equals('MKS', v_result);
  end;
  ---------------------------------------------------------------------------------------------
  procedure t_handle_z is
    --Should return J appended and index+2
    --when index+1 is H
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'ZHAO';
    v_result := 'M';
    ch_index := 1;
    ch_index := p_double_metaphone.handle_z(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(3, ch_index);
    plunit.assert_equals('MJ', v_result);
  end;

  procedure t_handle_z_2 is
    --Should return 'S' appended and index+2
    --when its slavo germanic
    --and index bigger than zero and char at index-1 is NOT T
    v_value     varchar(20);
    v_alternate varchar2(20);
    v_result    varchar(20);
    ch_index    int;
  begin
    v_value  := 'WITZZER';
    v_result := 'M';
    ch_index := 4;
    ch_index := p_double_metaphone.handle_z(v_value,
                                            v_result,v_alternate,
                                            ch_index,
                                            false);
    plunit.assert_equals(6, ch_index);
    plunit.assert_equals('MS', v_result);
  end;

end;
/
