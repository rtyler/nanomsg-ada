--
--  Pipeline demo with nanomsg
--

with Ada.Characters.Latin_1;
with Ada.Command_Line;
with Ada.Text_IO;
with Interfaces.C,
   Interfaces.C.Strings;
with System,
   System.Address_To_Access_Conversions,
   System.Address_Image;

use Ada.Text_IO;

with nanomsg_nn_h;
use nanomsg_nn_h;

use Interfaces.C,
   Interfaces.C.Strings;

procedure Pipeline is
   pragma Linker_Options ("-lnanomsg");

   NN_PROTO_PIPELINE : constant := 5;
   NN_PULL : constant := (NN_PROTO_PIPELINE * 16 + 1);
   NN_MSG : constant := size_t'Last;

   Socket : constant int := nn_socket (AF_SP, NN_PULL);
   Status : int;
begin
   Put_Line ("Running pipeline");
   Put_Line ("Socket " & int'Image (Socket));

   Status := nn_bind (Socket,
                      New_String ("ipc:///tmp/pipeline.ipc"));

   Put_Line ("Status: " & int'Image (Socket));

   declare
      Bytes : Integer := 0;
      Buf : aliased System.Address;
   begin
      loop
         Bytes := Integer (nn_recv (Socket, Buf, NN_MSG, 0));
         Put_Line ("Recv " & Integer'Image (Bytes));
         Flush;

         declare
            F : String (1 .. Bytes - 1);
            pragma Import (C, F);
            for F'Address use Buf;
         begin
            Put_Line (F);
         end;
         Status := nn_freemsg (Buf);
         exit;
      end loop;
   end;

   Ada.Command_Line.Set_Exit_Status (0);
end Pipeline;
