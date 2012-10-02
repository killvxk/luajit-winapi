require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IVssAdmin; //Interface
  typedef void* IVssAdminEx; //Interface
  typedef void* IVssAsync; //Interface
  typedef void* IVssBackupComponents; //Interface
  typedef void* IVssBackupComponentsEx; //Interface
  typedef void* IVssBackupComponentsEx2; //Interface
  typedef void* IVssBackupComponentsEx3; //Interface
  typedef void* IVssComponent; //Interface
  typedef void* IVssComponentEx; //Interface
  typedef void* IVssComponentEx2; //Interface
  typedef void* IVssCreateExpressWriterMetadata; //Interface
  typedef void* IVssCreateWriterMetadataEx; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt2; //Interface
  typedef void* IVssDifferentialSoftwareSnapshotMgmt3; //Interface
  typedef void* IVssEnumMgmtObject; //Interface
  typedef void* IVssEnumObject; //Interface
  typedef void* IVssExamineWriterMetadata; //Interface
  typedef void* IVssExamineWriterMetadataEx; //Interface
  typedef void* IVssExamineWriterMetadataEx2; //Interface
  typedef void* IVssExpressWriter; //Interface
  typedef void* IVssHardwareSnapshotProvider; //Interface
  typedef void* IVssHardwareSnapshotProviderEx; //Interface
  typedef void* IVssProviderCreateSnapshotSet; //Interface
  typedef void* IVssProviderNotifications; //Interface
  typedef void* IVssSnapshotMgmt; //Interface
  typedef void* IVssSnapshotMgmt2; //Interface
  typedef void* IVssSoftwareSnapshotProvider; //Interface
  typedef void* IVssWMComponent; //Interface
  typedef void* IVssWMFiledesc; //Interface
  typedef void* IVssWriterComponentsExt; //Interface
  typedef void* IVssWriterImpl; //Interface
  typedef LPVOID CVssWriter*; //Alias
  typedef LPVOID CVssWriterEx*; //Alias
  typedef GUID VSS_ID; //Alias
  typedef VSS_ID *WINAPI_VSS_ID*; //Pointer
  typedef WCHAR* VSS_PWSZ; //Alias
  typedef LONGLONG VSS_TIMESTAMP; //Alias
  typedef enum WINAPI_VSS_HRESULT {
    VSS_E_BAD_STATE = 0x80042301,
    VSS_E_UNEXPECTED = 0x80042302,
    VSS_E_PROVIDER_ALREADY_REGISTERED = 0x80042303,
    VSS_E_PROVIDER_NOT_REGISTERED = 0x80042304,
    VSS_E_PROVIDER_VETO = 0x80042306,
    VSS_E_PROVIDER_IN_USE = 0x80042307,
    VSS_E_OBJECT_NOT_FOUND = 0x80042308,
    VSS_S_ASYNC_PENDING = 0x00042309,
    VSS_S_ASYNC_FINISHED = 0x0004230A,
    VSS_S_ASYNC_CANCELLED = 0x0004230B,
    VSS_E_VOLUME_NOT_SUPPORTED = 0x8004230C,
    VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER = 0x8004230E,
    VSS_E_OBJECT_ALREADY_EXISTS = 0x8004230D,
    VSS_E_UNEXPECTED_PROVIDER_ERROR = 0x8004230F,
    VSS_E_CORRUPT_XML_DOCUMENT = 0x80042310,
    VSS_E_INVALID_XML_DOCUMENT = 0x80042311,
    VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED = 0x80042312,
    VSS_E_FLUSH_WRITES_TIMEOUT = 0x80042313,
    VSS_E_HOLD_WRITES_TIMEOUT = 0x80042314,
    VSS_E_UNEXPECTED_WRITER_ERROR = 0x80042315,
    VSS_E_SNAPSHOT_SET_IN_PROGRESS = 0x80042316,
    VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED = 0x80042317,
    VSS_E_WRITER_INFRASTRUCTURE = 0x80042318,
    VSS_E_WRITER_NOT_RESPONDING = 0x80042319,
    VSS_E_WRITER_ALREADY_SUBSCRIBED = 0x8004231A,
    VSS_E_UNSUPPORTED_CONTEXT = 0x8004231B,
    VSS_E_VOLUME_IN_USE = 0x8004231D,
    VSS_E_MAXIMUM_DIFFAREA_ASSOCIATIONS_REACHED = 0x8004231E,
    VSS_E_INSUFFICIENT_STORAGE = 0x8004231F,
    VSS_E_NO_SNAPSHOTS_IMPORTED = 0x80042320,
    VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED = 0x00042321,
    VSS_E_SOME_SNAPSHOTS_NOT_IMPORTED = 0x80042321,
    VSS_E_MAXIMUM_NUMBER_OF_REMOTE_MACHINES_REACHED = 0x80042322,
    VSS_E_REMOTE_SERVER_UNAVAILABLE = 0x80042323,
    VSS_E_REMOTE_SERVER_UNSUPPORTED = 0x80042324,
    VSS_E_REVERT_IN_PROGRESS = 0x80042325,
    VSS_E_REVERT_VOLUME_LOST = 0x80042326,
    VSS_E_REBOOT_REQUIRED = 0x80042327,
    VSS_E_TRANSACTION_FREEZE_TIMEOUT = 0x80042328,
    VSS_E_TRANSACTION_THAW_TIMEOUT = 0x80042329,
    VSS_E_VOLUME_NOT_LOCAL = 0x8004232D,
    VSS_E_CLUSTER_TIMEOUT = 0x8004232E,
    VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT = 0x800423F0,
    VSS_E_WRITERERROR_OUTOFRESOURCES = 0x800423F1,
    VSS_E_WRITERERROR_TIMEOUT = 0x800423F2,
    VSS_E_WRITERERROR_RETRYABLE = 0x800423F3,
    VSS_E_WRITERERROR_NONRETRYABLE = 0x800423F4,
    VSS_E_WRITERERROR_RECOVERY_FAILED = 0x800423F5,
    VSS_E_BREAK_REVERT_ID_FAILED = 0x800423F6,
    VSS_E_LEGACY_PROVIDER = 0x800423F7,
    VSS_E_MISSING_DISK = 0x800423F8,
    VSS_E_MISSING_HIDDEN_VOLUME = 0x800423F9,
    VSS_E_MISSING_VOLUME = 0x800423FA,
    VSS_E_AUTORECOVERY_FAILED = 0x800423FB,
    VSS_E_DYNAMIC_DISK_ERROR = 0x800423FC,
    VSS_E_NONTRANSPORTABLE_BCD = 0x800423FD,
    VSS_E_CANNOT_REVERT_DISKID = 0x800423FE,
    VSS_E_RESYNC_IN_PROGRESS = 0x800423FF,
    VSS_E_CLUSTER_ERROR = 0x80042400,
    VSS_E_UNSELECTED_VOLUME = 0x8004232A,
    VSS_E_SNAPSHOT_NOT_IN_SET = 0x8004232B,
    VSS_E_NESTED_VOLUME_LIMIT = 0x8004232C,
    VSS_E_NOT_SUPPORTED = 0x8004232F,
    VSS_E_WRITERERROR_PARTIAL_FAILURE = 0x80042336,
    VSS_E_ASRERROR_DISK_ASSIGNMENT_FAILED = 0x80042401,
    VSS_E_ASRERROR_DISK_RECREATION_FAILED = 0x80042402,
    VSS_E_ASRERROR_NO_ARCPATH = 0x80042403,
    VSS_E_ASRERROR_MISSING_DYNDISK = 0x80042404,
    VSS_E_ASRERROR_SHARED_CRIDISK = 0x80042405,
    VSS_E_ASRERROR_DATADISK_RDISK0 = 0x80042406,
    VSS_E_ASRERROR_RDISK0_TOOSMALL = 0x80042407,
    VSS_E_ASRERROR_CRITICAL_DISKS_TOO_SMALL = 0x80042408,
    VSS_E_WRITER_STATUS_NOT_AVAILABLE = 0x80042409,
    VSS_E_ASRERROR_DYNAMIC_VHD_NOT_SUPPORTED = 0x8004240A,
    VSS_E_CRITICAL_VOLUME_ON_INVALID_DISK = 0x80042411,
    VSS_E_ASRERROR_RDISK_FOR_SYSTEM_DISK_NOT_FOUND = 0x80042412,
    VSS_E_ASRERROR_NO_PHYSICAL_DISK_AVAILABLE = 0x80042413,
    VSS_E_ASRERROR_FIXED_PHYSICAL_DISK_AVAILABLE_AFTER_DISK_EXCLUSION = 0x80042414,
    VSS_E_ASRERROR_CRITICAL_DISK_CANNOT_BE_EXCLUDED = 0x80042415,
    VSS_E_ASRERROR_SYSTEM_PARTITION_HIDDEN = 0x80042416,
  } WINAPI_VSS_HRESULT;
  typedef enum VSS_PROVIDER_TYPE {
    VSS_PROV_UNKNOWN = 0,
    VSS_PROV_SYSTEM = 1,
    VSS_PROV_SOFTWARE = 2,
    VSS_PROV_HARDWARE = 3,
  } VSS_PROVIDER_TYPE;
  typedef enum VSS_BACKUP_TYPE {
    VSS_BT_UNDEFINED = 0,
    VSS_BT_FULL = 1,
    VSS_BT_INCREMENTAL = 2,
    VSS_BT_DIFFERENTIAL = 3,
    VSS_BT_LOG = 4,
    VSS_BT_COPY = 5,
    VSS_BT_OTHER = 6,
  } VSS_BACKUP_TYPE;
  typedef enum VSS_RESTORE_TYPE {
    VSS_RTYPE_UNDEFINED = 0,
    VSS_RTYPE_BY_COPY = 1,
    VSS_RTYPE_IMPORT = 2,
    VSS_RTYPE_OTHER = 3,
  } VSS_RESTORE_TYPE;
  typedef enum VSS_COMPONENT_TYPE {
    VSS_CT_UNDEFINED = 0,
    VSS_CT_DATABASE = 1,
    VSS_CT_FILEGROUP = 2,
  } VSS_COMPONENT_TYPE;
  typedef enum VSS_OBJECT_TYPE {
    VSS_OBJECT_UNKNOWN = 0,
    VSS_OBJECT_NONE = 1,
    VSS_OBJECT_SNAPSHOT_SET = 2,
    VSS_OBJECT_SNAPSHOT = 3,
    VSS_OBJECT_PROVIDER = 4,
  } VSS_OBJECT_TYPE;
  typedef enum VSS_WRITER_STATE {
    VSS_WS_UNKNOWN = 0,
    VSS_WS_STABLE = 1,
    VSS_WS_WAITING_FOR_FREEZE = 2,
    VSS_WS_WAITING_FOR_THAW = 3,
    VSS_WS_WAITING_FOR_POST_SNAPSHOT = 4,
    VSS_WS_WAITING_FOR_BACKUP_COMPLETE = 5,
    VSS_WS_FAILED_AT_IDENTIFY = 6,
    VSS_WS_FAILED_AT_PREPARE_BACKUP = 7,
    VSS_WS_FAILED_AT_PREPARE_SNAPSHOT = 8,
    VSS_WS_FAILED_AT_FREEZE = 9,
    VSS_WS_FAILED_AT_THAW = 10,
    VSS_WS_FAILED_AT_POST_SNAPSHOT = 11,
    VSS_WS_FAILED_AT_BACKUP_COMPLETE = 12,
    VSS_WS_FAILED_AT_PRE_RESTORE = 13,
    VSS_WS_FAILED_AT_POST_RESTORE = 14,
    VSS_WS_FAILED_AT_BACKUPSHUTDOWN = 15,
  } VSS_WRITER_STATE;
  typedef enum VSS_RESTORE_TARGET {
    VSS_RT_UNDEFINED = 0,
    VSS_RT_ORIGINAL = 1,
    VSS_RT_ALTERNATE = 2,
    VSS_RT_DIRECTED = 3,
    VSS_RT_ORIGINAL_LOCATION = 4,
  } VSS_RESTORE_TARGET;
  typedef enum VSS_FILE_RESTORE_STATUS {
    VSS_RS_UNDEFINED = 0,
    VSS_RS_NONE = 1,
    VSS_RS_ALL = 2,
    VSS_RS_FAILED = 3,
  } VSS_FILE_RESTORE_STATUS;
  typedef enum VSS_ROLLFORWARD_TYPE {
    VSS_RF_UNDEFINED = 0,
    VSS_RF_NONE = 1,
    VSS_RF_ALL = 2,
    VSS_RF_PARTIAL = 3,
  } VSS_ROLLFORWARD_TYPE;
  typedef enum VSS_RESTOREMETHOD_ENUM {
    VSS_RME_UNDEFINED = 0,
    VSS_RME_RESTORE_IF_NOT_THERE = 1,
    VSS_RME_RESTORE_IF_CAN_REPLACE = 2,
    VSS_RME_STOP_RESTORE_START = 3,
    VSS_RME_RESTORE_TO_ALTERNATE_LOCATION = 4,
    VSS_RME_RESTORE_AT_REBOOT = 5,
    VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE = 6,
    VSS_RME_CUSTOM = 7,
    VSS_RME_RESTORE_STOP_START = 8,
  } VSS_RESTOREMETHOD_ENUM;
  typedef enum VSS_USAGE_TYPE {
    VSS_UT_UNDEFINED = 0,
    VSS_UT_BOOTABLESYSTEMSTATE = 1,
    VSS_UT_SYSTEMSERVICE = 2,
    VSS_UT_USERDATA = 3,
    VSS_UT_OTHER = 4,
  } VSS_USAGE_TYPE;
  typedef enum VSS_SNAPSHOT_PROPERTY_ID {
    VSS_SPROPID_UNKNOWN = 0,
    VSS_SPROPID_SNAPSHOT_ID = 0x1,
    VSS_SPROPID_SNAPSHOT_SET_ID = 0x2,
    VSS_SPROPID_SNAPSHOTS_COUNT = 0x3,
    VSS_SPROPID_SNAPSHOT_DEVICE = 0x4,
    VSS_SPROPID_ORIGINAL_VOLUME = 0x5,
    VSS_SPROPID_ORIGINATING_MACHINE = 0x6,
    VSS_SPROPID_SERVICE_MACHINE = 0x7,
    VSS_SPROPID_EXPOSED_NAME = 0x8,
    VSS_SPROPID_EXPOSED_PATH = 0x9,
    VSS_SPROPID_PROVIDER_ID = 0xa,
    VSS_SPROPID_SNAPSHOT_ATTRIBUTES = 0xb,
    VSS_SPROPID_CREATION_TIMESTAMP = 0xc,
    VSS_SPROPID_STATUS = 0xd,
  } VSS_SNAPSHOT_PROPERTY_ID;
  typedef enum VSS_WRITERRESTORE_ENUM {
    VSS_WRE_UNDEFINED = 0,
    VSS_WRE_NEVER = 1,
    VSS_WRE_IF_REPLACE_FAILS = 2,
    VSS_WRE_ALWAYS = 3,
  } VSS_WRITERRESTORE_ENUM;
  typedef enum VSS_PROTECTION_LEVEL {
    VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME = 0,
    VSS_PROTECTION_LEVEL_SNAPSHOT = 1,
  } VSS_PROTECTION_LEVEL;
  typedef enum VSS_SOURCE_TYPE {
    VSS_ST_UNDEFINED = 0,
    VSS_ST_TRANSACTEDDB = 1,
    VSS_ST_NONTRANSACTEDDB = 2,
    VSS_ST_OTHER = 3,
  } VSS_SOURCE_TYPE;
  typedef enum VSS_SNAPSHOT_STATE {
    VSS_SS_UNKNOWN = 0,
    VSS_SS_PREPARING = 1,
    VSS_SS_PROCESSING_PREPARE = 2,
    VSS_SS_PREPARED = 3,
    VSS_SS_PROCESSING_PRECOMMIT = 4,
    VSS_SS_PRECOMMITTED = 5,
    VSS_SS_PROCESSING_COMMIT = 6,
    VSS_SS_COMMITTED = 7,
    VSS_SS_PROCESSING_POSTCOMMIT = 8,
    VSS_SS_PROCESSING_PREFINALCOMMIT = 9,
    VSS_SS_PREFINALCOMMITTED = 10,
    VSS_SS_PROCESSING_POSTFINALCOMMIT = 11,
    VSS_SS_CREATED = 12,
    VSS_SS_ABORTED = 13,
    VSS_SS_DELETED = 14,
    VSS_SS_POSTCOMMITTED = 15,
  } VSS_SNAPSHOT_STATE;
  typedef enum VSS_PROTECTION_FAULT {
    VSS_PROTECTION_FAULT_NONE = 0,
    VSS_PROTECTION_FAULT_DIFF_AREA_MISSING = 1,
    VSS_PROTECTION_FAULT_IO_FAILURE_DURING_ONLINE = 2,
    VSS_PROTECTION_FAULT_META_DATA_CORRUPTION = 3,
    VSS_PROTECTION_FAULT_MEMORY_ALLOCATION_FAILURE = 4,
    VSS_PROTECTION_FAULT_MAPPED_MEMORY_FAILURE = 5,
    VSS_PROTECTION_FAULT_COW_READ_FAILURE = 6,
    VSS_PROTECTION_FAULT_COW_WRITE_FAILURE = 7,
    VSS_PROTECTION_FAULT_DIFF_AREA_FULL = 8,
    VSS_PROTECTION_FAULT_GROW_TOO_SLOW = 9,
    VSS_PROTECTION_FAULT_GROW_FAILED = 10,
    VSS_PROTECTION_FAULT_DESTROY_ALL_SNAPSHOTS = 11,
    VSS_PROTECTION_FAULT_FILE_SYSTEM_FAILURE = 12,
    VSS_PROTECTION_FAULT_IO_FAILURE = 13,
    VSS_PROTECTION_FAULT_DIFF_AREA_REMOVED = 14,
    VSS_PROTECTION_FAULT_EXTERNAL_WRITER_TO_DIFF_AREA = 15,
  } VSS_PROTECTION_FAULT;
  typedef enum VSS_MGMT_OBJECT_TYPE {
    VSS_MGMT_OBJECT_UNKNOWN = 0,
    VSS_MGMT_OBJECT_VOLUME = 1,
    VSS_MGMT_OBJECT_DIFF_VOLUME = 2,
    VSS_MGMT_OBJECT_DIFF_AREA = 3,
  } VSS_MGMT_OBJECT_TYPE;
  typedef enum VDS_STORAGE_BUS_TYPE {
    VDSBusTypeUnknown = 0,
    VDSBusTypeScsi = 0x1,
    VDSBusTypeAtapi = 0x2,
    VDSBusTypeAta = 0x3,
    VDSBusType1394 = 0x4,
    VDSBusTypeSsa = 0x5,
    VDSBusTypeFibre = 0x6,
    VDSBusTypeUsb = 0x7,
    VDSBusTypeRAID = 0x8,
    VDSBusTypeiScsi = 0x9,
    VDSBusTypeSas = 0xa,
    VDSBusTypeSata = 0xb,
    VDSBusTypeSd = 0xc,
    VDSBusTypeMmc = 0xd,
    VDSBusTypeMax = 0xe,
    VDSBusTypeFileBackedVirtual = 0xf,
  } VDS_STORAGE_BUS_TYPE;
  typedef enum VDS_INTERCONNECT_ADDRESS_TYPE {
    VDS_IA_UNKNOWN = 0,
    VDS_IA_FCFS = 1,
    VDS_IA_FCPH = 2,
    VDS_IA_FCPH3 = 3,
    VDS_IA_MAC = 4,
    VDS_IA_SCSI = 5,
  } VDS_INTERCONNECT_ADDRESS_TYPE;
  typedef enum VDS_STORAGE_IDENTIFIER_CODE_SET {
    VDSStorageIdCodeSetReserved = 0,
    VDSStorageIdCodeSetBinary = 1,
    VDSStorageIdCodeSetAscii = 2,
    VDSStorageIdCodeSetUtf8 = 3,
  } VDS_STORAGE_IDENTIFIER_CODE_SET;
  typedef enum VDS_STORAGE_IDENTIFIER_TYPE {
    VDSStorageIdTypeVendorSpecific = 0,
    VDSStorageIdTypeVendorId = 1,
    VDSStorageIdTypeEUI64 = 2,
    VDSStorageIdTypeFCPHName = 3,
    VDSStorageIdTypePortRelative = 4,
    VDSStorageIdTypeTargetPortGroup = 5,
    VDSStorageIdTypeLogicalUnitGroup = 6,
    VDSStorageIdTypeMD5LogicalUnitIdentifier = 7,
    VDSStorageIdTypeScsiNameString = 8,
  } VDS_STORAGE_IDENTIFIER_TYPE;
  typedef DWORD VSS_HARDWARE_OPTIONS; //Alias
  typedef DWORD VSS_COMPONENT_FLAGS; //Alias
  typedef DWORD VSS_RECOVERY_OPTIONS; //Alias
  typedef struct VSS_SNAPSHOT_PROP {
    VSS_ID m_SnapshotId;
    VSS_ID m_SnapshotSetId;
    LONG m_lSnapshotsCount;
    VSS_PWSZ m_pwszSnapshotDeviceObject;
    VSS_PWSZ m_pwszOriginalVolumeName;
    VSS_PWSZ m_pwszOriginatingMachine;
    VSS_PWSZ m_pwszServiceMachine;
    VSS_PWSZ m_pwszExposedName;
    VSS_PWSZ m_pwszExposedPath;
    VSS_ID m_ProviderId;
    LONG m_lSnapshotAttributes;
    VSS_TIMESTAMP m_tsCreationTimestamp;
    VSS_SNAPSHOT_STATE m_eStatus;
  } VSS_SNAPSHOT_PROP;
  typedef struct VSS_VOLUME_PROTECTION_INFO {
    VSS_PROTECTION_LEVEL m_protectionLevel;
    BOOL m_volumeIsOfflineForProtection;
    VSS_PROTECTION_FAULT m_protectionFault;
    LONG m_failureStatus;
    BOOL m_volumeHasUnusedDiffArea;
    DWORD m_reserved;
  } VSS_VOLUME_PROTECTION_INFO;
  typedef struct VSS_VOLUME_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszVolumeDisplayName;
  } VSS_VOLUME_PROP;
  typedef struct VSS_DIFF_VOLUME_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszVolumeDisplayName;
    LONGLONG m_llVolumeFreeSpace;
    LONGLONG m_llVolumeTotalSpace;
  } VSS_DIFF_VOLUME_PROP;
  typedef struct VSS_DIFF_AREA_PROP {
    VSS_PWSZ m_pwszVolumeName;
    VSS_PWSZ m_pwszDiffAreaVolumeName;
    LONGLONG m_llMaximumDiffSpace;
    LONGLONG m_llAllocatedDiffSpace;
    LONGLONG m_llUsedDiffSpace;
  } VSS_DIFF_AREA_PROP;
  typedef union VSS_MGMT_OBJECT_UNION {
    VSS_VOLUME_PROP Vol;
    VSS_DIFF_VOLUME_PROP DiffVol;
    VSS_DIFF_AREA_PROP DiffArea;
  } VSS_MGMT_OBJECT_UNION;
  typedef struct VSS_MGMT_OBJECT_PROP {
    VSS_MGMT_OBJECT_TYPE Type;
    VSS_MGMT_OBJECT_UNION Obj;
  } VSS_MGMT_OBJECT_PROP;
  typedef struct VSS_PROVIDER_PROP {
    VSS_ID m_ProviderId;
    VSS_PWSZ m_pwszProviderName;
    VSS_PROVIDER_TYPE m_eProviderType;
    VSS_PWSZ m_pwszProviderVersion;
    VSS_ID m_ProviderVersionId;
    CLSID m_ClassId;
  } VSS_PROVIDER_PROP;
  typedef union VSS_OBJECT_UNION {
    VSS_SNAPSHOT_PROP Snap;
    VSS_PROVIDER_PROP Prov;
  } VSS_OBJECT_UNION;
  typedef struct VSS_OBJECT_PROP {
    VSS_OBJECT_TYPE Type;
    VSS_OBJECT_UNION Obj;
  } VSS_OBJECT_PROP;
  typedef struct VDS_STORAGE_IDENTIFIER {
    VDS_STORAGE_IDENTIFIER_CODE_SET m_CodeSet;
    VDS_STORAGE_IDENTIFIER_TYPE m_Type;
    ULONG m_cbIdentifier;
    BYTE* m_rgbIdentifier;
  } VDS_STORAGE_IDENTIFIER;
  typedef struct VDS_STORAGE_DEVICE_ID_DESCRIPTOR {
    ULONG m_version;
    ULONG m_cIdentifiers;
    VDS_STORAGE_IDENTIFIER* m_rgIdentifiers;
  } VDS_STORAGE_DEVICE_ID_DESCRIPTOR;
  typedef struct VDS_INTERCONNECT {
    VDS_INTERCONNECT_ADDRESS_TYPE m_addressType;
    ULONG m_cbPort;
    BYTE* m_pbPort;
    ULONG m_cbAddress;
    BYTE* m_pbAddress;
  } VDS_INTERCONNECT;
  typedef struct VDS_LUN_INFORMATION {
    ULONG m_version;
    BYTE m_DeviceType;
    BYTE m_DeviceTypeModifier;
    BOOL m_bCommandQueueing;
    VDS_STORAGE_BUS_TYPE m_BusType;
    char* m_szVendorId;
    char* m_szProductId;
    char* m_szProductRevision;
    char* m_szSerialNumber;
    GUID m_diskSignature;
    VDS_STORAGE_DEVICE_ID_DESCRIPTOR m_deviceIdDescriptor;
    ULONG m_cInterconnects;
    VDS_INTERCONNECT* m_rgInterconnects;
  } VDS_LUN_INFORMATION;
  typedef UINT VSS_VOLUME_SNAPSHOT_ATTRIBUTES; //Alias
]]
