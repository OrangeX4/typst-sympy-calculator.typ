# typst-sympy-calculator.typ

```typst
#import "typst-sympy-calculator.typ": *

// set variances
#let a = 1
#let b = $a + 1$

// define accents
#let acc(x) = math.accent(x, math.grave)

// define operators
#let add = math.op("add")
#let f = math.op("f")

// define symbols
#let xy = math.italic("xy")
#let mail = symbol("🖂", ("stamped", "🖃"),)

#let hidden(content) = {}

// matrix
#let cmat(..args) = {
  let mat = if (type(args.pos().at(0)) != "array") { (args.pos(),) } else { args.pos() }
  let mat_t = ()
  for j in range(mat.at(0).len()) {
    mat_t.push(())
    for i in range(mat.len()) {
      mat_t.at(j).push(mat.at(i).at(j))
    }
  }
  math.mat(..mat_t)
}

#let derivative(expr, var) = $(dif)/(dif var) expr$
```

"typst-calculator":

```typst-calculator
@func_mat()
def convert_cmat(matrix):
    return sympy.Matrix(matrix).T
    
@func()
def convert_derivative(expr, var):
    return sympy.Derivative(expr, var)
```

There are decorators: `operator, relation_op, additive_op, mp_op, postfix_op, reduce_op, func, func_mat, constant`
