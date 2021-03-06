require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PLDAPSearch; //Alias
  typedef struct WINAPI_LDAP_s {
    UINT_PTR sb_sd;
    UCHAR Reserved1[41];
    ULONG_PTR sb_naddr;
    UCHAR Reserved2[24];
  } WINAPI_LDAP_s;
  typedef struct LDAP {
    WINAPI_LDAP_s ld_sb;
    PCHAR ld_host;
    ULONG ld_version;
    UCHAR ld_lberoptions;
    ULONG ld_deref;
    ULONG ld_timelimit;
    ULONG ld_sizelimit;
    ULONG ld_errno;
    PCHAR ld_matched;
    PCHAR ld_error;
    ULONG ld_msgid;
    UCHAR Reserved3[25];
    ULONG ld_cldaptries;
    ULONG ld_cldaptimeout;
    ULONG ld_refhoplimit;
    ULONG ld_options;
  } LDAP;
  typedef LDAP *PLDAP; //Pointer
  typedef struct LDAPMessage {
    ULONG lm_msgid;
    ULONG lm_msgtype;
    PVOID lm_ber;
    LPVOID lm_chain;
    LPVOID lm_next;
    ULONG lm_time;
    PLDAP Connection;
    PVOID Request;
    ULONG lm_returncode;
    USHORT lm_referral;
    BOOLEAN lm_chased;
    BOOLEAN lm_eom;
    BOOLEAN ConnectionReferenced;
  } LDAPMessage;
  typedef LDAPMessage *PLDAPMessage; //Pointer
  typedef struct berval {
    ULONG bv_len;
    PCHAR bv_val;
  } berval;
  typedef berval struct berval; //Alias
  typedef berval BERVAL; //Pointer
  typedef berval BERVAL; //Pointer
  typedef berval *PBERVAL; //Pointer
  typedef struct LDAPControl {
    PTCHAR ldctl_oid;
    struct berval ldctl_value;
    BOOLEAN ldctl_iscritical;
  } LDAPControl;
  typedef LDAPControl *PLDAPControl; //Pointer
  typedef LDAPControl** PLDAPControl*; //Pointer
  typedef struct LDAP_TIMEVAL {
    LONG tv_sec;
    LONG tv_usec;
  } LDAP_TIMEVAL;
  typedef LDAP_TIMEVAL struct l_timeval; //Alias
  typedef struct LDAPSortKey {
    PTCHAR sk_attrtype;
    PTCHAR sk_matchruleoid;
    BOOLEAN sk_reverseorder;
  } LDAPSortKey;
  typedef LDAPSortKey *PLDAPSortKey; //Pointer
  typedef struct LDAPVLVInfo {
    int ldvlv_version;
    ULONG ldvlv_before_count;
    ULONG ldvlv_after_count;
    ULONG ldvlv_offset;
    ULONG ldvlv_count;
    PBERVAL ldvlv_attrvalue;
    PBERVAL ldvlv_context;
    VOID* ldvlv_extradata;
  } LDAPVLVInfo;
  typedef struct BerElement {
    PCHAR opaque;
  } BerElement;
  LDAP*           cldap_open(                 PCHAR HostName, ULONG PortNumber);
  LDAP*           cldap_open(                 PTCHAR HostName, ULONG PortNumber);
  LDAP*           ldap_open(                  PCHAR HostName, ULONG PortNumber);
  LDAP*           ldap_open(                  PTCHAR HostName, ULONG PortNumber);
  ULONG           ldap_bind(                  LDAP* ld, PCHAR dn, PCHAR cred, ULONG method);
  ULONG           ldap_bind(                  LDAP* ld, PTCHAR dn, PTCHAR cred, ULONG method);
  ULONG           ldap_bind_s(                LDAP* ld, PCHAR dn, PCHAR cred, ULONG method);
  ULONG           ldap_bind_s(                LDAP* ld, PTCHAR dn, PTCHAR cred, ULONG method);
  ULONG           ldap_simple_bind(           LDAP* ld, PCHAR dn, PCHAR passwd);
  ULONG           ldap_simple_bind(           LDAP* ld, PTCHAR dn, PTCHAR passwd);
  ULONG           ldap_simple_bind_s(         LDAP* ld, PCHAR dn, PCHAR passwd);
  ULONG           ldap_simple_bind_s(         LDAP* ld, PTCHAR dn, PTCHAR passwd);
  ULONG           ldap_sasl_bind(             LDAP* ExternalHandle, const PCHAR DistName, const PCHAR AuthMechanism, const BERVAL* cred, PLDAPControl* ServerCtrls, PLDAPControl* ClientCtrls, int* MessageNumber);
  ULONG           ldap_sasl_bind_s(           LDAP* ExternalHandle, const PCHAR DistName, const PCHAR AuthMechanism, const BERVAL* cred, PLDAPControl* ServerCtrls, PLDAPControl* ClientCtrls, PBERVAL* ServerData);
  ULONG           ldap_connect(               LDAP* ld, LDAP_TIMEVAL* timeout);
  LDAP*           ldap_init(                  PCHAR HostName, ULONG PortNumber);
  LDAP*           ldap_init(                  PTCHAR HostName, ULONG PortNumber);
  LDAP*           ldap_sslinit(               PCHAR HostName, ULONG PortNumber, int secure);
  LDAP*           ldap_sslinit(               PTCHAR HostName, ULONG PortNumber, int secure);
  ULONG           ldap_get_option(            LDAP* ld, int option, void* outvalue);
  ULONG           ldap_get_option(            LDAP* ld, int option, void* outvalue);
  ULONG           ldap_set_option(            LDAP* ld, int option, void* invalue);
  ULONG           ldap_set_option(            LDAP* ld, int option, void* invalue);
  ULONG           ldap_abandon(               LDAP* ld, ULONG msgid);
  ULONG           ldap_unbind(                LDAP* ld);
  ULONG           ldap_unbind_s(              LDAP* ld);
  ULONG           ldap_add(                   LDAP* ld, PCHAR dn);
  ULONG           ldap_add(                   LDAP* ld, PTCHAR dn);
  ULONG           ldap_add_ext(               LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_add_ext(               LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_add_s(                 LDAP* ld, PCHAR dn);
  ULONG           ldap_add_s(                 LDAP* ld, PTCHAR dn);
  ULONG           ldap_add_ext_s(             LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_add_ext_s(             LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_compare(               LDAP* ld, PCHAR dn, PCHAR attr, PCHAR value);
  ULONG           ldap_compare(               LDAP* ld, PTCHAR dn, PTCHAR attr, PTCHAR value);
  ULONG           ldap_compare_ext(           LDAP* ld, PCHAR dn, PCHAR Attr, PCHAR Value, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_compare_ext(           LDAP* ld, PTCHAR dn, PTCHAR Attr, PTCHAR Value, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_compare_s(             LDAP* ld, PCHAR dn, PCHAR attr, PCHAR value);
  ULONG           ldap_compare_s(             LDAP* ld, PTCHAR dn, PTCHAR attr, PTCHAR value);
  ULONG           ldap_compare_ext_s(         LDAP* ld, PCHAR dn, PCHAR Attr, PCHAR Value, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_compare_ext_s(         LDAP* ld, PTCHAR dn, PTCHAR Attr, PTCHAR Value, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_delete(                LDAP* ld, PCHAR dn);
  ULONG           ldap_delete(                LDAP* ld, PTCHAR dn);
  ULONG           ldap_delete_ext(            LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_delete_ext(            LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_delete_s(              LDAP* ld, PCHAR dn);
  ULONG           ldap_delete_s(              LDAP* ld, PTCHAR dn);
  ULONG           ldap_delete_ext_s(          LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_delete_ext_s(          LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_extended_operation_s(  LDAP* ld, PCHAR Oid, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls, PCHAR* ReturnedOid, struct berval** ReturnedData);
  ULONG           ldap_extended_operation(    LDAP* ld, PCHAR Oid, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_extended_operation(    LDAP* ld, PTCHAR Oid, struct berval* Data, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_close_extended_op(     LDAP* ld, ULONG MessageNumber);
  ULONG           ldap_modify(                LDAP* ld, PCHAR dn);
  ULONG           ldap_modify(                LDAP* ld, PTCHAR dn);
  ULONG           ldap_modify_ext(            LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_modify_ext(            LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_modify_s(              LDAP* ld, PCHAR dn);
  ULONG           ldap_modify_s(              LDAP* ld, PTCHAR dn);
  ULONG           ldap_modify_ext_s(          LDAP* ld, PCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_modify_ext_s(          LDAP* ld, PTCHAR dn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_check_filter(          LDAP* ld, PWCHAR SearchFilter);
  ULONG           ldap_count_entries(         LDAP* ld, LDAPMessage* res);
  ULONG           ldap_count_references(      LDAP* ld, LDAPMessage* res);
  ULONG           ldap_count_values(          PCHAR* vals);
  ULONG           ldap_count_values(          PTCHAR* vals);
  ULONG           ldap_count_values_len(      struct berval** vals);
  ULONG           ldap_create_page_control(   PLDAP ExternalHandle, ULONG PageSize, struct berval* Cookie, UCHAR IsCritical, PLDAPControl* Control);
  ULONG           ldap_create_page_control(   PLDAP ExternalHandle, ULONG PageSize, struct berval* Cookie, UCHAR IsCritical, PLDAPControl* Control);
  ULONG           ldap_create_sort_control(   PLDAP ExternalHandle, PLDAPSortKey* SortKeys, UCHAR IsCritical, PLDAPControl* Control);
  ULONG           ldap_create_sort_control(   PLDAP ExternalHandle, PLDAPSortKey* SortKeys, UCHAR IsCritical, PLDAPControl* Control);
  INT             ldap_create_vlv_control(    LDAP* ld, LDAPVLVInfo* Vlvinfop, char IsCritical, LDAPControl** ctrlp);
  ULONG           ldap_encode_sort_control(   PLDAP ExternalHandle, PLDAPSortKey* SortKeys, PLDAPControl Control, BOOLEAN IsCritical);
  ULONG           ldap_escape_filter_element( PCHAR sourceFilterElement, ULONG sourceLength, PCHAR destFilterElement, ULONG destLength);
  ULONG           ldap_escape_filter_element( PTCHAR sourceFilterElement, ULONG sourceLength, PCHAR destFilterElement, ULONG destLength);
  PCHAR           ldap_first_attribute(       LDAP* ld, LDAPMessage* entry, BerElement** ptr);
  PTCHAR          ldap_first_attribute(       LDAP* ld, LDAPMessage* entry, BerElement** ptr);
  PCHAR           ldap_next_attribute(        LDAP* ld, LDAPMessage* entry, BerElement* ptr);
  PTCHAR          ldap_next_attribute(        LDAP* ld, LDAPMessage* entry, BerElement* ptr);
  LDAPMessage*    ldap_first_entry(           LDAP* ld, LDAPMessage* res);
  LDAPMessage*    ldap_next_entry(            LDAP* ld, LDAPMessage* entry);
  LDAPMessage*    ldap_first_reference(       LDAP* ld, LDAPMessage* res);
  LDAPMessage*    ldap_next_reference(        LDAP* ld, LDAPMessage* entry);
  ULONG           ldap_get_next_page(         PLDAP ExternalHandle, PLDAPSearch SearchHandle, ULONG PageSize, ULONG* MessageNumber);
  ULONG           ldap_get_next_page_s(       PLDAP ExternalHandle, PLDAPSearch SearchHandle, struct l_timeval* timeout, ULONG PageSize, ULONG* TotalCount, LDAPMessage** Results);
  ULONG           ldap_get_paged_count(       PLDAP ExternalHandle, PLDAPSearch SearchBlock, ULONG* TotalCount, PLDAPMessage Results);
  PCHAR*          ldap_get_values(            LDAP* ld, LDAPMessage* entry, PCHAR attr);
  PTCHAR*         ldap_get_values(            LDAP* ld, LDAPMessage* entry, PTCHAR attr);
  struct berval** ldap_get_values_len(        LDAP* ExternalHandle, LDAPMessage* Message, PCHAR attr);
  struct berval** ldap_get_values_len(        LDAP* ExternalHandle, LDAPMessage* Message, PTCHAR attr);
  ULONG           ldap_parse_extended_result( LDAP* Connection, LDAPMessage* ResultMessage, PCHAR* ResultOID, struct berval** ResultData, BOOLEAN Freeit);
  ULONG           ldap_parse_page_control(    PLDAP ExternalHandle, PLDAPControl* ServerControls, ULONG* TotalCount, struct berval** Cookie);
  ULONG           ldap_parse_page_control(    PLDAP ExternalHandle, PLDAPControl* ServerControls, ULONG* TotalCount, struct berval** Cookie);
  ULONG           ldap_parse_reference(       LDAP* Connection, LDAPMessage* ResultMessage, PCHAR** Referrals);
  ULONG           ldap_parse_reference(       LDAP* Connection, LDAPMessage* ResultMessage, PTCHAR** Referrals);
  ULONG           ldap_parse_result(          LDAP* Connection, LDAPMessage* ResultMessage, ULONG* ReturnCode, PCHAR* MatchedDNs, PCHAR* ErrorMessage, PCHAR** Referrals, PLDAPControl** ServerControls, BOOLEAN Freeit);
  ULONG           ldap_parse_result(          LDAP* Connection, LDAPMessage* ResultMessage, ULONG* ReturnCode, PTCHAR* MatchedDNs, PTCHAR* ErrorMessage, PTCHAR** Referrals, PLDAPControl** ServerControls, BOOLEAN Freeit);
  ULONG           ldap_parse_sort_control(    PLDAP ExternalHandle, PLDAPControl* Control, ULONG* Result, PCHAR* Attribute);
  ULONG           ldap_parse_sort_control(    PLDAP ExternalHandle, PLDAPControl* Control, ULONG* Result, PTCHAR* Attribute);
  int             ldap_parse_vlv_control(     LDAP* ld, LDAPControl** ctrls, unsigned long* target_posp, unsigned long* list_countp, struct berval** contextp, int* errcodep);
  ULONG           ldap_result(                LDAP* ld, ULONG msgid, ULONG all, struct l_timeval* timeout, LDAPMessage** res);
  ULONG           ldap_search(                LDAP* ld, PCHAR base, ULONG scope, PCHAR filter, ULONG attrsonly);
  ULONG           ldap_search(                LDAP* ld, PTCHAR base, ULONG scope, PTCHAR filter, ULONG attrsonly);
  ULONG           ldap_search_s(              LDAP* ld, PCHAR base, ULONG scope, PCHAR filter, ULONG attrsonly, LDAPMessage** res);
  ULONG           ldap_search_s(              LDAP* ld, PTCHAR base, ULONG scope, PTCHAR filter, ULONG attrsonly, LDAPMessage** res);
  ULONG           ldap_search_st(             LDAP* ld, PCHAR base, ULONG scope, PCHAR filter, ULONG attrsonly, struct l_timeval* timeout, LDAPMessage** res);
  ULONG           ldap_search_st(             LDAP* ld, PTCHAR base, ULONG scope, PTCHAR filter, ULONG attrsonly, struct l_timeval* timeout, LDAPMessage** res);
  ULONG           ldap_search_ext(            LDAP* ld, PCHAR base, ULONG scope, PCHAR filter, ULONG attrsonly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG TimeLimit, ULONG SizeLimit, ULONG* MessageNumber);
  ULONG           ldap_search_ext(            LDAP* ld, PTCHAR base, ULONG scope, PTCHAR filter, ULONG attrsonly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG TimeLimit, ULONG SizeLimit, ULONG* MessageNumber);
  ULONG           ldap_search_ext_s(          LDAP* ld, PCHAR base, ULONG scope, PCHAR filter, ULONG attrsonly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, struct l_timeval* timeout, ULONG SizeLimit, LDAPMessage** res);
  ULONG           ldap_search_ext_s(          LDAP* ld, PTCHAR base, ULONG scope, PTCHAR filter, ULONG attrsonly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, struct l_timeval* timeout, ULONG SizeLimit, LDAPMessage** res);
  PLDAPSearch     ldap_search_init_page(      PLDAP ExternalHandle, PCHAR DistinguishedName, ULONG ScopeOfSearch, PCHAR SearchFilter, ULONG AttributesOnly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG PageTimeLimit, ULONG TotalSizeLimit, PLDAPSortKey* SortKeys);
  PLDAPSearch     ldap_search_init_page(      PLDAP ExternalHandle, PTCHAR DistinguishedName, ULONG ScopeOfSearch, PTCHAR SearchFilter, ULONG AttributesOnly, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG PageTimeLimit, ULONG TotalSizeLimit, PLDAPSortKey* SortKeys);
  ULONG           ldap_search_abandon_page(   PLDAP ExternalHandle, PLDAPSearch SearchBlock);
  PCHAR           ldap_err2string(            ULONG err);
  PTCHAR          ldap_err2string(            ULONG err);
  ULONG           LdapGetLastError(           );
  ULONG           LdapMapErrorToWin32(        ULONG LdapError);
  ULONG           ldap_result2error(          LDAP* ld, LDAPMessage* res, ULONG freeit);
  ULONG           ldap_control_free(          LDAPControl* Control);
  ULONG           ldap_control_free(          LDAPControl* Control);
  ULONG           ldap_controls_free(         LDAPControl** Controls);
  ULONG           ldap_controls_free(         LDAPControl** Controls);
  VOID            ldap_memfree(               PCHAR Block);
  VOID            ldap_memfree(               PTCHAR Block);
  ULONG           ldap_msgfree(               LDAPMessage* res);
  ULONG           ldap_value_free(            PCHAR* vals);
  ULONG           ldap_value_free(            PTCHAR* vals);
  ULONG           ldap_value_free_len(        struct berval** vals);
  PCHAR           ldap_dn2ufn(                PCHAR dn);
  PTCHAR          ldap_dn2ufn(                PTCHAR dn);
  ULONG           ldap_ufn2dn(                PCHAR ufn, PCHAR* pDn);
  ULONG           ldap_ufn2dn(                PTCHAR ufn, PTCHAR* pDn);
  PCHAR*          ldap_explode_dn(            PCHAR dn, ULONG notypes);
  PTCHAR*         ldap_explode_dn(            PTCHAR dn, ULONG notypes);
  PCHAR           ldap_get_dn(                LDAP* ld, LDAPMessage* entry);
  PTCHAR          ldap_get_dn(                LDAP* ld, LDAPMessage* entry);
  LDAP*           ldap_conn_from_msg(         LDAP* PrimaryConn, LDAPMessage* res);
  ULONG           ldap_modrdn2(               LDAP* ExternalHandle, PCHAR DistinguishedName, PCHAR NewDistinguishedName, INT DeleteOldRdn);
  ULONG           ldap_modrdn2(               LDAP* ExternalHandle, PTCHAR DistinguishedName, PTCHAR NewDistinguishedName, INT DeleteOldRdn);
  ULONG           ldap_modrdn2_s(             LDAP* ExternalHandle, PCHAR DistinguishedName, PCHAR NewDistinguishedName, INT DeleteOldRdn);
  ULONG           ldap_modrdn2_s(             LDAP* ExternalHandle, PTCHAR DistinguishedName, PTCHAR NewDistinguishedName, INT DeleteOldRdn);
  ULONG           ldap_rename_ext(            LDAP* ld, PCHAR dn, PCHAR NewRDN, PCHAR NewParent, INT DeleteOldRdn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_rename_ext(            LDAP* ld, PTCHAR dn, PTCHAR NewRDN, PTCHAR NewParent, INT DeleteOldRdn, PLDAPControl* ServerControls, PLDAPControl* ClientControls, ULONG* MessageNumber);
  ULONG           ldap_rename_ext_s(          LDAP* ld, PCHAR dn, PCHAR NewRDN, PCHAR NewParent, INT DeleteOldRdn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  ULONG           ldap_rename_ext_s(          LDAP* ld, PTCHAR dn, PTCHAR NewRDN, PTCHAR NewParent, INT DeleteOldRdn, PLDAPControl* ServerControls, PLDAPControl* ClientControls);
  int             LdapUnicodeToUTF8(          LPCWSTR lpSrcStr, int cchSrc, LPSTR lpDestStr, int cchDest);
  int             LdapUTF8ToUnicode(          LPCSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest);
  BerElement*     ber_init(                   BERVAL* pBerVal);
  void            ber_free(                   BerElement* pBerElement, INT fbuf);
  void            ber_bvfree(                 BERVAL* pBerVal);
  void            ber_bvecfree(               PBERVAL* pBerVal);
  BERVAL*         ber_bvdup(                  BERVAL* pBerVal);
  BerElement*     ber_alloc_t(                INT options);
  ULONG           ber_skip_tag(               BerElement* pBerElement, ULONG* pLen);
  ULONG           ber_peek_tag(               BerElement* pBerElement, ULONG* pLen);
  ULONG           ber_first_element(          BerElement* pBerElement, ULONG* pLen, CHAR** ppOpaque);
  ULONG           ber_next_element(           BerElement* pBerElement, ULONG* pLen, CHAR* opaque);
  INT             ber_flatten(                BerElement* pBerElement, PBERVAL* pBerVal);
  INT             ber_printf(                 BerElement* pBerElement, PCHAR fmt);
  INT             ber_scanf(                  BerElement* pBerElement, PCHAR fmt);
]]
return ffi.load( 'Wldap32.dll' )
