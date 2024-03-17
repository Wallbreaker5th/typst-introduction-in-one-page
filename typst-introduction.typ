#set text(
  font: "LXGW WenKai GB",
  size: 14pt,
  weight: 700,
)
#show raw: set text(
  font: "LXGW WenKai Mono GB",
  weight: 700,
)
#set page(
  margin: 5%,
  flipped: true,
)
#show raw.where(block: true): it => {
  block(it, fill: gray.lighten(80%), inset: 0.5em, radius: 0.5em)
}

#let title(it) = {
  move(
    box(
      text(stroke: black + 0.01em, size: 1.8em, it),
      fill: green.lighten(60%),
      outset: 0.5cm,
      radius: (top-left: 0.5cm, bottom-right: 0.5cm),
    ),
    dx: -0.5cm,
  )
}

#let under-heavy-line(it) = {
  underline(
    it,
    stroke: green.lighten(80%) + 0.5em,
    evade: false,
    background: true,
    offset: -0.5pt,
  )
}
#let subtitle(it) = {
  set text(
    stroke: 0.01em,
    size: 1.4em,
  )
  under-heavy-line(it)
}
#show heading.where(level: 2): it => {
  under-heavy-line(it)
}
#show heading.where(level: 3): it => {
  align(center, under-heavy-line(it))
}

#let main-stroke = blue.lighten(30%) + 0.2cm
#let sub-stroke = blue.lighten(60%) + 0.1cm
#let subsub-stroke = (paint: blue.lighten(60%), thickness: 0.05cm, dash: "dashed")

#let sLaTeX = {
  set text(
    font: "New Computer Modern Sans",
    weight: 500,
  )
  box(
    width: 2.55em,
    {
      set align(left)
      [L]
      place(top, dx: 0.3em, text(size: 0.7em)[A])
      place(
        top,
        dx: 0.7em,
        box(
          width: 1.8em,
          {
            set align(left)
            [T]
            place(top, dx: 0.56em, dy: 0.22em)[E]
            place(top, dx: 1.1em)[X]
          },
        ),
      )
    },
  )
}

#let sample-code = ```typ
#set heading(numbering: "一、") // 样式设置
= 兰亭集序
永和九年，岁在*癸丑*，暮春之初，会于会稽山阴之兰亭，修禊事也。              // 标记语法
#{                              // 编程语言
 set text(size: 0.8em)
 let t(name, s, offset, n) = table(
  columns: (3em, ) + (auto, ) * n,
  inset: 0.3em, align: center,
  strong(name),
  ..s.clusters(),
  [*年份*],
  ..range(n).map(i =>
   str(calc.rem(i + offset, n)))
 )
 t("天干", "甲乙丙丁戊己庚辛壬癸", 4, 10)
 t("地支", "子丑寅卯辰巳午未申酉戌亥", 4, 12)
}
$ cases(x equiv 3 (mod 10),     // 公式排版
        x equiv 5 (mod 12) )
  => x equiv 53 (mod 60) $
$ 353 - floor(353/60) = 53 $
```

#v(-1em)

#grid(
  columns: (7.8cm, auto, 1fr, 1fr, 4.5cm, 4.5cm),
  // rows: 3,
  // stroke: black+1pt,
  inset: (x: 0.5em, y: 1em),
  grid.cell(
    rowspan: 2,
    title[Typst 介绍与展示]
  ),
  grid.cell(
    rowspan: 1,
    colspan: 1,
    x: 0,
    y: 2,
  )[
    #subtitle[什么是 Typst?]

    Typst 是一门用于文档排版的标记语言。通过 Typst，你可以用简洁语法编写出美观的文档。

    如果你使用过 Markdown 或者 #sLaTeX，你应该很熟悉“从带标记的文本生成文档”的流程。
  ],
  grid.cell(
    rowspan: 3,
    colspan: 1,
    x: 0,
    y: 3,
  )[
    #subtitle[Typst 的优势]
    - 公式排版、参考文献管理等基本功能
    - 语法简洁，容易上手
    - 现代的、增量编译的编程语言可以
      - 快速地生成文档，并实时预览
      - 有更好的代码提示和报错信息
      - 更方便地编程与编写模板
    - 环境搭建简单
    - 有包管理器，不需要像 TeX Live 那样在本地安装大量用不到的包
    - 得益于友好的编程语言以及 Wasm 插件支持，Typst 已经有了许多功能强大的包
  ],
  grid.cell(
    rowspan: 1,
    colspan: 5,
    x: 1,
    y: 0,
    align: center
  )[
    #subtitle[效果展示]
  ],
  grid.cell(
    rowspan: 4,
    colspan: 3,
    x: 1,
    y: 1,
  )[
    #sample-code
  ],
  grid.cell(
    rowspan: 3,
    colspan: 2,
    x: 4,
    y: 1,
  )[
    #set text(font: "Source Han Sans SC", weight: 500)
    #eval("[" + sample-code.text + "]")
  ],
  grid.cell(
    rowspan: 1,
    colspan: 1,
    x: 1,
    y: 5,
    align: horizon,
  )[
    #rotate(-90deg, reflow: true)[
      == 部分包展示
    ]
  ],
  grid.cell(
    rowspan: 1,
    colspan: 1,
    x: 2,
    y: 5,
    align: center,
  )[
    #import "@preview/cetz:0.2.1"
    === CeTZ

    #v(1fr)

    #cetz.canvas({
      import cetz.draw: *
      circle((0, 0), radius: 1)
      let A = (60deg, 1)
      let B = (120deg, 1)
      line(A, B)
      let C = (-80deg, 1)
      let D = (-110deg, 1)
      line(A, C, stroke: red)
      line(B, C, stroke: red)
      line(A, D, stroke: blue)
      line(B, D, stroke: blue)
      let angle = cetz.angle.angle
      angle(C, A, B, stroke: red, fill: red.transparentize(70%), radius: 0.4)
      angle(D, A, B, stroke: blue, fill: blue.transparentize(70%), radius: 0.4)

      line(C, D, stroke: (dash: "dashed"))

      let O = (0, 0)
      circle(O, radius: 1pt, fill: black)
      content(O, $O$, anchor: "south", padding: 3pt)
    }, length: 1.5cm)
  ],
  grid.cell(
    rowspan: 1,
    colspan: 1,
    x: 3,
    y: 5,
  )[
    #import "@preview/pinit:0.1.3": *

    === Pinit

    后之览者，亦将有感于#pin(1)斯#pin(2)文。

    #pinit-highlight(1, 2)

    #pinit-point-from(2, [这])
  ],
  grid.cell(
    rowspan: 2,
    colspan: 1,
    x: 4,
    y: 4,
  )[
    #import "@preview/showybox:2.0.1": showybox

    === Showybox

    #showybox(
      frame: (
        border-color: blue.darken(50%),
        title-color: blue.lighten(60%),
        body-color: blue.lighten(80%),
        inset: 0.6em,
      ),
      title-style: (
        boxed-style: (
          fill: blue.lighten(60%),
          radius: (top-left: 10pt, bottom-right: 10pt),
        ),
        color: black
      ),
      title: "通知",
      [近日将有一股强冷空气来袭，请注意保暖。],
      [秋季天干物燥，要时刻注意消防安全。]
    )
  ],
  grid.cell(
    rowspan: 2,
    colspan: 1,
    x: 5,
    y: 4,
    align: center,
  )[
    === Fletcher

    #import "@preview/fletcher:0.4.2" as fletcher: node, edge

    #fletcher.diagram(
      node-stroke: blue.darken(50%),
      node-fill: blue.lighten(80%),
      spacing: 1em,
      edge-stroke: 1pt,
      node((0, 0), [A]),
      edge("~>"),
      node((-1, 1), [B\ C], corner-radius: 5pt),
      edge("-->"),
      node((1, 1), [D]),
      edge("->"),
      node((0, 2), [E]),
      edge((0, 2), (0, 0), "->", stroke: red),
      edge((0, 2), (-1, 1), "->", bend: 45deg),
      edge((1, 1), "dd,lll,uu,r", "=>")
    )
  ],
  
  grid.vline(
    x: 1,
    stroke: main-stroke
  ),

  grid.hline(
    y: 1,
    start: 1,
    end: 6,
    stroke: sub-stroke
  ),

  grid.hline(
    y: 5,
    start: 1,
    end: 4,
    stroke: sub-stroke
  ),
  grid.vline(
    x: 4,
    start: 4,
    end: 5,
    stroke: sub-stroke
  ),
  grid.hline(
    y: 4,
    start: 4,
    end: 6,
    stroke: sub-stroke
  ),
)

#place(right+bottom, move(dy: 1.5em)[
  #set text(fill: gray)
  This work by Wallbreaker5th is marked with CC0 1.0.\ To view a copy of this license, visit http://creativecommons.org/publicdomain/zero/1.0
])
