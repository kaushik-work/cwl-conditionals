# This scatters two conditional steps to show how conditionals
# and scatter work together

# cwltoil workflows/scatter.cwl --val 4  # evens = foo, odds = bar


class: Workflow
cwlVersion: v1.2
inputs:
  val: int

steps: 

  step1:
    in:
      in1: val
    run: ../tools/listify.cwl
    out: [out1]

  step2:
    in:
      in1: step1/out1
    scatter: [in1]
    run: ../tools/foo.cwl
    when: $(inputs.in1 % 2)
    out: [out1]
    
  step3:
    in:
      in1: step1/out1
    scatter: [in1]
    run: ../tools/bar.cwl
    when: $(1 - inputs.in1 % 2)
    out: [out1]

outputs: 
  out1:
    type: string[]
    outputSource:
      all_that_ran:
        - step2/out1
        - step3/out1
    linkMerge: merge_flattened  # Omitting will give validation error

requirements: 
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  MultipleInputFeatureRequirement: {}