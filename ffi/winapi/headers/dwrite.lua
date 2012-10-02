require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDWriteBitmapRenderTarget; //Interface
  typedef void* IDWriteFactory; //Interface
  typedef void* IDWriteFont; //Interface
  typedef void* IDWriteFontCollection; //Interface
  typedef void* IDWriteFontCollectionLoader; //Interface
  typedef void* IDWriteFontFace; //Interface
  typedef void* IDWriteFontFamily; //Interface
  typedef void* IDWriteFontFile; //Interface
  typedef void* IDWriteFontFileEnumerator; //Interface
  typedef void* IDWriteFontFileLoader; //Interface
  typedef void* IDWriteFontFileStream; //Interface
  typedef void* IDWriteFontList; //Interface
  typedef void* IDWriteGdiInterop; //Interface
  typedef void* IDWriteGlyphRunAnalysis; //Interface
  typedef void* IDWriteInlineObject; //Interface
  typedef void* IDWriteLocalFontFileLoader; //Interface
  typedef void* IDWriteLocalizedStrings; //Interface
  typedef void* IDWritePixelSnapping; //Interface
  typedef void* IDWriteRenderingParams; //Interface
  typedef void* IDWriteTextAnalyzer; //Interface
  typedef void* IDWriteTextFormat; //Interface
  typedef void* IDWriteTextLayout; //Interface
  typedef void* IDWriteTextRenderer; //Interface
  typedef void* IDWriteTypography; //Interface
  typedef IDWriteFontFile** IDWriteFontFile* const*; //Alias
  typedef void* IDWriteTextAnalysisSource; //Interface
  typedef void* IDWriteNumberSubstitution; //Interface
  typedef void* IDWriteGeometrySink; //Interface
  typedef void* IDWriteTextAnalysisSink; //Interface
  typedef LPVOID DWRITE_CLUSTER_METRICS*; //Alias
  typedef LPVOID DWRITE_SHAPING_TEXT_PROPERTIES*; //Alias
  typedef LPVOID DWRITE_SHAPING_GLYPH_PROPERTIES*; //Alias
  typedef LPVOID DWRITE_SHAPING_GLYPH_PROPERTIES const*; //Alias
  typedef UINT16 *UINT16 const*; //Pointer
  typedef UINT32 *UINT32 const*; //Pointer
  typedef FLOAT *FLOAT const*; //Pointer
  typedef void *void const*; //Pointer
  typedef RECT *RECT const*; //Pointer
  typedef LOGFONTW* LOGFONTW const*; //Alias
  typedef struct DWRITE_GLYPH_OFFSET {
    FLOAT advanceOffset;
    FLOAT ascenderOffset;
  } DWRITE_GLYPH_OFFSET;
  typedef DWRITE_GLYPH_OFFSET *DWRITE_GLYPH_OFFSET const*; //Pointer
  typedef struct DWRITE_GLYPH_RUN {
    IDWriteFontFace* fontFace;
    FLOAT fontEmSize;
    UINT32 glyphCount;
    UINT16 const* glyphIndices;
    FLOAT const* glyphAdvances;
    DWRITE_GLYPH_OFFSET const* glyphOffsets;
    BOOL isSideways;
    UINT32 bidiLevel;
  } DWRITE_GLYPH_RUN;
  typedef DWRITE_GLYPH_RUN *WINAPI_DWRITE_GLYPH_RUN*; //Pointer
  typedef DWRITE_GLYPH_RUN *DWRITE_GLYPH_RUN const*; //Pointer
  typedef enum DWRITE_FACTORY_TYPE {
    DWRITE_FACTORY_TYPE_SHARED = 0,
    DWRITE_FACTORY_TYPE_ISOLATED = 1,
  } DWRITE_FACTORY_TYPE;
  typedef struct DWRITE_MATRIX {
    FLOAT m11;
    FLOAT m12;
    FLOAT m21;
    FLOAT m22;
    FLOAT dx;
    FLOAT dy;
  } DWRITE_MATRIX;
  typedef DWRITE_MATRIX *DWRITE_MATRIX const*; //Pointer
  typedef enum DWRITE_FONT_FACE_TYPE {
    DWRITE_FONT_FACE_TYPE_CFF = 0,
    DWRITE_FONT_FACE_TYPE_TRUETYPE = 1,
    DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION = 2,
    DWRITE_FONT_FACE_TYPE_TYPE1 = 3,
    DWRITE_FONT_FACE_TYPE_VECTOR = 4,
    DWRITE_FONT_FACE_TYPE_BITMAP = 5,
    DWRITE_FONT_FACE_TYPE_UNKNOWN = 6,
  } DWRITE_FONT_FACE_TYPE;
  typedef enum DWRITE_PIXEL_GEOMETRY {
    DWRITE_PIXEL_GEOMETRY_FLAT = 0,
    DWRITE_PIXEL_GEOMETRY_RGB = 1,
    DWRITE_PIXEL_GEOMETRY_BGR = 2,
  } DWRITE_PIXEL_GEOMETRY;
  typedef enum DWRITE_FONT_WEIGHT {
    DWRITE_FONT_WEIGHT_THIN = 100,
    DWRITE_FONT_WEIGHT_EXTRA_LIGHT = 200,
    DWRITE_FONT_WEIGHT_LIGHT = 300,
    DWRITE_FONT_WEIGHT_NORMAL = 400,
    DWRITE_FONT_WEIGHT_MEDIUM = 500,
    DWRITE_FONT_WEIGHT_SEMI_BOLD = 600,
    DWRITE_FONT_WEIGHT_BOLD = 700,
    DWRITE_FONT_WEIGHT_EXTRA_BOLD = 800,
    DWRITE_FONT_WEIGHT_BLACK = 900,
    DWRITE_FONT_WEIGHT_EXTRA_BLACK = 950,
  } DWRITE_FONT_WEIGHT;
  typedef enum DWRITE_NUMBER_SUBSTITUTION_METHOD {
    DWRITE_NUMBER_SUBSTITUTION_METHOD_FROM_CULTURE = 0,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_CONTEXTUAL = 1,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_NONE = 2,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_NATIONAL = 3,
    DWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL = 4,
  } DWRITE_NUMBER_SUBSTITUTION_METHOD;
  typedef enum DWRITE_FONT_STRETCH {
    DWRITE_FONT_STRETCH_UNDEFINED = 0,
    DWRITE_FONT_STRETCH_ULTRA_CONDENSED = 1,
    DWRITE_FONT_STRETCH_EXTRA_CONDENSED = 2,
    DWRITE_FONT_STRETCH_CONDENSED = 3,
    DWRITE_FONT_STRETCH_SEMI_CONDENSED = 4,
    DWRITE_FONT_STRETCH_NORMAL = 5,
    DWRITE_FONT_STRETCH_SEMI_EXPANDED = 6,
    DWRITE_FONT_STRETCH_EXPANDED = 7,
    DWRITE_FONT_STRETCH_EXTRA_EXPANDED = 8,
    DWRITE_FONT_STRETCH_ULTRA_EXPANDED = 9,
  } DWRITE_FONT_STRETCH;
  typedef enum DWRITE_FONT_STYLE {
    DWRITE_FONT_STYLE_NORMAL = 0,
    DWRITE_FONT_STYLE_OBLIQUE = 1,
    DWRITE_FONT_STYLE_ITALIC = 2,
  } DWRITE_FONT_STYLE;
  typedef enum DWRITE_INFORMATIONAL_STRING_ID {
    DWRITE_INFORMATIONAL_STRING_NONE = 0,
    DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE = 1,
    DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS = 2,
    DWRITE_INFORMATIONAL_STRING_TRADEMARK = 3,
    DWRITE_INFORMATIONAL_STRING_MANUFACTURER = 4,
    DWRITE_INFORMATIONAL_STRING_DESIGNER = 5,
    DWRITE_INFORMATIONAL_STRING_DESIGNER_URL = 6,
    DWRITE_INFORMATIONAL_STRING_DESCRIPTION = 7,
    DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL = 8,
    DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION = 9,
    DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL = 10,
    DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES = 11,
    DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES = 12,
    DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES = 13,
    DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES = 14,
    DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT = 15,
  } DWRITE_INFORMATIONAL_STRING_ID;
  typedef UINT DWRITE_FONT_SIMULATIONS; //Alias
  typedef struct DWRITE_FONT_METRICS {
    UINT16 designUnitsPerEm;
    UINT16 ascent;
    UINT16 descent;
    INT16 lineGap;
    UINT16 capHeight;
    UINT16 xHeight;
    INT16 underlinePosition;
    UINT16 underlineThickness;
    INT16 strikethroughPosition;
    UINT16 strikethroughThickness;
  } DWRITE_FONT_METRICS;
  typedef enum DWRITE_RENDERING_MODE {
    DWRITE_RENDERING_MODE_DEFAULT = 0,
    DWRITE_RENDERING_MODE_ALIASED = 1,
    DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC = 2,
    DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL = 3,
    DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL = 4,
    DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC = 5,
    DWRITE_RENDERING_MODE_OUTLINE = 6,
  } DWRITE_RENDERING_MODE;
  typedef enum DWRITE_FONT_FILE_TYPE {
    DWRITE_FONT_FILE_TYPE_UNKNOWN = 0,
    DWRITE_FONT_FILE_TYPE_CFF = 1,
    DWRITE_FONT_FILE_TYPE_TRUETYPE = 2,
    DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION = 3,
    DWRITE_FONT_FILE_TYPE_TYPE1_PFM = 4,
    DWRITE_FONT_FILE_TYPE_TYPE1_PFB = 5,
    DWRITE_FONT_FILE_TYPE_VECTOR = 6,
    DWRITE_FONT_FILE_TYPE_BITMAP = 7,
  } DWRITE_FONT_FILE_TYPE;
  typedef enum DWRITE_TEXTURE_TYPE {
    DWRITE_TEXTURE_ALIASED_1x1 = 0,
    DWRITE_TEXTURE_CLEARTYPE_3x1 = 1,
  } DWRITE_TEXTURE_TYPE;
  typedef struct DWRITE_INLINE_OBJECT_METRICS {
    FLOAT width;
    FLOAT height;
    FLOAT baseline;
    BOOL supportsSideways;
  } DWRITE_INLINE_OBJECT_METRICS;
  typedef struct DWRITE_OVERHANG_METRICS {
    FLOAT left;
    FLOAT top;
    FLOAT right;
    FLOAT bottom;
  } DWRITE_OVERHANG_METRICS;
  typedef enum DWRITE_BREAK_CONDITION {
    DWRITE_BREAK_CONDITION_NEUTRAL = 0,
    DWRITE_BREAK_CONDITION_CAN_BREAK = 1,
    DWRITE_BREAK_CONDITION_MAY_NOT_BREAK = 2,
    DWRITE_BREAK_CONDITION_MUST_BREAK = 3,
  } DWRITE_BREAK_CONDITION;
  typedef UINT DWRITE_SCRIPT_SHAPES; //Alias
  typedef struct DWRITE_SCRIPT_ANALYSIS {
    UINT16 script;
    DWRITE_SCRIPT_SHAPES shapes;
  } DWRITE_SCRIPT_ANALYSIS;
  typedef DWRITE_SCRIPT_ANALYSIS *DWRITE_SCRIPT_ANALYSIS const*; //Pointer
  typedef enum DWRITE_TEXT_ALIGNMENT {
    DWRITE_TEXT_ALIGNMENT_LEADING = 0,
    DWRITE_TEXT_ALIGNMENT_TRAILING = 1,
    DWRITE_TEXT_ALIGNMENT_CENTER = 2,
  } DWRITE_TEXT_ALIGNMENT;
  typedef enum DWRITE_PARAGRAPH_ALIGNMENT {
    DWRITE_PARAGRAPH_ALIGNMENT_NEAR = 0,
    DWRITE_PARAGRAPH_ALIGNMENT_FAR = 1,
    DWRITE_PARAGRAPH_ALIGNMENT_CENTER = 2,
  } DWRITE_PARAGRAPH_ALIGNMENT;
  typedef enum DWRITE_WORD_WRAPPING {
    DWRITE_WORD_WRAPPING_WRAP = 0,
    DWRITE_WORD_WRAPPING_NO_WRAP = 1,
  } DWRITE_WORD_WRAPPING;
  typedef enum DWRITE_READING_DIRECTION {
    DWRITE_READING_DIRECTION_LEFT_TO_RIGHT = 0,
    DWRITE_READING_DIRECTION_RIGHT_TO_LEFT = 1,
  } DWRITE_READING_DIRECTION;
  typedef enum DWRITE_FLOW_DIRECTION {
    DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM = 0,
  } DWRITE_FLOW_DIRECTION;
  typedef enum DWRITE_TRIMMING_GRANULARITY {
    DWRITE_TRIMMING_GRANULARITY_NONE = 0,
    DWRITE_TRIMMING_GRANULARITY_CHARACTER = 1,
    DWRITE_TRIMMING_GRANULARITY_WORD = 2,
  } DWRITE_TRIMMING_GRANULARITY;
  typedef struct DWRITE_TRIMMING {
    DWRITE_TRIMMING_GRANULARITY granularity;
    UINT32 delimiter;
    UINT32 delimiterCount;
  } DWRITE_TRIMMING;
  typedef DWRITE_TRIMMING *DWRITE_TRIMMING const*; //Pointer
  typedef enum DWRITE_LINE_SPACING_METHOD {
    DWRITE_LINE_SPACING_METHOD_DEFAULT = 0,
    DWRITE_LINE_SPACING_METHOD_UNIFORM = 1,
  } DWRITE_LINE_SPACING_METHOD;
  typedef struct DWRITE_TEXT_RANGE {
    UINT32 startPosition;
    UINT32 length;
  } DWRITE_TEXT_RANGE;
  typedef struct DWRITE_LINE_METRICS {
    UINT32 length;
    UINT32 trailingWhitespaceLength;
    UINT32 newlineLength;
    FLOAT height;
    FLOAT baseline;
    BOOL isTrimmed;
  } DWRITE_LINE_METRICS;
  typedef struct DWRITE_TEXT_METRICS {
    FLOAT left;
    FLOAT top;
    FLOAT width;
    FLOAT widthIncludingTrailingWhitespace;
    FLOAT height;
    FLOAT layoutWidth;
    FLOAT layoutHeight;
    UINT32 maxBidiReorderingDepth;
    UINT32 lineCount;
  } DWRITE_TEXT_METRICS;
  typedef struct DWRITE_HIT_TEST_METRICS {
    UINT32 textPosition;
    UINT32 length;
    FLOAT left;
    FLOAT top;
    FLOAT width;
    FLOAT height;
    UINT32 bidiLevel;
    BOOL isText;
    BOOL isTrimmed;
  } DWRITE_HIT_TEST_METRICS;
  typedef enum DWRITE_MEASURING_MODE {
    DWRITE_MEASURING_MODE_NATURAL = 0,
    DWRITE_MEASURING_MODE_GDI_CLASSIC = 1,
    DWRITE_MEASURING_MODE_GDI_NATURAL = 2,
  } DWRITE_MEASURING_MODE;
  typedef struct DWRITE_UNDERLINE {
    FLOAT width;
    FLOAT thickness;
    FLOAT offset;
    FLOAT runHeight;
    DWRITE_READING_DIRECTION readingDirection;
    DWRITE_FLOW_DIRECTION flowDirection;
    WCHAR const* localeName;
    DWRITE_MEASURING_MODE measuringMode;
  } DWRITE_UNDERLINE;
  typedef DWRITE_UNDERLINE *DWRITE_UNDERLINE const*; //Pointer
  typedef struct DWRITE_STRIKETHROUGH {
    FLOAT width;
    FLOAT thickness;
    FLOAT offset;
    DWRITE_READING_DIRECTION readingDirection;
    DWRITE_FLOW_DIRECTION flowDirection;
    WCHAR const* localeName;
    DWRITE_MEASURING_MODE measuringMode;
  } DWRITE_STRIKETHROUGH;
  typedef DWRITE_STRIKETHROUGH *DWRITE_STRIKETHROUGH const*; //Pointer
  typedef enum DWRITE_FONT_FEATURE_TAG {
    DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS = 0x63726661,
    DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS = 0x63703263,
    DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS = 0x63733263,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES = 0x746c6163,
    DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS = 0x65736163,
    DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION = 0x706d6363,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES = 0x67696c63,
    DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING = 0x70737063,
    DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH = 0x68777363,
    DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING = 0x73727563,
    DWRITE_FONT_FEATURE_TAG_DEFAULT = 0x746c6664,
    DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES = 0x67696c64,
    DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS = 0x74707865,
    DWRITE_FONT_FEATURE_TAG_FRACTIONS = 0x63617266,
    DWRITE_FONT_FEATURE_TAG_FULL_WIDTH = 0x64697766,
    DWRITE_FONT_FEATURE_TAG_HALF_FORMS = 0x666c6168,
    DWRITE_FONT_FEATURE_TAG_HALANT_FORMS = 0x6e6c6168,
    DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH = 0x746c6168,
    DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS = 0x74736968,
    DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES = 0x616e6b68,
    DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES = 0x67696c68,
    DWRITE_FONT_FEATURE_TAG_HALF_WIDTH = 0x64697768,
    DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS = 0x6f6a6f68,
    DWRITE_FONT_FEATURE_TAG_JIS04_FORMS = 0x3430706a,
    DWRITE_FONT_FEATURE_TAG_JIS78_FORMS = 0x3837706a,
    DWRITE_FONT_FEATURE_TAG_JIS83_FORMS = 0x3338706a,
    DWRITE_FONT_FEATURE_TAG_JIS90_FORMS = 0x3039706a,
    DWRITE_FONT_FEATURE_TAG_KERNING = 0x6e72656b,
    DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES = 0x6167696c,
    DWRITE_FONT_FEATURE_TAG_LINING_FIGURES = 0x6d756e6c,
    DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS = 0x6c636f6c,
    DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING = 0x6b72616d,
    DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK = 0x6b72676d,
    DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING = 0x6b6d6b6d,
    DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS = 0x746c616e,
    DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS = 0x6b636c6e,
    DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES = 0x6d756e6f,
    DWRITE_FONT_FEATURE_TAG_ORDINALS = 0x6e64726f,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH = 0x746c6170,
    DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS = 0x70616370,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES = 0x6d756e70,
    DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS = 0x64697770,
    DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS = 0x64697771,
    DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES = 0x67696c72,
    DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS = 0x79627572,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES = 0x746c6173,
    DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS = 0x666e6973,
    DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS = 0x70636d73,
    DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS = 0x6c706d73,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1 = 0x31307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2 = 0x32307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3 = 0x33307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4 = 0x34307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5 = 0x35307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6 = 0x36307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7 = 0x37307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8 = 0x38307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9 = 0x39307373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10 = 0x30317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11 = 0x31317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12 = 0x32317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13 = 0x33317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14 = 0x34317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15 = 0x35317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16 = 0x36317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17 = 0x37317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18 = 0x38317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19 = 0x39317373,
    DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20 = 0x30327373,
    DWRITE_FONT_FEATURE_TAG_SUBSCRIPT = 0x73627573,
    DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT = 0x73707573,
    DWRITE_FONT_FEATURE_TAG_SWASH = 0x68737773,
    DWRITE_FONT_FEATURE_TAG_TITLING = 0x6c746974,
    DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS = 0x6d616e74,
    DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES = 0x6d756e74,
    DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS = 0x64617274,
    DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS = 0x64697774,
    DWRITE_FONT_FEATURE_TAG_UNICASE = 0x63696e75,
    DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO = 0x6f72657a,
  } DWRITE_FONT_FEATURE_TAG;
  typedef struct DWRITE_FONT_FEATURE {
    DWRITE_FONT_FEATURE_TAG nameTag;
    UINT32 parameter;
  } DWRITE_FONT_FEATURE;
  typedef struct DWRITE_GLYPH_METRICS {
    INT32 leftSideBearing;
    UINT32 advanceWidth;
    INT32 rightSideBearing;
    INT32 topSideBearing;
    UINT32 advanceHeight;
    INT32 bottomSideBearing;
    INT32 verticalOriginY;
  } DWRITE_GLYPH_METRICS;
  typedef struct DWRITE_TYPOGRAPHIC_FEATURES {
    DWRITE_FONT_FEATURE* features;
    UINT32 featureCount;
  } DWRITE_TYPOGRAPHIC_FEATURES;
  typedef DWRITE_TYPOGRAPHIC_FEATURES* *DWRITE_TYPOGRAPHIC_FEATURES const**; //Pointer
  typedef struct DWRITE_GLYPH_RUN_DESCRIPTION {
    WCHAR const* localeName;
    WCHAR const* string;
    UINT32 stringLength;
    UINT16 const* clusterMap;
    UINT32 textPosition;
  } DWRITE_GLYPH_RUN_DESCRIPTION;
  typedef DWRITE_GLYPH_RUN_DESCRIPTION *DWRITE_GLYPH_RUN_DESCRIPTION const*; //Pointer
]]
