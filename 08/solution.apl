⍝ testing matrices
a ← 8 8 ⍴ (2 0 0 2 1 0 1 0 1 3 0 2 1 2 3 0 0 1 2 0 1 2 3 2 0 0 3 2 1 4 4 1 3 3 0 4 0 4 2 4 2 4 0 2 4 2 2 2 1 1 1 4 5 5 3 3 4 4 2 1 3 3 3 5)
a ← 5 5 ⍴ (3 0 3 7 3 2 5 5 1 2 6 5 3 3 2 3 3 5 4 9 3 5 3 9 0)

n ← 5
m ← n n ⍴ 0
y ← n ⍴ 2

max ← { ⊃⍵[⍒⍵] }
inc ← { m[⍵;⍺] +← 1 }
inner_row ← { ⍵ + 1} ¨ ⍳ (n-2)

left ← { (⍺-1) ↑ a[⍵;] }
right ← { ⍺ ↓ a[⍵;] }
top ← { (⍵-1) ↑ a[;⍺] }
bottom ← { ⍵ ↓ a[;⍺] }

{{
	_y ← y[⍵]
	y[⍵] +← 1
	
	((max ⍵ left _y) < (a[_y;⍵])) : ⍵ inc _y
    ((max ⍵ right _y) < (a[_y;⍵])) : ⍵ inc _y
    ((max ⍵ top _y) < (a[_y;⍵])) : ⍵ inc _y
    ((max ⍵ bottom _y) < (a[_y;⍵])) : ⍵ inc _y
} ¨ inner_row } ¨ ⍳ (n-2)

inner ← +/ 1 (n×n) ⍴ m
(n × 2) + ((n-2) × 2) + inner