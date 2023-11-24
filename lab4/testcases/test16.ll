; ModuleID = 'testcases/test16.bc'
source_filename = "testcases/test16.bc"
target triple = "x86_64-unknown-linux-gnu"

declare i1 @readBool()

declare i32 @readInt()

declare void @writeBool(i1 zeroext)

declare void @writeInt(i32)

declare void @newLine()

define void @main() {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  br label %while.cond

while.cond:                                       ; preds = %entry
  %0 = load i32, ptr %x, align 4
  %1 = icmp slt i32 %0, 5
  br i1 %1, label %while.body, label %while.exit

while.body:                                       ; preds = %while.cond
  ret void

while.exit:                                       ; preds = %while.cond
  %2 = load i32, ptr %x, align 4
  %3 = icmp sgt i32 %2, 6
  br i1 %3, label %then, label %else

then:                                             ; preds = %while.exit
  ret void

merge:                                            ; No predecessors!
  %4 = load i32, ptr %y, align 4
  %5 = load i32, ptr %z, align 4
  %6 = icmp eq i32 %4, %5
  br i1 %6, label %then1, label %else3

else:                                             ; preds = %while.exit
  ret void

then1:                                            ; preds = %merge
  store i32 2, ptr %y, align 4
  br label %merge2

merge2:                                           ; preds = %else3, %then1
  ret void

else3:                                            ; preds = %merge
  store i32 1, ptr %z, align 4
  br label %merge2
}
