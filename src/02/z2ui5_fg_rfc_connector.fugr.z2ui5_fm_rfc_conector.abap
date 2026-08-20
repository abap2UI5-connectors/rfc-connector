FUNCTION z2ui5_fm_rfc_conector.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_REQ) TYPE  Z2UI5_S_HTTP_REQ
*"     VALUE(IS_CONFIG) TYPE  Z2UI5_S_HTTP_CONFIG
*"  EXPORTING
*"     VALUE(ES_RES) TYPE  Z2UI5_S_HTTP_RES
*"----------------------------------------------------------------------

* IS_CONFIG is reserved: the framework reads its HTTP configuration from the
* user exit of the system the apps run on - this one - so there is nothing to
* inject from the consumer side. It stays in the interface because removing a
* parameter from an RFC-enabled function module breaks every consumer system
* that still runs the previous version.

* _main( ) never raises - it turns any exception into a 500 whose body carries
* the reason - so ES_RES always describes the response, status included. The
* consumer only forwards it.
  DATA(ls_res) = z2ui5_cl_ui5_http_handler=>_main( CORRESPONDING #( is_req ) ).

  es_res = CORRESPONDING #( ls_res ).

ENDFUNCTION.
