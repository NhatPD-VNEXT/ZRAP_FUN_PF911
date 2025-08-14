*CLASS lsc_zi_pf911_01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
*
*  PROTECTED SECTION.
*
*    METHODS adjust_numbers REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_zi_pf911_01 IMPLEMENTATION.
*
*  METHOD adjust_numbers.
*    READ ENTITIES OF zi_pf911_01 IN LOCAL MODE
*          ENTITY zi_pf911_01
*          ALL FIELDS
*          WITH VALUE #( FOR <structure> IN mapped-zi_pf911_01 (
*                        %pky = VALUE #( %pid                  = <structure>-%pid
*                                        product               = <structure>-%tmp-product
*                                        plant                 = <structure>-%tmp-plant
*                                        subcontractor         = <structure>-%tmp-subcontractor
*                                        ) ) )
*          RESULT DATA(lt_hdr)
*          FAILED DATA(ls_hfailed).
*    LOOP AT mapped-zi_pf911_01 ASSIGNING FIELD-SYMBOL(<fs_phdr>).
*      READ TABLE lt_hdr INTO DATA(lw_hdr)
*                        WITH KEY %pid                  = <fs_phdr>-%pid
*                                 product               = <fs_phdr>-%tmp-product
*                                 plant                 = <fs_phdr>-%tmp-plant
*                                 subcontractor         = <fs_phdr>-%tmp-subcontractor.
*      IF sy-subrc = 0.
*        <fs_phdr>-product               = lw_hdr-productforedit.
*        <fs_phdr>-plant                 = lw_hdr-plantforedit.
*        <fs_phdr>-subcontractor         = lw_hdr-subcontractorforedit.
*      ENDIF.
*    ENDLOOP.
*  ENDMETHOD.
*
*ENDCLASS.

CLASS lhc_zi_pf911_01 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_pf911_01 RESULT result.

    METHODS vldbeforesave FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_pf911_01~vldbeforesave.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_pf911_01 RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zi_pf911_01 RESULT result.
    METHODS m_determ_create FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_pf911_01~m_determ_create.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zi_pf911_01.

ENDCLASS.

CLASS lhc_zi_pf911_01 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD vldbeforesave.

**  DATA Declaration
*    DATA: gds_rep  LIKE LINE OF reported-zi_pf911_01,
*          gds_fail LIKE LINE OF failed-zi_pf911_01.
*
*    TYPES : BEGIN OF gts_out   .
*    TYPES : status TYPE c LENGTH 1,
*            mess   TYPE c LENGTH 200,
*            id     TYPE sy-msgid,
*            number TYPE sy-msgno,
*            v1     TYPE sy-msgv1,
*            v2     TYPE sy-msgv2,
*            END OF gts_out .
*    DATA: gds_udata TYPE zp91101t,
*          gds_out   TYPE gts_out.
*    DATA(lo_ckvar) = NEW zcl_pf911_01( ).
*    READ ENTITIES OF zi_pf911_01 IN LOCAL MODE
*     ENTITY zi_pf911_01
*     ALL FIELDS
*     WITH CORRESPONDING #( keys )
*     RESULT DATA(gdt_pf911).
*
*    IF NOT gdt_pf911 IS INITIAL .
*      LOOP AT gdt_pf911 INTO DATA(lds_pf911) .
*
**-< ADD V1.01 (S) >-*
** Check Duplicate record
*        IF lds_pf911-product IS INITIAL.
*          SELECT SINGLE FROM zp91101t AS b
*            FIELDS b~product,
*                   b~plant,
*                   b~subcontractor
*            WHERE b~product       EQ @lds_pf911-productforedit
*              AND b~plant         EQ @lds_pf911-plantforedit
*              AND b~subcontractor EQ @lds_pf911-subcontractorforedit
*            INTO @DATA(lds_zp91101).
*
*          IF sy-subrc EQ '0'.
*            CLEAR gds_rep.
*            gds_rep-%tky = lds_pf911-%tky.
*            gds_rep-%msg = new_message( severity = if_abap_behv_message=>severity-error
*                                            id       = 'ZRAP_COM_99'
*                                            number   = '055'
*                                            v1       = |{ lds_zp91101-product } / { lds_zp91101-plant } / { lds_zp91101-subcontractor ALPHA = OUT }|
*                                            ).
*            APPEND gds_rep TO reported-zi_pf911_01.
*
*            CLEAR gds_fail.
*            MOVE-CORRESPONDING gds_rep TO gds_fail.
*            APPEND gds_fail TO failed-zi_pf911_01.
*            EXIT.
*          ENDIF.
*        ENDIF.
**-< ADD V1.01 (E) >-*
*
*        MOVE-CORRESPONDING lds_pf911 TO gds_udata .
*        gds_udata-inspection_index_code = lds_pf911-inspectionindexcode.
*        gds_udata-product               = lds_pf911-productforedit.
*        gds_udata-plant                 = lds_pf911-plantforedit.
*        gds_udata-subcontractor         = lds_pf911-subcontractorforedit.
*        lo_ckvar->check_validate( EXPORTING is_input = gds_udata IMPORTING es_output =  gds_out ).
*        IF  gds_out-status = 'E'.
*          CLEAR gds_rep.
*          gds_rep-%tky = lds_pf911-%tky.
*          gds_rep-%msg = new_message( severity = if_abap_behv_message=>severity-error
*                                          id       = gds_out-id
*                                          number   = gds_out-number
*                                          v1       = gds_out-v1
*                                          v2       = gds_out-v2
*                                          ).
*          APPEND gds_rep TO reported-zi_pf911_01.
*
*          CLEAR gds_fail.
*          MOVE-CORRESPONDING gds_rep TO gds_fail.
*          APPEND gds_fail TO failed-zi_pf911_01.
*        ENDIF .
*      ENDLOOP.
*    ENDIF.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
*    IF NOT result IS INITIAL .
*      DELETE FROM zp91101t_d WHERE product NE ''.
*      DELETE FROM zp91101t WHERE product NE ''.
*    ELSE.
*      DELETE FROM zp91101t_d WHERE product NE ''.
*      DELETE FROM zp91101t WHERE product NE ''.
*    ENDIF.

    DATA: lds_result LIKE LINE OF result.

    READ ENTITIES OF zi_pf911_01 IN LOCAL MODE
      ENTITY zi_pf911_01
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(ldt_pf911).

    LOOP AT ldt_pf911 INTO DATA(lds_pf911).
      CLEAR lds_result.

      MOVE-CORRESPONDING lds_pf911 TO lds_result.
      IF NOT lds_pf911-product IS INITIAL.
        lds_result-%field-productforedit                = if_abap_behv=>fc-f-read_only.
        lds_result-%field-plantforedit                  = if_abap_behv=>fc-f-read_only.
        lds_result-%field-subcontractorforedit          = if_abap_behv=>fc-f-read_only.
      ELSE.
        lds_result-%field-productforedit                = if_abap_behv=>fc-f-mandatory.
        lds_result-%field-plantforedit                  = if_abap_behv=>fc-f-mandatory.
        lds_result-%field-subcontractorforedit          = if_abap_behv=>fc-f-mandatory.
      ENDIF.

      APPEND lds_result TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD m_determ_create.
    READ ENTITIES OF zi_pf911_01 IN LOCAL MODE
     ENTITY zi_pf911_01
     ALL FIELDS
     WITH CORRESPONDING #( keys )
     RESULT DATA(gdt_pf911).

    LOOP AT gdt_pf911 INTO DATA(lds_pf911).

      SELECT SINGLE FROM i_product WITH PRIVILEGED ACCESS
      FIELDS product ,
             baseunit
      WHERE product EQ @lds_pf911-productforedit
      INTO @DATA(lds_product).

*-< ADD V1.01 (S) >-*
      SELECT SINGLE FROM i_unitofmeasure
                FIELDS unitofmeasure_e
                WHERE unitofmeasure = @lds_product-baseunit
                INTO @DATA(ldf_unitofmeasure_e).
*-< ADD V1.01 (S) >-*

*-< ADD V1.01 (S) >-*
      IF lds_pf911-baseunit IS INITIAL.
*-< ADD V1.01 (E) >-*
        MODIFY ENTITIES OF zi_pf911_01 IN LOCAL MODE
        ENTITY zi_pf911_01
*-< ADD V1.01 (S) >-*
*        UPDATE FIELDS ( baseunit samplequantityunit )
        UPDATE FIELDS ( baseunit )
*-< ADD V1.01 (E) >-*
        WITH VALUE #( ( %tky = lds_pf911-%tky
                        baseunit = lds_product-baseunit
*-< DEL V1.01 (S) >-*
*                      samplequantityunit = lds_product-baseunit
*-< DEL V1.01 (E) >-*
         ) ).
*-< ADD V1.01 (S) >-*
      ENDIF.
*-< ADD V1.01 (E) >-*

*-< ADD V1.01 (S) >-*
      IF lds_pf911-samplequantityunit IS INITIAL.
        MODIFY ENTITIES OF zi_pf911_01 IN LOCAL MODE
        ENTITY zi_pf911_01
        UPDATE FIELDS ( samplequantityunit )
        WITH VALUE #( ( %tky = lds_pf911-%tky
                      samplequantityunit = ldf_unitofmeasure_e
         ) ).
      ENDIF.
*-< ADD V1.01 (E) >-*

    ENDLOOP.
  ENDMETHOD.

  METHOD earlynumbering_create.
    LOOP AT entities INTO DATA(ls_entity).
      APPEND VALUE #(
        %cid  = ls_entity-%cid
        Plant = '1510'        "Default value cho key Plant
      ) TO mapped-zi_pf911_01.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
