set.seed(777)

library(sits)
library(sitsdata)

do_classification <- function(output_path) {
  #
  # Create a data cube from two raster bricks
  #
  cube <- sits_cube(
    type       = "STACK",
    name       = "bdc_cube",
    satellite  = "CBERS-4",
    sensor     = "AWFI",
    data_dir   = system.file("extdata/CBERS", package = "sitsdata"),
    delim      = "_",
    parse_info = c("", "", "", "", "", "date", "", "band")
  )

  #
  # training the model
  #
  samples <- sits_select(
    data  = samples_cerrado_cbers,
    bands = sits_bands(cube)
  )

  rfor_model <- sits_train(samples,
                           ml_method = sits_rfor(num_trees = 300))

  #
  # Classify the raster cube, generating a probability file
  #
  probs_cube <- sits_classify(cube,
                              ml_model   = rfor_model,
                              output_dir = output_path)

  #
  # smoothing and classify
  #
  probs_smoothed_cube <- sits_smooth(probs_cube,
                                     output_dir = output_path)

  label_cube <- sits_label_classification(probs_smoothed_cube,
                                          output_dir = output_path)

  return(output_path)
}

#
# create directories
#
dir.create("/opt/classification/results/experiment_02b", recursive = TRUE)

#
# generate the first result
#
do_classification("/opt/classification/results/experiment_02b")
