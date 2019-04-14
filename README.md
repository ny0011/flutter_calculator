# 계산기 by solocoding2019_base

## 요구사항
1. 덧셈, 뺄셈, 곱셈, 나눗셈 연산이 가능해야 한다.
2. 최소 10자리 까지는 정수로 연산이 가능해야 한다.
3. 최소 소수점 5자리까지 연산이 가능해야 한다.
4. 사칙연산 이외의 산술적 연산을 추가로 4가지 이상 지원해야 한다.
5. '='연산을 수행할 때마다 해당할 때의 연산 결과를 기기내 저장공간에 기록해주어야 한다.
6. 최근에 연산한 결과를 5개 이상은 조회할 수 있어야 한다.
7. 연산 결과를 길게 누르면 클립보드에 복사된다.

## 구현
핸드폰의 기본 계산기 어플을 따라 구현한다.
* UI 
  * 최상단에 입력한 숫자를 보여주는 빈 칸
  * 빈 칸 아래에 0 ~ 9 및 사칙연산 기호(+, -, /, x, =) 및 소수점(.) 및 삭제, 리셋 버튼 표시

* 기능
  * 손으로 버튼을 터치했을 때 빈 칸에 버튼이 눌린 기호가 무엇인지 표기한다
  * = 버튼을 누르면 연산을 실행한다
