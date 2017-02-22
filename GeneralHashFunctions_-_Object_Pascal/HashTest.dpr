(*************************************************************************)
(*                                                                       *)
(*                  General Hash Functions Hash Test                     *)
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


program HashTest;

{$APPTYPE CONSOLE}

uses
   SysUtils,
   GeneralHashFunctions;

var
  Key : String;

begin
 Key := 'abcdefghijklmnopqrstuvwxyz1234567890';
 Writeln('General Purpose Hash Function Algorithms Test');
 Writeln('By Arash Partow - 2002');
 Writeln;
 Writeln('Key: ',Key);
 Writeln;
 Writeln(' 1. RS-Hash Function Value:   ', RSHash  (Key));
 Writeln(' 2. JS-Hash Function Value:   ', JSHash  (Key));
 Writeln(' 3. PJW-Hash Function Value:  ', PJWHash (Key));
 Writeln(' 4. ELF-Hash Function Value:  ', ELFHash (Key));
 Writeln(' 5. BKDR-Hash Function Value: ', BKDRHash(Key));
 Writeln(' 6. SDBM-Hash Function Value: ', SDBMHash(Key));
 Writeln(' 7. DJB-Hash Function Value:  ', DJBHash (Key));
 Writeln(' 8. DEK-Hash Function Value:  ', DEKHash (Key));
 Writeln(' 9. BP-Hash Function Value:   ', BPHash  (Key));
 Writeln(' 9. FNV-Hash Function Value:  ', FNVHash (Key));
 Writeln('10. AP-Hash Function Value:   ', APHash  (Key));
 Writeln;
 Writeln('Press "ENTER" to exit...');
 Readln;
end.
