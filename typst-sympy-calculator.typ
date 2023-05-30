#let hidden(content) = {}

// Math display
#let display(body) = {
    if (repr(body.func()) == "equation") {
        if (body.block) {
            $#box(body)$
        } else {
            panic("The equation must be a block")
        }
    } else {
        panic("The content is not a equation")
    }
}

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

// eval at
#let evalat(body) = math.lr(body + "|")

// other functions
#let sign = math.op("sign")

#hidden[

```typst-calculator
@func_mat()
def convert_cmat(matrix):
    return sympy.Matrix(matrix).T
```

]

