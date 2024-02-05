#let format(kind, string) = {
  if kind == "jp" {
    return text(
      font: "Noto Serif JP",
      string
    )
  }

  if kind == "zh-cn" {
    return text(
      font: "Noto Serif SC",
      string
    )
  }

  if kind == "en" {
    return text(
      font: "Noto Serif",
      string
    )
  }

  if kind == "romanji" {
    return text(
      size: 9.5pt,
      font: "Noto Serif",
      string
    )
  }
  // Please add more!
}

#let get_source() = {
  let info = read("./source/info.txt").split("\n")
  let source = (
    title_T : info.at(0),
    title : info.at(1),
    subtitle_T : info.at(2),
    subtitle : info.at(3),
    artist_T : info.at(4),
    artist : info.at(5),
    cover_T : info.at(6),
    cover : info.at(7),
    line_num : info.at(8),
    line_T : info.slice(9)
  )
  return source
}

#let head_area(source) = {
  grid(
    columns: 2,
    if source.cover_T != "n" {
      box(
        height: 3cm,
        width: auto,
        {
          if source.cover_T == "y" {
            image("source/" + source.cover)
          }
        }    
      )
    },
    align(
      horizon,
      grid(
        columns: 1fr,
        rows:auto,
        row-gutter: 3mm,
        align(
          center,
          text(
            size: 20pt,
            format(source.title_T, source.title)
          )
        ),
        if source.subtitle_T != "n" {
          align(
            center,
            text(
              size: 10pt,
              format(source.subtitle_T, source.subtitle)
            )
          )
        },
        align(
          center,
          text(
            size: 13pt,
            format(source.artist_T, source.artist)
          )
        )
      )
    )
  )
}

#let body_area(source) = {
  let group = ()
  let n = 1
  while n <= int(source.line_num) {
    group.push(read("source/" + str(n) + ".txt").split("\n"))

    n += 1
  }
  
  grid(
    columns: 1fr,
    row-gutter: 0.9em,
    ..{
      let total = ()

      let m = 0 // Index of different line.
      while m < group.at(0).len() {
        total.push(
          box(
            {
              n = 0   // Index of different language.
              while n < group.len() {
                format(source.line_T.at(n), group.at(n).at(m))
                linebreak()

                n += 1
              }
            }
          )
        )

        m += 1
      }
      total
    }
  )
}

