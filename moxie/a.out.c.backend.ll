source_filename = "test"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"

@0 = external global i32

define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_1b5:
  %v0_1b5 = call i32 @__x86.get_pc_thunk.ax()
  ret i32 5
}

define i32 @__x86.get_pc_thunk.ax() local_unnamed_addr {
dec_label_pc_1c5:
  %tmp = call i32 @__decompiler_undefined_function_0()
  ret i32 %tmp
}

define void @_start(i32 %status) local_unnamed_addr {
dec_label_pc_1c9:
  %v2_1c9 = call i32 @main(i32 ptrtoint (i32* @0 to i32), i8** bitcast (i32* @0 to i8**))
  call void @exit(i32 0)
  ret void
}

declare void @exit(i32) local_unnamed_addr

declare i32 @__decompiler_undefined_function_0() local_unnamed_addr
