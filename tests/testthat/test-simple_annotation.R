test_that("simple annotation works", {
  tmpdir <- tempdir()
  load("testdata/sample_peaks.rda")
  load("testdata/expected_simple_annotation.rda")

  annotation <- simpleAnnotation(
    peaks,
    num_nodes = 16,
    db_name = "HMDB",
    outloc = tmpdir
  )

  annotation$Adduct <- as.character(annotation$Adduct)
  annotation$Name <- as.character(annotation$Name)
  annotation$Formula <- as.character(annotation$Formula)

  expected$Name <- as.character(expected$Name)
  expected$Adduct <- as.character(expected$Adduct)
  expected$Formula <- as.character(expected$Formula)

  comparison_columns = c("Adduct","Name", "mz", "time", "Formula", "MonoisotopicMass" )
  expected <- subset(expected, select = comparison_columns)
  actual <- subset(annotation, select = comparison_columns)

  expect_equal(actual, expected)
})