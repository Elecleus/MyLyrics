#set page(
  paper: "a4",
  margin: 1.8cm,
)
#set par(
  // hanging-indent: 1em,
  leading: 0.5em,
)
#set smartquote(enabled: false)

#let format(kind) = {
  if kind == "jp" {
    return (
      font: "Noto Serif JP",
      lang: "jp",
    )
  }

  if kind == "zh-cn" {
    return (
      font: "Noto Serif SC",
      lang: "zh",
      region: "cn",
    )
  }

  if kind == "en" {
    return (
      font: "Noto Serif SC",
      lang: "en",
    )
  }

  if kind == "romaji" {
    return (
      size: 9.5pt,
      font: "Noto Serif SC",
    )
  }
  // Please add more!
}

#let info = toml("./source/info.toml")

#let groups = ()
#for i in range(1, info.groups.num + 1) {
  groups.push(read("./source/" + str(i) + ".txt").split("\n"))
}

#line(length: 100%, stroke: (dash: "dashed"))

#grid(
  columns: 2,
  if info.cover.exist {
    box(
      height: 3.5cm,
      width: auto,
      image("source/" + info.cover.name + "." + info.cover.format),
    )
  },
  align(
    horizon,
    grid(
      columns: 1fr,
      rows: auto,
      row-gutter: 3mm,
      align(
        center,
        text(
          ..format(info.title.format),
          size: info.title.size * 1pt,
          info.title.content,
        ),
      ),
      if info.subtitle.exist {
        align(
          center,
          text(
            ..format(info.subtitle.format),
            size: info.subtitle.size * 1pt,
            info.subtitle.content,
          ),
        )
      },
      align(
        center,
        text(
          ..format(info.artist.format),
          size: info.artist.size * 1pt,
          info.artist.content,
        ),
      )
    ),
  ),
)

#line(length: 100%, stroke: (dash: "dashed"))

#show: rest => columns(2, rest)

#for other in info.other_info {
  text(..format(other.former_format), other.former_text)
  text(..format(other.later_format), other.later_text)
  linebreak()
}

#parbreak()

#let groups_num = info.groups.num
#let group_length = groups.at(0).len()
#for i in range(group_length) {
  box(for j in range(groups_num) {
    let object = groups.at(j).at(i)
    if object != "" {
      text(..format(info.groups.format.at(j)), object)
      linebreak()
    }
  })
  parbreak()
}
