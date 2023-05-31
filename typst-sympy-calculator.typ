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

#let differential(expr, var) = $(dif)/(dif var) expr$

// eval at
#let evalat(body) = math.lr(body + "|")

// other functions
#let sign = math.op("sign")

#hidden[
```typst-calculator
@func_mat()
def convert_cmat(matrix):
    return sympy.Matrix(matrix).T
    
@func()
def convert_differential(expr, var):
    return sympy.Derivative(expr, var)
```
]

