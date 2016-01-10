pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package stddef_h is

   --  unsupported macro: NULL ((void *)0)
   --  arg-macro: procedure offsetof __builtin_offsetof (TYPE, MEMBER)
   --    __builtin_offsetof (TYPE, MEMBER)
   subtype ptrdiff_t is long;  -- /home/tyler/scratch/tools/gnat-gpl-2015-x86_64-linux-bin/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/stddef.h:147

   subtype size_t is unsigned_long;  -- /home/tyler/scratch/tools/gnat-gpl-2015-x86_64-linux-bin/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/stddef.h:212

   subtype wchar_t is int;  -- /home/tyler/scratch/tools/gnat-gpl-2015-x86_64-linux-bin/lib/gcc/x86_64-pc-linux-gnu/4.9.3/include/stddef.h:324

end stddef_h;
