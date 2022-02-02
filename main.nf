// All arguments:
// 1. data frame file path: data
// 2. the number of split of the dataset: k
// 3. results dir: result_dir
params.result_file_name = "result.rds"
//create a channel
group_ids = Channel.from(1..params.k)

/******************
* Fit linear model
*******************/
process fit_linear_model {
  output:
  file 'raw_result.rds' into raw_results_ch


  input:
  path data_path from params.data
  val k from params.k
  val i from group_ids

  // args: 1. dataframe file path
  // 2. number of split
  // 3. group id
  """
  fit_linear.R $data_path $k $i
  """
}

/***************************
* Average fitted coefficient
****************************/
process average_coefficient {
  publishDir params.result_dir, mode: "copy"

  output:
  file "$params.result_file_name" into collected_results_ch

  input:
  file 'raw_result' from raw_results_ch.collect()

  """
  average_coef.R $params.result_file_name raw_result*
  """
}
