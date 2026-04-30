merge_child_rmds <- function(pattern, output_file) {
  child_files <- fs::dir_ls(
    fs::path(here::here(), "report", "child"),
    regexp = pattern
  ) |> sort()
  
  purrr::map_chr(child_files, readr::read_file) |>
    paste(collapse = "\n\n") |>
    readr::write_file(output_file)
  
  output_file  # return path for targets tracking
}