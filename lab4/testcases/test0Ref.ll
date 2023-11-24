; ModuleID = 'testcases/test0Ref.bc'
source_filename = "testcases/test0Ref.bc"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0
@y = common global i32 0
@a = common global i1 false
@b = common global [2 x i32] zeroinitializer
@c = common global [5 x i1] zeroinitializer
@global = common global i32 0

declare i1 @readBool()

declare i32 @readInt()

declare void @writeBool(i1 zeroext)

declare void @writeInt(i32)

declare void @newLine()

declare i32 @foo(i32)

define void @func0() {
entry:
  ret void
}

define void @func1(i32 %a, i1 zeroext %b) {
entry:
  %a1 = alloca i32, align 4
  store i32 %a, ptr %a1, align 4
  %b2 = alloca i1, align 1
  store i1 %b, ptr %b2, align 1
  %0 = load i32, ptr %a1, align 4
  %1 = sub i32 0, %0
  %2 = load i1, ptr %b2, align 1
  %3 = xor i1 %2, true
  ret void
}

define void @func2(ptr %a, ptr %b) {
entry:
  %a1 = alloca ptr, align 8
  store ptr %a, ptr %a1, align 8
  %b2 = alloca ptr, align 8
  store ptr %b, ptr %b2, align 8
  %0 = load ptr, ptr %a1, align 8
  %1 = getelementptr i32, ptr %0, i32 3
  %2 = load i32, ptr %1, align 4
  %3 = load ptr, ptr %a1, align 8
  %4 = getelementptr i32, ptr %3, i32 4
  %5 = load i32, ptr %4, align 4
  %6 = add i32 %2, %5
  %7 = load ptr, ptr %b2, align 8
  %8 = getelementptr i1, ptr %7, i32 1
  %9 = load i1, ptr %8, align 1
  %10 = xor i1 %9, true
  ret void
}

define i32 @func4() {
entry:
  ret i32 0
}

define i1 @func5() {
entry:
  ret i1 false
}

define void @main(i32 %a, ptr %b) {
entry:
  %a1 = alloca i32, align 4
  store i32 %a, ptr %a1, align 4
  %b2 = alloca ptr, align 8
  store ptr %b, ptr %b2, align 8
  %x = alloca i32, align 4
  %z = alloca [4 x i32], align 4
  %y = alloca [3 x i1], align 1
  %x3 = alloca [5 x i32], align 4
  call void @func0()
  %0 = load i32, ptr %a1, align 4
  %1 = getelementptr [3 x i1], ptr %y, i32 0, i32 1
  %2 = load i1, ptr %1, align 1
  call void @func1(i32 %0, i1 %2)
  %3 = load i32, ptr %x, align 4
  %4 = getelementptr [3 x i1], ptr %y, i32 0, i32 3
  %5 = load i1, ptr %4, align 1
  call void @func1(i32 %3, i1 %5)
  %6 = getelementptr [4 x i32], ptr %z, i32 0, i32 0
  %7 = getelementptr [3 x i1], ptr %y, i32 0, i32 0
  call void @func2(ptr %6, ptr %7)
  ret void
}

define void @bar(i32 %d) {
entry:
  %d1 = alloca i32, align 4
  store i32 %d, ptr %d1, align 4
  %x = alloca i32, align 4
  %tmp = alloca i32, align 4
  %0 = load i32, ptr %tmp, align 4
  %1 = add i32 %0, 1
  %2 = load i32, ptr %x, align 4
  %3 = add i32 %1, %2
  store i32 %3, ptr %x, align 4
  %4 = load i32, ptr %x, align 4
  %5 = call i32 @foo(i32 %4)
  ret void
}

define i1 @barArray(ptr %y) {
entry:
  %y1 = alloca ptr, align 8
  store ptr %y, ptr %y1, align 8
  %x = alloca [2 x i32], align 4
  %n = alloca [5 x i32], align 4
  %f = alloca i32, align 4
  %d = alloca i32, align 4
  %0 = getelementptr [5 x i32], ptr %n, i32 0, i32 7
  %1 = load i32, ptr %0, align 4
  %2 = load ptr, ptr %y1, align 8
  %3 = getelementptr i32, ptr %2, i32 3
  %4 = load i32, ptr %3, align 4
  %5 = add i32 %1, %4
  %6 = getelementptr [2 x i32], ptr %x, i32 0, i32 2
  store i32 %5, ptr %6, align 4
  %7 = load i32, ptr %d, align 4
  %8 = load i32, ptr %f, align 4
  %9 = add i32 %7, %8
  %10 = load ptr, ptr %y1, align 8
  %11 = getelementptr i32, ptr %10, i32 %9
  %12 = load i32, ptr %11, align 4
  %13 = getelementptr [5 x i32], ptr %n, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 8, %14
  ret i1 %15
}

define void @ifTest() {
entry:
  %x = alloca i32, align 4
  store i32 1, ptr %x, align 4
  %0 = load i32, ptr %x, align 4
  %1 = icmp sgt i32 %0, 1
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  store i32 2, ptr %x, align 4
  br label %merge

merge:                                            ; preds = %else, %then
  store i32 4, ptr %x, align 4
  ret void

else:                                             ; preds = %entry
  store i32 3, ptr %x, align 4
  br label %merge
}

define i32 @arth() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i1, align 1
  %d = alloca i1, align 1
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %2 = add i32 %0, %1
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %b, align 4
  %5 = sub i32 %3, %4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %8 = mul i32 %6, %7
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %b, align 4
  %11 = sdiv i32 %9, %10
  %12 = load i1, ptr %c, align 1
  %13 = load i1, ptr %d, align 1
  %14 = and i1 %12, %13
  %15 = load i1, ptr %c, align 1
  %16 = load i1, ptr %d, align 1
  %17 = or i1 %15, %16
  %18 = load i32, ptr %a, align 4
  %19 = load i32, ptr %b, align 4
  %20 = icmp eq i32 %18, %19
  %21 = load i32, ptr %a, align 4
  %22 = load i32, ptr %b, align 4
  %23 = icmp ne i32 %21, %22
  %24 = load i32, ptr %a, align 4
  %25 = load i32, ptr %b, align 4
  %26 = icmp slt i32 %24, %25
  %27 = load i32, ptr %a, align 4
  %28 = load i32, ptr %b, align 4
  %29 = icmp sle i32 %27, %28
  %30 = load i32, ptr %a, align 4
  %31 = load i32, ptr %b, align 4
  %32 = icmp sgt i32 %30, %31
  %33 = load i32, ptr %a, align 4
  %34 = load i32, ptr %b, align 4
  %35 = icmp sge i32 %33, %34
  %36 = load i32, ptr %a, align 4
  %37 = sub i32 0, %36
  %38 = load i1, ptr %c, align 1
  %39 = xor i1 %38, true
  %40 = load i32, ptr @global, align 4
  %41 = load i32, ptr %a, align 4
  %42 = add i32 %40, %41
  ret i32 %42
}
