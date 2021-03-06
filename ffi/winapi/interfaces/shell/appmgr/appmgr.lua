require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IAppPublisher; //Interface
  typedef void* IEnumPublishedApps; //Interface
  typedef void* IPublishedApp; //Interface
  typedef void* IPublishedApp2; //Interface
  typedef void* IShellApp; //Interface
  typedef DWORD APPINFODATAFLAGS; //Alias
  typedef struct APPINFODATA {
    DWORD cbSize;
    APPINFODATAFLAGS dwMask;
    LPWSTR pszDisplayName;
    LPWSTR pszVersion;
    LPWSTR pszPublisher;
    LPWSTR pszProductID;
    LPWSTR pszRegisteredOwner;
    LPWSTR pszRegisteredCompany;
    LPWSTR pszLanguage;
    LPWSTR pszSupportUrl;
    LPWSTR pszSupportTelephone;
    LPWSTR pszHelpLink;
    LPWSTR pszInstallLocation;
    LPWSTR pszInstallSource;
    LPWSTR pszInstallDate;
    LPWSTR pszContact;
    LPWSTR pszComments;
    LPWSTR pszImage;
    LPWSTR pszReadmeUrl;
    LPWSTR pszUpdateInfoUrl;
  } APPINFODATA;
  typedef APPINFODATA *PAPPINFODATA; //Pointer
  typedef struct SLOWAPPINFO {
    ULONGLONG ullSize;
    FILETIME ftLastUsed;
    int iTimesUsed;
    LPWSTR pszImage;
  } SLOWAPPINFO;
  typedef SLOWAPPINFO *PSLOWAPPINFO; //Pointer
  typedef DWORD PUBAPPINFOFLAGS; //Alias
  typedef struct PUBAPPINFO {
    DWORD cbSize;
    PUBAPPINFOFLAGS dwMask;
    LPWSTR pszSource;
    SYSTEMTIME stAssigned;
    SYSTEMTIME stPublished;
    SYSTEMTIME stScheduled;
    SYSTEMTIME stExpire;
  } PUBAPPINFO;
  typedef PUBAPPINFO *PPUBAPPINFO; //Pointer
]]
