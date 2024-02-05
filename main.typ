#import "base.typ": *
#set page(
  paper: "a4",
  columns: 2,
  margin: 1.8cm,
)
#set par(
  // hanging-indent: 1em,
  leading: 0.5em
)

#let source = get_source()
#head_area(source)
#body_area(source)
