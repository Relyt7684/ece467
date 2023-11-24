; ModuleID = 'testcases/test13_ref.bc'
source_filename = "testcases/test13.bc"
target triple = "x86_64-unknown-linux-gnu"

define void @abc() {
entry:
  %x = alloca i1, align 1
  %y = alloca i1, align 1
  %z = alloca i32, align 4
  %w = alloca i32, align 4
  %0 = load i1, ptr %x, align 1
  %1 = load i1, ptr %y, align 1
  %2 = and i1 %0, %1
  br i1 %2, label %then, label %merge

then:                                             ; preds = %entry
  store i32 777, ptr %z, align 4
  br label %merge

merge:                                            ; preds = %then, %entry
  %3 = load i1, ptr %x, align 1
  %4 = load i1, ptr %y, align 1
  %5 = and i1 %3, %4
  br i1 %5, label %then1, label %else

then1:                                            ; preds = %merge
  store i32 777, ptr %z, align 4
  br label %merge2

merge2:                                           ; preds = %else, %then1
  br label %while.cond

else:                                             ; preds = %merge
  store i32 1234, ptr %w, align 4
  br label %merge2

while.cond:                                       ; preds = %while.body, %merge2
  %6 = load i32, ptr %z, align 4
  %7 = load i32, ptr %w, align 4
  %8 = icmp eq i32 %6, %7
  br i1 %8, label %while.body, label %while.exit

while.body:                                       ; preds = %while.cond
  store i1 false, ptr %x, align 1
  br label %while.cond

while.exit:                                       ; preds = %while.cond
  ret void
}
