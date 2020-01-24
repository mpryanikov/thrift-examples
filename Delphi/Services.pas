(**
 * Autogenerated by Thrift Compiler (0.9.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *)

unit Services;

interface

uses
  Classes,
  SysUtils,
  Generics.Collections,
  Thrift,
  Thrift.Utils,
  Thrift.Collections,
  Thrift.Protocol,
  Thrift.Transport,
  Exceptions,
  Models;

const
  cServices_Option_AnsiStr_Binary = False;
type
  TProfileService = class
  public
    type
      Iface = interface
        function getById(const prsId: Int64): IProfile;
      end;

      TClient = class( TInterfacedObject, Iface)
      public
        constructor Create( prot: IProtocol); overload;
        constructor Create( const iprot: IProtocol; const oprot: IProtocol); overload;
      protected
        iprot_: IProtocol;
        oprot_: IProtocol;
        seqid_: Integer;
      public
        property InputProtocol: IProtocol read iprot_;
        property OutputProtocol: IProtocol read oprot_;
      protected
        // Iface
        function getById(const prsId: Int64): IProfile;
      public
        procedure send_getById(const prsId: Int64);
        function recv_getById(): IProfile;
      end;

      TProcessorImpl = class( TInterfacedObject, IProcessor)
      public
        constructor Create( iface_: Iface );
        destructor Destroy; override;
      private
        iface_: Iface;
      protected
        type
          TProcessFunction = reference to procedure( seqid: Integer; const iprot: IProtocol; const oprot: IProtocol);
      protected
        processMap_: IThriftDictionary<string, TProcessFunction>;
      public
        function Process( const iprot: IProtocol; const oprot: IProtocol): Boolean;
        procedure getById_Process( seqid: Integer; const iprot: IProtocol; const oprot: IProtocol);
      end;

      IGetById_args = interface(IBase)
        function GetPrsId: Int64;
        procedure SetPrsId( const Value: Int64);

        property PrsId: Int64 read GetPrsId write SetPrsId;

        function Get__isset_PrsId: Boolean;

        property __isset_PrsId: Boolean read Get__isset_PrsId;
      end;

      TGetById_argsImpl = class(TInterfacedObject, IBase, IGetById_args)
      private
        FPrsId: Int64;
        
        F__isset_PrsId: Boolean;
        
        function GetPrsId: Int64;
        procedure SetPrsId( const Value: Int64);

        function Get__isset_PrsId: Boolean;
      public
        constructor Create;
        destructor Destroy; override;

        function ToString: string; override;

        // IBase
        procedure Read( const iprot: IProtocol);
        procedure Write( const oprot: IProtocol);

        // Properties
        property PrsId: Int64 read GetPrsId write SetPrsId;

        // isset
        property __isset_PrsId: Boolean read Get__isset_PrsId;
      end;

      IGetById_result = interface(IBase)
        function GetSuccess: IProfile;
        procedure SetSuccess( const Value: IProfile);
        function GetE: TProfileException.IProfileExceptionFactory;
        procedure SetE( const Value: TProfileException.IProfileExceptionFactory);

        property Success: IProfile read GetSuccess write SetSuccess;
        property E: TProfileException.IProfileExceptionFactory read GetE write SetE;

        function Get__isset_Success: Boolean;
        function Get__isset_E: Boolean;

        property __isset_Success: Boolean read Get__isset_Success;
        property __isset_E: Boolean read Get__isset_E;
      end;

      TGetById_resultImpl = class(TInterfacedObject, IBase, IGetById_result)
      private
        FSuccess: IProfile;
        FE: TProfileException.IProfileExceptionFactory;
        
        F__isset_Success: Boolean;
        F__isset_E: Boolean;
        
        function GetSuccess: IProfile;
        procedure SetSuccess( const Value: IProfile);
        function GetE: TProfileException.IProfileExceptionFactory;
        procedure SetE( const Value: TProfileException.IProfileExceptionFactory);

        function Get__isset_Success: Boolean;
        function Get__isset_E: Boolean;
      public
        constructor Create;
        destructor Destroy; override;

        function ToString: string; override;

        // IBase
        procedure Read( const iprot: IProtocol);
        procedure Write( const oprot: IProtocol);

        // Properties
        property Success: IProfile read GetSuccess write SetSuccess;
        property E: TProfileException.IProfileExceptionFactory read GetE write SetE;

        // isset
        property __isset_Success: Boolean read Get__isset_Success;
        property __isset_E: Boolean read Get__isset_E;
      end;

  end;
  
implementation

constructor TProfileService.TClient.Create( prot: IProtocol);
begin
  Create( prot, prot );
end;

constructor TProfileService.TClient.Create( const iprot: IProtocol; const oprot: IProtocol);
begin
  iprot_ := iprot;
  oprot_ := oprot;
end;

function TProfileService.TClient.getById(const prsId: Int64): IProfile;
begin
  send_getById(prsId);
  Result := recv_getById();
end;

procedure TProfileService.TClient.send_getById(const prsId: Int64);
var
  args : IGetById_args;
  msg : IMessage;
begin
  seqid_ := seqid_ + 1;
  msg := TMessageImpl.Create('getById', TMessageType.Call, seqid_);
  oprot_.WriteMessageBegin( msg );
  args := TGetById_argsImpl.Create();
  args.PrsId := prsId;
  args.Write(oprot_);
  args.PrsId := 0;
  oprot_.WriteMessageEnd();
  oprot_.Transport.Flush();
end;

function TProfileService.TClient.recv_getById(): IProfile;
var
  msg : IMessage;
  ex : Exception;
  x : TApplicationException;
  ret : IGetById_result;
begin
  msg := iprot_.ReadMessageBegin();
  if (msg.Type_ = TMessageType.Exception) then
  begin
    x := TApplicationException.Read(iprot_);
    iprot_.ReadMessageEnd();
    raise x;
  end;
  ret := TGetById_resultImpl.Create();
  ret.Read(iprot_);
  iprot_.ReadMessageEnd();
  if (ret.__isset_success) then
  begin
    Result := ret.Success;
    ret.Success := nil;
    Exit;
  end;
  if (ret.__isset_E) then
  begin
    ex := ret.E.CreateException;
    raise ex;
  end;
  raise TApplicationException.Create(TApplicationException.TExceptionType.MissingResult, 'getById failed: unknown result');
end;

constructor TProfileService.TProcessorImpl.Create( iface_: Iface );
begin
  inherited Create;
  Self.iface_ := iface_;
  processMap_ := TThriftDictionaryImpl<string, TProcessFunction>.Create;
  processMap_.AddOrSetValue( 'getById', getById_Process);
end;

destructor TProfileService.TProcessorImpl.Destroy;
begin
  inherited;
end;

function TProfileService.TProcessorImpl.Process( const iprot: IProtocol; const oprot: IProtocol): Boolean;
var
  msg : IMessage;
  fn : TProcessFunction;
  x : TApplicationException;
begin
  try
    msg := iprot.ReadMessageBegin();
    fn := nil;
    if not processMap_.TryGetValue(msg.Name, fn)
    or not Assigned(fn) then
    begin
      TProtocolUtil.Skip(iprot, TType.Struct);
      iprot.ReadMessageEnd();
      x := TApplicationException.Create(TApplicationException.TExceptionType.UnknownMethod, 'Invalid method name: ''' + msg.Name + '''');
      msg := TMessageImpl.Create(msg.Name, TMessageType.Exception, msg.SeqID);
      oprot.WriteMessageBegin( msg);
      x.Write(oprot);
      oprot.WriteMessageEnd();
      oprot.Transport.Flush();
      Result := True;
      Exit;
    end;
    fn(msg.SeqID, iprot, oprot);
  except
    Result := False;
    Exit;
  end;
  Result := True;
end;

// both way processor
procedure TProfileService.TProcessorImpl.getById_Process( seqid: Integer; const iprot: IProtocol; const oprot: IProtocol);
var
  args: IGetById_args;
  msg: IMessage;
  ret: IGetById_result;
begin
  args := TGetById_argsImpl.Create;
  args.Read(iprot);
  iprot.ReadMessageEnd();
  ret := TGetById_resultImpl.Create;
  try
    ret.Success := iface_.getById(args.PrsId);
    args.PrsId := 0;
  except
    on E: TProfileException do
    begin
      ret.E := E.ProfileExceptionFactory;
    end;
  end;
  msg := TMessageImpl.Create('getById', TMessageType.Reply, seqid); 
  oprot.WriteMessageBegin( msg); 
  ret.Write(oprot);
  oprot.WriteMessageEnd();
  oprot.Transport.Flush();
end;

constructor TProfileService.TGetById_argsImpl.Create;
begin
  inherited;
end;

destructor TProfileService.TGetById_argsImpl.Destroy;
begin
  inherited;
end;

function TProfileService.TGetById_argsImpl.GetPrsId: Int64;
begin
  Result := FPrsId;
end;

procedure TProfileService.TGetById_argsImpl.SetPrsId( const Value: Int64);
begin
  F__isset_PrsId := True;
  FPrsId := Value;
end;

function TProfileService.TGetById_argsImpl.Get__isset_PrsId: Boolean;
begin
  Result := F__isset_PrsId;
end;

procedure TProfileService.TGetById_argsImpl.Read( const iprot: IProtocol);
var
  field_ : IField;
  struc : IStruct;

begin
  struc := iprot.ReadStructBegin;
  try
    while (true) do
    begin
      field_ := iprot.ReadFieldBegin();
      if (field_.Type_ = TType.Stop) then
      begin
        Break;
      end;
      case field_.ID of
        1: begin
          if (field_.Type_ = TType.I64) then
          begin
            PrsId := iprot.ReadI64();
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end
        else begin
          TProtocolUtil.Skip(iprot, field_.Type_);
        end;
      end;
      iprot.ReadFieldEnd;
    end;
  finally
    iprot.ReadStructEnd;
  end;
end;

procedure TProfileService.TGetById_argsImpl.Write( const oprot: IProtocol);
var
  struc : IStruct;
  field_ : IField;
begin
  struc := TStructImpl.Create('getById_args');
  oprot.WriteStructBegin(struc);
  field_ := TFieldImpl.Create;
  if (__isset_PrsId) then
  begin
    field_.Name := 'prsId';
    field_.Type_  := TType.I64;
    field_.ID := 1;
    oprot.WriteFieldBegin(field_);
    oprot.WriteI64(PrsId);
    oprot.WriteFieldEnd();
  end;
  oprot.WriteFieldStop();
  oprot.WriteStructEnd();
end;

function TProfileService.TGetById_argsImpl.ToString: string;
var
  sb : TThriftStringBuilder;
begin
  sb := TThriftStringBuilder.Create('(');
  try
    sb.Append('PrsId: ');
    sb.Append(PrsId);
    sb.Append(')');
    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

constructor TProfileService.TGetById_resultImpl.Create;
begin
  inherited;
end;

destructor TProfileService.TGetById_resultImpl.Destroy;
begin
  inherited;
end;

function TProfileService.TGetById_resultImpl.GetSuccess: IProfile;
begin
  Result := FSuccess;
end;

procedure TProfileService.TGetById_resultImpl.SetSuccess( const Value: IProfile);
begin
  F__isset_Success := True;
  FSuccess := Value;
end;

function TProfileService.TGetById_resultImpl.Get__isset_Success: Boolean;
begin
  Result := F__isset_Success;
end;

function TProfileService.TGetById_resultImpl.GetE: TProfileException.IProfileExceptionFactory;
begin
  Result := FE;
end;

procedure TProfileService.TGetById_resultImpl.SetE( const Value: TProfileException.IProfileExceptionFactory);
begin
  F__isset_E := True;
  FE := Value;
end;

function TProfileService.TGetById_resultImpl.Get__isset_E: Boolean;
begin
  Result := F__isset_E;
end;

procedure TProfileService.TGetById_resultImpl.Read( const iprot: IProtocol);
var
  field_ : IField;
  struc : IStruct;

begin
  struc := iprot.ReadStructBegin;
  try
    while (true) do
    begin
      field_ := iprot.ReadFieldBegin();
      if (field_.Type_ = TType.Stop) then
      begin
        Break;
      end;
      case field_.ID of
        0: begin
          if (field_.Type_ = TType.Struct) then
          begin
            Success := TProfileImpl.Create;
            Success.Read(iprot);
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end;
        1: begin
          if (field_.Type_ = TType.Struct) then
          begin
            E := TProfileException.TProfileExceptionFactoryImpl.Create;
            E.Read(iprot);
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end
        else begin
          TProtocolUtil.Skip(iprot, field_.Type_);
        end;
      end;
      iprot.ReadFieldEnd;
    end;
  finally
    iprot.ReadStructEnd;
  end;
end;

procedure TProfileService.TGetById_resultImpl.Write( const oprot: IProtocol);
var
  struc : IStruct;
  field_ : IField;
begin
  struc := TStructImpl.Create('getById_result');
  oprot.WriteStructBegin(struc);
  field_ := TFieldImpl.Create;
  if (Success <> nil) and __isset_Success then
  begin
    field_.Name := 'Success';
    field_.Type_  := TType.Struct;
    field_.ID := 0;
    oprot.WriteFieldBegin(field_);
    Success.Write(oprot);
    oprot.WriteFieldEnd();
  end;
  if (E <> nil) and __isset_E then
  begin
    field_.Name := 'e';
    field_.Type_  := TType.Struct;
    field_.ID := 1;
    oprot.WriteFieldBegin(field_);
    E.Write(oprot);
    oprot.WriteFieldEnd();
  end;
  oprot.WriteFieldStop();
  oprot.WriteStructEnd();
end;

function TProfileService.TGetById_resultImpl.ToString: string;
var
  sb : TThriftStringBuilder;
begin
  sb := TThriftStringBuilder.Create('(');
  try
    sb.Append('Success: ');
    if (Success = nil) then sb.Append('<null>') else sb.Append(Success.ToString());
    sb.Append(',E: ');
    if (E = nil) then sb.Append('<null>') else sb.Append(E.ToString());
    sb.Append(')');
    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

end.
