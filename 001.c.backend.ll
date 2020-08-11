source_filename = "test"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"

@ebp = internal unnamed_addr global i32 0
@global_var_804812d.1 = constant [15 x i8] c"Hello, world!\0A\00"

define i32 @strlen(i8* %arg1) local_unnamed_addr {
dec_label_pc_80480c6:
  %v2_80480e02 = load i8, i8* %arg1, align 1
  %v5_80480e34 = icmp eq i8 %v2_80480e02, 0
  %v1_80480e55 = icmp eq i1 %v5_80480e34, false
  br i1 %v1_80480e55, label %dec_label_pc_80480d5.preheader, label %dec_label_pc_80480e7

dec_label_pc_80480d5.preheader:                   ; preds = %dec_label_pc_80480c6
  %v4_80480dd1 = ptrtoint i8* %arg1 to i32
  br label %dec_label_pc_80480d5

dec_label_pc_80480d5:                             ; preds = %dec_label_pc_80480d5.preheader, %dec_label_pc_80480d5
  %v4_80480dd7 = phi i32 [ %v5_80480d5, %dec_label_pc_80480d5 ], [ %v4_80480dd1, %dec_label_pc_80480d5.preheader ]
  %storemerge6 = phi i32 [ %v4_80480d9, %dec_label_pc_80480d5 ], [ 0, %dec_label_pc_80480d5.preheader ]
  %v5_80480d5 = add i32 %v4_80480dd7, 1
  %v23_80480d5 = inttoptr i32 %v5_80480d5 to i8*
  %v4_80480d9 = add i32 %storemerge6, 1
  %v2_80480e0 = load i8, i8* %v23_80480d5, align 1
  %v5_80480e3 = icmp eq i8 %v2_80480e0, 0
  %v1_80480e5 = icmp eq i1 %v5_80480e3, false
  br i1 %v1_80480e5, label %dec_label_pc_80480d5, label %dec_label_pc_80480e7

dec_label_pc_80480e7:                             ; preds = %dec_label_pc_80480d5, %dec_label_pc_80480c6
  %storemerge.lcssa = phi i32 [ 0, %dec_label_pc_80480c6 ], [ %v4_80480d9, %dec_label_pc_80480d5 ]
  ret i32 %storemerge.lcssa

; uselistorder directives
  uselistorder i32 %v5_80480d5, { 1, 0 }
  uselistorder i1 false, { 1, 0 }
  uselistorder i8 0, { 1, 0 }
  uselistorder i8* %arg1, { 1, 0 }
  uselistorder label %dec_label_pc_80480d5, { 1, 0 }
}

define i32 @print(i32* %arg1) local_unnamed_addr {
dec_label_pc_80480ec:
  %v1_80480f6 = bitcast i32* %arg1 to i8*
  %v2_80480f6 = call i32 @strlen(i8* %v1_80480f6)
  %v4_8048111 = call i32 @write(i32 1, i32* %arg1, i32 %v2_80480f6)
  ret i32 %v4_8048111
}

define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr {
dec_label_pc_8048116:
  %v3_804811e = call i32 @print(i32* bitcast ([15 x i8]* @global_var_804812d.1 to i32*))
  ret i32 0

; uselistorder directives
  uselistorder i32 0, { 0, 2, 1, 3 }
}

declare i32 @write(i32, i32*, i32) local_unnamed_addr
