#import "confidentiality-statement.typ": *
#import "declaration-of-authorship.typ": *

#let info-page(
  authors,
  title,
  date,
  date-format,
  pdf-version,
  show-confidentiality-statement-at-beginning,
  show-declaration-of-authorship-at-beginning,
  confidentiality-statement-content,
  declaration-of-authorship-content,
  university,
  university-location,
  at-university,
  language,
  many-authors,
  page-margin,
) = {

  // ---------- Page Setup ---------------------------------------

  set page(
    margin: page-margin,
  )

  if (show-declaration-of-authorship-at-beginning) {

    declaration-of-authorship(
      authors,
      title,
      declaration-of-authorship-content,
      date,
      language,
      many-authors,
      at-university,
      university-location,
      date-format,
    )
  }

  if (show-confidentiality-statement-at-beginning) {
    
    if (show-declaration-of-authorship-at-beginning) {
      pagebreak()
    }

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
