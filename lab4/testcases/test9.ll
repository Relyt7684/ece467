; ModuleID = 'testcases/test9.bc'
source_filename = "testcases/test9.bc"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0
@y = common global i1 false
@z = common global [666 x i32] zeroinitializer

define void @abc() {
entry:
  ret void
}

define i32 @main() {
entry:
  ret i32 1
}
