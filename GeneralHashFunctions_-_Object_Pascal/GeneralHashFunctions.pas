(**************************************************************************)
(*                                                                        *)
(*          General Purpose Hash Function Algorithms Library              *)
(*                                                                        *)
(* Author: Arash Partow - 2002                                            *)
(* URL: http://www.partow.net                                             *)
(* URL: http://www.partow.net/programming/hashfunctions/index.html        *)
(*                                                                        *)
(* Copyright notice:                                                      *)
(* Free use of the General Purpose Hash Function Algorithms Library is    *)
(* permitted under the guidelines and in accordance with the MIT License. *)
(* http://www.opensource.org/licenses/MIT                                 *)
(*                                                                        *)
(**************************************************************************)


unit GeneralHashfunctions;

interface


type THashfunction = function(const key : String) : Cardinal;


function RSHash   (const Str : String) : Cardinal;
function JSHash   (const Str : String) : Cardinal;
function PJWHash  (const Str : String) : Cardinal;
function ELFHash  (const Str : String) : Cardinal;
function BKDRHash (const Str : String) : Cardinal;
function SDBMHash (const Str : String) : Cardinal;
function DJBHash  (const Str : String) : Cardinal;
function DEKHash  (const Str : String) : Cardinal;
function BPHash   (const Str : String) : Cardinal;
function FNVHash  (const Str : String) : Cardinal;
function APHash   (const Str : String) : Cardinal;

implementation

function RSHash(const Str : String) : Cardinal;
const b = 378551;
var
  a : Cardinal;
  i : Integer;
begin
  a      := 63689;
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := Result * a + Ord(Str[i]);
    a      := a * b;
  end;
end;
(* End Of RS Hash function *)


function JSHash(const Str : String) : Cardinal;
var
  i : Integer;
begin
  Result := 1315423911;
  for i := 1 to Length(Str) do
  begin
    Result := Result xor ((Result shl 5) + Ord(Str[i]) + (Result shr 2));
  end;
end;
(* End Of JS Hash function *)


function PJWHash(const Str : String) : Cardinal;
const BitsInCardinal = Sizeof(Cardinal) * 8;
const ThreeQuarters  = (BitsInCardinal  * 3) div 4;
const OneEighth      = BitsInCardinal div 8;
const HighBits       : Cardinal = (not Cardinal(0)) shl (BitsInCardinal - OneEighth);
var
  i    : Cardinal;
  Test : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := (Result shl OneEighth) + Ord(Str[i]);
    Test   := Result and HighBits;
    If (Test <> 0) then
    begin
      Result := (Result xor (Test shr ThreeQuarters)) and (not HighBits);
    end;
  end;
end;
(* End Of P. J. Weinberger Hash function *)


function ELFHash(const Str : String) : Cardinal;
var
  i : Cardinal;
  x : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := (Result shl 4) + Ord(Str[i]);
    x      := Result and $F0000000;
    if (x <> 0) then
    begin
      Result := Result xor (x shr 24);
    end;
    Result := Result and (not x);
  end;
end;
(* End Of ELF Hash function *)


function BKDRHash(const Str : String) : Cardinal;
const Seed = 131; (* 31 131 1313 13131 131313 etc... *)
var
  i : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := (Result * Seed) + Ord(Str[i]);
  end;
end;
(* End Of BKDR Hash function *)


function SDBMHash(const Str : String) : Cardinal;
var
  i : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := Ord(str[i]) + (Result shl 6) + (Result shl 16) - Result;
  end;
end;
(* End Of SDBM Hash function *)


function DJBHash(const Str : String) : Cardinal;
var
  i : Cardinal;
begin
  Result := 5381;
  for i := 1 to Length(Str) do
  begin
    Result := ((Result shl 5) + Result) + Ord(Str[i]);
  end;
end;
(* End Of DJB Hash function *)


function DEKHash(const Str : String) : Cardinal;
var
  i : Cardinal;
begin
  Result := Length(Str);
  for i := 1 to Length(Str) do
  begin
    Result := ((Result shr 5) xor (Result shl 27)) xor Ord(Str[i]);
  end;
end;
(* End Of DEK Hash function *)


function BPHash(const Str : String) : Cardinal;
var
  i : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := Result shl 7 xor Ord(Str[i]);
  end;
end;
(* End Of BP Hash function *)


function FNVHash(const Str : String) : Cardinal;
const FNVPrime = $811C9DC5;
var
  i : Cardinal;
begin
  Result := 0;
  for i := 1 to Length(Str) do
  begin
    Result := Result * FNVPrime;
    Result := Result xor Ord(Str[i]);
  end;
end;
(* End Of FNV Hash function *)


function APHash(const Str : String) : Cardinal;
var
  i : Cardinal;
begin
  Result := $AAAAAAAA;
  for i := 1 to Length(Str) do
  begin
    if ((i - 1) and 1) = 0 then
      Result := Result xor ((Result shl 7) xor Ord(Str[i]) * (Result shr 3))
    else
      Result := Result xor (not((Result shl 11) + Ord(Str[i]) xor (Result shr 5)));
  end;
end;
(* End Of AP Hash function *)


end.


