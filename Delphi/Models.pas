(**
 * Autogenerated by Thrift Compiler (0.9.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *)

unit Models;

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
  Enums;

const
  cModels_Option_AnsiStr_Binary = False;
type
  IProfile = interface(IBase)
    function GetPrsId: Int64;
    procedure SetPrsId( const Value: Int64);
    function GetFirstName: string;
    procedure SetFirstName( const Value: string);
    function GetLastName: string;
    procedure SetLastName( const Value: string);
    function GetBirthDate: Int64;
    procedure SetBirthDate( const Value: Int64);
    function GetState: TPersonState;
    procedure SetState( const Value: TPersonState);

    property PrsId: Int64 read GetPrsId write SetPrsId;
    property FirstName: string read GetFirstName write SetFirstName;
    property LastName: string read GetLastName write SetLastName;
    property BirthDate: Int64 read GetBirthDate write SetBirthDate;
    property State: TPersonState read GetState write SetState;

    function Get__isset_PrsId: Boolean;
    function Get__isset_FirstName: Boolean;
    function Get__isset_LastName: Boolean;
    function Get__isset_BirthDate: Boolean;
    function Get__isset_State: Boolean;

    property __isset_PrsId: Boolean read Get__isset_PrsId;
    property __isset_FirstName: Boolean read Get__isset_FirstName;
    property __isset_LastName: Boolean read Get__isset_LastName;
    property __isset_BirthDate: Boolean read Get__isset_BirthDate;
    property __isset_State: Boolean read Get__isset_State;
  end;

  TProfileImpl = class(TInterfacedObject, IBase, IProfile)
  private
    FPrsId: Int64;
    FFirstName: string;
    FLastName: string;
    FBirthDate: Int64;
    FState: TPersonState;
    
    F__isset_PrsId: Boolean;
    F__isset_FirstName: Boolean;
    F__isset_LastName: Boolean;
    F__isset_BirthDate: Boolean;
    F__isset_State: Boolean;
    
    function GetPrsId: Int64;
    procedure SetPrsId( const Value: Int64);
    function GetFirstName: string;
    procedure SetFirstName( const Value: string);
    function GetLastName: string;
    procedure SetLastName( const Value: string);
    function GetBirthDate: Int64;
    procedure SetBirthDate( const Value: Int64);
    function GetState: TPersonState;
    procedure SetState( const Value: TPersonState);

    function Get__isset_PrsId: Boolean;
    function Get__isset_FirstName: Boolean;
    function Get__isset_LastName: Boolean;
    function Get__isset_BirthDate: Boolean;
    function Get__isset_State: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function ToString: string; override;

    // IBase
    procedure Read( const iprot: IProtocol);
    procedure Write( const oprot: IProtocol);

    // Properties
    property PrsId: Int64 read GetPrsId write SetPrsId;
    property FirstName: string read GetFirstName write SetFirstName;
    property LastName: string read GetLastName write SetLastName;
    property BirthDate: Int64 read GetBirthDate write SetBirthDate;
    property State: TPersonState read GetState write SetState;

    // isset
    property __isset_PrsId: Boolean read Get__isset_PrsId;
    property __isset_FirstName: Boolean read Get__isset_FirstName;
    property __isset_LastName: Boolean read Get__isset_LastName;
    property __isset_BirthDate: Boolean read Get__isset_BirthDate;
    property __isset_State: Boolean read Get__isset_State;
  end;

implementation

constructor TProfileImpl.Create;
begin
  inherited;
end;

destructor TProfileImpl.Destroy;
begin
  inherited;
end;

function TProfileImpl.GetPrsId: Int64;
begin
  Result := FPrsId;
end;

procedure TProfileImpl.SetPrsId( const Value: Int64);
begin
  F__isset_PrsId := True;
  FPrsId := Value;
end;

function TProfileImpl.Get__isset_PrsId: Boolean;
begin
  Result := F__isset_PrsId;
end;

function TProfileImpl.GetFirstName: string;
begin
  Result := FFirstName;
end;

procedure TProfileImpl.SetFirstName( const Value: string);
begin
  F__isset_FirstName := True;
  FFirstName := Value;
end;

function TProfileImpl.Get__isset_FirstName: Boolean;
begin
  Result := F__isset_FirstName;
end;

function TProfileImpl.GetLastName: string;
begin
  Result := FLastName;
end;

procedure TProfileImpl.SetLastName( const Value: string);
begin
  F__isset_LastName := True;
  FLastName := Value;
end;

function TProfileImpl.Get__isset_LastName: Boolean;
begin
  Result := F__isset_LastName;
end;

function TProfileImpl.GetBirthDate: Int64;
begin
  Result := FBirthDate;
end;

procedure TProfileImpl.SetBirthDate( const Value: Int64);
begin
  F__isset_BirthDate := True;
  FBirthDate := Value;
end;

function TProfileImpl.Get__isset_BirthDate: Boolean;
begin
  Result := F__isset_BirthDate;
end;

function TProfileImpl.GetState: TPersonState;
begin
  Result := FState;
end;

procedure TProfileImpl.SetState( const Value: TPersonState);
begin
  F__isset_State := True;
  FState := Value;
end;

function TProfileImpl.Get__isset_State: Boolean;
begin
  Result := F__isset_State;
end;

procedure TProfileImpl.Read( const iprot: IProtocol);
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
        end;
        2: begin
          if (field_.Type_ = TType.String_) then
          begin
            FirstName := iprot.ReadString();
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end;
        3: begin
          if (field_.Type_ = TType.String_) then
          begin
            LastName := iprot.ReadString();
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end;
        4: begin
          if (field_.Type_ = TType.I64) then
          begin
            BirthDate := iprot.ReadI64();
          end else
          begin
            TProtocolUtil.Skip(iprot, field_.Type_);
          end;
        end;
        5: begin
          if (field_.Type_ = TType.I32) then
          begin
            State := TPersonState(iprot.ReadI32());
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

procedure TProfileImpl.Write( const oprot: IProtocol);
var
  struc : IStruct;
  field_ : IField;
begin
  struc := TStructImpl.Create('Profile');
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
  if (__isset_FirstName) then
  begin
    field_.Name := 'firstName';
    field_.Type_  := TType.String_;
    field_.ID := 2;
    oprot.WriteFieldBegin(field_);
    oprot.WriteString(FirstName);
    oprot.WriteFieldEnd();
  end;
  if (__isset_LastName) then
  begin
    field_.Name := 'lastName';
    field_.Type_  := TType.String_;
    field_.ID := 3;
    oprot.WriteFieldBegin(field_);
    oprot.WriteString(LastName);
    oprot.WriteFieldEnd();
  end;
  if (__isset_BirthDate) then
  begin
    field_.Name := 'birthDate';
    field_.Type_  := TType.I64;
    field_.ID := 4;
    oprot.WriteFieldBegin(field_);
    oprot.WriteI64(BirthDate);
    oprot.WriteFieldEnd();
  end;
  if (__isset_State) then
  begin
    field_.Name := 'state';
    field_.Type_  := TType.I32;
    field_.ID := 5;
    oprot.WriteFieldBegin(field_);
    oprot.WriteI32(Integer(State));
    oprot.WriteFieldEnd();
  end;
  oprot.WriteFieldStop();
  oprot.WriteStructEnd();
end;

function TProfileImpl.ToString: string;
var
  sb : TThriftStringBuilder;
begin
  sb := TThriftStringBuilder.Create('(');
  try
    sb.Append('PrsId: ');
    sb.Append(PrsId);
    sb.Append(',FirstName: ');
    sb.Append(FirstName);
    sb.Append(',LastName: ');
    sb.Append(LastName);
    sb.Append(',BirthDate: ');
    sb.Append(BirthDate);
    sb.Append(',State: ');
    sb.Append(Integer(State));
    sb.Append(')');
    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

end.