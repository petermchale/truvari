#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

set -o xtrace
# Must use single quote to prevent variable expansion.
# For example, if double quotes were used, ${LINENO} would take on the value of the current line,
# instead of its value when PS4 is used later in the script
# https://stackoverflow.com/a/6697845/6674256
# ${FOO:+val}    val if $FOO is set
# ${FOO[0]}   element #0 of the FOO array
# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
PS4='+ (${BASH_SOURCE[0]##*/} @ ${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

reference="/scratch/ucgd/lustre-work/quinlan/u6018199/chaisson_2019/GRCh38_full_analysis_set_plus_decoy_hla.fa"
truvari_output="test_output" 

rm -rf ${truvari_output}

bgzip --stdout base.vcf > base.vcf.gz
tabix --preset vcf base.vcf.gz 

bgzip --stdout comp.vcf  > comp.vcf.gz
tabix --preset vcf comp.vcf.gz 

./truvari \
        --debug \
        --sizemin 30 \
        --pctsize 0.25 \
        --reference ${reference} \
        --base base.vcf.gz \
        --comp comp.vcf.gz \
        --output ${truvari_output} \
        > ${truvari_output}.log 2>&1
