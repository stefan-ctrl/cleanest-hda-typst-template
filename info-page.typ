#import "confidentiality-statement.typ": *

#let info-page(
  authors,
  title,
  date,
  date-format,
  pdf-version,
  show-confidentiality-statement-at-beginning,
  confidentiality-statement-content,
  university,
  university-location,
  language,
  many-authors,
  page-margin,
) = {

  // ---------- Page Setup ---------------------------------------

  set page(
    margin: page-margin,
  )

  if (show-confidentiality-statement-at-beginning) {
    confidentiality-statement(
      authors,
      title,
      confidentiality-statement-content,
      university,
      university-location,
      date,
      language,
      many-authors,
      date-format,
  )
  }

  // ---------- Info at Bottom of Page ---------------------------------------

  place(
    bottom + left,
    {
      for author in authors {
        text(size: 11pt, [#author.name: #title, © #date.display(date-format)])
        linebreak()
      }
      v(1em)
      text(size: 9pt, fill: luma(100), [Version: #pdf-version])
    }
  )
}
