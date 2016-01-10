pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stddef_h;
with System;

package nanomsg_nn_h is

   --  unsupported macro: NN_INLINE static inline

   NN_VERSION_CURRENT : constant := 2;  --  /usr/include/nanomsg/nn.h:74

   NN_VERSION_REVISION : constant := 0;  --  /usr/include/nanomsg/nn.h:77

   NN_VERSION_AGE : constant := 2;  --  /usr/include/nanomsg/nn.h:80

   NN_HAUSNUMERO : constant := 156384712;  --  /usr/include/nanomsg/nn.h:88
   --  unsupported macro: EACCESS (NN_HAUSNUMERO + 17)
   --  unsupported macro: ETERM (NN_HAUSNUMERO + 53)
   --  unsupported macro: EFSM (NN_HAUSNUMERO + 54)

   NN_NS_NAMESPACE : constant := 0;  --  /usr/include/nanomsg/nn.h:201
   NN_NS_VERSION : constant := 1;  --  /usr/include/nanomsg/nn.h:202
   NN_NS_DOMAIN : constant := 2;  --  /usr/include/nanomsg/nn.h:203
   NN_NS_TRANSPORT : constant := 3;  --  /usr/include/nanomsg/nn.h:204
   NN_NS_PROTOCOL : constant := 4;  --  /usr/include/nanomsg/nn.h:205
   NN_NS_OPTION_LEVEL : constant := 5;  --  /usr/include/nanomsg/nn.h:206
   NN_NS_SOCKET_OPTION : constant := 6;  --  /usr/include/nanomsg/nn.h:207
   NN_NS_TRANSPORT_OPTION : constant := 7;  --  /usr/include/nanomsg/nn.h:208
   NN_NS_OPTION_TYPE : constant := 8;  --  /usr/include/nanomsg/nn.h:209
   NN_NS_OPTION_UNIT : constant := 9;  --  /usr/include/nanomsg/nn.h:210
   NN_NS_FLAG : constant := 10;  --  /usr/include/nanomsg/nn.h:211
   NN_NS_ERROR : constant := 11;  --  /usr/include/nanomsg/nn.h:212
   NN_NS_LIMIT : constant := 12;  --  /usr/include/nanomsg/nn.h:213

   NN_TYPE_NONE : constant := 0;  --  /usr/include/nanomsg/nn.h:216
   NN_TYPE_INT : constant := 1;  --  /usr/include/nanomsg/nn.h:217
   NN_TYPE_STR : constant := 2;  --  /usr/include/nanomsg/nn.h:218

   NN_UNIT_NONE : constant := 0;  --  /usr/include/nanomsg/nn.h:221
   NN_UNIT_BYTES : constant := 1;  --  /usr/include/nanomsg/nn.h:222
   NN_UNIT_MILLISECONDS : constant := 2;  --  /usr/include/nanomsg/nn.h:223
   NN_UNIT_PRIORITY : constant := 3;  --  /usr/include/nanomsg/nn.h:224
   NN_UNIT_BOOLEAN : constant := 4;  --  /usr/include/nanomsg/nn.h:225
   NN_MSG : constant := size_t'Last;
   --  arg-macro: function NN_CMSG_FIRSTHDR ((mhdr).msg_controllen >= sizeof (struct nn_cmsghdr) ? (struct nn_cmsghdr*) (mhdr).msg_control : (struct nn_cmsghdr*) NULL
   --    return (mhdr).msg_controllen >= sizeof (struct nn_cmsghdr) ? (struct nn_cmsghdr*) (mhdr).msg_control : (struct nn_cmsghdr*) NULL;
   --  arg-macro: procedure NN_CMSG_NXTHDR nn_cmsg_nexthdr_ ((struct nn_msghdr*) (mhdr), (struct nn_cmsghdr*) (cmsg))
   --    nn_cmsg_nexthdr_ ((struct nn_msghdr*) (mhdr), (struct nn_cmsghdr*) (cmsg))
   --  arg-macro: function NN_CMSG_DATA ((unsigned char*) (((struct nn_cmsghdr*) (cmsg)) + 1)
   --    return (unsigned char*) (((struct nn_cmsghdr*) (cmsg)) + 1);
   --  arg-macro: function NN_CMSG_ALIGN (((len) + sizeof (size_t) - 1) and (size_t) ~(sizeof (size_t) - 1)
   --    return ((len) + sizeof (size_t) - 1) and (size_t) ~(sizeof (size_t) - 1);
   --  arg-macro: function NN_CMSG_SPACE (NN_CMSG_ALIGN (len) + NN_CMSG_ALIGN (sizeof (struct nn_cmsghdr))
   --    return NN_CMSG_ALIGN (len) + NN_CMSG_ALIGN (sizeof (struct nn_cmsghdr));
   --  arg-macro: function NN_CMSG_LEN (NN_CMSG_ALIGN (sizeof (struct nn_cmsghdr)) + (len)
   --    return NN_CMSG_ALIGN (sizeof (struct nn_cmsghdr)) + (len);

   AF_SP : constant := 1;  --  /usr/include/nanomsg/nn.h:327
   AF_SP_RAW : constant := 2;  --  /usr/include/nanomsg/nn.h:328

   NN_SOCKADDR_MAX : constant := 128;  --  /usr/include/nanomsg/nn.h:331

   NN_SOL_SOCKET : constant := 0;  --  /usr/include/nanomsg/nn.h:335

   NN_LINGER : constant := 1;  --  /usr/include/nanomsg/nn.h:338
   NN_SNDBUF : constant := 2;  --  /usr/include/nanomsg/nn.h:339
   NN_RCVBUF : constant := 3;  --  /usr/include/nanomsg/nn.h:340
   NN_SNDTIMEO : constant := 4;  --  /usr/include/nanomsg/nn.h:341
   NN_RCVTIMEO : constant := 5;  --  /usr/include/nanomsg/nn.h:342
   NN_RECONNECT_IVL : constant := 6;  --  /usr/include/nanomsg/nn.h:343
   NN_RECONNECT_IVL_MAX : constant := 7;  --  /usr/include/nanomsg/nn.h:344
   NN_SNDPRIO : constant := 8;  --  /usr/include/nanomsg/nn.h:345
   NN_RCVPRIO : constant := 9;  --  /usr/include/nanomsg/nn.h:346
   NN_SNDFD : constant := 10;  --  /usr/include/nanomsg/nn.h:347
   NN_RCVFD : constant := 11;  --  /usr/include/nanomsg/nn.h:348
   NN_DOMAIN : constant := 12;  --  /usr/include/nanomsg/nn.h:349
   NN_PROTOCOL : constant := 13;  --  /usr/include/nanomsg/nn.h:350
   NN_IPV4ONLY : constant := 14;  --  /usr/include/nanomsg/nn.h:351
   NN_SOCKET_NAME : constant := 15;  --  /usr/include/nanomsg/nn.h:352

   NN_DONTWAIT : constant := 1;  --  /usr/include/nanomsg/nn.h:355

   NN_POLLIN : constant := 1;  --  /usr/include/nanomsg/nn.h:375
   NN_POLLOUT : constant := 2;  --  /usr/include/nanomsg/nn.h:376

   function nn_errno return int;  -- /usr/include/nanomsg/nn.h:189
   pragma Import (C, nn_errno, "nn_errno");

   function nn_strerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/nanomsg/nn.h:192
   pragma Import (C, nn_strerror, "nn_strerror");

   function nn_symbol (arg1 : int; arg2 : access int) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/nanomsg/nn.h:198
   pragma Import (C, nn_symbol, "nn_symbol");

   type nn_symbol_properties is record
      value : aliased int;  -- /usr/include/nanomsg/nn.h:231
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/include/nanomsg/nn.h:234
      ns : aliased int;  -- /usr/include/nanomsg/nn.h:237
      c_type : aliased int;  -- /usr/include/nanomsg/nn.h:240
      unit : aliased int;  -- /usr/include/nanomsg/nn.h:243
   end record;
   pragma Convention (C_Pass_By_Copy, nn_symbol_properties);  -- /usr/include/nanomsg/nn.h:228

   function nn_symbol_info
     (arg1 : int;
      arg2 : access nn_symbol_properties;
      arg3 : int) return int;  -- /usr/include/nanomsg/nn.h:249
   pragma Import (C, nn_symbol_info, "nn_symbol_info");

   procedure nn_term;  -- /usr/include/nanomsg/nn.h:256
   pragma Import (C, nn_term, "nn_term");

   function nn_allocmsg (arg1 : stddef_h.size_t; arg2 : int) return System.Address;  -- /usr/include/nanomsg/nn.h:264
   pragma Import (C, nn_allocmsg, "nn_allocmsg");

   function nn_reallocmsg (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address;  -- /usr/include/nanomsg/nn.h:265
   pragma Import (C, nn_reallocmsg, "nn_reallocmsg");

   function nn_freemsg (arg1 : System.Address) return int;  -- /usr/include/nanomsg/nn.h:266
   pragma Import (C, nn_freemsg, "nn_freemsg");

   type nn_iovec is record
      iov_base : System.Address;  -- /usr/include/nanomsg/nn.h:273
      iov_len : aliased stddef_h.size_t;  -- /usr/include/nanomsg/nn.h:274
   end record;
   pragma Convention (C_Pass_By_Copy, nn_iovec);  -- /usr/include/nanomsg/nn.h:272

   type nn_msghdr is record
      msg_iov : access nn_iovec;  -- /usr/include/nanomsg/nn.h:278
      msg_iovlen : aliased int;  -- /usr/include/nanomsg/nn.h:279
      msg_control : System.Address;  -- /usr/include/nanomsg/nn.h:280
      msg_controllen : aliased stddef_h.size_t;  -- /usr/include/nanomsg/nn.h:281
   end record;
   pragma Convention (C_Pass_By_Copy, nn_msghdr);  -- /usr/include/nanomsg/nn.h:277

   type nn_cmsghdr is record
      cmsg_len : aliased stddef_h.size_t;  -- /usr/include/nanomsg/nn.h:285
      cmsg_level : aliased int;  -- /usr/include/nanomsg/nn.h:286
      cmsg_type : aliased int;  -- /usr/include/nanomsg/nn.h:287
   end record;
   pragma Convention (C_Pass_By_Copy, nn_cmsghdr);  -- /usr/include/nanomsg/nn.h:284

   function nn_cmsg_nexthdr_u (mhdr : System.Address; cmsg : System.Address) return access nn_cmsghdr;  -- /usr/include/nanomsg/nn.h:292
   pragma Import (C, nn_cmsg_nexthdr_u, "nn_cmsg_nexthdr_");

   function nn_socket (arg1 : int; arg2 : int) return int;  -- /usr/include/nanomsg/nn.h:357
   pragma Import (C, nn_socket, "nn_socket");

   function nn_close (arg1 : int) return int;  -- /usr/include/nanomsg/nn.h:358
   pragma Import (C, nn_close, "nn_close");

   function nn_setsockopt
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : System.Address;
      arg5 : stddef_h.size_t) return int;  -- /usr/include/nanomsg/nn.h:359
   pragma Import (C, nn_setsockopt, "nn_setsockopt");

   function nn_getsockopt
     (arg1 : int;
      arg2 : int;
      arg3 : int;
      arg4 : System.Address;
      arg5 : access stddef_h.size_t) return int;  -- /usr/include/nanomsg/nn.h:361
   pragma Import (C, nn_getsockopt, "nn_getsockopt");

   function nn_bind (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/nanomsg/nn.h:363
   pragma Import (C, nn_bind, "nn_bind");

   function nn_connect (arg1 : int; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/nanomsg/nn.h:364
   pragma Import (C, nn_connect, "nn_connect");

   function nn_shutdown (arg1 : int; arg2 : int) return int;  -- /usr/include/nanomsg/nn.h:365
   pragma Import (C, nn_shutdown, "nn_shutdown");

   function nn_send
     (arg1 : int;
      arg2 : System.Address;
      arg3 : stddef_h.size_t;
      arg4 : int) return int;  -- /usr/include/nanomsg/nn.h:366
   pragma Import (C, nn_send, "nn_send");

   function nn_recv
     (arg1 : int;
     -- using `in out` in 2012 mode since we can allow the underlying C binding
     -- allocate our object for us
      arg2 : in out System.Address;
      arg3 : stddef_h.size_t;
      arg4 : int) return int;  -- /usr/include/nanomsg/nn.h:367
   pragma Import (C, nn_recv, "nn_recv");

   function nn_sendmsg
     (arg1 : int;
      arg2 : System.Address;
      arg3 : int) return int;  -- /usr/include/nanomsg/nn.h:368
   pragma Import (C, nn_sendmsg, "nn_sendmsg");

   function nn_recvmsg
     (arg1 : int;
      arg2 : access nn_msghdr;
      arg3 : int) return int;  -- /usr/include/nanomsg/nn.h:369
   pragma Import (C, nn_recvmsg, "nn_recvmsg");

   type nn_pollfd is record
      fd : aliased int;  -- /usr/include/nanomsg/nn.h:379
      events : aliased short;  -- /usr/include/nanomsg/nn.h:380
      revents : aliased short;  -- /usr/include/nanomsg/nn.h:381
   end record;
   pragma Convention (C_Pass_By_Copy, nn_pollfd);  -- /usr/include/nanomsg/nn.h:378

   function nn_poll
     (arg1 : access nn_pollfd;
      arg2 : int;
      arg3 : int) return int;  -- /usr/include/nanomsg/nn.h:384
   pragma Import (C, nn_poll, "nn_poll");

   function nn_device (arg1 : int; arg2 : int) return int;  -- /usr/include/nanomsg/nn.h:390
   pragma Import (C, nn_device, "nn_device");

end nanomsg_nn_h;
