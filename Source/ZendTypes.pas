{*******************************************************}
{                     PHP4Delphi                        }
{               ZEND - Delphi interface                 }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.telenet.be/ws36637                       }
{*******************************************************}
{$I PHP.INC}

{ $Id: ZendTypes.pas,v 7.4 10/2009 delphi32 Exp $ }

unit ZENDTypes;

interface

uses
  {$IFNDEF FPC} Windows {$ELSE} LCLType{$ENDIF}, SysUtils;

const
  //zend.h
  ZEND_MAX_RESERVED_RESOURCES = 4;

{$IFDEF PHP530}
{$IFDEF ZTS}
const ZEND_BUILD_TS  = ',TS';
{$ELSE}
const ZEND_BUILD_TS  = ',NTS';
{$ENDIF}

{$IFDEF ZEND_DEBUG}
const ZEND_BUILD_DEBUG  = ',debug';
{$ELSE}
const ZEND_BUILD_DEBUG  = '';
{$ENDIF}

const ZEND_BUILD_SYSTEM  =
{$IFDEF PHP_COMPILER_ID}
{$if defined(COMPILER_VC14)}',VC14'
{$elseif COMPILER_VC13} ',VC13'
{$elseif COMPILER_VC12} ',VC12'
{$elseif COMPILER_VC11} ',VC11'
{$elseif COMPILER_VC10} ',VC10'
{$elseif COMPILER_VC9}  ',VC9'
{$elseif COMPILER_VC6}  ',VC6'
{$else}', $DEFINE COMPILER_VCx directive error. See PHP.INC for more details'
{$ifend}
{$else}
', $DEFINE COMPILER_VCx directive error. See PHP.INC for more details'
{$endif};
{$ENDIF}


  //zend_vm_opcodes.h
const
  ZEND_NOP                                        = 0;
  ZEND_ADD                                        = 1;
  ZEND_SUB                                        = 2;
  ZEND_MUL                                        = 3;
  ZEND_DIV                                        = 4;
  ZEND_MOD                                        = 5;
  ZEND_SL                                         = 6;
  ZEND_SR                                         = 7;
  ZEND_CONCAT                                     = 8;
  ZEND_BW_OR                                      = 9;
  ZEND_BW_AND                                     = 10;
  ZEND_BW_XOR                                     = 11;
  ZEND_BW_NOT                                     = 12;
  ZEND_BOOL_NOT                                   = 13;
  ZEND_BOOL_XOR                                   = 14;
  ZEND_IS_IDENTICAL                               = 15;
  ZEND_IS_NOT_IDENTICAL                           = 16;
  ZEND_IS_EQUAL                                   = 17;
  ZEND_IS_NOT_EQUAL                               = 18;
  ZEND_IS_SMALLER                                 = 19;
  ZEND_IS_SMALLER_OR_EQUAL                        = 20;
  ZEND_CAST                                       = 21;
  ZEND_QM_ASSIGN                                  = 22;
  ZEND_ASSIGN_ADD                                 = 23;
  ZEND_ASSIGN_SUB                                 = 24;
  ZEND_ASSIGN_MUL                                 = 25;
  ZEND_ASSIGN_DIV                                 = 26;
  ZEND_ASSIGN_MOD                                 = 27;
  ZEND_ASSIGN_SL                                  = 28;
  ZEND_ASSIGN_SR                                  = 29;
  ZEND_ASSIGN_CONCAT                              = 30;
  ZEND_ASSIGN_BW_OR                               = 31;
  ZEND_ASSIGN_BW_AND                              = 32;
  ZEND_ASSIGN_BW_XOR                              = 33;
  ZEND_PRE_INC                                    = 34;
  ZEND_PRE_DEC                                    = 35;
  ZEND_POST_INC                                   = 36;
  ZEND_POST_DEC                                   = 37;
  ZEND_ASSIGN                                     = 38;
  ZEND_ASSIGN_REF                                 = 39;
  ZEND_ECHO                                       = 40;
  ZEND_PRINT                                      = 41;
  ZEND_JMP                                        = 42;
  ZEND_JMPZ                                       = 43;
  ZEND_JMPNZ                                      = 44;
  ZEND_JMPZNZ                                     = 45;
  ZEND_JMPZ_EX                                    = 46;
  ZEND_JMPNZ_EX                                   = 47;
  ZEND_CASE                                       = 48;
  ZEND_SWITCH_FREE                                = 49;
  ZEND_BRK                                        = 50;
  ZEND_CONT                                       = 51;
  ZEND_BOOLEAN                                    = 52; //original ZEND_BOOL
  ZEND_INIT_STRING                                = 53;
  ZEND_ADD_CHAR                                   = 54;
  ZEND_ADD_STRING                                 = 55;
  ZEND_ADD_VAR                                    = 56;
  ZEND_BEGIN_SILENCE                              = 57;
  ZEND_END_SILENCE                                = 58;
  ZEND_INIT_FCALL_BY_NAME                         = 59;
  ZEND_DO_FCALL                                   = 60;
  ZEND_DO_FCALL_BY_NAME                           = 61;
  ZEND_RETURN                                     = 62;
  ZEND_RECV                                       = 63;
  ZEND_RECV_INIT                                  = 64;
  ZEND_SEND_VAL                                   = 65;
  ZEND_SEND_VAR                                   = 66;
  ZEND_SEND_REF                                   = 67;
  ZEND_NEW                                        = 68;
  ZEND_JMP_NO_CTOR                                = 69;
  ZEND_FREE                                       = 70;
  ZEND_INIT_ARRAY                                 = 71;
  ZEND_ADD_ARRAY_ELEMENT                          = 72;
  ZEND_INCLUDE_OR_EVAL                            = 73;
  ZEND_UNSET_VAR                                  = 74;
  ZEND_UNSET_DIM_OBJ                              = 75;
  ZEND_ISSET_ISEMPTY                              = 76;
  ZEND_FE_RESET                                   = 77;
  ZEND_FE_FETCH                                   = 78;
  ZEND_EXIT                                       = 79;
  ZEND_FETCH_R                                    = 80;
  ZEND_FETCH_DIM_R                                = 81;
  ZEND_FETCH_OBJ_R                                = 82;
  ZEND_FETCH_W                                    = 83;
  ZEND_FETCH_DIM_W                                = 84;
  ZEND_FETCH_OBJ_W                                = 85;
  ZEND_FETCH_RW                                   = 86;
  ZEND_FETCH_DIM_RW                               = 87;
  ZEND_FETCH_OBJ_RW                               = 88;
  ZEND_FETCH_IS                                   = 89;
  ZEND_FETCH_DIM_IS                               = 90;
  ZEND_FETCH_OBJ_IS                               = 91;
  ZEND_FETCH_FUNC_ARG                             = 92;
  ZEND_FETCH_DIM_FUNC_ARG                         = 93;
  ZEND_FETCH_OBJ_FUNC_ARG                         = 94;
  ZEND_FETCH_UNSET                                = 95;
  ZEND_FETCH_DIM_UNSET                            = 96;
  ZEND_FETCH_OBJ_UNSET                            = 97;
  ZEND_FETCH_DIM_TMP_VAR                          = 98;
  ZEND_FETCH_CONSTANT                             = 99;
  ZEND_DECLARE_FUNCTION_OR_CLASS                  = 100;
  ZEND_EXT_STMT                                   = 101;
  ZEND_EXT_FCALL_BEGIN                            = 102;
  ZEND_EXT_FCALL_END                              = 103;
  ZEND_EXT_NOP                                    = 104;
  ZEND_TICKS                                      = 105;
  ZEND_SEND_VAR_NO_REF                            = 106;
{$IFDEF PHP511}
  ZEND_CATCH                                      = 107;
  ZEND_THROW                                      = 108;
  ZEND_FETCH_CLASS                                = 109;
  ZEND_CLONE                                      = 110;
  ZEND_INIT_METHOD_CALL                           = 112;
  ZEND_INIT_STATIC_METHOD_CALL                    = 113;
  ZEND_ISSET_ISEMPTY_VAR                          = 114;
  ZEND_ISSET_ISEMPTY_DIM_OBJ                      = 115;
  ZEND_PRE_INC_OBJ                                = 132;
  ZEND_PRE_DEC_OBJ                                = 133;
  ZEND_POST_INC_OBJ                               = 134;
  ZEND_POST_DEC_OBJ                               = 135;
  ZEND_ASSIGN_OBJ                                 = 136;
  ZEND_INSTANCEOF                                 = 138;
  ZEND_DECLARE_CLASS                              = 139;
  ZEND_DECLARE_INHERITED_CLASS                    = 140;
  ZEND_DECLARE_FUNCTION                           = 141;
  ZEND_RAISE_ABSTRACT_ERROR                       = 142;
  ZEND_ADD_INTERFACE                              = 144;
  ZEND_VERIFY_ABSTRACT_CLASS                      = 146;
  ZEND_ASSIGN_DIM                                 = 147;
  ZEND_ISSET_ISEMPTY_PROP_OBJ                     = 148;
  ZEND_HANDLE_EXCEPTION                           = 149;
  ZEND_USER_OPCODE                                = 150;
{$ENDIF}

  { end of block }

  { global/local fetches }

const
  ZEND_FETCH_GLOBAL           = 0;
  ZEND_FETCH_LOCAL            = 1;
  ZEND_FETCH_STATIC           = 2;
{$IFDEF PHP511}
  ZEND_FETCH_STATIC_MEMBER    =	3;
  ZEND_FETCH_GLOBAL_LOCK      = 4;

  ZEND_FETCH_CLASS_DEFAULT = 0;
  ZEND_FETCH_CLASS_SELF	   = 1;
  ZEND_FETCH_CLASS_PARENT  = 2;
  ZEND_FETCH_CLASS_MAIN    = 3;
  ZEND_FETCH_CLASS_GLOBAL  = 4;
  ZEND_FETCH_CLASS_AUTO    = 5;
  ZEND_FETCH_CLASS_INTERFACE = 6;
  ZEND_FETCH_CLASS_NO_AUTOLOAD = $80;
{$ENDIF}

  { var status for backpatching }

const
  BP_VAR_R                                        = 0;
  BP_VAR_W                                        = 1;
  BP_VAR_RW                                       = 2;
  BP_VAR_IS                                       = 3;
  BP_VAR_NA                                       = 4       { if not applicable }
  ;
  BP_VAR_FUNC_ARG                                 = 5;
  BP_VAR_UNSET                                    = 6;
  ZEND_INTERNAL_FUNCTION                          = 1;
  ZEND_USER_FUNCTION                              = 2;
  ZEND_OVERLOADED_FUNCTION                        = 3;
  ZEND_EVAL_CODE                                  = 4;
  ZEND_INTERNAL_CLASS                             = 1;
  ZEND_USER_CLASS                                 = 2;
  ZEND_EVAL                                       = (1 shl 0);
  ZEND_INCLUDE                                    = (1 shl 1);
  ZEND_INCLUDE_ONCE                               = (1 shl 2);
  ZEND_REQUIRE                                    = (1 shl 3);
  ZEND_REQUIRE_ONCE                               = (1 shl 4);
  ZEND_ISSET                                      = (1 shl 0);
  ZEND_ISEMPTY                                    = (1 shl 1);
  ZEND_CT                                         = (1 shl 0);
  ZEND_RT                                         = (1 shl 1);

{$IFDEF PHP530}
type
zend_stream_type = (
	ZEND_HANDLE_FILENAME,
	ZEND_HANDLE_FD,
	ZEND_HANDLE_FP,
	ZEND_HANDLE_STREAM,
	ZEND_HANDLE_MAPPED);
{$ELSE}
const
  ZEND_HANDLE_FILENAME                            = 0;
  ZEND_HANDLE_FD                                  = 1;
  ZEND_HANDLE_FP                                  = 2;
  ZEND_HANDLE_STDIOSTREAM                         = 3;
  ZEND_HANDLE_FSTREAM                             = 4;

  {$IFDEF PHP5}
  ZEND_HANDLE_STREAM                              = 5;
  {$ENDIF}
{$ENDIF}

const
  ZEND_FETCH_STANDARD                             = 0;
  ZEND_FETCH_ADD_LOCK                             = 1;
  ZEND_MEMBER_FUNC_CALL                           = 1 shl 0;
  ZEND_CTOR_CALL                                  = 1 shl 1;
  ZEND_ARG_SEND_BY_REF                            = (1 shl 0);
  ZEND_ARG_COMPILE_TIME_BOUND                     = (1 shl 1);
  ZEND_RETURN_VAL                                 = 0;
  ZEND_RETURN_REF                                 = 1;

  //zend_errors.h
const
  E_ERROR                                         = (1 shl 0);
  E_WARNING                                       = (1 shl 1);
  E_PARSE                                         = (1 shl 2);
  E_NOTICE                                        = (1 shl 3);
  E_CORE_ERROR                                    = (1 shl 4);
  E_CORE_WARNING                                  = (1 shl 5);
  E_COMPILE_ERROR                                 = (1 shl 6);
  E_COMPILE_WARNING                               = (1 shl 7);
  E_USER_ERROR                                    = (1 shl 8);
  E_USER_WARNING                                  = (1 shl 9);
  E_USER_NOTICE                                   = (1 shl 10);
  E_STRICT                                        = (1 shl 11);
  E_RECOVERABLE_ERROR                             = (1 shl 12);
  E_ALL = (E_ERROR or E_WARNING or E_PARSE or E_NOTICE or E_CORE_ERROR or E_CORE_WARNING or E_COMPILE_ERROR or E_COMPILE_WARNING or E_USER_ERROR or E_USER_WARNING or E_USER_NOTICE or E_RECOVERABLE_ERROR);
  E_CORE                                          = (E_CORE_ERROR or E_CORE_WARNING);

  //zend.h
  //data types
{$IFDEF PHP510}
const
  IS_NULL = 0;
  IS_LONG = 1;
  IS_DOUBLE = 2;
  IS_BOOL = 3;
  IS_ARRAY = 4;
  IS_OBJECT = 5;
  IS_STRING= 6;
  IS_RESOURCE = 7;
  IS_CONSTANT = 8;
  IS_CONSTANT_ARRAY = 9;
{$ELSE}
const
  IS_NULL                                         = 0;
  IS_LONG                                         = 1;
  IS_DOUBLE                                       = 2;
  IS_STRING                                       = 3;
  IS_ARRAY                                        = 4;
  IS_OBJECT                                       = 5;
  IS_BOOL                                         = 6;
  IS_RESOURCE                                     = 7;
  IS_CONSTANT                                     = 8;
  IS_CONSTANT_ARRAY                               = 9;
{$ENDIF}

  ZEND_PATHS_SEPARATOR                            = ';';
  SUCCESS                                         = 0;
  FAILURE                                         = -1;     { this MUST stay a negative number, or it may affect functions! }

  //zend_modules.h
const
   ZEND_MODULE_API_NO_700 = 20151012;
   ZEND_MODULE_API_NO_560 = 20131226;
   ZEND_MODULE_API_NO_550 = 20121212;
   ZEND_MODULE_API_NO_540 = 20100525;
   ZEND_MODULE_API_NO_530 = 20090626;
   ZEND_MODULE_API_NO_520 = 20060613;
   ZEND_MODULE_API_NO_511 = 20050922;
   ZEND_MODULE_API_NO_510 = 20050617;
   ZEND_MODULE_API_NO_504 = 20041030;
   ZEND_MODULE_API_NO_500 = 20040412;
   
   ZEND_MODULE_API_NO =
   {$ifdef PHP700}20151012
   {$elseif defined(PHP560)}20131226
   {$elseif defined(PHP550)}20121212
   {$elseif defined(PHP540)}20100525
   {$elseif defined(PHP530)}20090626
   {$elseif defined(PHP520)}20060613
   {$elseif defined(PHP512)}20050922
   {$elseif defined(PHP511)}20050922
   {$elseif defined(PHP510)}20050617
   {$elseif defined(PHP504)}20041030
   {$else}20040412
   {$ifend};

const
  USING_ZTS   = 
  {$ifdef ZTS}1
  {$else}0
  {$endif};


const
  NO_VERSION_YET                                  = nil;
  MODULE_PERSISTENT                               = 1;
  MODULE_TEMPORARY                                = 2;

  //zend_alloc.h
const
  MEM_BLOCK_START_MAGIC                           = $7312F8DC;
  MEM_BLOCK_END_MAGIC                             = $2A8FCC84;
  MEM_BLOCK_FREED_MAGIC                           = $99954317;
  MEM_BLOCK_CACHED_MAGIC                          = $FB8277DC;


const
  MAX_CACHED_MEMORY                               = 11;
  MAX_CACHED_ENTRIES                              = 256;
  PRE_INIT_CACHE_ENTRIES                          = 32;

  //zend_hash.h
const
  HASH_KEY_IS_STRING                              = 1;
  HASH_KEY_IS_LONG                                = 2;
  HASH_KEY_NON_EXISTANT                           = 3;
  HASH_UPDATE                                     = (1 shl 0);
  HASH_ADD                                        = (1 shl 1);
  HASH_NEXT_INSERT                                = (1 shl 2);
  HASH_DEL_KEY                                    = 0;
  HASH_DEL_INDEX                                  = 1;

const
 ZEND_RESOURCE_LIST_TYPE_STD  = 1;
 ZEND_RESOURCE_LIST_TYPE_EX	 = 2;

const
  ZEND_HASH_APPLY_KEEP                            = 0;
  ZEND_HASH_APPLY_REMOVE                          = 1 shl 0;
  ZEND_HASH_APPLY_STOP                            = 1 shl 1;

  //zend_constants.h
const
  CONST_CS                                        = (1 shl 0) { Case Sensitive }
  ;
  CONST_PERSISTENT                                = (1 shl 1) { Persistent }
  ;

  // Debug support
const
  TSRM_ERROR_LEVEL_ERROR                          = 1;
  TSRM_ERROR_LEVEL_CORE                           = 2;
  TSRM_ERROR_LEVEL_INFO                           = 3;

const
  ZVAL_CACHE_LIST                                 = 0;


const
  STACK_BLOCK_SIZE                                = 64;


const
  ZEND_STACK_APPLY_TOPDOWN                        = 1;
  ZEND_STACK_APPLY_BOTTOMUP                       = 2;


  //zend_highlight.h
const
  HL_COMMENT_COLOR                                = '#FF8000' { orange }
  ;
  HL_DEFAULT_COLOR                                = '#0000BB' { blue }
  ;
  HL_HTML_COLOR                                   = '#000000' { black }
  ;
  HL_STRING_COLOR                                 = '#DD0000' { red }
  ;
  HL_BG_COLOR                                     = '#FFFFFF' { white }
  ;
  HL_KEYWORD_COLOR                                = '#007700' { green }
  ;

const
  ZEND_INI_USER                                   = (1 shl 0);
  ZEND_INI_PERDIR                                 = (1 shl 1);
  ZEND_INI_SYSTEM                                 = (1 shl 2);
  ZEND_INI_ALL                                    = (ZEND_INI_USER or ZEND_INI_PERDIR or ZEND_INI_SYSTEM);

  ZEND_INI_DISPLAY_ORIG                           = 1;
  ZEND_INI_DISPLAY_ACTIVE                         = 2;
  ZEND_INI_STAGE_STARTUP                          = (1 shl 0);
  ZEND_INI_STAGE_SHUTDOWN                         = (1 shl 1);
  ZEND_INI_STAGE_ACTIVATE                         = (1 shl 2);
  ZEND_INI_STAGE_DEACTIVATE                       = (1 shl 3);
  ZEND_INI_STAGE_RUNTIME                          = (1 shl 4);

{ Common Types }
type
  CharPtr =
  {$IFDEF VERSION12}
    WideChar
  {$ELSE}
    AnsiChar
  {$ENDIF};
  {$IFDEF CPUX64}
  IntPtr = Int64;
  UIntPtr = UInt64;
  ULongPtr = ULong64;
  {$ELSE}
  IntPtr = Longint;
  UIntPtr = LongWord;
  ULongPtr = ULong;
  {$ENDIF}
  {$if defined(WSTR) and (CompilerVersion < 22) }
  UTF8Char = AnsiChar;
  PUTF8Char = PAnsiChar;
  {$ifend}
  zend_uint   = UIntPtr;
  zend_bool   = boolean;
  zend_uchar  = {$IFDEF PHP_UNICODE}UTF8Char{$ELSE}AnsiChar{$ENDIF};
  zend_ustr   = {$IFDEF PHP_UNICODE}UTF8String{$ELSE}AnsiString{$ENDIF};
  zend_ulong  = ULongPtr;
  zend_long   = IntPtr;
  zend_pchar  = {$IFDEF PHP_UNICODE}PUTF8Char{$ELSE}PAnsiChar{$ENDIF};
  zend_pstr   = {$IFDEF PHP_UNICODE}PUtf8String{$ELSE}PAnsiString{$ENDIF};
  {$IFDEF PHP7}
  _zend_refcounted_h = record
      refcount : cardinal;
      u : record
          case longint of
            0 : ( v : record
                _type : zend_uchar;
                flags : zend_uchar;
                gc_info : word;
              end );
            1 : ( type_info : cardinal );
          end;
    end;
  zend_refcounted_h = _zend_refcounted_h;
  _zend_refcounted = record
      gc : zend_refcounted_h;
    end;
    zend_refcounted = _zend_refcounted;
  _zend_string = record
      gc : zend_refcounted_h;
      h : zend_ulong;
      len : size_t;
      val : zend_pchar;
  end;

  P_zend_refcounted = ^_zend_refcounted;
    zend_string = _zend_string;
    P_zend_string = ^_zend_string;
    pzend_string = ^_zend_string;
  {$ELSE}
   pzend_string = zend_pchar;
  {$ENDIF}
  zend_ushort = word;
  unsigned_char = byte;
{ Common Types }
type
  uint = longword;
  PINT = ^Integer;
  size_t = cardinal;
  {$IFNDEF PHP7}
  ppointer = ^pointer;
  pppointer = ^ppointer;
  {$ENDIF}
  PStat = ^TStat;
  TStat = record
    st_dev: Word;
    st_ino: Word;
    st_mode: Word;
    st_nlink: SmallInt;
    st_uid: SmallInt;
    st_gid: SmallInt;
    st_rdev: Word;
    st_size: Longint;
    st_atime: Longint;
    st_mtime: Longint;
    st_ctime: Longint;
  end;
  Stat = TStat;

  Pzend_mem_header = ^Tzend_mem_header;
  _zend_mem_header = record
    pNext: Pzend_mem_header;
    pLast: Pzend_mem_header;
    size_cached: integer;
  end;
  Tzend_mem_header = _zend_mem_header;


type

  hash_func_t = function(arKey: zend_pchar; nKeyLength: uint): ulong;

  compare_func_t = function(_noname1: Pointer; _noname2: Pointer;
    TSRMLS_DC: Pointer): integer;

  dtor_func_t = procedure(pDest: Pointer);

  copy_ctor_func_t = procedure(pElement: Pointer);

  PBucket = ^TBucket;
  TBucket = record
    h: ulong;
    nKeyLength: uint;
    pData: Pointer;
    pDataPtr: Pointer;
    pListNext: PBucket;
    pListLast: PBucket;
    pNext: PBucket;
    pLast: PBucket;
    arKey: array[0..0] of zend_uchar;
  end;
  {$IFNDEF PHP7}
  PHashTable = ^THashTable;
  THashTable =
    record
    nTableSize: uint;
    nTableMask: uint;
    nNumOfElements: uint;
    nNextFreeElement: ulong;
    pInternalPointer: PBucket;
    pListHead: PBucket;
    pListTail: PBucket;
    arBuckets: ^PBucket;
    pDestructor: pointer;
    persistent: boolean;
    nApplyCount: Byte;
    bApplyProtection: boolean;
  end;
  {$ENDIF}
  HashPosition = {$IFDEF PHP7} cardinal {$ELSE} PBucket {$ENDIF};

  {$IFNDEF PHP7}
  {$IFDEF PHP5}

  zend_op_array =
  record
    _type : zend_uchar;
    function_name : zend_pchar;
    scope : pointer;
    fn_flags : zend_uint;
    prototype : pointer;
    num_args : zend_uint;
    required_num_args : zend_uint;
    arg_info : pointer;
    pass_rest_by_reference : zend_bool;
    return_reference : Byte;

    {$IFDEF PHP530}
    done_pass_two : zend_bool;
    {$ENDIF}

    refcount : pointer;
    opcodes : pointer;
    last :zend_uint ;
    size : zend_uint;
    T : zend_uint;
    brk_cont_array : pointer;
    last_brk_cont : zend_uint;
    current_brk_cont : zend_uint;
    try_catch_array : pointer;
    last_try_catch : Integer;
    static_variables : PHashTable;
    start_op : pointer;
    backpatch_count : Integer;

    {$IFDEF PHP530}
    this_var : zend_uint;
    {$ELSE}
    done_pass_two : zend_bool;
    uses_this : zend_bool;
    {$ENDIF}

    filename : zend_pchar;
    line_start : zend_uint;
    line_end : zend_uint;
    doc_comment : zend_pchar;
    doc_comment_len : zend_uint;
    {$IFDEF PHP530}
    early_binding : zend_uint;
    {$ENDIF}
    reserved : array[0..ZEND_MAX_RESERVED_RESOURCES - 1] of Pointer;
  end;

  _zend_internal_function =
    record
      _type : byte;
      function_name : zend_pchar;
      scope : pointer;
      fn_flags : zend_uint;
      prototype : pointer;
      num_args : zend_uint;
      required_num_args : zend_uint;
      arg_info : pointer;
      pass_rest_by_reference : zend_bool;
      return_reference : Byte;
      handler : pointer;
    end;
   TZendInternalFunction = _zend_internal_function;
   PZendInternalFunction = ^TZendInternalFunction;

  zend_function =
    record
      case Integer of
        1 :
          (
            _type : zend_uchar;
          );
        2 :
          (
          common :
              record
                _type : zend_uchar;
                function_name : zend_pchar;
                scope : pointer;
                fn_flags : zend_uint;
                prototype : pointer;
                num_args : zend_uint;
                required_num_args : zend_uint;
                arg_info : pointer;
                pass_rest_by_reference : zend_bool;
                return_reference : Byte;
              end;
            );
        3 :
          (
            op_array : zend_op_array;
          );
        4 :
          (
            internal_function : _zend_internal_function;
          );
    end;
    TZendFunction = zend_function;
    PZendFunction = ^TZendFunction;

  PZendObjectIteratorFuncs = ^zend_object_iterator_funcs;
  zend_object_iterator_funcs = record
  dtor : pointer;
  valid : pointer;
  get_currect_data : pointer;
  get_current_key : pointer;
  move_forward : pointer;
  rewind : pointer;
  end;
  zend_object_iterator = record
  data : pointer;
  funcs : PZendObjectIteratorFuncs;
  index : ulong;
  end;
  {$ENDIF}
  zend_class_iterator_funcs = record
  funcs : pointer;
  new_iterator : pointer;
  zf_new_iterator : pointer;
  zf_valid : pointer;
  zf_current : pointer;
  zf_key : pointer;
  zf_next : pointer;
  zf_rewind : pointer;
  end;
  {$ELSE}

  type zend_op_array = record
    _type : zend_uchar;
    arg_types : PByte;
    function_name : zend_pchar;
    refcount : pointer;
    opcodes : pointer;
    last : zend_uint;
    size : zend_uint;
    T : zend_uint;
    brk_cont_array : pointer;
    last_brk_cont : zend_uint;
    current_brk_cont : zend_uint;
    uses_globals : zend_bool;
    static_variables : PHashTable;
    start_op : pointer;
    backpatch_count : integer;

    return_reference : boolean;
    done_pass_two : boolean;

    filename : zend_pchar;
    reserved : array[0..ZEND_MAX_RESERVED_RESOURCES - 1] of Pointer;
  end;


type
  _zend_internal_function = record
    _type : byte;
    arg_types : PByte;
    function_name : zend_pchar;
    handler : pointer;
  end;
  PZendInternalFunction = ^_zend_internal_function;

  _zend_overloaded_function = record
   _type : byte;
   arg_types : PByte;
   function_name : zend_pchar;
   _var : zend_uint;
  end;

  zend_function = record
    case Integer of
        1 : ( _type : zend_uchar; );
        2 : (
          common :
              record
                _type : zend_uchar;
                arg_types : PByte;
                function_name : zend_pchar;
              end;
            );
        3 :
          (
            op_array : zend_op_array;
          );
        4 :
          (
            internal_function : _zend_internal_function;
          );
        5 :
          (
            overloaded_function : _zend_overloaded_function;
          );
    end;

  {$ENDIF}
  {$IFNDEF PHP7}
  Pzend_class_entry = ^Tzend_class_entry;
  PPZend_class_entry = ^PZend_class_entry;
  {$ENDIF}

  {$IFNDEF PHP7}
  Tzend_class_entry = record
   _type : zend_uchar;
   name  : zend_pchar;
   name_length : zend_uint;
   parent : PZend_class_entry;
   refcount : integer;
   constants_updated : zend_bool;
   ce_flags : zend_uint;

   function_table : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};
   default_properties : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};
   properties_info : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};
   default_static_members : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};

   static_members : PHashTable;
   constants_table : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};
   builtin_functions : pointer;

   _constructor : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   _destructor :  {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   clone : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   __get : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   __set : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   {$IFDEF PHP510}
   __unset : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   __isset : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   {$ENDIF}
   __call: {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   {$IFDEF PHP530}
   __callstatic : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   {$ENDIF}
   {$IFDEF PHP520}
   __tostring : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   {$ENDIF}
   {$IFDEF PHP510}
   serialize_func : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
   unserialize_func : {$IFDEF PHP7}P_zend_function{$ELSE}PZendFunction{$ENDIF};
  {$ENDIF}
   iterator_funcs : zend_class_iterator_funcs;

   create_object : pointer;
   get_iterator : pointer;
   interface_gets_implemented : pointer;

   {$IFDEF PHP530}
   get_static_method : pointer;
   {$ENDIF}

   {$IFDEF PHP511}
   serialize : pointer;
   unserialize : pointer;
   {$ENDIF}

   interfaces : pointer;
   num_interfaces : zend_uint;

   filename : zend_pchar;
   line_start : zend_uint;
   line_end : zend_uint;
   doc_comment : zend_pchar;
   doc_comment_len : zend_uint;

   {$IFDEF PHP511}
   module : pointer;
   {$ENDIF}
  end;
  {$ENDIF}

  {$IFNDEF PHP7}
  //P_zend_object_handlers = ^_zend_object_handlers;
  Pzend_Object = ^Tzend_object;
  PPzend_Object = ^PZend_Object;
  _zend_object = record
  {$IFDEF PHP7}
    gc : zend_refcounted_h;
    handle : cardinal;
    handlers : P_zend_object_handlers;
  {$ENDIF}
    ce: Pzend_class_entry;
    properties: PHashTable;
  {$IFDEF PHP7}
    properties_table : array[0..0] of zval;
  {$ENDIF}
  {$IFDEF PHP5}
    in_get_set : cardinal;
  {$ENDIF}
  end;
  Tzend_Object = _zend_object;
 {$IFDEF PHP5}
 {$ENDIF}


 type

   Tzend_object_get_properties = function (_object : pointer; TSRMLS_DC : pointer) :{$IFDEF PHP7}Pzend_array{$ELSE}PHashTable{$ENDIF}; cdecl;
   Pzend_object_get_propeeries = ^Tzend_object_get_properties;

   Tzend_object_get_classname  = function(_object : pointer; class_name : pointer; class_name_len : pointer; p : integer; TSRMLS_DC : pointer) : integer; cdecl;

 {$IFNDEF PHP7}
 _zend_object_handlers = record
	// general object functions
	add_ref : pointer;
	del_ref : pointer;
	clone_obj : pointer;
	// individual object functions
	read_property : pointer;
	write_property : pointer;
	read_dimension : pointer;
	write_dimension : pointer;
	get_property_ptr_ptr : pointer;
	_get : pointer;
	_set : pointer;
	has_property : pointer;
	unset_property : pointer;
	has_dimension : pointer;
	unset_dimension : pointer;
	get_properties : Tzend_object_get_properties;
	get_method : pointer;
	call_method : pointer;
	get_constructor : pointer;
	get_class_entry : pointer;
	get_class_name : Tzend_object_get_classname;
	compare_objects : pointer;
	cast_object : pointer;
	count_elements : pointer;
  {$IFDEF PHP530}
  get_debug_info : pointer;
  get_closure : pointer;
  {$ENDIF}
   end;
   {$ENDIF}
   zend_object_handle = cardinal;
  {$IFNDEF PHP7}
  zend_object_handlers = _zend_object_handlers;
  pzend_object_handlers = ^_zend_object_handlers;


  _zend_object_value = record
   handle : zend_object_handle;
   handlers : pzend_object_handlers;
  end;
  TZendObjectValue = _zend_object_value;
  PZendObjectValue = ^TZendObjectValue;
  {$ENDIF}
 {$ENDIF}

{$IFNDEF PHP7}
Pzvalue_value = ^zvalue_value;
  zvalue_value = record
    case longint of
      0: (lval: zend_long);
      1: (dval: double);
      2: (str: record
          val: zend_pchar;
          len: integer;
        end);
      3: (ht: PHashTable);
      4 : (obj :  _zend_object_value);
  end;
  pppzval = ^ppzval;
  ppzval = ^pzval;

  pzval = ^zval;
  zval = record
   value : zvalue_value;
   refcount : zend_uint;
   _type : byte;
   is_ref : byte;
  end;

{$ENDIF}

  ppzval_array = ^pzval_array;

  pzval_array = array of ppzval;
  pzval_array_ex = array of pzval;

type
  PZend_rsrc_list_entry = ^zend_rsrc_list_entry;
  zend_rsrc_list_entry = record
     ptr : pointer;
     _type : integer;
     refcount : integer;
  end;
 TZend_rsrc_list_entry = Zend_rsrc_list_entry;

type
  PZendHashKey = ^TZendHashKey;
  zend_hash_key = record
    arKey: zend_pchar;
    nKeyLength: uint;
    h: ulong;
  end;
  TZendHashKey = zend_hash_key;

  zend_hash_graceful_reverse_destroy_t = procedure(ht: PHashTable); cdecl;

type
  PZendConstant = ^TZendConstant;
  zend_constant = record
    value: zval;
    flags: Integer;
    name: zend_pchar;
    name_len: uint;
    module_number: Integer;
  end;
  TZendConstant = zend_constant;

{$IFDEF PHP5}
type
   zend_stream_reader_t = function(handle : pointer; buf : zend_pchar; len : size_t; TSRMLS_DC : pointer) : size_t; cdecl;
   zend_stream_closer_t = procedure(handle : pointer; TSRMLS_DC : pointer); cdecl;
   zend_stream_fteller_t = function(handle : pointer; TSRMLS_DC : pointer) : longint; cdecl;

{$IFDEF PHP530}
   zend_stream_fsizer_t = function (handle : pointer; TSRMLS_DC : pointer) : size_t; cdecl;
{$ENDIF}

{$IFDEF PHP530}
zend_mmap  = record
	len : size_t;
	pos : size_t;
	map : pointer;
	buf : zend_pchar;
	old_handle : pointer;
	old_closer : zend_stream_closer_t;
end;
{$ENDIF}

{$IFDEF PHP530}
  _zend_stream = record
   handle : pointer;
   isatty : integer;
   mmap : zend_mmap;
   reader : zend_stream_reader_t;
   fsizer : zend_stream_fsizer_t;
   closer : zend_stream_closer_t;
   end;
{$ELSE}
  _zend_stream = record
   handle : pointer;
   reader : zend_stream_reader_t;
   closer : zend_stream_closer_t;
   {$IFDEF PHP510}
   fteller : zend_stream_fteller_t;
   {$ENDIF}
   interactive : integer;
   end;
{$ENDIF}


   TZendStream = _zend_stream;
   PZendStream = ^TZendStream;


{$ENDIF}


type
  PZendFileHandle = ^TZendFileHandle;
  zend_file_handle =
    record
    {$IF Defined(PHP530) or Defined(PHP540) or Defined(PHP550) or Defined(PHP560) or Defined(PHP700)}
    _type : zend_stream_type;
    {$ELSE}
    _type: uchar;
    {$IFEND}
    filename: zend_pchar;
    opened_path: zend_pchar;
    handle:
    record
      case Integer of
        {$IFDEF PHP7}
        0:( fd: Integer; );
        1:( fp: pointer; );
        2 : ( stream : TZendStream; );
        {$ELSE}
        1:( fd: Integer; );
        2:( fp: pointer; );
          {$IFDEF PHP5}
          3 : ( stream : TZendStream; );
          {$ENDIF}
        {$ENDIF}
    end;
    free_filename: {$IFDEF PHP7}byte{$ELSE}shortint{$ENDIF};
  end;
  TZendFileHandle = zend_file_handle;

  //TSRM.h


type
  ts_rsrc_id = integer;
  pts_rsrc_id = ^ts_rsrc_id;


  //zend_stack.h
type
  pzend_stack = ^Tzend_stack;
  zend_stack =
    record
    top: Integer;
    max: Integer;
    elements: PPointer;
  end;
  Tzend_stack = zend_stack;


type
  Pzend_syntax_highlighter_ini = ^Tzend_syntax_highlighter_ini;
  zend_syntax_highlighter_ini =
    record
    highlight_html    : zend_pchar;
    highlight_comment : zend_pchar;
    highlight_default : zend_pchar;
    highlight_string  : zend_pchar;
    highlight_keyword : zend_pchar;
  end;
  Tzend_syntax_highlighter_ini = zend_syntax_highlighter_ini;


type
  zend_write_t = function(str: zend_pchar; str_length: integer): integer; cdecl;


type

  {$IFDEF PHP5}
   _zend_arg_info = record
   name : zend_pchar;
   name_len : zend_uint;
   class_name : zend_pchar;
   class_name_len : zend_uint;
   {$IFDEF PHP510}
   array_type_hint : zend_bool;
   {$ENDIF}
   allow_null : zend_bool;
   pass_by_reference : zend_bool;
   return_reference : zend_bool;
   required_num_args : integer;
   end;

   TZendArgInfo = _zend_arg_info;
   PZendArgInfo = ^TZendArgInfo;
  {$ENDIF}

 {$IFNDEF PHP7}
  Pzend_function_entry = ^Tzend_function_entry;
  zend_function_entry = record
    fname: zend_pchar;
    handler: pointer;
     arg_info : PZendArgInfo;
     num_args : zend_uint;
     flags : zend_uint;
  end;
  Tzend_function_entry = zend_function_entry;
  TZendFunctionEntry = zend_function_entry;
    P_zend_arg_info = ^_zend_arg_info;
  zend_object_value = record
    handle:Integer;
    handlers:Pointer;
  end;
  _zend_function_entry = record
    fname     : zend_pchar;
    handler   : pointer;
    arg_info  : P_zend_arg_info;
    num_args  : uint;
    flags     : uint;
  end;
  {$ENDIF}
  Pzend_module_entry = ^Tzend_module_entry;
  PPzend_module_entry = ^Pzend_module_entry;
  p_zend_module_entry = ^_zend_module_entry;
  _zend_module_entry = record
    size                  : word;
    zend_api              : dword;
    zend_debug            : byte;
    zts                   : byte;
    ini_entry             : pointer;
    deps                  : pointer;
    name                  : zend_pchar;
    functions             : Pointer;
    module_startup_func   : pointer;
    module_shutdown_func  : pointer;
    request_startup_func  : pointer;
    request_shutdown_func : pointer;
    info_func             : pointer;
    version               : zend_pchar;

    {$IFDEF PHP520}
    globals_size : size_t;
    globals_id_ptr : pointer;
    globals_ctor : pointer;
    globals_dtor : pointer;
    {$ENDIF}

    post_deactivate_func  : pointer;
    module_started        : integer;
    _type                 : byte;
    handle                : pointer;
    module_number         : Integer;
    build_id              : zend_pchar;
  end;
  Tzend_module_entry = record
    size: word;
    zend_api: dword;
    zend_debug: byte;
    zts: byte;
    {$IFDEF PHP5}
    ini_entry : pointer;
    {$IFDEF PHP510}
    deps : pointer;
    {$ENDIF}
    {$ENDIF}
    name: zend_pchar;
    functions: Pointer;
    module_startup_func: pointer;
    module_shutdown_func: pointer;
    request_startup_func: pointer;
    request_shutdown_func: pointer;
    info_func: pointer;
    version: zend_pchar;

    {$IFDEF PHP5}
     {$IFDEF PHP520}
      globals_size : size_t;
      {$IFDEF PHP540}
      globals_ptr : pointer;
      {$ELSE}
      globals_id_ptr : pointer;
      {$ENDIF}
      globals_ctor : procedure (global:pointer);cdecl;
      globals_dtor : procedure (global:pointer);cdecl;
     {$ENDIF}
    {$ENDIF}

    {$IFDEF PHP5}
    post_deactivate_func : pointer;
    {$ELSE}
    global_startup_func: pointer;
    global_shutdown_func: pointer;
    {$ENDIF}

    {$IFNDEF PHP520}
    global_id: integer;
    {$ENDIF}

    module_started: longint;
    _type: byte;
    handle: pointer;
    module_number: longint;
    {$IFDEF PHP530}
    build_id : zend_pchar;
    {$ENDIF}
  end;


type
  pzend_list_element = ^zend_list_element;
  zend_list_element = record
    prev: pzend_list_element;
    next: pzend_list_element;
    data: zend_uchar;
  end;

  pzend_llist = ^zend_llist;
  zend_llist = record
    head: pzend_list_element;
    tail: pzend_list_element;
    size: size_t;
    count: size_t;
    dtor: pointer;
    persistent: byte;
    traverse_ptr: pzend_list_element;
  end;

   pzend_overloaded_element = ^Zend_overloaded_element;
   zend_overloaded_element = record
    _type : integer;
    element : zval;
   end;


type
  _zend_property_reference = record
    _type: integer;
    _object: pzval;
    elements_list: pzend_llist;
  end;

  Tzend_property_reference = _zend_property_reference;
  Pzend_property_reference = ^Tzend_property_reference;


type
  //Zend internal function
  TInternalFunction = procedure(ht: integer; return_value: pzval; this_ptr: pzval;
    return_value_used: integer; TSRMLS_DC: pointer); cdecl;

  PInitFunction = ^TInitFunction;
  TInitFunction = function(_type: integer; module_number: integer; TSRMLS_DC: pointer): integer; cdecl;

  PShutdownFunction = ^TShutdownFunction;
  TShutdownFunction = function(_type: integer; module_number: integer; TSRMLS_DC: pointer): integer; cdecl;

  PZendModuleInfoFunction = ^TZendModuleInfoFunction;
  TZendModuleInfoFunction = procedure(zend_module: Pzend_module_entry; TSRMLS_DC: pointer); cdecl;

  //global startup and shutdown function
  TZendGlobalFunction = procedure(); cdecl;

  TZendModuleType = (mtPersistent, mtTemporary);

type

 _znode = record
      op_type : Integer;
      u :         
        record
          case Integer of
            1 : 
              (
                constant : zval;
              );
            2 : 
              (
                _var : zend_uint;
              );
            3 : 
              (
                opline_num : zend_uint;
                                       {  Needs to be signed }
              );
            4 : 
              (
                op_array : ^zend_op_array;
              );
            5 : 
              (
                jmp_addr : pointer;
              );
            6 : 
              (
              EA :                   
                  record
                    _var : zend_uint;
                                       { dummy }
                    _type : zend_uint;
                  end;
                );
      end;
   end;

 _zend_declarables = record
	ticks : zval;
 end;
 zend_declarables = _zend_declarables;

 Pzend_compiler_globals = ^zend_compiler_globals;
 zend_compiler_globals  = record
    bp_stack : zend_stack;
    switch_cond_stack : zend_stack;
    foreach_copy_stack : zend_stack;
    object_stack : zend_stack;
    declare_stack : zend_stack;


    class_entry : PZend_class_entry;

    //variables for list() compilation
    list_llist : zend_llist;
    dimension_llist : zend_llist;
    list_stack : zend_stack;

    function_call_stack : zend_stack;

    compiled_filename : zend_pchar;

    zend_lineno : integer;
    //comment_start_line : integer;
    heredoc : zend_pchar;
    heredoc_len : integer;

    active_op_array : pointer;

    function_table :  {$IFDEF PHP7} Pzend_array {$ELSE} PHashTable{$ENDIF}; // function symbol table
    class_table :  {$IFDEF PHP7} Pzend_array {$ELSE} PHashTable{$ENDIF};    // class table

    filenames_table : {$IFDEF PHP7} zend_array {$ELSE} THashTable{$ENDIF};

    auto_globals :  {$IFDEF PHP7} Pzend_array {$ELSE} PHashTable{$ENDIF};

    in_compilation : zend_bool;
    short_tags : zend_bool;
    asp_tags : zend_bool;
    allow_call_time_pass_reference : zend_bool;

    declarables : zend_declarables;

    unclean_shutdown : zend_bool;
    ini_parser_unbuffered_errors : zend_bool;
    open_files : zend_llist;
    
    // For extensions support
   // extended_info : zend_bool;  // generate extension information for debugger/profiler
   // handle_op_arrays : zend_bool; // run op_arrays through op_array handlers


    catch_begin : longint;

    ini_parser_param : pointer;

    interactive : integer;

    start_lineno : zend_uint;
    increment_lineno : zend_bool;


    implementing_class : _znode;
    access_type : zend_uint;
    doc_comment : zend_pchar;
    doc_comment_len : integer;
  end;
  Tzend_compiler_globals = zend_compiler_globals;


  zend_ptr_stack  = record
   top, max : integer;
   elements : pointer;
   top_element : pointer;
  end;

  jump_buf = array[0..63] of byte;
  p_jump_buf = ^jump_buf;

{$IFDEF PHP5}
type  _zend_objects_store = record
	object_buckets : pointer;
	top : zend_uint;
	size : zend_uint;
	free_list_head : integer;
      end;

type  _zend_property_info  = record
	flags : zend_uint;
	name : zend_pchar;
	name_length : integer;
	h : ulong;
        {$IFDEF PHP510}
        doc_comment : zend_pchar;
        doc_comment_len : integer;
        {$ENDIF}
      end;

{$ENDIF}

type

  Pzend_executor_globals = ^zend_executor_globals;
  zend_executor_globals  = record
    return_value_ptr_ptr : {$IFNDEF PHP7} ppzval{$ELSE} pzval{$ENDIF};

     uninitialized_zval : zval;
     uninitialized_zval_ptr : pzval;

     error_zval : zval;
     error_zval_ptr : pzval;

     function_state_ptr : pointer;
     arg_types_stack : zend_ptr_stack;

     // symbol table cache
     symtable_cache : array[0..31] of PHashTable;
     symtable_cache_limit : ^PHashTable;
     symtable_cache_ptr : ^PHashTable;

     opline_ptr : pointer;
     active_symbol_table : PHashTable;
     symbol_table : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};	// main symbol table
     included_files : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};	// files already included */
     bailout : p_jump_buf;

     error_reporting : integer;
     orig_error_reporting : integer;
     exit_status : integer;

     active_op_array : pointer;

     function_table : {$IFDEF PHP7}Pzval{$ELSE}PHashTable{$ENDIF};	// function symbol table */
     class_table : {$IFDEF PHP7}Pzval{$ELSE}PHashTable{$ENDIF};  	// class table
     zend_constants : {$IFDEF PHP7}Pzval{$ELSE}PHashTable{$ENDIF};	// constants table */

     {$IFDEF PHP5}
     scope : pointer;
     _this : pzval;
     {$ENDIF}

     precision : longint;

     ticks_count : integer;

     in_execution : zend_bool;
     {$IFDEF PHP5}
     in_autoload : PHashTable;
     {$IFDEF PHP510}
     autoload_func : pointer;
     {$ENDIF}
     {$ENDIF}

     full_tables_cleanup : zend_bool;
     {$IFDEF PHP5}
     ze1_compatibility_mode : zend_bool;
     {$ENDIF}

     // for extended information support */
     no_extensions : zend_bool;

     timed_out : zend_bool;

     regular_list : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};
     persistent_list : {$IFDEF PHP7}HashTable{$ELSE}THashTable{$ENDIF};

     argument_stack : zend_ptr_stack;

     {$IFNDEF PHP510}
     free_op1, free_op2 : pzval;
     unary_op : pointer;
     binary_op : pointer;

     garbage : array[0..1] of pzval;
     garbage_ptr : integer;
     {$ENDIF}

     {$IFDEF PHP5}
      user_error_handler_error_reporting : integer;
     {$ENDIF}
     user_error_handler : pzval;
     {$IFDEF PHP5}
     user_exception_handler : pzval;
     user_error_handlers_error_reporting : zend_stack;
     {$ENDIF}

     user_error_handlers : zend_ptr_stack;
     {$IFDEF PHP5}
     user_exception_handlers : zend_ptr_stack;
     {$ENDIF}

	//* timeout support */
     timeout_seconds : integer;
     lambda_count : integer;
     ini_directives : PHashTable;
     {$IFDEF PHP5}

      objects_store : _zend_objects_store;
      exception : pzval;
      opline_before_exception : pointer;
      current_execute_data : pointer;
      {$IFDEF PHP5}
      current_module : pointer;
      {$ENDIF}

      std_property_info : _zend_property_info;
     {$ENDIF}
     //* locale stuff */

     {$IFNDEF PHP510}
     float_separator : zend_uchar;
     {$ENDIF}

     reserved: array[0..3] of pointer;
   end;


{$IFDEF PHP5}
 type
   TZendObjectReadProperty = function (_object : pzval; member : pzval; _type : integer; TSRMLS_DC : pointer) : pzval; cdecl;
   TZendObjectReadDimension = function (_object : pzval; offset : pzval; _type : integer; TSRMLS_DC : pointer) : pzval; cdecl;
   TZendObjectWriteProperty = procedure(_object : pzval; member : pzval; value : pzval; TSRMLS_DC : pointer); cdecl;
   TZendObjectWriteDimension = procedure(_object : pzval; offset : pzval; value : pzval; TSRMLS_DC : pointer); cdecl;

{$ENDIF}

{$IFDEF PHP530}
function ZEND_MODULE_BUILD_ID : zend_ustr;
{$ENDIF}

implementation

{$IFDEF PHP530}
function ZEND_MODULE_BUILD_ID : zend_ustr;
begin
  Result  := 'API' + IntToStr(ZEND_MODULE_API_NO) + ZEND_BUILD_TS + ZEND_BUILD_DEBUG + ZEND_BUILD_SYSTEM;
end;
{$ENDIF}

end.
