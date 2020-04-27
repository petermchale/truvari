## run test

```
./run_test.sh
```

## comp.vcf 
Calls were made by aligning short reads against build 38 of the human reference, then 
doing a bespoke local assembly of 
those reads in five regions, followed by running a bespoke caller on the assemblies. 

## base.vcf 
Calls were made from haplotype-resolved assemblies of long reads in the same sample at the same five regions. 

## classifications_sequence_similarities.tsv

After manual inspection of each region, I've indicated whether I think the base and comp calls should be matched, 
and what the Levenshtein sequence similarity metric reports using the current truvari code 
and using a suggested edit of the truvari code in which the lines 

https://github.com/petermchale/truvari/blob/55500977c48e0f35eb63086968f3908700cfb5fe/truvari/truvari#L138-L139

are deleted. The suggested edit results in truvari now computing sequence similarity of the 
predicted haplotype in the sample genome in each region for DELs, which I believe  
was the intent espoused at 

https://github.com/petermchale/truvari#comparing-haplotype-sequences-of-variants

The previous version of the truvari code does not report the sample haplotype, as far as I can tell. 

## get data 

Sample HG00514. Use download scripts to fetch alignments. Local assemblies of short reads is 
in `fermi.unitigs.sorted.YC.bam`.




