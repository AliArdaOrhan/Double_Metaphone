create or replace package p_double_metaphone is

  -- Author  : ALI.ORHAN
  -- Created : 02.01.2015 13:43:43
  -- Purpose : NAME_CHECK

  -------------------------------------Main-------------------------------------

  function calculate_result(str_value     in varchar2,
                            str_alternate in out varchar2) return varchar2;

  ---------------HANDLERS_------------------
  -------------------------------------------------
  function handle_c(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;
  function handle_sc(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in int) return int;
  -------------------------------------------------
  function handle_aeiyou(str_result    in out varchar2,
                         str_alternate in out varchar2,
                         ch_index      in number) return int;
  -------------------------------------------------
  function handle_ch(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int;
  -------------------------------------------------
  function handle_cc(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int;
  -------------------------------------------------
  function handle_b(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in number) return int;
  ---------------------------------------------------
  function handle_c_with_cedilla(str_value     in varchar2,
                                 str_result    in out varchar2,
                                 str_alternate in out varchar2,
                                 ch_index      in number) return int;
  -------------------------------------------------
  function handle_d(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in number) return int;
  ---------------------------------------------------
  function handle_g(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in number,
                    isslavogermanic in boolean) return int;
  ------------------------------------------------
  function handle_gh(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int;

  ------------------------------------------------
  function handle_j(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        int,
                    isslavogermanic boolean) return int;
  -------------------------------------------------
  function handle_h(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;

  ------------------------------------------------
  function handle_l(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;

  -----------------------------------------------------
  function handle_r(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in int,
                    isslavogermanic in boolean) return int;
  ------------------------------------------------------
  function handle_s(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in int,
                    isslavogermanic in boolean) return int;
  ------------------------------------------------------
  function handle_t(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;
  ----------------------------------------------------
  function handle_w(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;
  ----------------------------------------------
  function handle_x(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      int) return int;
  ---------------------------------------------------------
  function handle_p(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int;
  ---------------------------------------------
  function handle_z(str_value         in varchar2,
                    str_result        in out varchar2,
                    str_alternate     in out varchar2,
                    ch_index          int,
                    is_slavo_germanic in boolean) return int;

  -------------------CONDITIONS-------------------------
  ------------------------------------------------------
  function c_condition_1(str_value in varchar2, ch_index in int)
    return boolean;
  ------------------------------------------------------
  function ch_condition_1(str_value in varchar2, ch_index in number)
    return boolean;
  -------------------------------------------------------
  function ch_condition_2(str_value in varchar2, ch_index in number)
    return boolean;
  -------------------------------------------------------
  function l_condition_1(str_value in varchar2, ch_index in number)
    return boolean;
  --------------------------------------------------------
  function m_condition_1(str_value in varchar2, ch_index in number)
    return boolean;
  --------------------------HELPERS----------------------------------
  function is_slavo_germanic(str_value in varchar2) return boolean;
  -------------------------------------------------------------------
  function trim_and_upper(str_value in varchar2) return varchar2;
  -------------------------------------------------------------------
  function is_silent_start(str_value in varchar2) return boolean;
  -------------------------------------------------------------------
  function char_at(str in varchar2, index_of_ch in number) return varchar2;
  -------------------------------------------------------------------
  function is_contain(str_target in varchar2, str_search in varchar2)
    return boolean;
  -------------------------------------------------------------------
  function is_vowel(ch in varchar2) return boolean;
  -------------------------------------------------------------------
  function split_2_table(str_target in varchar2)
    return apex_application_global.vc_arr2;
  -------------------------------------------------------------------
end p_double_metaphone;
/
create or replace package body p_double_metaphone is
  -------------DECLARATIONS START------------------------
  function calculate_result(str_value     in varchar2,
                            str_alternate in out varchar2) return varchar2 is
    ch_index        number;
    str_result      varchar2(50);
    isslavogermanic boolean;
    target          varchar2(100);
  begin
    target          := trim_and_upper(str_value);
    ch_index        := 1;
    str_result      := '';
    str_alternate   := '';
    isslavogermanic := is_slavo_germanic(str_value);
    if (is_silent_start(str_value)) then
      ch_index := ch_index + 1;
    end if;
    while ch_index <= length(str_value) loop
      case char_at(str_value, ch_index)
        when 'A' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'E' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'I' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'Y' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'O' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'U' then
          ch_index := handle_aeiyou(str_result, str_alternate, ch_index);
        when 'B' then
          ch_index := handle_b(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'Ç' then
          ch_index := handle_c_with_cedilla(str_value,
                                            str_result,
                                            str_alternate,
                                            ch_index);
        when 'C' then
          ch_index := handle_c(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'D' then
          ch_index := handle_d(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'F' then
          str_result    := concat(str_result, 'F');
          str_alternate := concat(str_alternate, 'F');
          if char_at(str_value, ch_index + 1) = 'F' then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'G' then
          ch_index := handle_g(str_value,
                               str_result,
                               str_alternate,
                               ch_index,
                               isslavogermanic);
        when 'H' then
          ch_index := handle_h(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'J' then
          ch_index := handle_j(str_value,
                               str_result,
                               str_alternate,
                               ch_index,
                               isslavogermanic);
        when 'K' then
          str_result    := concat(str_result, 'K');
          str_alternate := concat(str_alternate, 'K');
          if char_at(str_value, ch_index + 1) = 'K' then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'L' then
          ch_index := handle_l(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'M' then
          str_result    := concat(str_result, 'M');
          str_alternate := concat(str_alternate, 'M');
          if (m_condition_1(str_value, ch_index)) then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'N' then
          str_result    := concat(str_result, 'N');
          str_alternate := concat(str_alternate, 'N');
          if (char_at(str_value, ch_index + 1) = 'N') then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'Ñ' then
          str_result    := concat(str_result, 'N');
          str_alternate := concat(str_alternate, 'N');
          ch_index      := ch_index + 1;
        when 'P' then
          ch_index := handle_p(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'Q' then
          str_result    := concat(str_result, 'K');
          str_alternate := concat(str_alternate, 'K');
          if (char_at(str_value, ch_index + 1) = 'Q') then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'R' then
          ch_index := handle_r(str_value,
                               str_result,
                               str_alternate,
                               ch_index,
                               isslavogermanic);
        when 'S' then
          ch_index := handle_s(str_value,
                               str_result,
                               str_alternate,
                               ch_index,
                               isslavogermanic);
        when 'T' then
          ch_index := handle_t(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'V' then
          str_result    := concat(str_result, 'F');
          str_alternate := concat(str_alternate, 'F');
          if (char_at(str_value, ch_index + 1) = 'V') then
            ch_index := ch_index + 2;
          else
            ch_index := ch_index + 1;
          end if;
        when 'W' then
          ch_index := handle_w(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'X' then
          ch_index := handle_x(str_value,
                               str_result,
                               str_alternate,
                               ch_index);
        when 'Z' then
          ch_index := handle_z(str_value,
                               str_result,
                               str_alternate,
                               ch_index,
                               isslavogermanic);
        
        else
          ch_index := ch_index + 1;
      end case;
    end loop;
    return str_result;
  end;

  -------------------FUNCTIONS STARTS-------------------------

  ------------------------------HANDLERS---------------------------------------
  --DONE
  function handle_aeiyou(str_result    in out varchar2,
                         str_alternate in out varchar2,
                         ch_index      in number) return int is
  begin
    if (ch_index = 1) then
      str_result    := concat(str_result, 'A');
      str_alternate := concat(str_alternate, 'A');
    end if;
    return ch_index + 1;
  end;
  ----------------------------------------------------------------------------------
  function handle_b(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in number) return int is
  begin
    str_result    := concat(str_result, 'P');
    str_alternate := concat(str_result, 'P');
    if (char_at(str_value, ch_index + 1) = 'B') then
      return ch_index + 2;
    else
      return ch_index + 1;
    end if;
    return null;
  end;

  -----------------------------------------------------------------------------------
  --DONE--
  function handle_c_with_cedilla(str_value     in varchar2,
                                 str_result    in out varchar2,
                                 str_alternate in out varchar2,
                                 ch_index      in number) return int is
  begin
    str_result    := concat(str_result, 'S');
    str_alternate := concat(str_alternate, 'S');
    return ch_index + 1;
  end;

  -----------------------------------------------------------------------------------
  --DONE
  function handle_c(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
    v_index number;
  begin
    v_index := ch_index;
    if (c_condition_1(str_value, ch_index)) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    elsif (ch_index = 1 and substr(str_value, ch_index, 6) = 'CEASER') then
      str_result    := concat(str_result, 'S');
      str_alternate := concat(str_alternate, 'S');
      return ch_index + 2;
    elsif (substr(str_value, ch_index, 2) = 'CH') then
      v_index := handle_ch(str_value, str_result, str_alternate, ch_index);
      return v_index;
    elsif substr(str_value, ch_index, 2) = 'CZ' and
          substr(str_value, ch_index - 2, 4) <> 'WICZ' then
      str_result    := concat(str_result, 'S');
      str_alternate := concat(str_alternate, 'X');
      return ch_index + 2;
    elsif (substr(str_value, ch_index + 1, 3) = 'CIA') then
      str_result    := concat(str_result, 'X');
      str_alternate := concat(str_alternate, 'X');
      return ch_index + 3;
    elsif (substr(str_value, ch_index, 2) = 'CC' and
          (ch_index = 1 and char_at(str_value, 1) = 'M') = false) then
      return handle_cc(str_value, str_result, str_alternate, ch_index);
    
    elsif (is_contain(substr(str_value, ch_index, 2), 'CK,CG,CQ')) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    elsif is_contain(substr(str_value, ch_index, 2), 'CI,CE,CY') then
      if (is_contain(substr(str_value, ch_index, 3), 'CIO,CIE,CIA')) then
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'X');
      else
        str_result := concat(str_result, 'S');
      end if;
      return ch_index + 2;
    else
      str_result := concat(str_result, 'K');
      if (is_contain(substr(str_value, ch_index + 1, 2), ' C, Q, G')) then
        return ch_index + 3;
      elsif (is_contain(char_at(str_value, ch_index + 1), 'C,K,Q') and
            (is_contain(substr(str_value, ch_index + 1, 2), 'CE,CI') =
            false)) then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    end if;
  end;
  -----------------------------------------------------------------------------------
  --DONE
  function handle_cc(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int is
    v_index number;
  begin
    v_index := ch_index;
    if (is_contain(char_at(str_value, ch_index + 2), 'I,E,H')) and
       (substr(str_value, ch_index + 2, 2) <> 'HU')
    
     then
      if ((ch_index = 2 and substr(str_value, ch_index - 1, 1) = 'A') or
         (is_contain(substr(str_value, ch_index - 1, 5), 'UCCEE,UCCES')))
      
       then
        str_result    := concat(str_result, 'KS');
        str_alternate := concat(str_alternate, 'KS');
      else
        str_result    := concat(str_result, 'X');
        str_alternate := concat(str_alternate, 'X');
      end if;
      v_index := ch_index + 3;
    else
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      v_index       := ch_index + 2;
    end if;
    return v_index;
  end;
  -----------------------------------------------------------------------------------
  --DONE
  function handle_ch(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int is
  begin
    if (ch_index > 0 and substr(str_value, ch_index, 4) = 'CHAE') then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'X');
      return ch_index + 2;
    elsif (ch_condition_1(str_value, ch_index)) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    elsif (ch_condition_2(str_value, ch_index)) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    else
      if (ch_index > 1) then
        if (substr(str_value, 0, 2) = 'MC') then
          str_result := concat(str_result, 'K');
        else
          str_result    := concat(str_result, 'X'); --Alternate
          str_alternate := concat(str_alternate, 'K');
        end if;
      else
        str_result    := concat(str_result, 'X');
        str_alternate := concat(str_alternate, 'K');
      end if;
      return ch_index + 2;
    end if;
  end;
  -----------------------------------------------------------------------------------
  --DONE
  function handle_d(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in number) return int is
  begin
    if (substr(str_value, ch_index, 2) = 'DG') then
      if (substr(str_value, ch_index + 2, 1) = 'I' or
         substr(str_value, ch_index + 2, 1) = 'E' or
         substr(str_value, ch_index + 2, 1) = 'Y') then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'J');
        return ch_index + 3;
      else
        str_result    := concat(str_result, 'TK');
        str_alternate := concat(str_alternate, 'TK');
        return ch_index + 2;
      end if;
    elsif (substr(str_value, ch_index, 2) = 'DT' or
          substr(str_value, ch_index, 2) = 'DD') then
      str_result    := concat(str_result, 'T');
      str_alternate := concat(str_alternate, 'T');
      return ch_index + 2;
    else
      str_result    := concat(str_result, 'T');
      str_alternate := concat(str_alternate, 'T');
      return ch_index + 1;
    end if;
    return ch_index;
  end;

  function handle_g(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in number,
                    isslavogermanic in boolean) return int is
  
  begin
    if (char_at(str_value, ch_index + 1) = 'H') then
      return handle_gh(str_value, str_result, str_alternate, ch_index);
    elsif (char_at(str_value, ch_index + 1) = 'N') then
      if (ch_index = 2 and is_vowel(char_at(str_value, 1)) and
         isslavogermanic = false) then
        str_result    := concat(str_result, 'KN'); --Alternative N
        str_alternate := concat(str_alternate, 'N');
        return ch_index + 2;
      elsif (is_contain(substr(str_value, ch_index + 2, 2), 'EY') = false and
            char_at(str_value, ch_index + 1) <> 'Y' and
            isslavogermanic = false) then
        str_result    := concat(str_result, 'N');
        str_alternate := concat(str_alternate, 'KN');
        return ch_index + 2;
      else
        str_result := concat(str_result, 'KN');
        return ch_index + 2;
      end if;
    elsif is_contain(substr(str_value, ch_index + 1, 2), 'LI') and
          isslavogermanic = false then
      str_result    := concat(str_result, 'KL'); --alternative L
      str_alternate := concat(str_alternate, 'L');
      return ch_index + 2;
    elsif (ch_index = 1 and
          (char_at(str_value, ch_index + 1) = 'Y' or
          is_contain(substr(str_value, ch_index + 1, 2),
                       'ES,EP,EB,EL,EY,IB,IL,IN,IE,EI,ER'))) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    elsif (is_contain(substr(str_value, ch_index + 1, 2), 'ER') or
          char_at(str_value, ch_index + 1) = 'Y') and
          is_contain(substr(str_value, 1, 6), 'DANGER,RANGER,MANGER') =
          false and
          is_contain(substr(str_value, ch_index - 1, 1), 'E,I') = false and
          is_contain(substr(str_value, ch_index - 1, 3), 'RGY,OGY') = false then
      str_result    := concat(str_result, 'K'); --alternative J
      str_alternate := concat(str_alternate, 'J');
      return ch_index + 2;
    elsif (is_contain(substr(str_value, ch_index + 1, 1), 'E,I,Y') or
          is_contain(substr(str_value, ch_index - 1), 'AGGI,OGGI')) then
      if (is_contain(substr(str_value, 1, 4), 'VAN,VON') or
         is_contain(substr(str_value, 1, 3), 'SCH') or
         is_contain(substr(str_value, ch_index + 1, 3), 'IER')) then
        str_result    := concat(str_result, 'K');
        str_alternate := concat(str_alternate, 'K');
      elsif (is_contain(substr(str_value, ch_index + 1, 2), 'IER')) then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'J');
      else
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'K'); --alternative K
      end if;
      return ch_index + 2;
    elsif (char_at(str_value, ch_index + 1) = 'G') then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    else
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    end if;
  end;

  function handle_gh(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in number) return int is
  begin
    if (ch_index > 1 and
       is_vowel(substr(str_value, ch_index - 1, 1)) = false) then
      str_result    := concat(str_result, 'K');
      str_alternate := concat(str_alternate, 'K');
      return ch_index + 2;
    elsif (ch_index = 1) then
      if (substr(str_value, ch_index + 2, 1) = 'I') then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'J');
      else
        str_result    := concat(str_result, 'K');
        str_alternate := concat(str_alternate, 'K');
      end if;
      return ch_index + 2;
    elsif ((ch_index > 2 and
          is_contain(char_at(str_value, ch_index - 2), 'B,H,D')) or
          (ch_index > 3 and
          is_contain(char_at(str_value, ch_index - 3), 'B,H,D')) or
          (ch_index > 4 and
          (is_contain(char_at(str_value, ch_index - 4), 'B,H')))) then
      return ch_index + 2;
    else
      if (ch_index > 2 and substr(str_value, ch_index - 1, 1) = 'U' and
         (is_contain(char_at(str_value, ch_index - 3), 'C,G,L,R,T'))) then
        str_result    := concat(str_result, 'F');
        str_alternate := concat(str_alternate, 'F');
      elsif (ch_index > 0 and substr(str_value, ch_index - 1, 1) <> 'I') then
        str_result    := concat(str_result, 'K');
        str_alternate := concat(str_alternate, 'K');
      end if;
      return ch_index + 2;
    end if;
    return ch_index;
  end;
  ----------------------------------------------------------------------------------------------------
  function handle_h(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
  
  begin
  
    if ((ch_index = 1 or is_vowel(char_at(str_value, ch_index - 1))) and
       is_vowel(char_at(str_value, ch_index + 1))) then
      str_result    := concat(str_result, 'H');
      str_alternate := concat(str_alternate, 'H');
      return ch_index + 2;
    else
      return ch_index + 1;
    end if;
    return ch_index;
  end;
  -----------------------------------------------------------------------------------------
  function handle_j(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        int,
                    isslavogermanic boolean) return int is
  
  begin
  
    if (is_contain(substr(str_value, ch_index, 4), 'JOSE,SAN ')) then
      if ((ch_index = 1 and char_at(str_value, ch_index + 4) = ' ') or
         length(str_value) = 4 or
         is_contain(substr(str_value, 1, 4), 'SAN ')) then
        str_result := concat(str_result, 'H');
      else
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'H');
      end if;
      return ch_index + 1;
    else
      if (ch_index = 1 and substr(str_value, ch_index, 4) <> 'JOSE') then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'A');
      elsif (is_vowel(substr(str_value, ch_index - 1, 1)) and
            isslavogermanic and (substr(str_value, ch_index + 1, 1) = 'A' or
            substr(str_value, ch_index + 1, 1) = 'O')) then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'H');
      elsif (ch_index = length(str_value)) then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, ' '); --whitespace yeah
      elsif (instr('LTKSNMBZ', substr(str_value, ch_index + 1, 1)) = 0 and
            instr('SKL', substr(str_value, ch_index - 1, 1)) = 0) then
        str_result    := concat(str_result, 'J');
        str_alternate := concat(str_alternate, 'J');
      end if;
    
      if (char_at(str_value, ch_index + 1) = 'J') then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    
    end if;
  
  end;
  -----------------------------------------------------------------------------------------
  function handle_l(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
  begin
    if (char_at(str_value, ch_index + 1) = 'L') then
      if (l_condition_1(str_value, ch_index)) then
        str_alternate := concat(str_alternate, 'L');
      else
        str_result    := concat(str_result, 'L');
        str_alternate := concat(str_alternate, 'L');
      end if;
      return ch_index + 2;
    else
      str_result := concat(str_result, 'L');
      return ch_index + 1;
    end if;
  end;
  ------------------------------------------------------------------------------------------
  function handle_p(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
  begin
    if (char_at(str_value, ch_index + 1) = 'H') then
      str_result    := concat(str_result, 'F');
      str_alternate := concat(str_alternate, 'F');
      return ch_index + 2;
    else
      str_result    := concat(str_result, 'P');
      str_alternate := concat(str_alternate, 'P');
      if (is_contain(str_value, 'PB')) then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    end if;
  end;

  function handle_r(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in int,
                    isslavogermanic in boolean) return int is
  begin
    if ch_index = length(str_value) and isslavogermanic = false and
       substr(str_value, ch_index - 2, 2) = 'IE' and
       (substr(str_value, ch_index - 4, 2) = 'ME' or
       substr(str_value, ch_index - 4, 2) = 'MA') then
      str_alternate := concat(str_alternate, 'R');
    else
      str_result    := concat(str_result, 'R');
      str_alternate := concat(str_alternate, 'R');
    end if;
    if char_at(str_value, ch_index + 1) = 'R' then
      return ch_index + 2;
    else
      return ch_index + 1;
    end if;
  end;

  function handle_s(str_value       in varchar2,
                    str_result      in out varchar2,
                    str_alternate   in out varchar2,
                    ch_index        in int,
                    isslavogermanic in boolean) return int is
  
  begin
    if is_contain(substr(str_value, ch_index - 1, 3), 'ISL,YSL') then
      return ch_index + 1;
    elsif (ch_index = 1 and substr(str_value, ch_index, 5) = 'SUGAR') then
      str_result    := concat(str_result, 'X');
      str_alternate := concat(str_alternate, 'S'); --Alternative append select
      return ch_index + 1;
    elsif substr(str_value, ch_index, 2) = 'SH' then
      if (is_contain(substr(str_value, ch_index + 1, 4),
                     'HEIM,HOEK,HOLM,HOLZ')) then
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'S');
      else
        str_result    := concat(str_result, 'X');
        str_alternate := concat(str_alternate, 'S');
      end if;
      return ch_index + 2;
    elsif is_contain(substr(str_value, ch_index, 3), 'SIO,SIA') or
          is_contain(substr(str_value, ch_index, 4), 'SIAN') then
      if (isslavogermanic) then
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'S');
      else
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'X');
      end if;
      return ch_index + 3;
    elsif (ch_index = 0 and
          instr('MNLW', substr(str_value, ch_index + 1, 1)) > 0) or
          char_at(str_value, ch_index + 1) = 'Z' then
      str_result    := concat(str_result, 'S');
      str_alternate := concat(str_alternate, 'X'); --alternative X
      if (char_at(str_value, ch_index + 1) = 'Z') then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    elsif substr(str_value, ch_index, 2) = 'SC' then
      return handle_sc(str_value, str_result, str_alternate, ch_index);
    else
      if (ch_index = length(str_value) and
         is_contain(substr(str_value, ch_index - 2, 2), 'AI,IO')) then
        str_alternate := concat(str_alternate, 'S'); --alternavite append s
      else
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'S');
      end if;
      if (instr('SZ', substr(str_value, ch_index + 1, 1)) > 0) then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    
    end if;
    return ch_index;
  end;

  function handle_sc(str_value     in varchar2,
                     str_result    in out varchar2,
                     str_alternate in out varchar2,
                     ch_index      in int) return int is
  
  begin
    if (char_at(str_value, ch_index + 2) = 'H') then
      if is_contain(substr(str_value, ch_index + 3, 2), 'OO,ER,EN,UY,ED,EM') then
        if is_contain(substr(str_value, ch_index + 3, 2), 'ER,EN') then
          str_result    := concat(str_result, 'X'); --alternate SK
          str_alternate := concat(str_alternate, 'SK');
        else
          str_result    := concat(str_result, 'SK');
          str_alternate := concat(str_alternate, 'SK');
        end if;
      else
        if (ch_index = 0 and is_vowel(substr(str_value, 3, 1)) and
           char_at(str_value, 3) <> 'W') then
          str_result    := concat(str_result, 'X');
          str_alternate := concat(str_alternate, 'S'); --alternate S
        else
          str_result    := concat(str_result, 'X');
          str_alternate := concat(str_alternate, 'X'); --alternate S
        end if;
      end if;
    else
      if (instr('IEY', char_at(str_value, ch_index + 2)) > 0) then
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'S');
      else
        str_result    := concat(str_result, 'SK');
        str_alternate := concat(str_alternate, 'SK');
      end if;
    end if;
    return ch_index + 3;
  end;

  function handle_t(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
  
  begin
  
    if substr(str_value, ch_index, 4) = 'TION' then
      str_result    := concat(str_result, 'X');
      str_alternate := concat(str_alternate, 'X');
      return ch_index + 3;
    elsif (is_contain(substr(str_value, ch_index, 3), 'TIA,TCH')) --can be merged with upper if!
     then
      str_result    := concat(str_result, 'X');
      str_alternate := concat(str_alternate, 'X');
      return ch_index + 3;
    elsif substr(str_value, ch_index, 2) = 'TH' or
          substr(str_value, ch_index, 3) = 'TTH' then
      if is_contain(substr(str_value, ch_index + 2, 2), 'OM,AM') or
         is_contain(substr(str_value, 0, 4), 'VAN ,VON ') or
         substr(str_value, 0, 3) = 'SCH' then
        str_result    := concat(str_result, 'T');
        str_alternate := concat(str_alternate, 'T');
      else
        str_result    := concat(str_result, '0');
        str_alternate := concat(str_alternate, 'T'); -- alternative T
      end if;
      return ch_index + 2;
    else
      str_result    := concat(str_result, 'T');
      str_alternate := concat(str_alternate, 'T');
      if instr('TD', substr(str_value, ch_index + 1, 1)) > 0 then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    end if;
    return ch_index;
  end;

  function handle_w(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      in int) return int is
  
  begin
    if substr(str_value, ch_index, 2) = 'WR' then
      str_result    := concat(str_result, 'R');
      str_alternate := concat(str_alternate, 'R');
      return ch_index + 2;
    else
      if (ch_index = 1 and is_vowel(char_at(str_value, ch_index + 1))) or
         substr(str_value, ch_index, 2) = 'WH' then
        if (is_vowel(char_at(str_value, ch_index + 1))) then
          str_result    := concat(str_result, 'A'); ---alternative from
          str_alternate := concat(str_alternate, 'F');
        else
          str_result    := concat(str_result, 'A');
          str_alternate := concat(str_alternate, 'A');
        
        end if;
        return ch_index + 1;
      elsif (ch_index = length(str_value) and
            is_vowel(char_at(str_value, ch_index - 1))) or
            is_contain(substr(str_value, ch_index - 1, 5),
                       'WSKI,EWSKY,OWSKI,OWSKY') or
            substr(str_value, 0, 3) = 'SCH' then
        str_alternate := concat(str_alternate, 'F');
        return ch_index + 1;
      elsif is_contain(substr(str_value, ch_index, 4), 'WITZ,WICZ') then
        str_result    := concat(str_result, 'TS');
        str_alternate := concat(str_alternate, 'FX'); --append FX alternate
        return ch_index + 4;
      else
        return ch_index + 1;
      end if;
    end if;
    return ch_index;
  end;

  function handle_x(str_value     in varchar2,
                    str_result    in out varchar2,
                    str_alternate in out varchar2,
                    ch_index      int) return int is
  
  begin
    if ch_index = 1 then
      str_result    := concat(str_result, 'S');
      str_alternate := concat(str_alternate, 'S');
      return ch_index + 1;
    else
      if (ch_index <> length(str_value) and
         is_contain(substr(str_value, ch_index - 3, 3), 'IAU,EAU')) or
         is_contain(substr(str_value, ch_index - 2, 2), 'AU,OU') then
        str_result    := concat(str_result, 'KS');
        str_alternate := concat(str_alternate, 'KS');
      end if;
      if (instr('CX', substr(str_value, ch_index + 1, 1)) > 0) then
        return ch_index + 2;
      else
        return ch_index + 1;
      end if;
    end if;
  end;

  function handle_z(str_value         in varchar2,
                    str_result        in out varchar2,
                    str_alternate     in out varchar2,
                    ch_index          int,
                    is_slavo_germanic in boolean) return int is
  
    v_new_index int;
  begin
    if (char_at(str_value, ch_index + 1) = 'H') then
      str_result    := concat(str_result, 'J');
      str_alternate := concat(str_alternate, 'J');
      v_new_index   := ch_index + 2;
    else
      if is_contain(substr(str_value, ch_index + 1, 2), 'ZI,ZA,ZO') or
         (is_slavo_germanic and char_at(str_value, ch_index - 1) <> 'T') then
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'TS'); --alternate TS
      else
        str_result    := concat(str_result, 'S');
        str_alternate := concat(str_alternate, 'S');
      end if;
      if (char_at(str_value, ch_index + 1) = 'Z') then
        v_new_index := ch_index + 2;
      else
        v_new_index := ch_index + 1;
      end if;
    end if;
    return v_new_index;
  end;
  ------------------------------BOOLEAN_CHECKS-------------------------------------------

  /* Word that contains W, WITZ, CZ, K are slavo germanic words */
  function is_slavo_germanic(str_value in varchar2) return boolean is
  begin
    if (instr(str_value, 'W') > 0) or (instr(str_value, 'CZ') > 0) or
       (instr(str_value, 'K') > 0) then
      return true;
    else
      return false;
    end if;
  end;
  --------------------------------------------------------------------------------------
  /* word that starts with GN, KN, PN, PS or WR are starts with silent*/
  function is_silent_start(str_value in varchar2) return boolean is
  begin
    if (is_contain(substr(str_value, 1, 2), 'GN,KN,PN,PS,WR')) then
      return true;
    else
      return false;
    end if;
  end;
  ---------------------------------------------------------------------------------------
  function is_vowel(ch in varchar2) return boolean is
    v_vowels varchar(10) := 'AEIOUY';
    wrong_value_exception exception;
    pragma exception_init(wrong_value_exception, -60);
  begin
    if (length(ch) > 1) then
      raise wrong_value_exception;
    end if;
    if (instr(v_vowels, ch) > 0) then
      return true;
    else
      return false;
    end if;
  end;
  -------------------------------LETTER_CONDITIONS_START------------------------------------

  function c_condition_1(str_value in varchar2, ch_index in int)
    return boolean is
  begin
    if (substr(str_value, ch_index, 4) = 'CHIA') then
      return true;
    elsif (ch_index <= 2) then
      return false;
    elsif (is_vowel(char_at(str_value, ch_index - 2))) then
      return false;
    elsif is_contain(substr(str_value, ch_index - 1, 3), 'ACH') = false then
      return false;
    else
      if (char_at(str_value, ch_index + 2) <> 'I' and
         char_at(str_value, ch_index + 2) <> 'E') or
         is_contain(substr(str_value, ch_index - 2, 6), 'BACHER,MACHER') then
        return true;
      else
        return false;
      end if;
    end if;
  end;
  ---------------------------------------------------------------------------------
  function ch_condition_1(str_value in varchar2, ch_index in number)
    return boolean is
  begin
    if (ch_index <> 1) then
      return false;
    elsif (is_contain(substr(str_value, ch_index + 1, 5), 'HARAC,HARIS') != true) and
          (is_contain(substr(str_value, ch_index + 1, 3), 'HOR,HYM,HIA,HEM') != true) then
      return false;
    elsif substr(str_value, 0, 5) = 'CHORE' then
      return false;
    else
      return true;
    end if;
  end;
  ---------------------------------------------------------------------------------
  --DONE

  function ch_condition_2(str_value in varchar2, ch_index in number)
    return boolean is
  begin
    if is_contain(substr(str_value, 1, 4), 'VAN ,VON ') or
       (substr(str_value, 1, 3) = 'SCH') or
       is_contain(substr(str_value, ch_index - 2, 6),
                  'ORCHES,ARCHIT,ORCHID') or
       is_contain(substr(str_value, ch_index + 2, 1), 'T,S') or
       ((is_contain(substr(str_value, ch_index - 1, 1), 'A,O,U,E') or
        ch_index = 0) and (is_contain(substr(str_value, ch_index + 2, 1),
                                      'L,R,N,M,B,H,F,V,W, ') or
        ch_index + 1 = length(str_value))) then
      return true;
    else
      return false;
    end if;
  end;
  ---------------------------------------------------------------------------------
  function l_condition_1(str_value in varchar2, ch_index in number)
    return boolean is
  begin
    if ch_index = length(str_value) - 3 and
       is_contain(substr(str_value, ch_index - 1, 4), 'ILLO,ILLA,ALLE') then
      return true;
    elsif ((is_contain(substr(str_value, ch_index - 2, 2), 'AO,OS') or
          is_contain(substr(str_value, ch_index - 1, 1), 'A,O')) and
          (substr(str_value, ch_index - 1, 4) = 'ALLE')) then
      return true;
    else
      return false;
    end if;
  end;
  ---------------------------------------------------------------------------------

  function m_condition_1(str_value in varchar2, ch_index in number)
    return boolean is
  begin
    if (char_at(str_value, ch_index + 1) = 'M') then
      return true;
    elsif (substr(str_value, ch_index - 1, 3) = 'UMB') and
          ((ch_index + 1 = length(str_value) - 1) or
          (substr(str_value, ch_index + 2, 2) = 'ER')) then
      return true;
    else
      return false;
    end if;
  end;
  -----------------------------------HELPERS----------------------------------------------------

  function char_at(str in varchar2, index_of_ch in number) return varchar2 is
  begin
    return substr(str, index_of_ch, 1);
  end;
  ---------------------------------------------------------------------------------------
  function split_2_table(str_target in varchar2)
    return apex_application_global.vc_arr2 is
    v_array apex_application_global.vc_arr2;
    null_exception exception;
    pragma exception_init(null_exception, -60);
  begin
    --to avoid null values
    if (str_target is null) then
      raise null_exception;
    end if;
    v_array := apex_util.string_to_table(str_target, ',');
    return v_array;
  end;
  ------------------------------------------------------------------------------------------
  function trim_and_upper(str_value in varchar2) return varchar2 is
  begin
    return upper(trim(str_value));
  end;
  --------------------------This is core function!------------------------------------------
  function is_contain(str_target in varchar2, str_search in varchar2)
    return boolean is
    v_array apex_application_global.vc_arr2;
    null_exception exception;
    pragma exception_init(null_exception, -60);
  begin
    --to avoid null values
    if (str_target is null or str_search is null) then
      return false;
    end if;
  
    v_array := split_2_table(str_search);
  
    for i in 1 .. v_array.count loop
      if (instr(str_target, v_array(i)) > 0) then
        return true;
      end if;
    end loop;
    return false;
  end;
end p_double_metaphone;
/
