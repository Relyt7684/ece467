; ModuleID = 'testcases/test10_ref.bc'
source_filename = "testcases/test10.bc"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(i32 %a, i1 zeroext %b, ptr %c, i1 zeroext %d, ptr %e) {
entry:
  %a1 = alloca i32, align 4
  store i32 %a, ptr %a1, align 4
  %b2 = alloca i1, align 1
  store i1 %b, ptr %b2, align 1
  %c3 = alloca ptr, align 8
  store ptr %c, ptr %c3, align 8
  %d4 = alloca i1, align 1
  store i1 %d, ptr %d4, align 1
  %e5 = alloca ptr, align 8
  store ptr %e, ptr %e5, align 8
  %z = alloca [2 x i32], align 4
  %y = alloca [3 x i1], align 1
  store i32 1, ptr %a1, align 4
  store i1 true, ptr %b2, align 1
  %0 = getelementptr [2 x i32], ptr %z, i32 0, i32 666
  store i32 1, ptr %0, align 4
  %1 = getelementptr [3 x i1], ptr %y, i32 0, i32 777
  store i1 true, ptr %1, align 1
  %2 = load ptr, ptr %c3, align 8
  %3 = getelementptr i32, ptr %2, i32 100
  store i32 2, ptr %3, align 4
  %4 = load ptr, ptr %c3, align 8
  %5 = getelementptr i32, ptr %4, i32 666
  %6 = load i32, ptr %5, align 4
  store i32 %6, ptr %a1, align 4
  %7 = load i32, ptr %a1, align 4
  ret i32 %7
}
