(*************************************************************************)
(*                                                                       *)
(*             General Hash Functions Bloom Filter Test                  *)
(*                                                                       *)
(* Author: Arash Partow - 2002                                           *)
(* URL: http://www.partow.net                                            *)
(*                                                                       *)
(* Copyright notice:                                                     *)
(* Free use of the General Hash Functions Library is permitted under the *)
(* guidelines and in accordance with the MIT License.                    *)
(* http://www.opensource.org/licenses/MIT                                *)
(*                                                                       *)
(*************************************************************************)


program BloomFilterTest;

{$APPTYPE CONSOLE}


uses
  SysUtils,
  Classes,
  BloomFilter in 'BloomFilter.pas',
  GeneralHashFunctions in '..\GeneralHashFunctions_-_Object_Pascal\GeneralHashFunctions.pas';


function Reverse(Const Str : String) : String;
var
  i : Integer;
begin
  Result := '';
  for i := Length(Str) downto 1 do
  begin
    Result := Result + Str[i];
  end;
end;

var
  i      : Integer;
  List   : TStringList;
  Filter : TBloomFilter;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  List := TStringList.Create;
  List.LoadFromFile('word-list.txt');

  Filter := TBloomFilter.Create(List.Count * 32);

  for i := 0 to List.Count - 1 do
  begin
    Filter.Insert(List[i]);
  end;

  for i := 0 to List.Count - 1 do
  begin
    if not Filter.contains(List[i]) then
    begin
      WriteLn('ERROR: key not found! => ',List[i]);
    end;
  end;

  for i := 0 to List.Count - 1 do
  begin
    if Filter.contains(List[i] + reverse(List[i])) then
    begin
      WriteLn('ERROR: key that does not exist found! => ',List[i] + reverse(List[i]));
    end;
  end;

end.
