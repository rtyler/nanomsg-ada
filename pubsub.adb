--
--  Pubsub demo with nanomsg
--

with Ada.Calendar,
   Ada.Calendar.Formatting;
with Ada.Text_IO;
with Interfaces.C,
   Interfaces.C.Strings;

with nanomsg_nn_h;

procedure Pubsub is
   pragma Linker_Options ("-lnanomsg");

   use nanomsg_nn_h;
   use Interfaces.C,
      Interfaces.C.Strings;

   use Ada.Text_IO;

   NN_PROTO_PUBSUB : constant := 2;
   NN_PUB : constant := (NN_PROTO_PUBSUB * 16 + 0);
   NN_SUB : constant := (NN_PROTO_PUBSUB * 16 + 1);

   NN_SUB_SUBSCRIBE : constant := 1;
   NN_SUB_UNSUBSCRIBE : constant := 2;

   subtype C_Socket is int;

   Socket : constant C_Socket := nn_socket (AF_SP, NN_PUB);
   Status : int;

   procedure Publish_Tick (Bound_Socket : in C_Socket) is
      Bytes_Sent : int := 0;
      Buffer : constant String := Ada.Calendar.Formatting.Image (Ada.Calendar.Clock);
   begin
      Bytes_Sent := nn_send (Bound_Socket,
                           To_C (Buffer)'Address,
                           unsigned_long (Buffer'Last),
                           0);
      Put_Line ("Sent" & int'Image (Bytes_Sent));
   end Publish_Tick;
begin
   Put_Line ("Running pubsub server");
   Put_Line ("Socket " & int'Image (Socket));

   Status := nn_bind (Socket,
                      New_String ("tcp://127.0.0.1:5018"));

   Put_Line ("Status: " & int'Image (Socket));

   loop
      Publish_Tick (Socket);
      delay 2.0;
   end loop;

   Status := nn_shutdown (Socket, 0);
end Pubsub;
