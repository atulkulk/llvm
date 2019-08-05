; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -instcombine -S < %s | FileCheck %s

define i8* @memcpy_nonconst_n(i8* %d, i8* nocapture readonly %s, i64 %n) {
; CHECK-LABEL: @memcpy_nonconst_n(
; CHECK-NEXT:    [[R:%.*]] = tail call i8* @mempcpy(i8* [[D:%.*]], i8* [[S:%.*]], i64 [[N:%.*]])
; CHECK-NEXT:    ret i8* [[R]]
;
  %r = tail call i8* @mempcpy(i8* %d, i8* %s, i64 %n)
  ret i8* %r
}

define i8* @memcpy_small_const_n(i8* %d, i8* nocapture readonly %s) {
; CHECK-LABEL: @memcpy_small_const_n(
; CHECK-NEXT:    [[R:%.*]] = tail call i8* @mempcpy(i8* [[D:%.*]], i8* [[S:%.*]], i64 8)
; CHECK-NEXT:    ret i8* [[R]]
;
  %r = tail call i8* @mempcpy(i8* %d, i8* %s, i64 8)
  ret i8* %r
}

define i8* @memcpy_big_const_n(i8* %d, i8* nocapture readonly %s) {
; CHECK-LABEL: @memcpy_big_const_n(
; CHECK-NEXT:    [[R:%.*]] = tail call i8* @mempcpy(i8* [[D:%.*]], i8* [[S:%.*]], i64 1024)
; CHECK-NEXT:    ret i8* [[R]]
;
  %r = tail call i8* @mempcpy(i8* %d, i8* %s, i64 1024)
  ret i8* %r
}

declare i8* @mempcpy(i8*, i8* nocapture readonly, i64)
