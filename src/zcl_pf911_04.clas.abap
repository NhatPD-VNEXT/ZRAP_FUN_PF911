************************************************************************
*  [変更履歴]                                                          *
*   バージョン情報 ：V1.00  2025/01/22  NTZ WIND            NWFK900068 *
*   変更内容       ：新規作成                                          *
*----------------------------------------------------------------------*
*   バージョン情報 ：V9.99  YYYY/MM/DD  変更者             移送番号    *
*   変更内容       ：                                                  *
************************************************************************
************************************************************************
* [Change History]                                                     *
* Version Information: V1.00 2025/01/22  NTZ WIND           NWFK900068 *
* Change Details: Newly created                                        *
*----------------------------------------------------------------------*
* Version Information: V9.99 YYYY/MM/DD <Modifier>         <Tr.Number> *
* Change Details:                                                      *
************************************************************************
CLASS zcl_pf911_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PF911_04 IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
*    LOOP AT it_original_data ASSIGNING FIELD-SYMBOL(<lf_sorg>).
*      DATA(ldf_index) = sy-tabix.
*      READ  TABLE ct_calculated_data INDEX ldf_index ASSIGNING FIELD-SYMBOL(<lf_calc>).
*      ASSIGN COMPONENT 'PRODUCT' OF STRUCTURE <lf_sorg> TO FIELD-SYMBOL(<lf_product>).
*      ASSIGN COMPONENT 'HIDEKEYFIELD' OF STRUCTURE <lf_calc> TO FIELD-SYMBOL(<lf_hidekeyfield>).
*      IF <lf_product> IS ASSIGNED AND <lf_hidekeyfield> IS ASSIGNED.
*        IF NOT <lf_product> IS INITIAL.
*          <lf_hidekeyfield> = abap_true.
*        ENDIF.
*      ENDIF.
*
*    ENDLOOP.
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
*    et_requested_orig_elements = VALUE #( ( |PRODUCT| ) ).
  ENDMETHOD.
ENDCLASS.
