# CWL conditionals test bed

## Useful links

1. [Design decision document](https://github.com/common-workflow-language/common-workflow-language/blob/kaushik-work-patch-1/design-decisions/conditionals-2019.md)
1. [Proposal](https://github.com/common-workflow-language/common-workflow-language/issues/854)
1. [Collected list of use cases](https://github.com/common-workflow-language/common-workflow-language/issues/725)
1. [List of proposals for conditionals](https://github.com/common-workflow-language/common-workflow-language/issues?utf8=%E2%9C%93&q=label%3Aconditionals+)


## Steps for getting up an running

tl;dr

```
git clone https://github.com/kaushik-work/cwl-conditionals.git
chmod +x ./cwl-conditionals/setup.sh
./cwl-conditionals/setup.sh
```
If you don't have Python3 (callable as python3) you can replace the line in
`setup.sh` to create a Python2 virtualenv.


Also see [setup.sh](setup.sh)

- Create a new virtual environment for testing
- Install Toil from `kaushik-work/toil`  `kaushik/conditionals/when` branch
- Install CWL tool `pa/conditionals` branch
- Checkout the test scripts and test files
- Run them with `toil-cwl-runner` 

Manual steps (in a fresh virtualenv):
```
# If toil is not installed from clone, it complains about missing galaxy libs
git clone --branch kaushik/conditionals/when https://github.com/kaushik-work/toil.git
cd toil
pip install -e .[cwl]
toil --version  # should read 3.21.0a1
cd ..


git clone --branch pa/conditionals https://github.com/common-workflow-language/cwltool.git
cd cwltool
pip install -e .
cd ..

cd cwl-conditionals
chmod +x run-examples.sh
./run-examples.sh
```  

## Running Toil in macOS

You may need to do the following before running a task that uses Docker
`export TMPDIR=/tmp/docker_tmp` from Toil
