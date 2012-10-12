require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/internet' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD WINAPI_InternetService; //Alias
  static const WINAPI_InternetService INTERNET_SERVICE_FTP = 1;
  static const WINAPI_InternetService INTERNET_SERVICE_GOPHER = 2;
  static const WINAPI_InternetService INTERNET_SERVICE_HTTP = 3;
  typedef DWORD WINAPI_CacheEntryType; //Alias
  typedef DWORD WINAPI_InternetOption; //Alias
  static const WINAPI_InternetOption INTERNET_OPTION_CALLBACK = 1;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECT_TIMEOUT = 2;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECT_RETRIES = 3;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECT_BACKOFF = 4;
  static const WINAPI_InternetOption INTERNET_OPTION_SEND_TIMEOUT = 5;
  static const WINAPI_InternetOption INTERNET_OPTION_RECEIVE_TIMEOUT = 6;
  static const WINAPI_InternetOption INTERNET_OPTION_DATA_SEND_TIMEOUT = 7;
  static const WINAPI_InternetOption INTERNET_OPTION_DATA_RECEIVE_TIMEOUT = 8;
  static const WINAPI_InternetOption INTERNET_OPTION_HANDLE_TYPE = 9;
  static const WINAPI_InternetOption INTERNET_OPTION_LISTEN_TIMEOUT = 11;
  static const WINAPI_InternetOption INTERNET_OPTION_READ_BUFFER_SIZE = 12;
  static const WINAPI_InternetOption INTERNET_OPTION_WRITE_BUFFER_SIZE = 13;
  static const WINAPI_InternetOption INTERNET_OPTION_ASYNC_ID = 15;
  static const WINAPI_InternetOption INTERNET_OPTION_ASYNC_PRIORITY = 16;
  static const WINAPI_InternetOption INTERNET_OPTION_PARENT_HANDLE = 21;
  static const WINAPI_InternetOption INTERNET_OPTION_KEEP_CONNECTION = 22;
  static const WINAPI_InternetOption INTERNET_OPTION_REQUEST_FLAGS = 23;
  static const WINAPI_InternetOption INTERNET_OPTION_EXTENDED_ERROR = 24;
  static const WINAPI_InternetOption INTERNET_OPTION_OFFLINE_MODE = 26;
  static const WINAPI_InternetOption INTERNET_OPTION_CACHE_STREAM_HANDLE = 27;
  static const WINAPI_InternetOption INTERNET_OPTION_USERNAME = 28;
  static const WINAPI_InternetOption INTERNET_OPTION_PASSWORD = 29;
  static const WINAPI_InternetOption INTERNET_OPTION_ASYNC = 30;
  static const WINAPI_InternetOption INTERNET_OPTION_SECURITY_FLAGS = 31;
  static const WINAPI_InternetOption INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT = 32;
  static const WINAPI_InternetOption INTERNET_OPTION_DATAFILE_NAME = 33;
  static const WINAPI_InternetOption INTERNET_OPTION_URL = 34;
  static const WINAPI_InternetOption INTERNET_OPTION_SECURITY_CERTIFICATE = 35;
  static const WINAPI_InternetOption INTERNET_OPTION_SECURITY_KEY_BITNESS = 36;
  static const WINAPI_InternetOption INTERNET_OPTION_REFRESH = 37;
  static const WINAPI_InternetOption INTERNET_OPTION_PROXY = 38;
  static const WINAPI_InternetOption INTERNET_OPTION_SETTINGS_CHANGED = 39;
  static const WINAPI_InternetOption INTERNET_OPTION_VERSION = 40;
  static const WINAPI_InternetOption INTERNET_OPTION_USER_AGENT = 41;
  static const WINAPI_InternetOption INTERNET_OPTION_END_BROWSER_SESSION = 42;
  static const WINAPI_InternetOption INTERNET_OPTION_PROXY_USERNAME = 43;
  static const WINAPI_InternetOption INTERNET_OPTION_PROXY_PASSWORD = 44;
  static const WINAPI_InternetOption INTERNET_OPTION_CONTEXT_VALUE = 45;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECT_LIMIT = 46;
  static const WINAPI_InternetOption INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT = 47;
  static const WINAPI_InternetOption INTERNET_OPTION_POLICY = 48;
  static const WINAPI_InternetOption INTERNET_OPTION_DISCONNECTED_TIMEOUT = 49;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECTED_STATE = 50;
  static const WINAPI_InternetOption INTERNET_OPTION_IDLE_STATE = 51;
  static const WINAPI_InternetOption INTERNET_OPTION_OFFLINE_SEMANTICS = 52;
  static const WINAPI_InternetOption INTERNET_OPTION_SECONDARY_CACHE_KEY = 53;
  static const WINAPI_InternetOption INTERNET_OPTION_CALLBACK_FILTER = 54;
  static const WINAPI_InternetOption INTERNET_OPTION_CONNECT_TIME = 55;
  static const WINAPI_InternetOption INTERNET_OPTION_SEND_THROUGHPUT = 56;
  static const WINAPI_InternetOption INTERNET_OPTION_RECEIVE_THROUGHPUT = 57;
  static const WINAPI_InternetOption INTERNET_OPTION_REQUEST_PRIORITY = 58;
  static const WINAPI_InternetOption INTERNET_OPTION_HTTP_VERSION = 59;
  static const WINAPI_InternetOption INTERNET_OPTION_RESET_URLCACHE_SESSION = 60;
  static const WINAPI_InternetOption INTERNET_OPTION_ERROR_MASK = 62;
  static const WINAPI_InternetOption INTERNET_OPTION_FROM_CACHE_TIMEOUT = 63;
  static const WINAPI_InternetOption INTERNET_OPTION_BYPASS_EDITED_ENTRY = 64;
  static const WINAPI_InternetOption INTERNET_OPTION_HTTP_DECODING = 65;
  static const WINAPI_InternetOption INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO = 67;
  static const WINAPI_InternetOption INTERNET_OPTION_CODEPAGE = 68;
  static const WINAPI_InternetOption INTERNET_OPTION_CACHE_TIMESTAMPS = 69;
  static const WINAPI_InternetOption INTERNET_OPTION_DISABLE_AUTODIAL = 70;
  static const WINAPI_InternetOption INTERNET_OPTION_MAX_CONNS_PER_SERVER = 73;
  static const WINAPI_InternetOption INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER = 74;
  static const WINAPI_InternetOption INTERNET_OPTION_PER_CONNECTION_OPTION = 75;
  static const WINAPI_InternetOption INTERNET_OPTION_DIGEST_AUTH_UNLOAD = 76;
  static const WINAPI_InternetOption INTERNET_OPTION_IGNORE_OFFLINE = 77;
  static const WINAPI_InternetOption INTERNET_OPTION_IDENTITY = 78;
  static const WINAPI_InternetOption INTERNET_OPTION_REMOVE_IDENTITY = 79;
  static const WINAPI_InternetOption INTERNET_OPTION_ALTER_IDENTITY = 80;
  static const WINAPI_InternetOption INTERNET_OPTION_SUPPRESS_BEHAVIOR = 81;
  static const WINAPI_InternetOption INTERNET_OPTION_AUTODIAL_MODE = 82;
  static const WINAPI_InternetOption INTERNET_OPTION_AUTODIAL_CONNECTION = 83;
  static const WINAPI_InternetOption INTERNET_OPTION_CLIENT_CERT_CONTEXT = 84;
  static const WINAPI_InternetOption INTERNET_OPTION_AUTH_FLAGS = 85;
  static const WINAPI_InternetOption INTERNET_OPTION_COOKIES_3RD_PARTY = 86;
  static const WINAPI_InternetOption INTERNET_OPTION_DISABLE_PASSPORT_AUTH = 87;
  static const WINAPI_InternetOption INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY = 88;
  static const WINAPI_InternetOption INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT = 89;
  static const WINAPI_InternetOption INTERNET_OPTION_ENABLE_PASSPORT_AUTH = 90;
  static const WINAPI_InternetOption INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS = 91;
  static const WINAPI_InternetOption INTERNET_OPTION_ACTIVATE_WORKER_THREADS = 92;
  static const WINAPI_InternetOption INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS = 93;
  static const WINAPI_InternetOption INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH = 94;
  static const WINAPI_InternetOption INTERNET_OPTION_PROXY_SETTINGS_CHANGED = 95;
  static const WINAPI_InternetOption INTERNET_OPTION_DATAFILE_EXT = 96;
  static const WINAPI_InternetOption INTERNET_OPTION_CODEPAGE_PATH = 100;
  static const WINAPI_InternetOption INTERNET_OPTION_CODEPAGE_EXTRA = 101;
  static const WINAPI_InternetOption INTERNET_OPTION_IDN = 102;
  typedef DWORD WINAPI_InternetGetConnectedStateFlags; //Alias
  typedef DWORD WINAPI_InternetOpenType; //Alias
  static const WINAPI_InternetOpenType INTERNET_OPEN_TYPE_PRECONFIG = 0;
  static const WINAPI_InternetOpenType INTERNET_OPEN_TYPE_DIRECT = 1;
  static const WINAPI_InternetOpenType INTERNET_OPEN_TYPE_PROXY = 3;
  static const WINAPI_InternetOpenType INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY = 4;
  typedef DWORD WINAPI_InternetOpenFlags; //Alias
  typedef DWORD WINAPI_InternetFlags; //Alias
  typedef DWORD WINAPI_HttpQueryFlags; //Alias
  typedef DWORD WINAPI_InternetReadFileFlags; //Alias
  typedef DWORD WINAPI_HttpAddReqFlag; //Alias
  typedef DWORD WINAPI_InternetCookieFlags; //Alias
  typedef DWORD WINAPI_InternetErrorDlgErrorCode; //Alias
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED = 12044;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR = 12039;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_INCORRECT_PASSWORD = 12014;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_INVALID_CA = 12045;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_POST_IS_NON_SECURE = 12043;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_SEC_CERT_CN_INVALID = 12038;
  static const WINAPI_InternetErrorDlgErrorCode ERROR_INTERNET_SEC_CERT_DATE_INVALID = 12037;
  typedef DWORD WINAPI_InternetErrorDlgFlags; //Alias
  typedef DWORD WINAPI_CacheEntryFieldControl; //Alias
  BOOLAPI                  CommitUrlCacheEntry(                    LPCTSTR lpszUrlName, LPCTSTR lpszLocalFileName, FILETIME ExpireTime, FILETIME LastModifiedTime, WINAPI_CacheEntryType CacheEntryType, LPVOID lpHeaderInfo, DWORD dwHeaderSize, LPCTSTR lpszFileExtension, LPCTSTR lpszOriginalUrl);
  BOOL                     CreateMD5SSOHash(                       PWSTR pszChallengeInfo, PWSTR pwszRealm, PWSTR pwszTarget, PBYTE pbHexHash);
  BOOLAPI                  CreateUrlCacheEntry(                    LPCTSTR lpszUrlName, DWORD dwExpectedFileSize, LPCTSTR lpszFileExtension, LPTSTR lpszFileName, DWORD dwReserved);
  GROUPID                  CreateUrlCacheGroup(                    DWORD dwFlags, LPVOID lpReserved);
  BOOLAPI                  DeleteUrlCacheEntry(                    LPCTSTR lpszUrlName);
  BOOL                     DeleteUrlCacheGroup(                    GROUPID GroupId, DWORD dwFlags, LPVOID lpReserved);
  BOOL                     DetectAutoProxyUrl(                     LPSTR lpszAutoProxyUrl, DWORD dwAutoProxyUrlLength, DWORD dwDetectFlags);
  BOOLAPI                  FindCloseUrlCache(                      HANDLE hEnumHandle);
  HANDLE                   FindFirstUrlCacheEntry(                 LPCTSTR lpszUrlSearchPattern, LPINTERNET_CACHE_ENTRY_INFO lpFirstCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
  HANDLE                   FindFirstUrlCacheEntryEx(               LPCTSTR lpszUrlSearchPattern, DWORD dwFlags, DWORD dwFilter, GROUPID GroupId, LPINTERNET_CACHE_ENTRY_INFO lpFirstCacheEntryInfo, LPDWORD lpdwEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes, LPVOID lpReserved);
  HANDLE                   FindFirstUrlCacheGroup(                 DWORD dwFlags, DWORD dwFilter, LPVOID lpSearchCondition, DWORD dwSearchCondition, GROUPID* lpGroupId, LPVOID lpReserved);
  BOOLAPI                  FindNextUrlCacheEntry(                  HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFO lpNextCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
  BOOL                     FindNextUrlCacheEntryEx(                HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFO lpNextCacheEntryInfo, LPDWORD lpcbEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes, LPVOID lpReserved);
  BOOL                     FindNextUrlCacheGroup(                  HANDLE hFind, GROUPID* lpGroupId, LPVOID lpReserved);
  BOOL                     FtpCommand(                             HINTERNET hConnect, BOOL fExpectResponse, DWORD dwFlags, LPCTSTR lpszCommand, DWORD_PTR dwContext, HINTERNET* phFtpCommand);
  BOOL                     FtpCreateDirectory(                     HINTERNET hConnect, LPCTSTR lpszDirectory);
  BOOL                     FtpDeleteFile(                          HINTERNET hConnect, LPCTSTR lpszFileName);
  HINTERNET                FtpFindFirstFile(                       HINTERNET hConnect, LPCTSTR lpszSearchFile, LPWIN32_FIND_DATA lpFindFileData, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     FtpGetCurrentDirectory(                 HINTERNET hConnect, LPTSTR lpszCurrentDirectory, LPDWORD lpdwCurrentDirectory);
  BOOL                     FtpGetFile(                             HINTERNET hConnect, LPCTSTR lpszRemoteFile, LPCTSTR lpszNewFile, BOOL fFailIfExists, DWORD dwFlagsAndAttributes, DWORD dwFlags, DWORD_PTR dwContext);
  DWORD                    FtpGetFileSize(                         HINTERNET hFile, LPDWORD lpdwFileSizeHigh);
  HINTERNET                FtpOpenFile(                            HINTERNET hConnect, LPCTSTR lpszFileName, DWORD dwAccess, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     FtpPutFile(                             HINTERNET hConnect, LPCTSTR lpszLocalFile, LPCTSTR lpszNewRemoteFile, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     FtpRemoveDirectory(                     HINTERNET hConnect, LPCTSTR lpszDirectory);
  BOOL                     FtpRenameFile(                          HINTERNET hConnect, LPCTSTR lpszExisting, LPCTSTR lpszNew);
  BOOL                     FtpSetCurrentDirectory(                 HINTERNET hConnect, LPCTSTR lpszDirectory);
  BOOL                     GetUrlCacheEntryInfo(                   LPCTSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFO lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
  BOOLAPI                  GetUrlCacheEntryInfoEx(                 LPCTSTR lpszUrl, LPINTERNET_CACHE_ENTRY_INFO lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, LPTSTR lpszRedirectUrl, LPDWORD lpcbRedirectUrl, LPVOID lpReserved, DWORD dwFlags);
  BOOL                     GetUrlCacheGroupAttribute(              GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFO lpGroupInfo, LPDWORD lpdwGroupInfo, LPVOID lpReserved);
  BOOL                     GopherCreateLocator(                    LPCTSTR lpszHost, INTERNET_PORT nServerPort, LPCTSTR lpszDisplayString, LPCTSTR lpszSelectorString, DWORD dwGopherType, LPTSTR lpszLocator, LPDWORD lpdwBufferLength);
  HINTERNET                GopherFindFirstFile(                    HINTERNET hConnect, LPCTSTR lpszLocator, LPCTSTR lpszSearchString, LPGOPHER_FIND_DATA lpFindData, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     GopherGetAttribute(                     HINTERNET hConnect, LPCTSTR lpszLocator, LPCTSTR lpszAttributeName, LPBYTE lpBuffer, DWORD dwBufferLength, LPDWORD lpdwCharactersReturned, GOPHER_ATTRIBUTE_ENUMERATOR lpfnEnumerator, DWORD_PTR dwContext);
  BOOL                     GopherGetLocatorType(                   LPCTSTR lpszLocator, LPDWORD lpdwGopherType);
  HINTERNET                GopherOpenFile(                         HINTERNET hConnect, LPCTSTR lpszLocator, LPCTSTR lpszView, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     HttpAddRequestHeaders(                  HINTERNET hConnect, LPCTSTR lpszHeaders, DWORD dwHeadersLength, WINAPI_HttpAddReqFlag dwModifiers);
  BOOL                     HttpEndRequest(                         HINTERNET hRequest, LPINTERNET_BUFFERS lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
  HINTERNET                HttpOpenRequest(                        HINTERNET hConnect, LPCTSTR lpszVerb, LPCTSTR lpszObjectName, LPCTSTR lpszVersion, LPCTSTR lpszReferer, LPCTSTR* lplpszAcceptTypes, WINAPI_InternetFlags dwFlags, DWORD_PTR dwContext);
  BOOL                     HttpQueryInfo(                          HINTERNET hRequest, WINAPI_HttpQueryFlags dwInfoLevel, LPVOID lpvBuffer, LPDWORD lpdwBufferLength, LPDWORD lpdwIndex);
  BOOL                     HttpSendRequest(                        HINTERNET hRequest, LPCTSTR lpszHeaders, DWORD dwHeadersLength, LPVOID lpOptional, DWORD dwOptionalLength);
  BOOL                     HttpSendRequestEx(                      HINTERNET hRequest, LPINTERNET_BUFFERS lpBuffersIn, LPINTERNET_BUFFERS lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
  DWORD                    InternetAttemptConnect(                 DWORD dwReserved);
  BOOL                     InternetAutodial(                       DWORD dwFlags, HWND hwndParent);
  BOOL                     InternetAutodialHangup(                 DWORD dwReserved);
  BOOL                     InternetCanonicalizeUrl(                LPCTSTR lpszUrl, LPTSTR lpszBuffer, LPDWORD lpdwBufferLength, WINAPI_InternetCanonicalizeUrlFlags dwFlags);
  BOOL                     InternetCheckConnection(                LPCTSTR lpszUrl, DWORD dwFlags, DWORD dwReserved);
  BOOL                     InternetCloseHandle(                    HINTERNET hInternet);
  BOOL                     InternetCombineUrl(                     LPCTSTR lpszBaseUrl, LPCTSTR lpszRelativeUrl, LPTSTR lpszBuffer, LPDWORD lpdwBufferLength, WINAPI_InternetCanonicalizeUrlFlags dwFlags);
  DWORD                    InternetConfirmZoneCrossing(            HWND hWnd, LPTSTR szUrlPrev, LPTSTR szUrlNew, BOOL bPost);
  HINTERNET                InternetConnect(                        HINTERNET hInternet, LPCTSTR lpszServerName, INTERNET_PORT nServerPort, LPCTSTR lpszUsername, LPCTSTR lpszPassword, WINAPI_InternetService dwService, WINAPI_InternetFlags dwFlags, DWORD_PTR dwContext);
  BOOL                     InternetCrackUrl(                       LPCTSTR lpszUrl, DWORD dwUrlLength, WINAPI_InternetCrackUrlFlags dwFlags, LPURL_COMPONENTS lpUrlComponents);
  BOOL                     InternetCreateUrl(                      LPURL_COMPONENTS lpUrlComponents, WINAPI_InternetCrackUrlFlags dwFlags, LPTSTR lpszUrl, LPDWORD lpdwUrlLength);
  DWORD                    InternetDial(                           HWND hwndParent, LPTSTR pszEntryName, DWORD dwFlags, DWORD_PTR* lpdwConnection, DWORD dwReserved);
  DWORD                    InternetErrorDlg(                       HWND hWnd, HINTERNET hRequest, WINAPI_InternetErrorDlgErrorCode dwError, WINAPI_InternetErrorDlgFlags dwFlags, LPVOID* lppvData);
  BOOL                     InternetFindNextFile(                   HINTERNET hFind, LPVOID lpvFindData);
  BOOL                     InternetGetConnectedState(              WINAPI_InternetGetConnectedStateFlags* lpdwFlags, DWORD dwReserved);
  BOOL                     InternetGetConnectedStateEx(            WINAPI_InternetGetConnectedStateFlags* lpdwFlags, LPTSTR lpszConnectionName, DWORD dwNameLen, DWORD dwReserved);
  BOOL                     InternetGetCookie(                      LPCTSTR lpszUrl, LPCTSTR lpszCookieName, LPTSTR lpszCookieData, LPDWORD lpdwSize);
  BOOL                     InternetGetCookieEx(                    LPCTSTR pchURL, LPCTSTR pchCookieName, LPTSTR pchCookieData, LPDWORD pcchCookieData, WINAPI_InternetCookieFlags dwFlags, LPVOID lpReserved);
  BOOL                     InternetGetLastResponseInfo(            LPDWORD lpdwError, LPTSTR lpszBuffer, LPDWORD lpdwBufferLength);
  BOOL                     InternetGoOnline(                       LPTSTR lpszURL, HWND hwndParent, DWORD dwFlags);
  DWORD                    InternetHangUp(                         DWORD_PTR dwConnection, DWORD dwReserved);
  BOOL                     InternetLockRequestFile(                HINTERNET hInternet, HANDLE* lphLockReqHandle);
  HINTERNET                InternetOpen(                           LPCTSTR lpszAgent, WINAPI_InternetOpenType dwAccessType, LPCTSTR lpszProxyName, LPCTSTR lpszProxyBypass, WINAPI_InternetOpenFlags dwFlags);
  HINTERNET                InternetOpenUrl(                        HINTERNET hInternet, LPCTSTR lpszUrl, LPCTSTR lpszHeaders, DWORD dwHeadersLength, WINAPI_InternetFlags dwFlags, DWORD_PTR dwContext);
  BOOL                     InternetQueryDataAvailable(             HINTERNET hFile, LPDWORD lpdwNumberOfBytesAvailable, DWORD dwFlags, DWORD_PTR dwContext);
  BOOL                     InternetQueryOption(                    HINTERNET hInternet, WINAPI_InternetOption dwOption, LPVOID lpBuffer, LPDWORD lpdwBufferLength);
  BOOL                     InternetReadFile(                       HINTERNET hFile, LPVOID lpBuffer, DWORD dwNumberOfBytesToRead, LPDWORD lpdwNumberOfBytesRead);
  BOOL                     InternetReadFileEx(                     HINTERNET hFile, LPINTERNET_BUFFERS lpBuffersOut, WINAPI_InternetReadFileFlags dwFlags, DWORD_PTR dwContext);
  BOOL                     InternetSetCookie(                      LPCTSTR lpszUrl, LPCTSTR lpszCookieName, LPCTSTR lpszCookieData);
  DWORD                    InternetSetCookieEx(                    LPCTSTR lpszURL, LPCTSTR lpszCookieName, LPCTSTR lpszCookieData, WINAPI_InternetCookieFlags dwFlags, DWORD_PTR dwReserved);
  DWORD                    InternetSetFilePointer(                 HINTERNET hFile, LONG lDistanceToMove, PVOID pReserved, DWORD dwMoveMethod, DWORD_PTR dwContext);
  BOOL                     InternetSetOption(                      HINTERNET hInternet, WINAPI_InternetOption dwOption, LPVOID lpBuffer, DWORD dwBufferLength);
  INTERNET_STATUS_CALLBACK InternetSetStatusCallback(              HINTERNET hInternet, INTERNET_STATUS_CALLBACK lpfnInternetCallback);
  BOOL                     InternetTimeFromSystemTime(             const SYSTEMTIME* pst, DWORD dwRFC, LPTSTR lpszTime, DWORD cbTime);
  BOOL                     InternetTimeToSystemTime(               LPCTSTR lpszTime, SYSTEMTIME* pst, DWORD dwReserved);
  BOOLAPI                  InternetUnlockRequestFile(              HANDLE hLockRequestInfo);
  BOOL                     InternetWriteFile(                      HINTERNET hFile, LPCVOID lpBuffer, DWORD dwNumberOfBytesToWrite, LPDWORD lpdwNumberOfBytesWritten);
  BOOLAPI                  ReadUrlCacheEntryStream(                HANDLE hUrlCacheStream, DWORD dwLocation, LPVOID lpBuffer, LPDWORD lpdwLen, DWORD dwReserved);
  BOOL                     ResumeSuspendedDownload(                HINTERNET hRequest, DWORD dwResultCode);
  BOOLAPI                  RetrieveUrlCacheEntryFile(              LPCTSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFO lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, DWORD dwReserved);
  HANDLE                   RetrieveUrlCacheEntryStream(            LPCTSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFO lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, BOOL fRandomRead, DWORD dwReserved);
  BOOLAPI                  SetUrlCacheEntryGroup(                  LPCTSTR lpszUrlName, DWORD dwFlags, GROUPID GroupId, LPBYTE pbGroupAttributes, DWORD cbGroupAttributes, LPVOID lpReserved);
  BOOLAPI                  SetUrlCacheEntryInfo(                   LPCTSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFO lpCacheEntryInfo, WINAPI_CacheEntryFieldControl dwFieldControl);
  BOOL                     SetUrlCacheGroupAttribute(              GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFO lpGroupInfo, LPVOID lpReserved);
  BOOLAPI                  UnlockUrlCacheEntryFile(                LPCTSTR lpszUrlName, DWORD dwReserved);
  BOOLAPI                  UnlockUrlCacheEntryStream(              HANDLE hUrlCacheStream, DWORD dwReserved);
  BOOL                     InternetClearAllPerSiteCookieDecisions( );
  BOOL                     InternetEnumPerSiteCookieDecision(      LPTSTR pszSiteName, unsigned long* pcSiteNameSize, unsigned long* pdwDecision, unsigned long dwIndex);
  BOOL                     InternetGetPerSiteCookieDecision(       LPCTSTR pchHostName, unsigned long* pResult);
  BOOL                     InternetSetPerSiteCookieDecision(       LPCTSTR pchHostName, DWORD dwDecision);
  DWORD                    PrivacyGetZonePreferenceW(              DWORD dwZone, DWORD dwType, LPDWORD pdwTemplate, LPWSTR pszBuffer, LPDWORD pdwBufferLength);
  DWORD                    PrivacySetZonePreferenceW(              DWORD dwZone, DWORD dwType, DWORD dwTemplate, LPCWSTR pszPreference);
]]
return ffi.load( 'Wininet.dll' )
