(**************************************************************************)
(*                                                                        *)
(*          General Purpose Hash Function Algorithms Library              *)
(*                                                                        *)
(* Author: Arash Partow - 2002                                            *)
(* Class: Bloom Filter                                                    *)
(* URL: http://www.partow.net                                             *)
(* URL: http://www.partow.net/programming/hashfunctions/index.html        *)
(*                                                                        *)
(* Copyright notice:                                                      *)
(* Free use of the General Purpose Hash Function Algorithms Library is    *)
(* permitted under the guidelines and in accordance with the MIT License. *)
(* http://www.opensource.org/licenses/MIT                                 *)
(*                                                                        *)
(**************************************************************************)


unit BloomFilter;

interface

uses
   Classes;

type TBloomFilter = class

  public

    constructor Create(Size :Integer);
    destructor  Destroy;               override;

    procedure Insert  (const Key : String);
    function  Contains(const Key : String) : Boolean;

  private

    HashFunction : TList;
    HashTable    : Array of Byte;
    TableSize    : Cardinal;

    procedure RegisterHashFunctions;
end;

implementation

uses
   GeneralHashFunctions;

const ByteSize : Cardinal = 8;
const BitMask  : array [0..7] of Byte = (
                                         $01,  //00000001
                                         $02,  //00000010
                                         $04,  //00000100
                                         $08,  //00001000
                                         $10,  //00010000
                                         $20,  //00100000
                                         $40,  //01000000
                                         $80   //10000000
                                        );



constructor TBloomFilter.Create(Size :Integer);
var
  i : Integer;
begin
  RegisterHashFunctions;
  SetLength(HashTable,Size);
  TableSize := Size;
  for i := 0 to TableSize - 1 do HashTable[i] := 0;
end;


destructor TBloomFilter.Destroy;
begin
  finalize(HashTable);
  HashFunction.Free;
end;


procedure TBloomFilter.RegisterHashFunctions;
begin
  HashFunction := TList.Create;
  HashFunction.Add(@RSHash);
  HashFunction.Add(@JSHash);
  HashFunction.Add(@PJWHash);
  HashFunction.Add(@ELFHash);
  HashFunction.Add(@BKDRHash);
  HashFunction.Add(@SDBMHash);
  HashFunction.Add(@DJBHash);
  HashFunction.Add(@DEKHash);
  HashFunction.Add(@APHash);
end;


procedure TBloomFilter.Insert(const Key : String);
var
  i        : Integer;
  BitIndex : Cardinal;
begin
  for i := 0 to HashFunction.Count - 1  do
  begin
    BitIndex                  := THashFunction(HashFunction[i])(Key) mod (TableSize * ByteSize);
    HashTable[BitIndex shr 3] := HashTable[BitIndex div ByteSize] or BitMask[BitIndex mod ByteSize];
  end;
end;


function TBloomFilter.Contains(const Key : String) : Boolean;
var
  i        : Integer;
  Bit      : Cardinal;
  BitIndex : Cardinal;
begin
  for i := 0 To HashFunction.Count - 1  do
  begin
    BitIndex := THashFunction(HashFunction[i])(Key) mod (TableSize * ByteSize);
    Bit      := BitIndex mod ByteSize;
    if (HashTable[BitIndex div ByteSize] and BitMask[Bit]) <> BitMask[Bit] then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

end.
